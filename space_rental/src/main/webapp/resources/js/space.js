/* ----------- Img preview ---------- */
function readURL(input, target) {
	if (input.files && input.files[0]) {
		var imgfiles = [];
		var files = input.files;
		var filesArr = Array.prototype.slice.call(files);
		var index = 0;

		filesArr.forEach(function (f) {
			if (!f.type.match("image.*")) {
				alert("확장자는 이미지 확장자만 가능합니다.");
				return;
			}

			imgfiles.push(f);

			var reader = new FileReader();
			reader.onload = function (e) {
				var result = "<img class='fileImg' src='" + e.target.result + "'>";
				target.append(result);
				index++;
			}
			reader.readAsDataURL(f);
		});
	}
}

/* ----------- space & host (write, update) ---------- */
$(function () {

	/* ----------- Img preview ---------- */
	$("#writeForm").on("change", "#titleImgFile", function (event) {
		$('.inner_img').empty();
		readURL(this, $(".inner_img"));
	});
	$("#writeForm").on("change", "#imgFile", function (event) {
		$('.inner_imgs').empty();
		readURL(this, $(".inner_imgs"));
	});

	$("#updateForm").on("change", "#titleImgFile", function (event) {
		readURL(this, $(".inner_img"));
	});
	$("#updateForm").on("change", "#imgFile", function (event) {
		readURL(this, $(".inner_imgs"));
	});

	/* ----------- textCount ---------- */
	$("#space_name").keyup(function (e) {
		var content = $(this).val();
		$(this).height(((content.split('\n').length + 1) * 1.5) + 'em');
		$("#spcNmCnt").html(content.length);
	});
	$("#space_name").keyup();

	$("#space_text").keyup(function (e) {
		var content = $(this).val();
		$(this).height(((content.split('\n').length + 1) * 1.5) + 'em');
		$("#spcCtCnt").html(content.length);
	});
	$("#space_text").keyup();
	
});

/* ----------- 세부공간추가 ---------- */
function spaceAddConfirm(){
	$('#confirmModel').modal("show");
	$('.ok').on('click',function(){
		var hostNo = $('#hostNo').val();
		$(this).form.submit();
		window.location.href = '/spacerental/space/write/'+hostNo;
	});
	$('.cancel').on('click',function(){
		$(this).form.submit();
		window.location.href = '/spacerental/';
	});
}


/* ----------- year & monthChange ---------- */
function change() {
	$('#calendar-table').load("/spacerental/space/calendar", {
		"year": $('#y').val(),
		"month": $('#m').val(),
		"spaceNo": $('#spaceNo').val()
	});
}

/* ----------- dayChange ---------- */
function dayCheck(i) {
	if ($('#day' + i).is(":checked")) {
		$('td').removeClass('datepick');
		$('#day' + i).parent().addClass('datepick');
	} else {
		$('#day' + i).parent().removeClass('datepick');
	}

	$('#time-table').load("/spacerental/space/time", {
		"year": $('#y').val(),
		"month": $('#m').val(),
		"day": $('#day' + i).val(),
		"spaceNo": $('#spaceNo').val()
	});
}

/* ----------- timeChange ---------- */
var n = 0, s_t = 0, e_t = 0;
function timeClick(time) {
	n++;

	$('label').removeClass('timepick');
	if (n % 2 == 1) {
		s_t = time;
		startTime(time, s_t);
	} else if (n % 2 == 0) {
		e_t = time;
		endTime(time, s_t, e_t);
	}
}

function startTime(time, s_t) {// 시작시간 선택
	$('#timelabel' + time).addClass('timepick');
	$('#startTime').attr('value', s_t);
	$('#endTime').attr('value', s_t);
}

function endTime(time, s_t, e_t) {// 끝나는시간 선택
	for (var t = s_t; t <= e_t; t++) {
		$('#timelabel' + t).addClass('timepick');
	}
	$('#endTime').attr('value', e_t);
}

