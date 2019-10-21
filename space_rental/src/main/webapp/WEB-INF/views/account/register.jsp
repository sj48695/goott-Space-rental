<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" language="java" contentType="text/html; charset=utf-8"
	     pageEncoding="utf-8"%>

<jsp:include page="/WEB-INF/views/include/header.jsp"/> 
<link rel="stylesheet" type="text/css" href="/spacerental/resources/css/select2.min.css">
<link rel="stylesheet" type="text/css" href="/spacerental/resources/css/util.css">
<link rel="stylesheet" type="text/css" href="/spacerental/resources/css/main.css">
<style>
.header {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	z-index: 100;
	background: #3a1a48;
	-webkit-transition: all 400ms ease;
	-moz-transition: all 400ms ease;
	-ms-transition: all 400ms ease;
	-o-transition: all 400ms ease;
	transition: all 400ms ease;
}
</style>

<div class="container-contact100">
	<div class="wrap-contact100">
		<div class="contact100-pic js-tilt" data-tilt>
			<img src="/spacerental/resources/images/register_picture.png" alt="IMG">
		</div>
		<form class="contact100-form validate-form" action="register" method="post">
			<span class="contact100-form-title">회원가입</span>

			<div class="wrap-input100 validate-input" data-validate = "아이디는 필수항목입니다.">
				<input class="input100" type="text" name="id" id="id" placeholder="아이디">
				<span class="focus-input100"></span>
				<span class="symbol-input100">
					<i class="fa fa-user" aria-hidden="true"></i>
				</span>
			</div>
			<p class="result">
				<span class="msg">아이디를 확인해 주세요.</span>
			</p>

			<div class="wrap-input100 validate-input" data-validate = "비밀번호는 필수항목입니다.">
				<input class="input100" type="password" name="passwd" placeholder="비밀번호">
				<span class="focus-input100"></span>
				<span class="symbol-input100">
					<i class="fa fa-user" aria-hidden="true"></i>
				</span>
			</div>

			<div class="wrap-input100 validate-input" data-validate = "이름은 필수항목입니다.">
				<input class="input100" type="text" name="name" placeholder="이름">
				<span class="focus-input100"></span>
				<span class="symbol-input100">
					<i class="fa fa-user" aria-hidden="true"></i>
				</span>
			</div>
			
			<div class="wrap-input100">
				<input class="input100" type="text" name="phone" placeholder="휴대폰번호">
				<span class="symbol-input100">
					<i class="fa fa-user" aria-hidden="true"></i>
				</span>
			</div>
			
			<div class="wrap-input100">
				<input type="radio" name="type" value="customer">개인
				<input type="radio" name="type" value="host">사업자
			</div>
			<button type="button" class="idCheck">아이디 중복확인</button>

			<div class="container-contact100-form-btn">
				<input class="contact100-form-btn" id="submit" type="submit" value="가입하기" style="width:170px" disabled="disabled" />
				&nbsp;
	        	<input class="contact100-form-btn" id="cancel_button" type="button" value="취소" style="width:170px"/>
			</div>			
			
			<script type="text/javascript">
        	window.addEventListener('load', function(event) {
	        	var btnCancel = document.querySelector('#cancel_button');
        		btnCancel.addEventListener('click', function(event) {
        			location.href = "/spacerental/";
        		});
        	});
        	</script>
		</form>
	</div>		
</div>

<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13"></script>
<script type="text/javascript">
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-23581568-13');
</script>

<jsp:include page="/WEB-INF/views/include/footer.jsp"/> 
<script type="text/javascript">
$(".idCheck").click(function() {
	var query = { id : $("#id").val() };

	$.ajax({
		url : "/spacerental/account/idCheck",
		type : "POST",
		data : query,
		success : function(data) {
			if (data == 1) {
				$(".result .msg").text("이미 사용중인 아이디 입니다.");
				$(".result .msg").attr("style", "color:#f00");
				$("#submit").attr("disabled", "disabled");
			} else {
				$(".result .msg").text("사용 가능한 아이디 입니다.");
				$(".result .msg").attr("style", "color:#00f");
				$("#submit").removeAttr("disabled");
			}
		}
	});
});
$("#id").keyup(function() {
	$(".result .msg").text("중복확인을 해주세요.");
	$(".result .msg").attr("style", "color:#000");
	$("#submit").attr("disabled", "disabled");

});
</script>
