<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false" language="java"
	contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<c:set var="title" value="관리자 마이페이지" scope="request" />
<jsp:include page="/WEB-INF/views/include/header.jsp" />
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
<div class="jumbotron" style="margin-top: 10%; background-color: white; width: 40%; margin-left: 29%">
	<div class="container" style="border: solid 1px; padding: 5%">
		<form class="form-signin">
			<div class="text-center mb-4">
				<h1><strong>관리페이지</strong></h1>
			</div>
			<div class="buttons col-sm-12">
				<div class="row">
					<input type="button" class="btn btn-warning col-sm-5 mx-3"
						id="before_ok" value="승인요청 사업장" /> 
					<input type="button" class="btn btn-secondary col-sm-5 mx-3" 
						id="after_ok" value="승인완료 사업장" />
				</div>
			</div>
		</form>
	</div>
</div>

<jsp:include page="/WEB-INF/views/include/footer.jsp" />