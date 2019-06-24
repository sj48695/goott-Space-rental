<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="false" language="java" contentType="text/html; charset=utf-8"
	     pageEncoding="utf-8"%>
<c:set var="title" value="예약관리리스트" scope="request"/>
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
    <c:if test="${ loginuser.id eq 'manager' }">
    	<li class="breadcrumb-item"><a href="/spacerental/mypage/beforeOk">사업장 승인현황</a></li>
    </c:if>	    
	<c:if test="${ loginuser.id ne 'manager' }">
		<li class="breadcrumb-item"><a href="/spacerental/mypage/hostlist">내 사업장 리스트</a></li>
	</c:if>
    <li class="breadcrumb-item active" aria-current="page">예약리스트</li>
  </ol>
</nav>
<br>
<h1 style="text-align: center"><strong>예약 리스트</strong></h1>
<br><br>
	<c:if test="${ empty rentlist }">
		<h5 style="text-align: center">현재 진행중인 예약이 존재하지 않습니다.</h5>
	</c:if>

	<table class="table table-hover">
		<tr>
			<th>번호</th>
			<th>공간명</th>
			<th>예약자</th>
			<th>예약날짜</th>
		</tr>
		<c:forEach var="rent" items="${ rentlist }" varStatus="i">
		<fmt:formatDate value="${ rent.rentDate }" var="rentDate" type="date" pattern="yyyy-MM-dd"/>
			<tr>
				<td>${ fn:length(rentlist) - i.index }</td>
				<td><a href="/spacerental/space/rent?spaceNo=${ rent.spaceNo }">${ rent.spaceName }</a></td>
				<td>${ rent.id }</td>
				<td>${ rentDate }</td>
			</tr>
		</c:forEach>
	</table>

</div>

<jsp:include page="/WEB-INF/views/include/footer.jsp"/>