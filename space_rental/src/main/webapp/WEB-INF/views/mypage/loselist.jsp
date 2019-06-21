<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="false" language="java" contentType="text/html; charset=utf-8"
	     pageEncoding="utf-8"%>
<c:set var="title" value="분실물작성리스트" scope="request"/>
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
<h1 style="text-align: center"><strong>나의 분실물 리스트</strong></h1>
<br><br><br>
	<c:if test="${ empty lose }">
		<h5 style="text-align: center">내가 작성한 분실물이 존재하지 않습니다.</h5>
	</c:if>
	
	<table class="table table-hover">
		<tr>
			<th>분실물 번호</th>
			<th>제목</th>
			<th>내용</th>
			<th>날짜</th>
		</tr>
		<c:forEach var="lose" items="${ lose }">
		<fmt:formatDate value="${ lose.loseDate }" var="loseDate" type="date" pattern="yyyy-MM-dd"/>
			<tr>
				<td>${ lose.loseNo }</td>
				<td><a href="/spacerental/loseview/losedetail/${ lose.loseNo }" style="text-decoration: none">${ lose.title }</a></td>
				<td>${ lose.content }</td>
				<td>${ loseDate }</td>
			</tr>
		</c:forEach>
	</table>  
	  
</div>

<jsp:include page="/WEB-INF/views/include/footer.jsp"/>