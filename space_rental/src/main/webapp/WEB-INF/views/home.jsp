<%@page import="java.net.URLEncoder"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" language="java" contentType="text/html; charset=utf-8"
	     pageEncoding="utf-8"%>

<c:set var="title" value="찾아줘 빌려줘 다조" scope="request" />
<jsp:include page="/WEB-INF/views/include/header.jsp" /> 

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
											<div class="home_title"><h1>유형으로 검색하기</h1></div>
											<div class="search_form_container">
												<form action="/spacerental/space/spacesearch?&value1"class="search_form" id="search_form">
													<div class="d-flex flex-sm-row flex-column align-items-sm-start align-items-center justify-content-sm-between">
														<input type="text" class="search_input" placeholder="ex) 스터디룸, 회의실, 세미나실.etc" name="value1" required="required">
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
											<div class="home_title"><h1>주소지로 검색하기</h1></div>
											<div class="search_form_container">
												<form action="/spacerental/space/addsearch?&value2" class="search_form" id="search_form">
													<div class="d-flex flex-sm-row flex-column align-items-sm-start align-items-center justify-content-sm-between">
														<input type="text" class="search_input" placeholder="ex)강남구, 서초구, 동작구, 송파구.etc" name="value2" required="required">
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
											<div class="home_title"><h1>분실물 검색하기</h1></div>
											<div class="search_form_container">
												<form action="/spacerental/loseview/losesearch?&value3" class="search_form" id="search_form">
													<div class="d-flex flex-sm-row flex-column align-items-sm-start align-items-center justify-content-sm-between">
														<input type="text" class="search_input" placeholder="ex)지갑, 핸드폰, 손목시계 .etc" name="value3" required="required">
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
						
						<li class="home_slider_custom_dot">01.</li>						
						<li class="home_slider_custom_dot">02.</li>
						<li class="home_slider_custom_dot">03.</li>
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
								<a href="/spacerental/space/computer">
									<div class="d-flex flex-md-column flex-row align-items-md-center align-items-md-start align-items-center justify-content-start">
										<div class="cat_icon"><img src="/spacerental/resources/images/computer.svg" class="svg" alt="https://www.flaticon.com/authors/monkik"></div>
										<div class="cat_title">컴퓨터</div>
									</div>
								</a>
							</div>

							<!-- Category -->
							<div class="category text-center">
								<a href="/spacerental/space/beamproject">
									<div class="d-flex flex-md-column flex-row align-items-md-center align-items-md-start align-items-center justify-content-start">
										<div class="cat_icon"><img src="/spacerental/resources/images/beam.svg" class="svg" alt="https://www.flaticon.com/authors/monkik"></div>
										<div class="cat_title">빔 프로젝터</div>
									</div>	
								</a>
							</div>

							<!-- Category -->
							<div class="category text-center">
								<a href="/spacerental/space/wifi">
									<div class="d-flex flex-md-column flex-row align-items-md-center align-items-md-start align-items-center justify-content-start">
										<div class="cat_icon"><img src="/spacerental/resources/images/wifi.svg" class="svg" alt="https://www.flaticon.com/authors/monkik"></div>
										<div class="cat_title">WIFI</div>
									</div>
								</a>
							</div>

							<!-- Category -->
							<div class="category text-center">
								<a href="/spacerental/space/10less">
									<div class="d-flex flex-md-column flex-row align-items-md-center align-items-md-start align-items-center justify-content-start">
										<div class="cat_icon"><img src="/spacerental/resources/images/10less.svg" class="svg" alt="https://www.flaticon.com/authors/monkik"></div>
										<div class="cat_title">10인 미만</div>
									</div>
								</a>
							</div>

							<!-- Category -->
							<div class="category text-center">
								<a href="/spacerental/space/10more">
									<div class="d-flex flex-md-column flex-row align-items-md-center align-items-md-start align-items-center justify-content-start">
										<div class="cat_icon"><img src="/spacerental/resources/images/10more.svg" class="svg" alt="https://www.flaticon.com/authors/monkik"></div>
										<div class="cat_title">10인 이상</div>
									</div>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div><!-- super container inner -->
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
