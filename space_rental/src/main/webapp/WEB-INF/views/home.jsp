<<<<<<< HEAD
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" language="java" contentType="text/html; charset=utf-8"
	     pageEncoding="utf-8"%>
<jsp:include page="/WEB-INF/views/include/header.jsp"/> 

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
			
			<!-- Home Slider -->
			<div class="home_slider_container">
				<div class="owl-carousel owl-theme home_slider">
					
					<!-- Slide -->
					<div class="slide">
						<div class="background_image" style="background-image:url(/spacerental/resources/images/index.jpg)"></div>
						<div class="home_container">
							<div class="container">
								<div class="row">
									<div class="col-xl-8 offset-xl-2">
										<div class="home_content text-center">
											<div class="home_title"><h1>종류별  찾기</h1></div>
											<div class="search_form_container">
												<form action="#" class="search_form" id="search_form">
													<div class="d-flex flex-sm-row flex-column align-items-sm-start align-items-center justify-content-sm-between">
														<input type="text" class="search_input" placeholder="ex) 스터디룸, 회의실, 세미나실..." required="required">
														<button class="search_button">Search</button>
													</div>
												</form>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<!-- Slide -->
					<div class="slide">
						<div class="background_image" style="background-image:url(/spacerental/resources/images/index.jpg)"></div>
						<div class="home_container">
							<div class="container">
								<div class="row">
									<div class="col-xl-8 offset-xl-2">
										<div class="home_content text-center">
											<div class="home_title"><h1>주소지로 찾기</h1></div>
											<div class="search_form_container">
												<form action="#" class="search_form" id="search_form">
													<div class="d-flex flex-sm-row flex-column align-items-sm-start align-items-center justify-content-sm-between">
														<input type="text" class="search_input" placeholder="ex)강남구, 서초구, 동작구, 송파구..." required="required">
														<button class="search_button">Search</button>
													</div>
												</form>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<!-- Slide -->
					<div class="slide">
						<div class="background_image" style="background-image:url(/spacerental/resources/images/index.jpg)"></div>
						<div class="home_container">
							<div class="container">
								<div class="row">
									<div class="col-xl-8 offset-xl-2">
										<div class="home_content text-center">
											<div class="home_title"><h1>분실물 찾기</h1></div>
											<div class="search_form_container">
												<form action="#" class="search_form" id="search_form">
													<div class="d-flex flex-sm-row flex-column align-items-sm-start align-items-center justify-content-sm-between">
														<input type="text" class="search_input" placeholder="ex)지갑, 핸드폰, 손목시계 ..." required="required">
														<button class="search_button">Search</button>
													</div>
												</form>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

				</div>

				<!-- Home Slider Dots -->

				<div class="home_slider_dots">
					<ul id="home_slider_custom_dots" class="home_slider_custom_dots">
						<li class="home_slider_custom_dot active">종류별 찾기</li>
						<li class="home_slider_custom_dot">주소로 찾기</li>
						<li class="home_slider_custom_dot">분실물 검색</li>
					</ul>
				</div>

			</div>
		</div>

		<!-- Categories -->

		<div class="categories">
			<div class="container">
				<div class="row">
					<div class="col">
						<div class="categories_container d-flex flex-md-row flex-column align-items-start justify-content-start">
							
							<!-- Category -->
							<div class="category text-center">
								<a href="listings.html">
									<div class="d-flex flex-md-column flex-row align-items-md-center align-items-md-start align-items-center justify-content-start">
										<div class="cat_icon"><img src="/spacerental/resources/images/icon_1.svg" class="svg" alt="https://www.flaticon.com/authors/monkik"></div>
										<div class="cat_title">Restaurants</div>
									</div>
								</a>
							</div>

							<!-- Category -->
							<div class="category text-center">
								<a href="listings.html">
									<div class="d-flex flex-md-column flex-row align-items-md-center align-items-md-start align-items-center justify-content-start">
										<div class="cat_icon"><img src="/spacerental/resources/images/icon_2.svg" class="svg" alt="https://www.flaticon.com/authors/monkik"></div>
										<div class="cat_title">Hotels</div>
									</div>	
								</a>
							</div>

							<!-- Category -->
							<div class="category text-center">
								<a href="listings.html">
									<div class="d-flex flex-md-column flex-row align-items-md-center align-items-md-start align-items-center justify-content-start">
										<div class="cat_icon"><img src="/spacerental/resources/images/icon_3.svg" class="svg" alt="https://www.flaticon.com/authors/monkik"></div>
										<div class="cat_title">Nightlife</div>
									</div>
								</a>
							</div>

							<!-- Category -->
							<div class="category text-center">
								<a href="listings.html">
									<div class="d-flex flex-md-column flex-row align-items-md-center align-items-md-start align-items-center justify-content-start">
										<div class="cat_icon"><img src="/spacerental/resources/images/icon_4.svg" class="svg" alt="https://www.flaticon.com/authors/monkik"></div>
										<div class="cat_title">Coffeeshops</div>
									</div>
								</a>
							</div>

							<!-- Category -->
							<div class="category text-center">
								<a href="listings.html">
									<div class="d-flex flex-md-column flex-row align-items-md-center align-items-md-start align-items-center justify-content-start">
										<div class="cat_icon"><img src="/spacerental/resources/images/icon_5.svg" class="svg" alt="https://www.flaticon.com/authors/monkik"></div>
										<div class="cat_title">Culture</div>
									</div>
								</a>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>

		
		
