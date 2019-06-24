<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><%-- JSTL의 함수를 제공하는 taglib --%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="nav" value="space" scope="request"/>
<c:set var="title" value="공간 상세 페이지" scope="request"/>
<jsp:include page="/WEB-INF/views/include/header.jsp"/>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
<style>
.datepick {
	position: relative;
	border: 0;
	background-color: #704de4;
	color: wheat;
}

.nowDay {
	background: blue;
}

.timepick {
	background: #704de4;
	color: wheat;
}

.calender {
	margin: auto;
	border: 1px solid #ccccff;
	width: -webkit-fill-available;
}

.time {
	text-align: -webkit-center;
	width: 37px;
	height: 37px;
	border-radius: 50px;
}

/* rating */
.starrr {
	display: inline-block;
}

.starrr a {
	font-size: 16px;
	padding: 0 1px;
	cursor: pointer;
	color: #FFD119;
	text-decoration: none;
}
</style>
<div class="site-loader"></div>

<div class="site-wrap">
	<div class="site-mobile-menu">
		<div class="site-mobile-menu-header">
			<div class="site-mobile-menu-close mt-3">
				<span class="icon-close2 js-menu-toggle"></span>
			</div>
		</div>
		<div class="site-mobile-menu-body"></div>
	</div>
</div>

<div class="site-blocks-cover inner-page-cover overlay" data-aos="fade" data-stellar-background-ratio="0.5"
	style="background-image: url(/spacerental/resources/files/space-files/${host.file.savedFileName});"></div>

<!-- 디테일 박스 -->
<div class="site-section site-section-sm container">
	<div class="row">
		<div class="col-lg-8">
			<!-- 제목 -->
			<div class="bg-white property-body border">
				<div class="row mb-3">
					<div class="col-md-12">
						<h1 class="text-black"><b>${ space.spaceName }</b> - 
						<font size="4"><a href="/spacerental/space/detail/${ host.hostNo }">${ host.name }</a></font></h1>
					</div>
				</div>
				<!-- 공간 이미지 -->
				<div>
					<div class="slide-one-item home-slider owl-carousel">
						<c:forEach var="file" items="${ space.files }">
							<img src="/spacerental/resources/files/space-files/${ file.savedFileName }" style="width:668; height:400px" class="img-fluid">
						</c:forEach>
					</div>
				</div>

				<div class="my-4">
					<h4 class="text-black"><b>공간 소개</b></h4>
