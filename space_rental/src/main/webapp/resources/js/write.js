function readURL(input,target) {
	if (input.files && input.files[0]) {
		var imgfiles = [];
		var files = input.files;
		var filesArr = Array.prototype.slice.call(files);
		
		var index = 0;
		filesArr.forEach(function(f){
			if(!f.type.match("image.*")){
				alert("확장자는 이미지 확장자만 가능합니다.");
				return;
			}
			
			imgfiles.push(f);
			
			var reader = new FileReader();
			reader.onload = function(e) {
				var result = "<img width='200' height='200' src='" + e.target.result + "'>";
				target.append(result);
				console.log(result);
				index++;
			}
			reader.readAsDataURL(f);
			
		});
		
	}
}
$("#writeForm").on("change", "#titleImgFile", function(event) {
	readURL(this,$(".inner_img"));
});
$("#writeForm").on("change", "#imgFile", function(event) {
	readURL(this,$(".inner_imgs"));
});

$(function() {
    $("#space_name").keyup(function (e){
        var content = $(this).val();
        $(this).height(((content.split('\n').length + 1) * 1.5) + 'em');
        $("#spcNmCnt").html(content.length);
    });
    $("#space_name").keyup();
    
    $("#space_text").keyup(function (e){
        var content = $(this).val();
        $(this).height(((content.split('\n').length + 1) * 1.5) + 'em');
        $("#spcCtCnt").html(content.length);
    });
    $("#space_text").keyup();    
});


function dayCheck(i) {
	if($('#day'+i).is(":checked")){
		$('td').removeClass('datepick');
		$('#day'+i).parent().addClass('datepick');
	}else{
		$('#day'+i).parent().removeClass('datepick');
	}
}

var n=0;
var s_t=0;
var e_t=0;
function timeClick(i,time){
	n++;

	$('label').removeClass('timepick');
	//console.log(n);
	if(n%2 == 1){
		s_t=time;
		startTime(i, s_t);
	}
	else if(n%2 == 0){
		e_t=time;
		endTime(i, s_t, e_t);
	}
}


function startTime(i, s_t) {//시작시간 선택
	//console.log("111 / "+s_t+" / "+e_t + " / " + i);
		$('#timelabel'+i).addClass('timepick');
		$('#startTime').attr('value',s_t);
}
function endTime(i, s_t, e_t) {//끝나는시간 선택
	//console.log("222 / "+s_t+" / "+e_t + " / " + i);
		for(var t=s_t;t<=e_t;t++){
			$('#timelabel'+t).addClass('timepick');
		}
		$('#endTime').attr('value',e_t);
}

function change() {	
	$('#calendar-table').load("/spacerental/space/calendar",{
		"year" : $('#y').val(),
		"month" : $('#m').val(),
		"spaceNo" : $('#spaceNo').val()
	});
} 

