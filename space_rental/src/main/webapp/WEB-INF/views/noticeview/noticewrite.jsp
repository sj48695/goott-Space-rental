<%@page import="org.springframework.web.bind.annotation.SessionAttribute"%>
<%@ page import ="com.spacerental.vo.Notice" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" language="java" contentType="text/html; charset=utf-8"
	     pageEncoding="utf-8"%>
	     
<c:set var="title" value="공간 등록" scope="request"/>
<jsp:include page="/WEB-INF/views/include/header.jsp"/>
<link rel="stylesheet" type="text/css" href="/spacerental/resources/styles/blog.css">
<link rel="stylesheet" type="text/css" href="/spacerental/resources/styles/blog_responsive.css">
<link rel="stylesheet" type="text/css" href="/spacerental/resources/styles/contact.css">
<link rel="stylesheet" type="text/css" href="/spacerental/resources/styles/contact_responsive.css">

	<div class="super_container_inner">
		<div class="super_overlay"></div>

		<!-- Home -->

		<div class="home">
			<div class="parallax_background parallax-window" data-parallax="scroll" style="background-image: url(/spacerental/resources/images/contact.jpg)" data-speed="0.8"></div>
			<div class="home_container">
				<div class="container">
					<div class="row">
						<div class="col">
							<div class="home_content">
								<div class="home_title">공지작성</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Contact -->

		<!-- <div class="contact container_custom" >
			<div class="container" >
				<div class="row"> -->

					<!-- Contact Content -->
					<div align ="center" >
					<div class="col-xl-6" >
						<div class="contact_content" >
							<div class="contact_form_container">
								<div class="section_title"><h1>작성란</h1></div>
								<form action="/spacerental/noticeview/noticeupload" method="get" class="contact_form" id="contact_form" >
									
									<div>
										<input type="text" class="contact_input" placeholder="제목" name="title">
									</div>
									<div>
										<textarea  class="contact_input contact_textarea" placeholder="내용" required="required" name="content"></textarea>
									</div>
									<button class="contact_button trans_200">작성완료</button>
								</form>
								
								</div>
							</div>
						</div>
					<br> <br> <br> 
                     

		<!-- Footer -->

	</div>
		


<jsp:include page="/WEB-INF/views/include/footer.jsp"/>