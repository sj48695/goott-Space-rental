<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><%-- JSTL의 함수를 제공하는 taglib --%>
<c:set var="title" value="공간 상세 페이지" scope="request"/>
<jsp:include page="/WEB-INF/views/include/header.jsp"/>
<style>
.datepick {
	position: relative;
	border: 0;
	background-color: #704de4;
    color: wheat;
}

.nowDay{
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

.time{
    text-align: -webkit-center;
	width: 37px;
    height: 37px;
	border-radius: 50px;
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
							<img src="/spacerental/resources/files/space-files/${ file.savedFileName }" style="width:668px;height:400px;" class="img-fluid">
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
							<img src="/spacerental/resources/files/space-files/${ file.savedFileName }" class="img-fluid">
						</a>
					</div>
					</c:forEach>
				</div>
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
					<div class="pt-2 row justify-content-center col-sm-12 m-0">
						<div class="select">
						
							<%-- <c:forEach var="rent" items="${ rents }">
								<c:set var="start" value="${ rent.startTime }"/>
								<c:set var="end" value="${ rent.endTime }"/>
							</c:forEach> --%>
							
							<c:forEach var="time" begin="${ host.openStart }" end="${ host.openEnd }" varStatus="i">
								<label class="py-1 px-2 border time" id="timelabel${ i.index }"
							<%-- 	<c:if test="${ i.index >=start && i.index <= end  }">
									style="background: #a9a9a92e;color: #c1c1c1;"
								</c:if> --%>
									onclick="javascript:timeClick(${ i.index },${ time })"
									
									
									>${ time }</label>
							</c:forEach>
							<input type="radio" hidden="hidden" name="startTime" id="startTime" value="0">
							<input type="radio" hidden="hidden" name="endTime" id="endTime" value="0">
						</div>
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

<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	
	<script type="text/javascript">
	$(function(){
		$('#rent_submit').on('click', function(event){
			
			//serialize() : <form에 포함된 입력 요소의 값을 이름=값&이름=값&... 형식으로 만드는 함수 
			var formData = $('#rentform').serialize();
			//alert(formData);
			
			 $.ajax({
				url: "/spacerental/space/rent",
				method: "POST",
				data : formData,
				success: function(data, status, xhr){ //data: 응답받은 데이터
					alert("예약되었습니다!");
					window.location.href = '/spacerental/mypage/rentList'; 
				},
				error: function(xhr, status, err){
					alert(err);
				}
			});  
		});
	});
	</script>
		
	
	
<footer class="site-footer">
	<div class="container">
		<div class="row">
			<div class="col-lg-4">
				<div class="mb-5">
					<h3 class="footer-heading mb-4">About Homeland</h3>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
						Saepe pariatur reprehenderit vero atque, consequatur id ratione,
						et non dignissimos culpa? Ut veritatis, quos illum totam quis
						blanditiis, minima minus odio!</p>
				</div>
			</div>
			<div class="col-lg-4 mb-5 mb-lg-0">
				<div class="row mb-5">
					<div class="col-md-12">
						<h3 class="footer-heading mb-4">Navigations</h3>
					</div>
					<div class="col-md-6 col-lg-6">
						<ul class="list-unstyled">
							<li><a href="#">Home</a></li>
							<li><a href="#">Buy</a></li>
							<li><a href="#">Rent</a></li>
							<li><a href="#">Properties</a></li>
						</ul>
					</div>
					<div class="col-md-6 col-lg-6">
						<ul class="list-unstyled">
							<li><a href="#">About Us</a></li>
							<li><a href="#">Privacy Policy</a></li>
							<li><a href="#">Contact Us</a></li>
							<li><a href="#">Terms</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="col-lg-4 mb-5 mb-lg-0">
				<h3 class="footer-heading mb-4">Follow Us</h3>
				<div>
					<a href="#" class="pl-0 pr-3"><span class="icon-facebook"></span></a>
					<a href="#" class="pl-3 pr-3"><span class="icon-twitter"></span></a>
					<a href="#" class="pl-3 pr-3"><span class="icon-instagram"></span></a>
					<a href="#" class="pl-3 pr-3"><span class="icon-linkedin"></span></a>
				</div>
			</div>
		</div>
		<div class="row pt-5 mt-5 text-center">
			<div class="col-md-12">
				<p>
					Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. Copyright &copy;
					<script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
					<script>document.write(new Date().getFullYear());</script>
					All rights reserved | This template is made with 
					<i class="icon-heart text-danger" aria-hidden="true"></i> by 
					<a href="https://colorlib.com" target="_blank">Colorlib</a> Link
					back to Colorlib can't be removed. Template is licensed under CC BY 3.0.
				</p>
			</div>
		</div>
	</div>
</footer>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
