<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:set var="title" value="사업장 등록" scope="request"/>
<jsp:include page="/WEB-INF/views/include/header.jsp"/>
<!-- space-writeForm -->
<link rel="stylesheet" type="text/css" href="/spacerental/resources/styles/spacewrite.css">
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

<section id="contents" class="contents contents_register" role="main">
	<form action="register_host" method="post">
		<input type="hidden" name="hostId" value="${ loginuser.id }">
		<div class="heading">
			<h3>사업장 정보를 입력해주세요.</h3>
			<span class="option"><span class="txt_required"><span class="ico_required">* </span>필수입력</span></span>
		</div>
		<div class="box_form">
			<div class="tit">
				<label for="space_name">상호명<span class="ico_required">*</span></label>
			</div>
			<span class="option"><span class="spcNmCnt"><em id="spcNmCnt">0</em>자/<em>18</em>자</span></span>
			<div class="input">
				<input type="text" id="host_name" min="1" maxlength="18" name="name">
			</div>
			<p class="p_guide normal">
				<i class="sp_icon ico_alert"></i>사용 가능한 특수문자 : ( , ) , [ , ] , - , .(마침표), ,(쉼표)
			</p>
			<p class="p_guide warn">
				<i class="sp_icon ico_alert"></i>공간이름 입력은 필수입니다.
			</p>
		</div>
		<div class="box_form">
			<div class="tit">
				<label for="space_intro">사업장 유형<span class="ico_required">*</span></label>
			</div>
			<p class="option">
				<span class="txt_required">필수선택</span>
			</p>
			<div class="row">
				<ul class="check_list space">
					<li>
						<input type="radio" name="type" value="카페" id="cate1">
						<label for="cate1" class="ellip">카페</label>
					</li>
					<li>
						<input type="radio" name="type" value="파티룸" id="cate2">
						<label for="cate2" class="ellip">파티룸</label>
					</li>
					<li>
						<input type="radio" name="type" value="스터디룸" id="cate3">
						<label for="cate3" class="ellip">스터디룸</label>
					</li>
					<li>
						<input type="radio" name="type" value="회의실" id="cate4">
						<label for="cate4" class="ellip">회의실</label>
					</li>
				</ul>
			</div>
			<p class="p_guide warn usual">
				<i class="sp_icon ico_alert"></i>검수 후에는 <span class="underline">유형 변경이 불가</span>합니다.
			</p>
			<p class="p_guide warn usual">
				<i class="sp_icon ico_alert"></i>관련도가 떨어지는 유형을 선택하시면 검수시 무통보 삭제/변경됩니다.
			</p>
		</div>
		<div class="box_form">
			<div class="tit">
				<label for="space_text">회사 소개<span class="ico_required">*</span></label>
			</div>
			<span class="option">
				<span class="spcCtCnt"><em>0</em>자/<em>500</em>자<span class="txt_guide">(최소 20자)</span></span>
			</span>
			<div class="input">
				<textarea id="space_text" maxlength="500" style="height: 108px;" name="content" minlength="20" 
					placeholder="공간을 상세하게 소개해보세요. 공간의 특징이나 주변환경 등의 세부정보를 작성하시면 효과적입니다."></textarea>
			</div>
			<p class="p_guide warn">
				<i class="sp_icon ico_alert"></i>공간 소개는 필수 입력입니다.
			</p>
		</div>
	
		<div class="box_form">
			<span class="tit"><label for="sp_adrs">주소(위치)<span
					class="ico_required">*</span></label></span>
			<div class="file ">
				<input type="text" name="roadAddr" id="roadAddr" placeholder="주소등록 버튼을 눌러주세요.">
				<div class="btn_box">
					<a class="addrBtn btn" title="레이어 팝업 열림">주소등록</a>
				</div>
			</div>
			<div>
				<input type="text" name="detailAddr" id="detailAddr" placeholder="상세 주소">
				<input type="text" name="extraAddr" id="extraAddr" placeholder="참고 항목">
			</div>
			<p class="p_guide warn">
				<i class="sp_icon ico_alert"></i>주소(위치)는 필수 입력입니다.
			</p>
		</div>
		<div class="box_form">
			<div class="tit">
				<label for="space_text">주차<span class="ico_required">*</span></label>
			</div>
			<div class="row">
				<ul class="check_list space">
					<li>
						<input type="radio" name="parking" value="가능" id="radio1">
						<label for="radio1" class="ellip">가능</label>
					</li>
					<li>
						<input type="radio" name="parking" value="불가능" id="radio2">
						<label for="radio2" class="ellip">불가능</label>
					</li>
				</ul>
			</div>
			<p class="p_guide warn">
				<i class="sp_icon ico_alert"></i>주차는 필수 입력입니다.
			</p>
		</div>
		<div class="box_form">
			<div class="tit">
				<label for="space_text">이용시간<span class="ico_required">*</span></label>
			</div>
			<div class="row">
				<div class="select col-sm-3">
					<select name="openStart" class="col-6">
						<c:forEach begin="0" end="24" var="start">
							<option value="${ start }">${ start }</option>
						</c:forEach>
					</select>
				</div>
				
					<font size="6" style="vertical-align: center">~</font>
				<div class="select col-sm-3">
					<select name="openEnd" class="col-6">
						<c:forEach begin="0" end="24" var="end">
							<option value="${ end }" <c:if test="${ end eq 24 }">selected</c:if>>${ end }</option>
						</c:forEach>
					</select>
				</div>
			</div>
			<p class="p_guide warn">
				<i class="sp_icon ico_alert"></i>이용시간은 필수 입력입니다.
			</p>
		</div>
		<div class="box_form">
			<div class="tit">
				<label for="space_text">휴무일<span class="ico_required">*</span></label>
			</div>
			<div class="row select">
				<select name="holiday">
					<option>없음</option>
					<option>월</option>
					<option>화</option>
					<option>수</option>
					<option>목</option>
					<option>금</option>
					<option>토</option>
					<option>일</option>
				</select>
			</div>
			<p class="p_guide warn">
				<i class="sp_icon ico_alert"></i>주차는 필수 입력입니다.
			</p>
		</div>
		<div class="box_form">
			<div class="btn_box">
				<input type="submit" class="btn" value="세부공간 등록">
			</div>
		</div>
	</form>
</section>
		
<!--autoload=false 파라미터를 이용하여 자동으로 로딩되는 것을 막습니다.-->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
<script type="text/javascript">

daum.postcode.load(function(){
	
    //load함수를 이용하여 core스크립트의 로딩이 완료된 후, 우편번호 서비스를 실행합니다.
    $(".addrBtn").on("click",function (){
    	new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                //document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("roadAddr").value = roadAddr;
                //$("#roadAddr").attr("value", roadAddr);
                //document.getElementById("jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("extraAddr").value = extraRoadAddr;
                } else {
                    document.getElementById("extraAddr").value = '';
                } 

            }
        }).open();
    });
});
</script>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>