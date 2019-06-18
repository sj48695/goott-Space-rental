<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:set var="title" value="공간 등록" scope="request"/>
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
	<form action="/spacerental/space/write" method="post" enctype="multipart/form-data" id="writeForm">
		<input type="hidden" name="hostId" value="${ loginuser.id }">
		<input type="hidden" name="hostNo" value="${ hostNo }"> 
		<div class="heading">
			<h3>공간 정보를 입력해주세요.</h3>
			<span class="option"><span class="txt_required"><span class="ico_required">* </span>필수입력</span></span>
		</div>
		<div class="box_form">
			<div class="tit">
				<label for="space_name">공간명<span class="ico_required">*</span></label>
			</div>
			<span class="option"><span class="txt_count"><em id="spcNmCnt">0</em>자/<em>18</em>자</span></span>
			<div class="input">
				<input type="text" id="space_name" min="1" maxlength="18" name="spaceName">
			</div>
			<p class="p_guide normal">
				<i class="sp_icon ico_alert"></i>사용 가능한 특수문자 : ( , ) , [ , ] , - , .(마침표), ,(쉼표)
			</p>
			<p class="p_guide warn">
				<i class="sp_icon ico_alert"></i>공간이름 입력은 필수입니다.
			</p>
		</div>
		<!-- <div class="box_form">
			<div class="tit">
				<label for="space_intro">공간 한줄 소개<span class="ico_required">*</span></label>
			</div>
			<span class="option"><span class="txt_count"><em>0</em>자/<em>27</em>자</span></span>
			<div class="input">
				<input type="text" id="space_intro" name="content"
					placeholder="공간을 소개하는 한줄 문장을 입력해주세요." min="1" maxlength="27">
			</div>
			<p class="p_guide warn">
				<i class="sp_icon ico_alert"></i>공간을 소개하는 한 줄은 필수입니다.
			</p>
		</div> -->
		 <div class="box_form">
			<div class="tit">
				<label for="space_text">공간 소개<span class="ico_required">*</span></label>
			</div>
			<span class="option">
				<span class="txt_count"><em id="spcCtCnt">0</em>자/<em>500</em>자<span class="txt_guide">(최소 20자)</span></span>
			</span>
			<div class="input">
				<textarea id="space_text" minlength="20" maxlength="500" style="height: 108px;" name="content"
					placeholder="공간을 상세하게 소개해보세요. 공간의 특징이나 주변환경 등의 세부정보를 작성하시면 효과적입니다."></textarea>
			</div>
			<p class="p_guide warn">
				<i class="sp_icon ico_alert"></i>공간 소개는 필수 입력입니다.
			</p>
		</div>
		<!-- 
		<div class="box_form">
			<div class="tit">
				<label for="space_tag">공간 태그<span class="ico_required"> *</span></label>
			</div>
			<p class="option">최대 5개</p>
			<div class="input_add">
				<input type="text" id="space_tag" placeholder="태그를 입력해 주세요." maxlength="30">
				<div class="btn_box">
					<a href="javascript:void(0);" class="btn active"><span class="btn_inner">추가</span></a>
				</div>
			</div>
		</div>
		<div class="box_form">
			<div class="tit">
				<label for="space_nam">시설안내<span class="ico_required">*</span></label>
			</div>
			<span class="option"><span class="txt_count"><em>0</em>자/<em>100</em>자</span></span>
			<div class="input_add ">
				<input type="text" name="space_guide" id="space_guide"
					placeholder="최대 10개까지 작성가능합니다." maxlength="100" value="">
				<div class="btn_box">
					<a class="btn"><span class="btn_inner">추가</span></a>
				</div>
			</div>
		</div>
		<div class="box_form">
			<div class="tit">
				<label for="space_nam">예약 시 주의사항<span class="ico_required">*</span></label>
			</div>
			<span class="option"><span class="txt_count"><em>0</em>자/<em>100</em>자</span></span>
			<div class="input_add">
				<input type="text" name="space_rsv_caution" id="space_rsv_caution"
					placeholder="최대 10개까지 작성가능합니다." maxlength="100">
				<div class="btn_box">
					<a href="javascript:void(0);" class="btn"><span class="btn_inner">추가</span></a>
				</div>
			</div>
		</div>
		<div class="box_form">
			<div class="tit">
				<label for="space_url">웹사이트</label>
			</div>
			<div class="input">
				<input type="text" id="space_url" placeholder="웹사이트 URL을 입력해주세요.">
			</div>
			<p class="p_guide warn">
				<i class="sp_icon ico_alert"></i>유효하지 않은 웹사이트 주소입니다.
			</p>
		</div> -->
		<div class="box_form">
			<span class="tit">대표이미지<span class="ico_required"> *</span></span>
			<p class="option">2048 *1158 권장, 최대 3MB</p>
			<div class="file ">
				<div class="inner inner_img">이미지 파일을 추가해 주세요. (JPG, JPEG, PNG)</div>
				<div class="btn_box">
					<label class="titleImgBtn btn" for="titleImgFile"><div>파일첨부</div> 
					<input type="file" class="_fileRel" name="titleImgFile" id="titleImgFile"
						accept="image/*" style="display: none;"></label>
				</div>
			</div>
			<p class="p_guide warn">
				<i class="sp_icon ico_alert"></i>대표이미지는 필수 입력입니다.
			</p>
		</div>
		<div class="box_form">
			<span class="tit">이미지<label for="sp_adrs"><span class="ico_required">*</span></label></span>
			<p class="option">
				2048 * 1158 권장, 한 장당 최대 3MB<span class="txt_guide">(최대 10장)</span>
			</p>
			<div class="file ">
				<div class="inner inner_imgs">이미지 파일을 추가해 주세요. (JPG, JPEG, PNG)</div>
				<div class="btn_box">
					<label class="imgBtn btn" for="imgFile"><div>파일첨부</div> 
						<input type="file" class="_fileRel" name="imgFile" id="imgFile" style="display: none;"
							accept="image/*" placeholder="이미지 파일을 추가해 주세요. (JPG, JPEG, PNG)">
					</label>
					<div class="nav_btn">
						<a class="btn_move">
							<i class="sp_icon ico_select_prev"></i>
							<em class="blind">앞으로 순서 이동</em>
						</a>
						<a class="btn_move ">
							<i class="sp_icon ico_select_del"></i>
							<em class="blind">삭제</em>
						</a>
						<a class="btn_move ">
							<i class="sp_icon ico_select_next"></i>
							<em class="blind">뒤로 순서 이동</em>
						</a>
					</div>
				</div>
			</div>
		</div>
		<div class="box_form">
			<div class="tit">
				<label for="space_text">최대인원<span class="ico_required">*</span></label>
			</div>
			<div class="input">
				<input type="text" name="maximum">
			</div>
			<p class="p_guide warn">
				<i class="sp_icon ico_alert"></i>주차는 필수 입력입니다.
			</p>
		</div>
		<div class="box_form">
			<div class="tit">
				<label for="space_text">빔프로젝터<span class="ico_required">*</span></label>
			</div>
			<div class="row">
				<ul class="check_list space">
					<li>
						<input type="radio" name="bim" value="유" id="radio1">
						<label for="radio1" class="ellip">유</label>
					</li>
					<li>
						<input type="radio" name="bim" value="무" id="radio2">
						<label for="radio2" class="ellip">무</label>
					</li>
				</ul>
			</div>
			<p class="p_guide warn">
				<i class="sp_icon ico_alert"></i>주차는 필수 입력입니다.
			</p>
		</div>
		<div class="box_form">
			<div class="tit">
				<label for="space_text">흡연실<span class="ico_required">*</span></label>
			</div>
			<div class="row">
				<ul class="check_list space">
					<li>
						<input type="radio" name="smoking" value="유" id="radio3">
						<label for="radio3" class="ellip">유</label>
					</li>
					<li>
						<input type="radio" name="smoking" value="무" id="radio4">
						<label for="radio4" class="ellip">무</label>
					</li>
				</ul>
			</div>
			<p class="p_guide warn">
				<i class="sp_icon ico_alert"></i>주차는 필수 입력입니다.
			</p>
		</div>
		<div class="box_form">
			<div class="tit">
				<label for="space_text">음식물 반입<span class="ico_required">*</span></label>
			</div>
			<div class="row">
				<ul class="check_list space">
					<li>
						<input type="radio" name="food" value="가능" id="radio5">
						<label for="radio5" class="ellip">가능</label>
					</li>
					<li>
						<input type="radio" name="food" value="불가능" id="radio6">
						<label for="radio6" class="ellip">불가능</label>
					</li>
				</ul>
			</div>
			<p class="p_guide warn">
				<i class="sp_icon ico_alert"></i>주차는 필수 입력입니다.
			</p>
		</div>
		<div class="box_form">
			<div class="tit">
				<label for="space_text">인터넷/Wi-Fi<span class="ico_required">*</span></label>
			</div>
			<div class="row">
				<ul class="check_list space">
					<li>
						<input type="radio" name="wifi" value="가능" id="radio7">
						<label for="radio7" class="ellip">가능</label>
					</li>
					<li>
						<input type="radio" name="wifi" value="불가능" id="radio8">
						<label for="radio8" class="ellip">불가능</label>
					</li>
				</ul>
			</div>
			<p class="p_guide warn">
				<i class="sp_icon ico_alert"></i>주차는 필수 입력입니다.
			</p>
		</div>
		<div class="box_form">
			<div class="tit">
				<label for="space_text">컴퓨터<span class="ico_required">*</span></label>
			</div>
			<div class="row">
				<ul class="check_list space">
					<li>
						<input type="radio" name="computer" value="가능" id="radio9">
						<label for="radio9" class="ellip">가능</label>
					</li>
					<li>
						<input type="radio" name="computer" value="불가능" id="radio10">
						<label for="radio10" class="ellip">불가능</label>
					</li>
				</ul>
			</div>
			<p class="p_guide warn">
				<i class="sp_icon ico_alert"></i>주차는 필수 입력입니다.
			</p>
		</div>
		<div class="box_form">
			<div class="btn_box">
				<input type="submit" class="btn" value="공간 등록">
			</div>
		</div>
	</form>
</section>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>