<%@page import="org.springframework.web.bind.annotation.SessionAttribute"%>
<%@ page import ="com.spacerental.vo.Notice" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" language="java" contentType="text/html; charset=utf-8"
	     pageEncoding="utf-8"%>
	     
<!DOCTYPE html>
<html lang="en">
<head>
<title>공지작성</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="DirectoryPlus template project">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="/spacerental/resources/styles/bootstrap-4.1.2/bootstrap.min.css">
<link href="/spacerental/resources/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="/spacerental/resources/styles/contact.css">
<link rel="stylesheet" type="text/css" href="/spacerental/resources/styles/contact_responsive.css">
</head>
<body>

<!-- Menu -->

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
	</div>
</div>

<div class="super_container">

	<!-- Header -->

	<header class="header">
		<div class="header_background"><div class="background_image" style="background-image:url(/spacerental/resources/images/header.jpg)"></div></div>
		<div class="header_overlay"></div>
		<div class="header_content d-flex flex-row align-items-center justify-content-start">
			
			<!-- Logo -->
			<div class="logo"><a href="/spacerental/">빌려조<br> 찾아조<br><span>&nbsp;&nbsp;&nbsp;&nbsp;다조</span><span>+</span></a></div>

			<!-- Header Nav -->
			<div class="header_right d-flex flex-row align-items-center justify-content-start ml-auto">
				<nav class="main_nav">
					<ul class="d-flex flex-row align-items-center justify-content-start">
						<li><a href="/spacerental/">홈</a></li>
				<li><a href="listings.html">장소</a></li>
				<li><a href="blog.html">분실물</a></li>
				<li><a href="/spacerental/noticeview/notice">공지사항</a></li>
					</ul>
				</nav>
				<div class="add_listing text-center trans_200"><a href="#">+Add Listing</a></div>
				<div class="log_reg">
					<ul class="d-flex flex-row align-items-center justify-content-start">
						<li><a href="#">Login</a></li>
						<li><a href="#">Register</a></li>
					</ul>
				</div>
				<div class="hamburger">
					<i class="fa fa-bars trans_200"></i>
				</div>
			</div>

		</div>
	</header>

	<div class="super_container_inner">
		<div class="super_overlay"></div>

		<!-- Home -->

		<div class="home">
			<div class="parallax_background parallax-window" data-parallax="scroll" data-image-src="/spacerental/resources/images/contact.jpg" data-speed="0.8"></div>
			<div class="home_container">
				<div class="container">
					<div class="row">
						<div class="col">
							<div class="home_content">
								<div class="home_title">공지상세</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Contact -->

		<div class="contact container_custom">
			<div class="container">
				<div class="row">

					<!-- Contact Content -->
					<div class="col-xl-6">
						<div class="contact_content">
							<div class="contact_form_container">
								<div class="section_title"><h1>작성란</h1></div>
								<form action="/spacerental/noticeview/noticeupload" method="get" class="contact_form" id="contact_form" >
									
									<div>
										<input type="text" class="contact_input" placeholder="제목" name="title">
									</div>
									<div>
										<textarea class="contact_input contact_textarea" placeholder="내용" required="required" name="content"></textarea>
									</div>
									<button class="contact_button trans_200">작성완료</button>
								</form>
								
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>

		<!-- Footer -->

		<footer class="footer container_custom">
			<div class="container">
				<div class="row">
					<div class="col">
						<div class="footer_container d-flex flex-md-row flex-column align-items-center justify-content-md-start justify-content-center">
							<div class="copyright order-md-1 order-2"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
</div>
							<nav class="footer_nav ml-md-auto order-md-2 order-1">
								<ul class="d-flex flex-row align-items-center justify-content-start">
									<li><a href="index.html">Home</a></li>
									<li><a href="#">About us</a></li>
									<li><a href="listings.html">Listings</a></li>
									<li><a href="blog.html">News</a></li>
									<li class="active"><a href="contact.html">Contact</a></li>
								</ul>
							</nav>
						</div>
					</div>
				</div>
			</div>
		</footer>
	</div>
		


<jsp:include page="/WEB-INF/views/include/footer.jsp"/>