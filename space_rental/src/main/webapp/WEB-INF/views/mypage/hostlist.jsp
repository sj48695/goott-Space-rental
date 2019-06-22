<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page session="false" language="java" contentType="text/html; charset=utf-8"
	     pageEncoding="utf-8"%>
<c:set var="title" value="사업장리스트" scope="request"/>
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
	<h1 style="text-align: center">
		<strong>
			<c:if test="${ loginuser.id eq 'manager' }">사업장 승인현황</c:if>
			<c:if test="${ loginuser.id ne 'manager' }">내 사업장 리스트</c:if>
		</strong>
	</h1>
<br><br><br>
	<c:if test="${ empty hosts }">
		<h5 style="text-align: center">현재 운영중인 공간이 존재하지 않습니다.</h5>
	</c:if>
	
	<c:forEach begin="0" end="${ fn:length(hosts)/3 }" varStatus="i">
		<div class="row">
		<c:forEach var="host" begin="${i.index*3}" end="${i.index*3+2}" items="${ hosts }" varStatus="hostnum">
			<div class="card col-sm-4 p-0">						 
			  <img src="/spacerental/resources/files/space-files/${ host.file.savedFileName }" class="card-img-top" alt="Image" style="height:300px;">
			  <div class="card-body">
			    <h5 class="card-title"><a href="/spacerental/mypage/hostRentList/${ host.hostNo }" style="text-decoration: none">${ host.name }</a></h5>
			  	<c:if test="${ host.ok eq false }">
			  		<c:if test="${ loginuser.id  eq 'manager' }">
				    	<button class="py-2 btn btn-outline-dark ok" onclick="javascript:okCheck(1,${ host.hostNo })" value="승인 하기">승인 하기</button>
					</c:if>
				  	<c:if test="${ loginuser.id  ne 'manager' }">
				    	<div class="py-2">승인 대기</div>
					</c:if>			    	
			    </c:if>
			    <c:if test="${ host.ok eq true }">
			    	<c:if test="${ loginuser.id  eq 'manager' }">
				    	<button class="py-2 btn btn-dark okCancel" onclick="javascript:okCheck(0,${ host.hostNo })" value="승인 취소">승인 취소</button>
					</c:if>
				  	<c:if test="${ loginuser.id  ne 'manager' }">
				    	<div class="py-2">승인 완료</div>
					</c:if>	
			    </c:if>
			    <p class="card-text"></p>			  
			  </div>			  
			</div>
		</c:forEach>
		</div>
		<br>
	</c:forEach>
	
</div>

<jsp:include page="/WEB-INF/views/include/footer.jsp"/>