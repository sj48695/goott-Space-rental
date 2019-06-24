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
function timeClick(i, time) {
	n++;

	$('label').removeClass('timepick');
	if (n % 2 == 1) {
		s_t = time;
		startTime(i, s_t);
	} else if (n % 2 == 0) {
		e_t = time;
		endTime(i, s_t, e_t);
	}
}

function startTime(i, s_t) {// 시작시간 선택
	$('#timelabel' + i).addClass('timepick');
	$('#startTime').attr('value', s_t);
}

function endTime(i, s_t, e_t) {// 끝나는시간 선택
	for (var t = s_t; t <= e_t; t++) {
		$('#timelabel' + t).addClass('timepick');
	}
	$('#endTime').attr('value', e_t);
}

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