function readURL(input,target) {
	if (input.files && input.files[0]) {
		var reader = new FileReader();
		reader.onload = function(e) {
			var result = "<img width='200' height='200' src='" + e.target.result + "'>";
			target.html(result);
			console.log(result);
		}
		reader.readAsDataURL(input.files[0]);
	}
}
$("#writeForm").on("change", "#titleImgFile", function(event) {
	
// var formData = $('#writeForm').serialize();
//	$.ajax({
//		method : "POST",
//		enctype:"multipart/form-data",
//		url : "/spacerental/space/titleImg",
//		data : formData,
//		processData: false, //processData : false로 선언 시 formData를 string으로 변환하지 않음
//        contentType: false,//contentType : false 로 선언 시 content-type 헤더가 multipart/form-data로 전송되게 함
//        cache: false,
//		success : function(data, status, xhr) {
//			alert(data+ " / "+formData);
//			console.log("s");
//			var result = "<img src='/resources/files/space-files/" + data + "'>";
//			$(".inner_img").html(result);
//			//alert(result);
//		},
//		error : function(xhr, status, err) {
//			alert(err);
//		}
//	});
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