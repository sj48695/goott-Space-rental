<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" language="java" contentType="text/html; charset=utf-8"
	     pageEncoding="utf-8"%>

<jsp:include page="/WEB-INF/views/include/header.jsp"/> 
<link rel="stylesheet" type="text/css" href="/spacerental/resources/css/select2.min.css">
<link rel="stylesheet" type="text/css" href="/spacerental/resources/css/util.css">
<link rel="stylesheet" type="text/css" href="/spacerental/resources/css/main.css">

	<div class="menu">
		<div class="menu_container text-right">
			<div class="menu_close">close</div>
			<nav class="menu_nav">
				<ul>
					<li><a href="/spacerental/">홈</a></li>
					<li><a href="listings.html">장소</a></li>
					<li><a href="blog.html">분실물</a></li>
					<li><a href="/spacerental/noticeview/notice">공지사항</a></li>
				</ul>
			</nav>
			<div class="menu_link">
				<a href="#">+Add Listing</a>
			</div>
		</div>
	</div>
	
	<div class="super_container">
	
		<header class="header">
			<div class="header_overlay"></div>
			<div class="header_content d-flex flex-row align-items-center justify-content-start">
				
				<!-- Logo -->
				<div class="logo"><a href="/spacerental/">빌려조<br> 찾아조<br><span>&nbsp;&nbsp;&nbsp;&nbsp;다조</span><span>+</span></a></div>
	
				<!-- Header Nav -->
				<div class="header_right d-flex flex-row align-items-center justify-content-start ml-auto">
					<nav class="main_nav">
						<ul class="d-flex flex-row align-items-center justify-content-start">
							<li class="active"><a href="/spacerental/">홈</a></li>
							<li><a href="listings.html">장소</a></li>
							<li><a href="blog.html">분실물</a></li>
							<li><a href="/spacerental/noticeview/notice">공지사항</a></li>
						</ul>
					</nav>
					<!-- <div class="add_listing text-center trans_200"><a href="#">+Add Listing</a></div> -->
					<div class="log_reg">
						<ul class="d-flex flex-row align-items-center justify-content-start">
							<li><a href="/spacerental/account/login">Login</a></li>
							<li><a href="/spacerental/account/register">Register</a></li>
						</ul>
					</div> 
					<div class="hamburger">
						<i class="fa fa-bars trans_200"></i>
					</div>
				</div>
	
			</div>
		</header>
		
		<div class="bg-contact100" style="background-image: url('/spacerental/resources/images/register_background.jpg');">
		<div class="container-contact100">
			<div class="wrap-contact100">
			
				<div class="contact100-pic js-tilt" data-tilt>
					<img src="/spacerental/resources/images/register_picture.png" alt="IMG">
				</div>

				<form class="contact100-form validate-form" action="login" method="post">
					<span class="contact100-form-title">
						로그인
					</span>

					<div class="wrap-input100 validate-input" data-validate = "아이디는 필수항목입니다.">
						<input class="input100" type="text" name="id" placeholder="아이디">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-user" aria-hidden="true"></i>
						</span>
					</div>

					<div class="wrap-input100 validate-input" data-validate = "비밀번호는 필수항목입니다.">
						<input class="input100" type="password" name="passwd" placeholder="비밀번호">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-user" aria-hidden="true"></i>
						</span>
					</div>

					<div class="container-contact100-form-btn">
						<button class="contact100-form-btn">
							로그인
						</button>
					</div>
					
				</form>
				
			</div>		
		</div>
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

<jsp:include page="/WEB-INF/views/include/footer.jsp"/> 
