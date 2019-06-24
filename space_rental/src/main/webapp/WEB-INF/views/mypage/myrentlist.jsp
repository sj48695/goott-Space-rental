<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="false" language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>

<c:set var="title" value="예약리스트" scope="request"/>
<jsp:include page="/WEB-INF/views/include/header.jsp"/> 

<style>
.header {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	z-index: 100;
	background: #3a1a48;
	-webkit-transition: all 400ms ease;
	-moz-transition: all 400ms ease;
	-ms-transition: all 400ms ease;
	-o-transition: all 400ms ease;
	transition: all 400ms ease;
}
</style>

<div class="container" style="margin-top:160px;">
<nav aria-label="breadcrumb">
  <ol class="breadcrumb">
    <li class="breadcrumb-item"><a href="/spacerental/mypage/${ loginuser.type }">마이페이지</a></li>
    <li class="breadcrumb-item active" aria-current="page">예약리스트</li>
  </ol>
</nav>
<br>
<h1 style="text-align: center"><strong>예약 리스트</strong></h1>
<br><br>
	<c:if test="${ empty rents }">
		<h5 style="text-align: center">현재 진행중인 예약이 존재하지 않습니다.</h5>
	</c:if>

	<div class="row">
	<c:forEach var="rent" items="${ rents }" varStatus="rentnum">
		<fmt:formatDate value="${ rent.rentDate }" var="rentDate" type="date" pattern="yyyy-MM-dd"/>
			<div class="card border-light col-sm-6" id="card${ rentnum.index }">
				<div class="card-header">${ fn:length(rents) - rentnum.index }</div>
				<div class="card-body">
					<h5 class="card-title"><a href="/spacerental/space/detail/${ rent.hostNo }" style="text-decoration: none">
						${ rent.name }-${ rent.spaceName }</a>
					</h5>
					<p class="card-text">${ rentDate } / ${ rent.startTime }시 ~ ${ rent.endTime }시</p>
					<hr>
					<p class="card-text">${ rent.id }</p>
					<form action="/spacerental/mypage/rent_cancel" id="rentform${ rentnum.index }">
						<input type="button" class="btn btn-outline-primary btn-sm col-sm-3" style="margin-left:370px" value="예약취소" onclick="javascript:rent_cancel(${ rentnum.index })" />
						<input type="hidden" name="spaceNo" value="${ rent.spaceNo }">		
						<input type="hidden" name="id" value="${ rent.id }">		
					</form>			
				</div>
			</div>
		<br>
	</c:forEach>
	</div>	
</div>

<jsp:include page="/WEB-INF/views/include/footer.jsp"/>