<%-- 줄바꿈 문자열을 저장하고 있는 변수 만들기 --%>
<c:set var="enter" value="
" />
					<p>${ fn:replace(space.content, enter, '<br>') }</p>
					<h4 class="text-black py-3"><b>이용시설</b></h4>
					<div class="row justify-content-center text-center">
						<c:if test="${ space.computer eq true }">
						<div class="col-sm-2 flex-md-column" style="margin: 9px">
							<div class="cat_icon"><img src="/spacerental/resources/images/computer.svg" class="svg" alt="https://www.flaticon.com/authors/monkik"></div>
							<p>컴퓨터</p>
						</div>
						</c:if>
						<c:if test="${ space.bim eq true }">
						<div class="col-sm-2 flex-md-column" style="margin: 9px">
							<div class="cat_icon"><img src="/spacerental/resources/images/beam.svg" class="svg" alt="https://www.flaticon.com/authors/monkik"></div>
							<p>빔 프로젝터</p>
						</div>
						</c:if>
						<c:if test="${ space.wifi eq true }">
						<div class="col-sm-2 flex-md-column" style="margin: 9px">
							<div class="cat_icon"><img src="/spacerental/resources/images/wifi.svg" class="svg" alt="https://www.flaticon.com/authors/monkik"></div>
							<p>WIFI</p>
						</div>
						</c:if>
						<c:if test="${ space.smoking eq true }">
						<div class="col-sm-2 flex-md-column" style="margin: 9px">
							<div class="cat_icon"><img src="/spacerental/resources/images/smoking.svg" class="svg" alt="https://www.flaticon.com/authors/monkik"></div>
							<p>흡연실</p>
						</div>
						</c:if>
						<c:if test="${ space.food eq true }">
						<div class="col-sm-2 flex-md-column" style="margin: 9px">
							<div class="cat_icon"><img src="/spacerental/resources/images/fast-food.svg" class="svg" alt="https://www.flaticon.com/authors/monkik"></div>
							<p>음식물 반입</p>
						</div>
						</c:if>
					</div>
				</div>
				
				<!-- 갤러리 -->
				<div class="row no-gutters mt-5">
					<div class="col-12">
						<h4 class="text-black mb-3"><b>Gallery</b></h4>
					</div>
					<c:forEach var="file" items="${ space.files }">
					<div class="col-sm-6 col-md-4 col-lg-3">
						<a href="/spacerental/resources/files/space-files/${ file.savedFileName }" class="image-popup gal-item">
							<img src="/spacerental/resources/files/space-files/${ file.savedFileName }" style="width:180px; height:180px" class="img-fluid">
						</a>
					</div>
					</c:forEach>
				</div>
				
				<!-- 후기 -->
				<%-- <c:if test="${ space.reviewCheck }"> --%>
	            <form id="reviewform" class="form-inline row">
	               <h4 class="text-black col-md-12 py-3"><b>후기</b></h4>
	               <input type="hidden" name="spaceNo" id="spaceNo" value="${ space.spaceNo }"> 
	               <input type="hidden" name="writer" value="${ loginuser.id }">
					<div class="col-md-12">
						<!-- <div class='starrr' id='star'></div>
						<br /> 
						<input type="hidden" name='rating' id='star_input' /> -->
						<textarea class="form-control mr-1" id="review_content"
							name="content" cols="65" rows="3"></textarea>
						<a class="btn btn-primary py-3 px-4" id="writereview"
							href="javascript:">댓글<br>등록
						</a>
					</div>
				</form>
	            <%-- </c:if> --%>
	            
	            <hr style="border-color: #4a2773;">
				<!-- review list -->
				<c:if test="${ not empty space.reviews and space.reviews[0].reviewNo != 0 }">
					<table id="review-list" class="w-100 m-auto border-top">
						<c:forEach var="review" items="${ space.reviews }">
						<fmt:formatDate value="${ review.regDate }" var="regDate" type="date" pattern="yyyy-MM-dd hh:mm:ss"/>
							<tr id="tr${ review.reviewNo }">
								<td class="border-bottom text-left" style="padding-left:${ review.depth*20 + 10 }px">
									<div id='reviewview${ review.reviewNo }' class="container">
										<div class="col-sm-12 row justify-content-between py-1">
											${ review.writer } &nbsp;&nbsp; [${ regDate }] 
											<div class="row"style='display:${ loginuser.id eq review.writer ? "block" : "none" }'>
												<a class="editreview" data-reviewno='${ review.reviewNo }' href="javascript:" style="width: 30px; height: 30px">
													편집<!-- <img src="/spacerental/resources/images/edit.svg" class="svg"> -->
												</a> &nbsp; 
												<a class="deletereview" href="javascript:" data-reviewno="${ review.reviewNo }" style="width: 30px; height: 30px">
													삭제<!-- <img src="/spacerental/resources/images/delete.svg" class="svg"> -->
												</a>
											</div>
										</div>
										<span>${ review.content }</span>
										
										<div style="width: 30px;height: 30px">
											<a class="comment-link"
												data-toggle="collapse" href="#comment-collapse${ review.reviewNo }"
												aria-controls="comment-collapse${ review.reviewNo }">
													<img src="/spacerental/resources/images/comment.svg" class="svg">
											</a>
										</div>

									</div>
									<div>
									<div class="row">
										<div class="col">
											<div class="collapse multi-collapse" id="comment-collapse${ review.reviewNo }">
												<div class="card-body">
												<form id="comment-form" class="form-inline row">
													<input type="hidden" name="reviewNo" value="${ review.reviewNo }">
									               <input type="hidden" name="spaceNo" id="spaceNo" value="${ space.spaceNo }"> 
									               <input type="hidden" name="writer" value="${ loginuser.id }">
									               <div class="col-md-12">
									                  <textarea class="form-control mr-1" name="content" cols="${ 60 - review.depth*5 }" rows="3"></textarea>
									                  <a class="btn btn-primary py-3 px-4" id="write-comment" 
									                  	data-reviewno='${ review.reviewNo }' href="javascript:">댓글<br>등록</a>
									               </div>
									            </form>
									            </div>
											</div>
										</div>
									</div>
									</div>
									<div id='reviewedit${ review.reviewNo }' style="display: none" class="container">
										<div class="col-sm-12 row justify-content-between py-1">
											${ review.writer } &nbsp;&nbsp; [${ regDate }]
										</div>
										<form id="updateform${ review.reviewNo }">
											<input type="hidden" name="reviewNo" value="${ review.reviewNo }" />
											<textarea class="form-control"name="content" style="width: 550px" rows="3"
												maxlength="200">${ review.content }</textarea>
										</form>
										<div>
											<a class="updatereview" href="javascript:" data-reviewno="${ review.reviewNo }">수정</a> &nbsp; 
											<a class="cancel" data-reviewno="${ review.reviewNo }" href="javascript:">취소</a>
										</div>
									</div>
								</td>
							</tr>
						</c:forEach>
					</table>
				</c:if>
				<c:if test="${ empty space.reviews or space.reviews[0].reviewNo eq 0 }">
					등록된 후기가 없습니다.
				</c:if>
			</div>
		</div>
		<div class="col-lg-4">
			<div class="bg-white widget border rounded">
				<form action="rent" method="post" id="rentform">
					<input type="hidden" name="spaceNo" id="spaceNo" value="${ space.spaceNo }">
					<h5 class="pt-3">날짜 선택</h5>
					<h6 class="px-3 row justify-content-end">
					<select name="year" id="y" onchange="change()" class="border">
						<c:forEach var="y" begin="${ nowYear }" end="${ nowYear+1 }" varStatus="y_status">
							<option <c:if test="${ y eq nowYear}">selected</c:if>>${ y_status.index }</option>
						</c:forEach>
					</select>년도&nbsp;&nbsp;&nbsp; 
					<select name="month" id="m" onchange="change()" class="border">
						<c:forEach var="m" begin="1" end="12" varStatus="m_status">
							<option <c:if test="${ m eq nowMonth}">selected</c:if>>${ m_status.index }</option>
						</c:forEach>
					</select>월
					</h6>
					<!-- // 요일출력 start -->
					<table id="calendar-table" class="calender">
						<tr bgcolor="#ccccff">
							<c:forEach var="week" varStatus="i" items="${ strWeek }">
								<td class="text-center py-1 px-2">
									<font color=<c:choose>
													<c:when test="${ i.index eq 0 }">"red"</c:when>
													<c:when test="${ i.index eq 6 }">"blue"</c:when>
													<c:otherwise>"black"</c:otherwise>
												</c:choose>><b>${ week }</b>
									</font>
								</td>
							</c:forEach>
						</tr>
				<c:forEach var="i" begin="1" end="${ lastDay }">
					<c:if test="${ i eq 1 }">
						<tr>
						<c:forEach begin="0" end="${ week-1 }">
							<td>&nbsp;</td>
						</c:forEach>
					</c:if>
							<td class="text-center py-1 px-2"
								<c:if test="${ i eq nowDay }">style="background:#e2d6b79e"</c:if>
								<c:if test="${ i < nowDay }">style="background: #a9a9a92e;color: #c1c1c1;"</c:if>
								<c:if test="${ i > nowDay }">style="cursor: pointer;"</c:if>>
								
								<c:if test="${ i > nowDay }">
									<input type="radio" id="day${i}" name="day" value="${i}"
										hidden="hidden" onclick="javascript:dayCheck(${ i })">
								</c:if> 
								<label for="day${i}" class="date m-0">${i}</label>
							</td>

							<c:if test="${ i eq lastDay }">
						<c:forEach begin="${ week+1 }" end="6">
							<td>&nbsp;</td>
						</c:forEach>
					</c:if>

					<c:set var="week" value="${week+1}" />
					<c:if test="${ week > 6 }">
						<c:set var="week" value="0" />
						</tr>
						<tr>
					</c:if>
				</c:forEach>
						</tr>
					</table>
					
					<h5 class="pt-4">시간 선택</h5>
					<div class="pt-2 row justify-content-center col-sm-12 m-0" id="time-table">
						날짜를 먼저 선택해주세요.
					</div>
					<h5 class="pt-4">인원 선택</h5>
					<div class="pt-2 row">
						<div class="col-12">
							<select name="headCount" class="col-12 border">
								<c:forEach var="count" begin="1" end="${ space.maximum }">
									<option>${ count }</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="row justify-content-end">
						<%-- <c:if test="${ loginuser.type ne 'customer' }"> --%>
							<input class="btn btn-primary" type="button" id="rent_submit" name="rent_submit" value="예약"/>
						<%-- </c:if> --%>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<jsp:include page="/WEB-INF/views/include/footer.jsp" />
