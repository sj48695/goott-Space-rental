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
		<form class="contact100-form validate-form" action="login" method="post">
			<span class="contact100-form-title">로그인</span>

			<div class="wrap-input100 validate-input" data-validate = "아이디는 필수항목입니다.">
				<input class="input100" type="text" name="id" id="id" placeholder="아이디">
				<span class="focus-input100"></span>
				<span class="symbol-input100">
					<i class="fa fa-user" aria-hidden="true"></i>
				</span>
			</div>
			<div id="checkMsg"></div>

			<div class="wrap-input100 validate-input" data-validate = "비밀번호는 필수항목입니다.">
				<input class="input100" type="password" name="passwd" placeholder="비밀번호">
				<span class="focus-input100"></span>
				<span class="symbol-input100">
					<i class="fa fa-user" aria-hidden="true"></i>
				</span>
			</div>

			<div class="container-contact100-form-btn">
				<button class="contact100-form-btn" style="width:150px">로그인</button>
				<button class="contact100-form-btn" type="submit" id="checkbtn" style="width:150px">아이디 중복확인</button>
			</div>
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
	$ajax({
		url: '${pageContext.request.contextPath}/account/idCheck?id=' + id,
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