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

function change() {
//	$.ajax({
//		method : "GET",
//		url : "/spacerental/space/rent",
//		data : {
//			"year" : $('#year').val(),
//			"month" : $('#month').val(),
//			"spaceNo" : $('#spaceNo').val()
//		},
//		success : function(data, status, xhr) {
//			
//		}
//	});
	
	$('#calendar-table').load("/spacerental/space/calendar",{
		"year" : $('#year').val(),
		"month" : $('#month').val(),
		"spaceNo" : $('#spaceNo').val()
	});
//	window.location.href="/spacerental/space/rent?year="+$('#year').val()+
//										"&month="+$('#month').val()+
//										"&spaceNo="+$('#spaceNo').val();
} 

