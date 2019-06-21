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
								<div class="home_title">공지상세</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Contact -->
 <!-- Contact -->
<!-- 
      <div class="contact container_custom" style="margin:auto">
       <div class="container">
         <div class="row"> -->
		<div align="center" style="width:100%; height:100%">
               <!-- Contact Content -->
           <div class="col-xl-6" >
                <div class="contact_content" align="center">
                   <div class="contact_form_container">
                       <div class="section_title"><h1>공지사항</h1></div>   
                       <form action="noticeupdate" method="get" class="contact_form" id="contact_form" >
                         <div>
                             <textarea class="contact_input" name="title" readonly="readonly" style="fontsize:200%">${ notices.title }</textarea>
                           </div>
                          <div>
                             <h6> <textarea class="contact_input contact_textarea" name="content" required="required"  readonly="readonly">${ notices.content }</textarea></h6>
                           </div>
                           
                          	<c:choose>
			           			<c:when test="${ id eq 'manager' }">
                          			<input  type="button" class="contact_button trans_200" id="update" value="수정" />
                           			<input  type="button" class="contact_button trans_200" id="delete" value="삭제" />
                           			<input  type="button" class="contact_button trans_200" id="return" value="돌아가기" />
                        		</c:when>
                          		<c:otherwise>
                        			<!-- <input  type="button" class="contact_button trans_200" id="update" value="수정" />
                           			<input  type="button" class="contact_button trans_200" id="delete" value="삭제" /> -->
                           			<input  type="button" class="contact_button trans_200" id="return1" value="돌아가기" />
                         		</c:otherwise>
			        			</c:choose>
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
               </div>
             </div> -->
<!-- 
            </div>
         </div>
      </div>
 -->
		<!-- Footer -->

	
	</div>
	
	
	
	<script type="text/javascript">
	window.addEventListener('load',function(event){
		
		var btnUpdate=document.querySelector('#update');
		btnUpdate.addEventListener('click',function(event){
			location.href="/spacerental/noticeview/noticeupdate/${notices.noticeNo}";
		});
		
		var btnDelete=document.querySelector('#delete');
		btnDelete.addEventListener('click',function(event){
			var ok = confirm("${notices.noticeNo}번 공지를 삭제할까요?");
			if(ok){
			location.href="/spacerental/noticeview/noticedelete/${notices.noticeNo}";
			}
		});
	
		var btnReturn=document.querySelector('#return');
		btnReturn.addEventListener('click',function(event){
			location.href="/spacerental/noticeview/notice";
		});
	});
	
	window.addEventListener('load',function(event){
		
		
		var btnReturn=document.querySelector('#return1');
		btnReturn.addEventListener('click',function(event){
			location.href="/spacerental/noticeview/notice";
		});
	});
	
	
	</script>

<jsp:include page="/WEB-INF/views/include/footer.jsp"/>