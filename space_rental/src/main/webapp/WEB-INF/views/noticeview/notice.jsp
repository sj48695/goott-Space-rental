<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<c:set var="nav" value="notice" scope="request"/>
<c:set var="title" value="공지사항" scope="request"/>
<jsp:include page="/WEB-INF/views/include/header.jsp"/>
<link rel="stylesheet" type="text/css" href="/spacerental/resources/styles/blog.css">
<link rel="stylesheet" type="text/css" href="/spacerental/resources/styles/blog_responsive.css">

	<div class="super_container_inner">
		<div class="super_overlay"></div>
	
		<!-- Home -->
	
		<div class="home">
			<div class="parallax_background parallax-window" data-parallax="scroll" style="background-image:url(/spacerental/resources/images/blog.jpg)" data-speed="0.8"></div>
			<div class="home_container">
				<div class="container">
					<div class="row">
						<div class="col">
							<div class="home_content">
								<div class="home_title">공지사항</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="blog">
			<div class="container">
				<div class="row">
					<div class="col">
						<div class="blog_posts_container">
							<div class="blog_posts">
								
								<!-- Blog Post -->
							
						<c:forEach var="notice" items="${ Notices }">
								<div class="blog_post">
								
									<div class="blog_post_container">
										<div class="blog_post_image"><a href="noticedetail.jsp"></a></div>
										
										<div class="blog_post_content">
										
											<div >${notice.noticeNo }</div>
											<div class="blog_post_title"><h4><a href="noticedetail/${ notice.noticeNo }">${ notice.title }</a></h4></div>
											<div class="blog_post_tags">
											</div>
											<div class="blog_post_text">
											<p>${notice.content.substring(0,45)}</p>
											</div>
										
										</div>	
																	
									</div>
								
								</div>
							</c:forEach>
					</div>
				</div>
				
				<c:choose>
		            <c:when test='${ id eq "manager" }'>
				        <div class="row">
							<div class="col">
								<div class="blog_posts_more">
									<div class="button load_more_button ml-auto mr-auto"><a href="noticewrite">공지작성</a></div>
								</div>
							</div>
						</div>
		            </c:when>
		            <c:otherwise>
		            <div class="row">
							<div class="col">
								<div class="blog_posts_more">
									<!-- <div class="button load_more_button ml-auto mr-auto"><a href="noticewrite">공지작성</a></div> -->
								</div>
							</div>
						</div>
		            </c:otherwise>
		        </c:choose>
			</div>		
		</div>

	<!-- Footer -->

	</div>
</div>
	</div>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