/* ----------- Review ---------- */
$(function () {
	var spaceNo = $('#reviewform #spaceNo').val();
	$('#writereview').on('click', function (event) {
		
		//serialize   -   form에 포함된 입력요소의 값을 이름=값&이름=값...형식으로 만드는 함수
		var formData = $('#reviewform').serialize();
		
		$.ajax({
			url: "/spacerental/space/write-review",
			method: "POST",
			data: formData,
			success: function (data, status, xhr) {
				$('textarea').val();
				alert("댓글 등록");
				$("#review-list").load('/spacerental/space/review-list',
					{ "spaceNo": spaceNo },
					function () {
						$('#spaceNo').attr("value", spaceNo);
					});
			},
			error: function (xhr, status, err) {
				alert(err);
			}
		});
	});

	var currentreviewNo = -1;
	
	$('#review-list').on('click', '.editreview', function (event) {
		reviewNo = $(this).attr('data-reviewno');
		$('.collapse').collapse('hide');
		
		if (currentreviewNo != -1) {
			$('#reviewview' + currentreviewNo).css('display', '');
			$('#reviewedit' + currentreviewNo).css('display', 'none');
		}
		$('#reviewview' + reviewNo).css('display', 'none');
		$('#reviewedit' + reviewNo).css('display', '');
		currentreviewNo = reviewNo;
	});

	$('#review-list').on('click', '.cancel', function (event) {
		reviewNo = $(this).attr('data-reviewno');
		$('#reviewview' + reviewNo).css('display', '');
		$('#reviewedit' + reviewNo).css('display', 'none');
		currentreviewNo = -1;
	});

	$('#review-list').on('click', '.deletereview', function (event) { //새로 만들어지는 객체에도 이벤트를 적용시키도록 하는 것??
		reviewNo = $(this).attr('data-reviewno');
		$.ajax({
			url: "/spacerental/space/delete-review",
			method: "GET",
			data: "reviewNo=" + reviewNo,
			success: function (data, status, xhr) {
				if (data == 'success') {
					$('#tr' + reviewNo).remove();
					alert('삭제했습니다');
				}
				else alert('삭제실패');
			},
			error: function (xhr, status, err) {
				console.log(err);
			}
		});
	});

	$('#review-list').on('click', '.updatereview', function (event) {
		//현재 클릭된 <a 의 data-reviewno 속성 값 읽기
		var reviewNo = $(this).attr('data-reviewno');
		var content = $('#updateform' + reviewNo + ' textarea').val();
		var inputData = $('#updateform' + reviewNo).serialize();

		//ajax 방식으로 데이터 수정
		$.ajax({
			"url": "/spacerental/space/update-review",
			"method": "POST",
			"data": inputData,
			"success": function (data, status, xhr) {
				alert('댓글을 수정했습니다.');
				var span = $('#reviewview' + reviewNo + ' span');
				span.html(content.replace(/\n/gi, '<br>'));
				//view-div는 숨기고, edit-div는 표시하기   
				$('#reviewview' + reviewNo).css('display', 'block');
				$('#reviewedit' + reviewNo).css('display', 'none');
			},
			"error": function (xhr, status, err) {
				alert('댓글 수정 실패');
			}
		});
	});

	$('#write-comment').on('click', function (event) {
		var reviewNo = $(this).attr('data-reviewno');
		var content = $('#comment-form textarea').val();
		if (content.length == 0) return;

		var commentData = $('#comment-form').serialize();

		$.ajax({
			url: "/spacerental/space/write-comment",
			method: "POST",
			data: commentData,
			success: function (data, status, xhr) {
				alert('댓글을 달았습니다.');
				$('#comment-collapse' + reviewNo).collapse('hide'); //hide bootstrap modal
				$('#comment-form').each(function () {
					this.reset();
				});
				
				$("#review-list").load('/spacerental/space/review-list',
						{ "spaceNo": spaceNo },
						function () {
							$('#spaceNo').attr("value", spaceNo);
//							$('#star').attr("id","star"+spaceNo);
//							$('#star_input').attr("id","star_input"+spaceNo);
						});
			},
			error: function (xhr, status, err) {
				alert('fail');
			}
		});
	});

	/* ----------- rating ---------- */
//	    var $s_input = $('#star_input');
//	$('#star').starrr({
//		max : 5,
//		rating : $s_input.val(),
//		change : function(e, value) {
//			$s_input.val(value).trigger('input');
//		}
//	});
//	    (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
//	    (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
//	    m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
//	    })(window,document,'script','//www.google-analytics.com/analytics.js','ga');
//	    ga('create', 'UA-39205841-5', 'dobtco.github.io');
//	    ga('send', 'pageview');
});

/* ----------- rent ---------- */
$(function () {
	$('#rent_submit').on('click', function (event) {

		// serialize() : <form에 포함된 입력 요소의 값을 이름=값&이름=값&... 형식으로 만드는 함수
		var formData = $('#rentform').serialize();
		// alert(formData);

		$.ajax({
			url: "/spacerental/space/rent",
			method: "POST",
			data: formData,
			success: function (data, status, xhr) { // data: 응답받은 데이터
				alert("예약되었습니다!");
				window.location.href = '/spacerental/mypage/rentList';
			},
			error: function (xhr, status, err) {
				alert(err);
			}
		});
	});	
	
	$('#before_ok').on('click', function(event) {
		location.href = "/spacerental/mypage/beforeOk";
	});
	$('#after_ok').on('click', function(event) {
		location.href = "/spacerental/mypage/afterOk";
	});
});
      		
function rent_cancel(i) {
	var formData = $("#rentform"+i).serialize();
	var ok = confirm("예약을 취소하시겠습니까?");
	if (ok) {
		$.ajax({
			url : "/spacerental/mypage/rent_cancel",
			method: "GET",
			data: formData,
			success: function (data, status, xhr) { // data: 응답받은 데이터
				alert("예약 취소되었습니다.");
				$("#card"+i).remove();
			},
			error: function (xhr, status, err) {
				alert(err);
			}
		});	        			
	}
}


/* ----------- hostOk ---------- */
function okCheck(i,okCheck, hostNo) {
	var btn = $('.ok'+i);
	$.ajax({
		url: "/spacerental/mypage/okCheck",
		method: "POST",
		data: {
			"okCheck": okCheck,
			"hostNo": hostNo
		},
		success: function (data, status, xhr) { // data: 응답받은 데이터
			if(data == "ok"){
				btn.removeClass("btn-outline-dark");
				btn.addClass("btn-dark");			
				btn.attr("value","승인 취소");
				btn.attr("onclick","javascript:okCheck("+i+",0,"+hostNo+")");
			}else if(data == "okCancel"){
				btn.removeClass("btn-dark");
				btn.addClass("btn-outline-dark");			
				btn.attr("value","승인 하기");
				btn.attr("onclick","javascript:okCheck("+i+",1,"+hostNo+")");
			}
		},
		error: function (xhr, status, err) {
			alert(err);
		}
	});
}