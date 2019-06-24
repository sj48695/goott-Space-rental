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
			<div class="wrap-input100" id="checkMsg"></div>

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

			<div class="container-contact100-form-btn">
				<input class="contact100-form-btn" id="register" type="submit" value="가입하기" style="width:170px"/>
				&nbsp;
	        	<input class="contact100-form-btn" id="cancel_button" type="button" value="취소" style="width:170px"/>
			</div>
			<button class="btn btn-link" type="submit" id="checkbtn">아이디 중복확인</button>
			
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
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-23581568-13');
</script>

<script type="text/javascript">
$("#id").blur(function() {
	var id = $('#id').val();
	$.ajax({
		url: '${pageContext.request.contextPath}/account/idCheck?id='+ id,
		type: 'post',
		success: function(data) {
			if(data == 1) {
				$("#checkMsg").text("이미 사용중인 아이디입니다.");
			} else {
				$("#checkMsg").text("사용가능한 아이디입니다.");
			}
		}
	});
});
</script>

<jsp:include page="/WEB-INF/views/include/footer.jsp"/> 
