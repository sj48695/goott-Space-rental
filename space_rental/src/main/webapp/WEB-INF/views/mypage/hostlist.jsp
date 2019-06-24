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
	<nav aria-label="breadcrumb">
	  <ol class="breadcrumb">
	    <li class="breadcrumb-item"><a href="/spacerental/mypage/${ loginuser.type }">마이페이지</a></li>
	    <c:if test="${ loginuser.id eq 'manager' }">
	    	<li class="breadcrumb-item active" aria-current="page">사업장 승인현황</li>
	    </c:if>	    
		<c:if test="${ loginuser.id ne 'manager' }">
			<li class="breadcrumb-item active" aria-current="page">내 사업장 리스트</li>
		</c:if>
	  </ol>
	</nav>
	<br>
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
			    <h5 class="card-title">
			    	<c:if test="${ loginuser.id  eq 'manager' }">
				    	<a href="/spacerental/space/detail/${ host.hostNo }" id="previewBtn" style="text-decoration: none">${ host.name }</a>
					</c:if>
				  	<c:if test="${ loginuser.id  ne 'manager' }">
				    	<a href="/spacerental/mypage/hostRentList/${ host.hostNo }" style="text-decoration: none">${ host.name }</a>
					</c:if>	
			    </h5>
			  	<c:if test="${ host.ok eq false }">
			  		<c:if test="${ loginuser.id  eq 'manager' }">
				    	<input type="button" class="py-2 col-sm-5 btn btn-outline-dark ok${ hostnum.index }" value="승인 하기"
				    		onclick="javascript:okCheck(${ hostnum.index },1,${ host.hostNo })">
					</c:if>
				  	<c:if test="${ loginuser.id  ne 'manager' }">
				    	<div class="py-2">승인 대기</div>
					</c:if>			    	
			    </c:if>
			    <c:if test="${ host.ok eq true }">
			    	<c:if test="${ loginuser.id  eq 'manager' }">
				    	<input type="button" class="py-2 col-sm-5 btn btn-dark ok${ hostnum.index }" value="승인 취소"
				    		onclick="javascript:okCheck(${ hostnum.index },0,${ host.hostNo })">
					</c:if>
				  	<c:if test="${ loginuser.id  ne 'manager' }">
				    	<div class="py-2">승인 완료</div>
					</c:if>	
			    </c:if>
			    <c:if test="${ loginuser.id  ne 'manager' }">
			    <a class="btn btn-primary offset-md-10" href="/spacerental/space/detail/${ host.hostNo }" role="button">수정</a>
			    </c:if>
			    <p class="card-text"></p>			  
			  </div>			  
			</div>
		</c:forEach>
		</div>
		<br>
	</c:forEach>
	<script type="text/javascript">
	window.addEventListener('load', function(event) {
		var btn = document.querySelector('#previewBtn');
   		btn.addEventListener('click', function(event) {
   			var ok = confirm("현재 페이지는 미리보기 페이지입니다.");
   			if (ok) {
    			location.href = "/spacerental/space/detail/${ host.hostNo }";		        			
   			}
   		});
	});
	</script>
	
</div>

<jsp:include page="/WEB-INF/views/include/footer.jsp"/>