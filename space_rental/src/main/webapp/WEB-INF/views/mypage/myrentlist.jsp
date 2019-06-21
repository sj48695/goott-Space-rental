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
<h1 style="text-align: center"><strong>예약 리스트</strong></h1>
<br><br>
	<c:if test="${ empty rents }">
		<h5 style="text-align: center">현재 진행중인 예약이 존재하지 않습니다.</h5>
	</c:if>

	<c:forEach begin="0" end="${ fn:length(rents)/2 }" varStatus="i">
		<div class="row">
		<c:forEach var="rent" begin="${i.index*2}" end="${i.index*2+1}" items="${ rents }" varStatus="rentnum">
		<fmt:formatDate value="${ rent.rentDate }" var="rentDate" type="date" pattern="yyyy-MM-dd"/>
			<div class="card border-light col-sm-6">
				<div class="card-header">${ fn:length(rents) - i.index }</div>
				<div class="card-body">
					<h5 class="card-title"><a href="/spacerental/space/detail/${ rent.hostNo }" style="text-decoration: none">${ rent.spaceName }</a></h5>
					<p class="card-text">${ rentDate } / ${ rent.startTime }시 ~ ${ rent.endTime }시</p>
					<hr>
					<p class="card-text">${ rent.id }</p>
				</div>
			</div>
		</c:forEach>
		</div>
		<br>
	</c:forEach>
	
</div>

<jsp:include page="/WEB-INF/views/include/footer.jsp"/>