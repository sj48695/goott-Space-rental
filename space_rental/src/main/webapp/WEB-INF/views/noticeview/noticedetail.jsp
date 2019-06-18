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