<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" language="java" contentType="text/html; charset=utf-8"
	     pageEncoding="utf-8"%>
<c:set var="title" value="회원정보 수정" scope="request"/>
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

<div class="jumbotron" style="margin-top:10%; background-color:white; width:40%;margin-left:29%">
	<div class="container" style="border: solid 1px; padding:5%">
		<h1 style="text-align: center"><strong>회원정보 수정</strong></h1>
		<form action="/spacerental/mypage/update" method="post">
		<br>
			<table class="table" >
				<tr>
					<th>아이디</th>
					<td><input type="text" name="id" value="${ member.id }" readonly /></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="passwd" /></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" name="name" value="${ member.name }" readonly /></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td><input type="text" name="phone" value="${ member.phone }" /></td>
				</tr>
			</table>
			<br>
			<div class="buttons">
				<input type="submit" class="btn col-sm-3" value="수정" style="margin-left:23%" />
				<input type="button" class="btn col-sm-3" id="cancel_button" value="취소" />
				<script type="text/javascript">
	        	window.addEventListener('load', function(event) {
		        	var btnCancel = document.querySelector('#cancel_button');
	        		btnCancel.addEventListener('click', function(event) {
	        			location.href = "/spacerental/mypage/${ member.type }";
	        		});
	        	});
        		</script>
			</div>
		</form>
	</div>
</div>

<jsp:include page="/WEB-INF/views/include/footer.jsp"/>