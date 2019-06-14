<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	     
<!DOCTYPE html>
<html lang="ko">
<head>
<title>${ requestScope.title }</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="DirectoryPlus template project">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- space-writeForm -->
<link rel="stylesheet" type="text/css" href="/spacerental/resources/styles/spacewrite.css">

<!-- home & notice -->
<link rel="stylesheet" type="text/css" href="/spacerental/resources/styles/bootstrap-4.1.2/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/spacerental/resources/plugins/font-awesome-4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="/spacerental/resources/plugins/OwlCarousel2-2.3.4/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="/spacerental/resources/plugins/OwlCarousel2-2.3.4/owl.theme.default.css">
<link rel="stylesheet" type="text/css" href="/spacerental/resources/plugins/OwlCarousel2-2.3.4/animate.css">
<link rel="stylesheet" type="text/css" href="/spacerental/resources/styles/main_styles.css">
<link rel="stylesheet" type="text/css" href="/spacerental/resources/styles/responsive.css">

</head>
<body>

	<!-- Menu -->
	<div class="menu">
		<div class="menu_container text-right">
			<div class="menu_close">close</div>
			<nav class="menu_nav">
				<ul>
					<li><a href="/spacerental/">홈</a></li>
					<li><a href="/spacerental/space/write">장소</a></li>
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
	
		<!-- Header -->
		<header class="header">
			<div class="header_overlay"></div>
			<div class="header_content d-flex flex-row align-items-center justify-content-start">

				<!-- Logo -->
				<div class="logo">
					<a href="/spacerental/">빌려조<br> 찾아조<br>
					<span>&nbsp;&nbsp;&nbsp;&nbsp;다조+</span></a>
				</div>

				<!-- Header Nav -->
				<div class="header_right d-flex flex-row align-items-center justify-content-start ml-auto">
					<nav class="main_nav">
						<ul class="d-flex flex-row align-items-center justify-content-start">
							<li class="active"><a href="/spacerental/">홈</a></li>
							<li><a href="/spacerental/space/write">장소</a></li>
							<li><a href="blog.html">분실물</a></li>
							<li><a href="/spacerental/noticeview/notice">공지사항</a></li>
						</ul>
					</nav>
					<!-- <div class="add_listing text-center trans_200"><a href="#">+Add Listing</a></div> -->
					<div class="log_reg">
						<ul class="d-flex flex-row align-items-center justify-content-start">
							<li><a href="#">Login</a></li>
							<li><a href="#">Register</a></li>
						</ul>
					</div>
					<div class="hamburger"><i class="fa fa-bars trans_200"></i></div>
				</div>

			</div>
		</header>