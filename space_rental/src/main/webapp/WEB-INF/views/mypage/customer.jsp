<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" language="java" contentType="text/html; charset=utf-8"
	     pageEncoding="utf-8"%>
<c:set var="title" value="마이페이지" scope="request"/>
<jsp:include page="/WEB-INF/views/include/header.jsp"/> 

<link rel="canonical" href="https://getbootstrap.com/docs/4.3/examples/floating-labels/">
<style>
body{
	background-color: #f1f1f194;
}
</style>

<div class="jumbotron" style="margin-top:10%; background-color:white; width:40%;margin-left:30%">
<div class="container">
	<form class="form-signin">
	  <div class="text-center mb-4">
	    <h1 class="h3 mb-3 font-weight-normal"><strong>마이페이지</strong></h1><br>
	  </div>
	  <table class="table table-borderless">
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
       	<input type="button" class="btn col-sm-3" id="update_button" value="수정" />
       	<input type="button" class="btn col-sm-3" id="delete_button" value="탈퇴" />     	
       	<script type="text/javascript">
       	window.addEventListener('load', function(event) {	        		
       		var btnDelete = document.querySelector('#delete_button');
       		btnDelete.addEventListener('click', function(event) {
       			var ok = confirm("탈퇴하시겠습니까?");
       			if (ok) {
        			location.href = "/spacerental/mypage/delete";		        			
       			}
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
</div>

<jsp:include page="/WEB-INF/views/include/footer.jsp"/>