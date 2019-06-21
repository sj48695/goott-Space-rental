<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<c:set var="title" value="공간 등록" scope="request"/>
<jsp:include page="/WEB-INF/views/include/header.jsp"/>
<meta name="description" content="DirectoryPlus template project">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="/spacerental/resources/styles/bootstrap-4.1.2/bootstrap.min.css">
<link href="/spacerental/resources/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="/spacerental/resources/styles/elements.css">
<link rel="stylesheet" type="text/css" href="/spacerental/resources/styles/elements_responsive.css">
	<div class="super_container_inner">
		<div class="super_overlay"></div>
	
		<!-- Home -->
	
		<div class="home">
			<div class="parallax_background parallax-window" data-parallax="scroll" style="background-image:url(/spacerental/resources/images/contact.jpg)" data-speed="0.8"></div>
			<div class="home_container">
				<div class="container">
					<div class="row">
						<div class="col">
							<div class="home_content">
								<div class="home_title">ABOUT US</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		</div>
		
		
		
		<!-- Elements -->
<div>
	<div >
		<div class="elements">
		
			<div class="container" >
			
				<div class="row">
				
					<div class="col">
					
						<div>
						<!-- USERS -->
						<div class="milestones" style="z-index:2">
							<div class="section_title"><h1>USERS</h1></div>
							<div class="milestones_container d-flex flex-row align-items-start justify-content-start flex-wrap">
								
								<!-- Milestone -->
								<div class="milestone d-flex flex-row align-items-start justify-content-start">
									<div class="milestone_content">
										<div class="milestone_counter" data-end-value="${uT}">0</div>
										<div class="milestone_title">TOTAL</div>
									</div>
								</div>

								<!-- Milestone -->
								<div class="milestone d-flex flex-row align-items-start justify-content-start">
									<div class="milestone_content">
										<div class="milestone_counter" data-end-value="${csC }">0</div>
										<div class="milestone_title">CUSTOMERS</div>
									</div>
								</div>

								<!-- Milestone -->
								<div class="milestone d-flex flex-row align-items-start justify-content-start">
									<div class="milestone_content">
										<div class="milestone_counter" data-end-value="${hC }">0</div>
										<div class="milestone_title">HOSTS</div>
									</div>
								</div>
							</div>
						</div>

						<!-- SPACES -->
						<div class="milestones">
							<div class="section_title"><h1>SPACES</h1></div>
							<div class="milestones_container d-flex flex-row align-items-start justify-content-start flex-wrap">
								
								<!-- Milestone -->
								<div class="milestone d-flex flex-row align-items-start justify-content-start">
									<div class="milestone_content">
										<div class="milestone_counter" data-end-value="${sT}">0</div>
										<div class="milestone_title">TOTAL</div>
									</div>
								</div>
								
								<!-- Milestone -->
								<div class="milestone d-flex flex-row align-items-start justify-content-start">
									<div class="milestone_content">
										<div class="milestone_counter" data-end-value="${cC }">0</div>
										<div class="milestone_title">COMPUTER</div>
									</div>
								</div>

								<!-- Milestone -->
								<div class="milestone d-flex flex-row align-items-start justify-content-start">
									<div class="milestone_content">
										<div class="milestone_counter" data-end-value="${bC }">0</div>
										<div class="milestone_title">BEAM</div>
									</div>
								</div>

								<!-- Milestone -->
								<div class="milestone d-flex flex-row align-items-start justify-content-start">
									<div class="milestone_content">
										<div class="milestone_counter" data-end-value="${wC }">0</div>
										<div class="milestone_title">WIFI</div>
									</div>
								</div>

							</div>
						</div>
					</div>
					</div>
				</div>
			</div>
		</div>
		
		
		
		
<br> <br> <br> 
                     	<div align="left">
                     	<div class="section_title" align="left"><h4>구트아카데미<br></h4></div>
                           <div >
                              <ul>
                                 <li class="d-flex flex-row align-items-start justify-content-start">
                                    <div class="contact_info_icon"><br><img src="/spacerental/resources/images/info_1.png" alt=""></div>
                                    <div class="contact_info_content"><br><span>주소: </span>서울시 구로구 시흥대로 163길 33 주호타워 2층 구트 아카데미 학원(구로동 1129-1)</div>
                                 </li>
                                 <li class="d-flex flex-row align-items-start justify-content-start">
                                    <div class="contact_info_icon"><img src="/spacerental/resources/images/info_2.png" alt=""></div>
                                    <div class="contact_info_content"><span>전화번호: </span>02-837-9922</div>
                                 </li>
                                 <li class="d-flex flex-row align-items-start justify-content-start">
                                    <div class="contact_info_icon"><img src="/spacerental/resources/images/info_3.png" alt=""></div>
                                    <div class="contact_info_content"><span>Copyright ©</span>주식회사구트. ALL RIGHTS RESERVED </div>
                                 </li>
                              </ul>
                           </div>
                           </div>		
	</div>	
		
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
									<li><a href="/spacerental/">홈</a></li>
									
									<li><a href="listings.html">장소</a></li>
									<li><a href="blog.html">분실물</a></li>
									<li class="active"><a href="/spacerental/noticeview/notice">공지사항</a></li>
								</ul>
							</nav>
						</div>
					</div>
				</div>
			</div>
		</footer>
	</div>




<script src="/spacerental/resources/js/jquery-3.3.1.min.js"></script>
<script src="/spacerental/resources/styles/bootstrap-4.1.2/popper.js"></script>
<script src="/spacerental/resources/styles/bootstrap-4.1.2/bootstrap.min.js"></script>
<script src="/spacerental/resources/plugins/greensock/TweenMax.min.js"></script>
<script src="/spacerental/resources/plugins/greensock/TimelineMax.min.js"></script>
<script src="/spacerental/resources/plugins/scrollmagic/ScrollMagic.min.js"></script>
<script src="/spacerental/resources/plugins/greensock/animation.gsap.min.js"></script>
<script src="/spacerental/resources/plugins/greensock/ScrollToPlugin.min.js"></script>
<script src="/spacerental/resources/plugins/easing/easing.js"></script>
<script src="/spacerental/resources/plugins/progressbar/progressbar.min.js"></script>
<script src="/spacerental/resources/plugins/parallax-js-master/parallax.min.js"></script>
<script src="/spacerental/resources/js/elements.js"></script>

<jsp:include page="/WEB-INF/views/include/footer.jsp"/>