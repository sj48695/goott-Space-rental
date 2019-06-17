<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" language="java" contentType="text/html; charset=utf-8"
	     pageEncoding="utf-8"%>
<c:set var="title" value="마이페이지" scope="request"/>
<jsp:include page="/WEB-INF/views/include/header.jsp"/> 

<div class="super_container_inner">
	 <h1 class="jumbotron-heading">마이페이지</h1>
</div>
<section class="contents member_wrap">
	<div class="profile_inner">
		<div class="profile_box">
			<div class="def_info">
				<!---->
				<div class="prf_img"
					style="background-image: url(&quot;https://kr.object.ncloudstorage.com/scloud-service/service/156074123_156005c5baf40ff51a327f1c34f2975b.jpg&quot;);"></div>
				<strong>모</strong>
				<button>
					프로필 사진 변경하기<input type="file">
				</button>
			</div>
			<div class="det_info">
				<table>
					<caption>프로필 정보</caption>
					<colgroup>
						<col class="ths">
						<col>
					</colgroup>
					<tr>
						<th scope="row">닉네임</th>
						<td>모</td>
					</tr>
					<tr>
						<th scope="row">이메일</th>
						<td>adg980224@naver.com <!----> <a class="ok_inc">인증완료</a></td>
					</tr>
					<tr>
						<th scope="row">연락처</th>
						<!---->
						<td>휴대폰 정보 없음 <a class="do_inc">인증하기</a></td>
					</tr>
					<tr>
						<th scope="row">SNS연동</th>
						<td><ul class="sns_com">
								<li class="naver"><input type="checkbox" id="navCom">
									<label for="navCom">네이버연동</label></li>
								<li class="kakao"><input type="checkbox" id="kakaoCom">
									<label for="kakaoCom">카카오연동</label></li>
							</ul>
							<p>1개의 SNS연동만 가능하며, 연동된 소셜계정은 해제가 불가합니다.</p></td>
					</tr>
					<tr>
						<th scope="row">비밀번호</th>
						<td><a href="/auth/change/password" class="ch_info">변경하기</a></td>
					</tr>
					<tr>
						<th scope="row">마케팅 수신동의</th>
						<td><ul class="marketing">
								<li><input type="checkbox" id="email"> <label
									for="email">이메일</label></li>
								<li><input type="checkbox" id="sms"> <label
									for="sms">SMS</label></li>
							</ul></td>
					</tr>
				</table>
			</div>
			<div class="out_box">
				<a href="/auth/leave" class="">서비스 탈퇴하기</a>
			</div>
		</div>
	</div>
</section>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>