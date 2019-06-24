<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" language="java" contentType="text/html; charset=utf-8"
	     pageEncoding="utf-8"%>
<c:set var="title" value="호스트 마이페이지" scope="request"/>
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

<nav aria-label="breadcrumb" class="col-sm-8" style="margin-top:160px; margin-left:270px">
  <ol class="breadcrumb">
    <li class="breadcrumb-item active" aria-current="page">마이페이지</li>
  </ol>
</nav>
<div class="container" style="border: solid 1px; padding:5%">
	<form class="form-signin">
	  <div class="text-center mb-4">
	    <h1><strong>마이페이지</strong></h1><br>
	  </div>
	  <table class="table">
	      <tr>
	          <th>아이디</th>
	          <td>${ member.id }</td>
	      </tr>
	      <tr>
	      	<th>이름</th>
	      	<td>${ member.name }</td>
	      </tr>
	      <tr>
	          <th>전화번호</th>
	          <td>${ member.phone }</td>
	      </tr>
	  </table>
	  <br>
	  <div class="buttons">
       	<input type="button" class="btn col-sm-3" id="update_button" value="수정" style="margin-left:13%" />
       	<input type="button" class="btn btn-warning col-sm-3" id="list_button" value="예약관리" />
       	<input type="button" class="btn btn-link col-sm-3" id="delete_button" value="탈퇴"/>
       	<script type="text/javascript">
       	window.addEventListener('load', function(event) {	        		
       		var btnDelete = document.querySelector('#delete_button');
       		btnDelete.addEventListener('click', function(event) {
       			var ok = confirm("탈퇴하시겠습니까?");
       			if (ok) {
        			location.href = "/spacerental/mypage/delete";		        			
       			}
       		});
       		
       		var btnUpdate = document.querySelector('#list_button');
       		btnUpdate.addEventListener('click', function(event) {
       			location.href = "/spacerental/mypage/hostlist";
       		});
       		
       		var btnUpdate = document.querySelector('#update_button');
       		btnUpdate.addEventListener('click', function(event) {
       			location.href = "/spacerental/mypage/update";
       		});
       		
       	});
       	</script>      	
      </div>
	</form>
</div>

<jsp:include page="/WEB-INF/views/include/footer.jsp"/>