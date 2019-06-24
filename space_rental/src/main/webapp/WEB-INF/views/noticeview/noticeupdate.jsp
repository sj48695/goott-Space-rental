<%@page import="org.springframework.web.bind.annotation.SessionAttribute"%>
<%@ page import ="com.spacerental.vo.Notice" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" language="java" contentType="text/html; charset=utf-8"
	     pageEncoding="utf-8"%>
<c:set var="nav" value="notice" scope="request"/>
<c:set var="title" value="공지사항 수정" scope="request"/>
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
								<div class="home_title">공지수정</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Contact -->

      <!-- <div class="contact container_custom" style="margin:auto">
         <div class="container">
            <div class="row"> -->

               <!-- Contact Content -->
        	<div align="center" style="width:100%; height:100%">
              <div class="col-xl-6"> 
                  <div class="contact_content">
                     <div class="contact_form_container">
                        <div class="section_title"><h1>공지사항</h1></div>   
                        <form action="/spacerental/noticeview/noticeupdatefirm" method="get" class="contact_form" id="contact_form" >
                        <c:forEach items="${ noticess }" var="notice">
                        <input type="hidden" name="noticeNo" value="${notice.noticeNo }"/>
                           <div>
                              <textarea type="text" class="contact_input" name="title">${ notice.title }</textarea>
                           </div>
                           <div>
                              <textarea class="contact_input contact_textarea" name="content" required="required" >${ notice.content }</textarea>
                           </div>
                        </c:forEach>
                           <button class="contact_button trans_200">수정완료</button>
                           <input  type="button" class="contact_button trans_200" id="return" value="돌아가기" />
                        </form>
                      <!--  <div class="contact_info"> --><div align="left">
                             </div>
                     </div>
                  </div>
               </div>   
                      <br> <br> <br> 
                     
                  
               <!-- <div class="col-xl-6">
                  <div class="contact_map_container">
                     <img src="/spacerental/resources/images/icon_1.svg" style="margin:0">

                  </div>
               </div> -->
<!-- 
      </div>
         </div>
      </div>  -->
		
		<!-- Footer -->

	
	</div>
		

<script type="text/javascript">
	
	window.addEventListener('load',function(event){
		
		
		var btnReturn = document.querySelector('#return');
		btnReturn.addEventListener('click',function(event){
		location.href="/spacerental/noticeview/notice";
	});
		
	});
</script>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>