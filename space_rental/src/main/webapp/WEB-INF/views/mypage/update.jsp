<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" language="java" contentType="text/html; charset=utf-8"
	     pageEncoding="utf-8"%>
<c:set var="title" value="마이페이지" scope="request"/>
<jsp:include page="/WEB-INF/views/include/header.jsp"/> 

	<div id="pageContainer">
		
		<div style="padding-top:25px;text-align:center">
		<div id="inputcontent">
		    <div id="inputmain">
		        <div class="inputsubtitle">회원정보 수정</div>
		        <form action="/spacerental/mypage/update" method="post">
		        <table>
		            <tr>
		                <th>아이디</th>
		                <td>
		                    <input type="text" name="id" style="width:280px" value="${ id }"  readonly="readonly"/>
		                </td>
		            </tr>
		            <tr>
		                <th>비밀번호</th>
		                <td>
		                	<input type="password" name="passwd">
		                </td>
		            </tr>
		            <tr>
		                <th>이름</th>
		                <td>
		                	<input type="text" name="name" value="${ member.name }" readonly="readonly">
		                </td>
		            </tr>
		            <tr>
		                <th>전화번호</th>
		                <td>
		                	<input type="text" name="phone" value="${ member.phone }">
		                </td>
		            </tr>
		        </table>
		        <div class="buttons">
		        	<input type="submit" class="btn col-sm-3" value="수정" />
		        	<input type="button" class="btn col-sm-3" id="cancel_button" value="취소" />
		        	
		        	<script type="text/javascript">
		        	window.addEventListener('load', function(event) {
			        	var btnCancel = document.querySelector('#cancel_button');
		        		btnCancel.addEventListener('click', function(event) {
		        			location.href = "/spacerental/mypage/{ member.type }";
		        		});
		        	});
		        	</script>
		        </div>
		        </form>
		    </div>
		</div>   	
	
	</div>
	</div>


<jsp:include page="/WEB-INF/views/include/footer.jsp"/>