</div>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/> 
© 2019 GitHub, Inc.
Terms
Privacy
Security
Status
Help
Contact GitHub
Pricing
API
Training
Blog
About
=======
<%@page import="java.net.URLEncoder"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" language="java" contentType="text/html; charset=utf-8"
	     pageEncoding="utf-8"%>
<c:set var="title" value="찾아줘  빌려줘 다조" scope="request" />
<jsp:include page="/WEB-INF/views/include/header.jsp" /> 

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
			
			<!-- Home Slider -->
			<div class="home_slider_container">
				<div class="owl-carousel owl-theme home_slider">
					
					<!-- Slide -->
					<div class="slide">
						<div class="background_image" style="background-image:url(/spacerental/resources/images/index.jpg)"></div>
						<div class="home_container">
							<div class="container">
								<div class="row">
									<div class="col-xl-8 offset-xl-2">
										<div class="home_content text-center">
											<div class="home_title"><h1>종류별  찾기</h1></div>
											<div class="search_form_container">
												<form action="#" class="search_form" id="search_form">
													<div class="d-flex flex-sm-row flex-column align-items-sm-start align-items-center justify-content-sm-between">
														<input type="text" class="search_input" placeholder="ex) 스터디룸, 회의실, 세미나실..." required="required">
														<button class="search_button">Search</button>
													</div>
												</form>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<!-- Slide -->
					<div class="slide">
						<div class="background_image" style="background-image:url(/spacerental/resources/images/index.jpg)"></div>
						<div class="home_container">
							<div class="container">
								<div class="row">
									<div class="col-xl-8 offset-xl-2">
										<div class="home_content text-center">
											<div class="home_title"><h1>주소지로 찾기</h1></div>
											<div class="search_form_container">
												<form action="#" class="search_form" id="search_form">
													<div class="d-flex flex-sm-row flex-column align-items-sm-start align-items-center justify-content-sm-between">
														<input type="text" class="search_input" placeholder="ex)강남구, 서초구, 동작구, 송파구..." required="required">
														<button class="search_button">Search</button>
													</div>
												</form>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<!-- Slide -->
					<div class="slide">
						<div class="background_image" style="background-image:url(/spacerental/resources/images/index.jpg)"></div>
						<div class="home_container">
							<div class="container">
								<div class="row">
									<div class="col-xl-8 offset-xl-2">
										<div class="home_content text-center">
											<div class="home_title"><h1>분실물 찾기</h1></div>
											<div class="search_form_container">
												<form action="#" class="search_form" id="search_form">
													<div class="d-flex flex-sm-row flex-column align-items-sm-start align-items-center justify-content-sm-between">
														<input type="text" class="search_input" placeholder="ex)지갑, 핸드폰, 손목시계 ..." required="required">
														<button class="search_button">Search</button>
													</div>
												</form>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

				</div>

				<!-- Home Slider Dots -->

				<div class="home_slider_dots">
					<ul id="home_slider_custom_dots" class="home_slider_custom_dots">
						<li class="home_slider_custom_dot active">종류별 찾기</li>
						<li class="home_slider_custom_dot">주소로 찾기</li>
						<li class="home_slider_custom_dot">분실물 검색</li>
					</ul>
				</div>

			</div>
		</div>

		<!-- Categories -->

		<div class="categories">
			<div class="container">
				<div class="row">
					<div class="col">
						<div class="categories_container d-flex flex-md-row flex-column align-items-start justify-content-start">
							
							<!-- Category -->
							<div class="category text-center">
								<a href="listings.html">
									<div class="d-flex flex-md-column flex-row align-items-md-center align-items-md-start align-items-center justify-content-start">
										<div class="cat_icon"><img src="/spacerental/resources/images/icon_1.svg" class="svg" alt="https://www.flaticon.com/authors/monkik"></div>
										<div class="cat_title">Restaurants</div>
									</div>
								</a>
							</div>

							<!-- Category -->
							<div class="category text-center">
								<a href="listings.html">
									<div class="d-flex flex-md-column flex-row align-items-md-center align-items-md-start align-items-center justify-content-start">
										<div class="cat_icon"><img src="/spacerental/resources/images/icon_2.svg" class="svg" alt="https://www.flaticon.com/authors/monkik"></div>
										<div class="cat_title">Hotels</div>
									</div>	
								</a>
							</div>

							<!-- Category -->
							<div class="category text-center">
								<a href="listings.html">
									<div class="d-flex flex-md-column flex-row align-items-md-center align-items-md-start align-items-center justify-content-start">
										<div class="cat_icon"><img src="/spacerental/resources/images/icon_3.svg" class="svg" alt="https://www.flaticon.com/authors/monkik"></div>
										<div class="cat_title">Nightlife</div>
									</div>
								</a>
							</div>

							<!-- Category -->
							<div class="category text-center">
								<a href="listings.html">
									<div class="d-flex flex-md-column flex-row align-items-md-center align-items-md-start align-items-center justify-content-start">
										<div class="cat_icon"><img src="/spacerental/resources/images/icon_4.svg" class="svg" alt="https://www.flaticon.com/authors/monkik"></div>
										<div class="cat_title">Coffeeshops</div>
									</div>
								</a>
							</div>

							<!-- Category -->
							<div class="category text-center">
								<a href="listings.html">
									<div class="d-flex flex-md-column flex-row align-items-md-center align-items-md-start align-items-center justify-content-start">
										<div class="cat_icon"><img src="/spacerental/resources/images/icon_5.svg" class="svg" alt="https://www.flaticon.com/authors/monkik"></div>
										<div class="cat_title">Culture</div>
									</div>
								</a>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
</div>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/> 
