<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" language="java" contentType="text/html; charset=utf-8"
	     pageEncoding="utf-8"%>
	     
<c:set var="title" value="상세보기" scope="request" />
<jsp:include page="/WEB-INF/views/include/header.jsp" /> 
<!-- lose -->
<link rel="stylesheet" href="http://sample.paged.kr/purewhite/theme/pagedtheme/css/default.css?ver=1011">
<link rel="stylesheet" href="http://sample.paged.kr/purewhite/theme/pagedtheme/skin/board/basic/style.css?v2">
<link rel="stylesheet" href="http://sample.paged.kr/purewhite/theme/pagedtheme/css/board.common.css?ver=1011">
<link rel="stylesheet" href="http://sample.paged.kr/purewhite/js/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="http://sample.paged.kr/purewhite/theme/pagedtheme/css/mobile.css?ver=1011">
<link rel="stylesheet" href="http://sample.paged.kr/purewhite/theme/pagedtheme/css/contents.css?ver=1011">
<link rel="stylesheet" href="http://sample.paged.kr/purewhite/theme/pagedtheme/plugin/featherlight/featherlight.min.css?ver=1011">


<link rel="stylesheet" type="text/css" href="/spacerental/resources/styles/blog.css">
<link rel="stylesheet" type="text/css" href="/spacerental/resources/styles/blog_responsive.css">

<a id="topID"></a>


<!-- 상단 시작  -->
<aside id="topSpacer"></aside>
<aside id="sideBarCover"></aside>
<!-- } 상단 끝 -->
<hr>

<!-- 콘텐츠 시작  -->
<div id="ctWrap">
	<div id="container">


		<article id="bo_v" style="width: 100%">
			<header>
				<h2 id="bo_v_title">
					<span class="bo_v_tit"></span>
				</h2>
			</header>

			<section id="bo_v_info">
				<h2>페이지 정보</h2>
				<span class="sound_only">작성자</span> 
				<span class="sound_only">댓글</span>
				<span class="sound_only">조회</span> 
				<strong class="if_date">
					<span class="sound_only">작성일</span>
					<i class="fa fa-clock-o" aria-hidden="true"></i>
				</strong>
			</section>

			<section id="bo_v_atc">
				<h2 id="bo_v_atc_title">본문</h2>

				<div id="bo_v_img"></div>

				<!-- 본문 내용 시작 { -->
				<div id="bo_v_con">
					<p></p>
				</div>
				<!-- } 본문 내용 끝 -->
			</section>

			<div id="bo_v_share"></div>

			<!-- 게시물 상단 버튼 시작 { -->
			<div id="bo_v_top">
				<ul class="bo_v_left">
					<li>
						<a href="" class="btn_b01 btn"><i class="fa fa-pencil-square-o" aria-hidden="true"></i>수정</a>
					</li>
					<li>
						<a href="" class="btn_b01 btn" onclick="del(this.href); return false;">
						<i class="fa fa-trash-o" aria-hidden="true"></i>삭제</a>
					</li>
				</ul>
				<ul class="bo_v_com">
					<li><a href="loselist" class="btn_b01 btn"><i class="fa fa-list" aria-hidden="true"></i>목록</a></li>
					<li><a href="losewrite" class="btn_b02 btn"><i class="fa fa-pencil" aria-hidden="true"></i>글쓰기</a></li>
				</ul>
			</div>
			<!-- } 게시물 상단 버튼 끝 -->
			
			<script>
				// 글자수 제한
				var char_min = parseInt(0); // 최소
				var char_max = parseInt(0); // 최대
			</script>

			<hr class="dashHr">
		</article>
	</div>
	<!-- // #container 닫음 -->
	<jsp:include page="sideBar.jsp" />
</div>

<hr>

<!-- 하단 시작 { -->
<footer id="footer"></footer>

<script src="http://sample.paged.kr/purewhite/theme/pagedtheme/js/jquery-1.11.0.min.js"></script>
<script src="http://sample.paged.kr/purewhite/theme/pagedtheme/js/jquery.menu.min.js?ver=171222"></script>
<script src="http://sample.paged.kr/purewhite/js/common.js?ver=171222"></script>
<script src="http://sample.paged.kr/purewhite/theme/pagedtheme/js/WEBsiting.js?ver=221712222"></script>
<script src="http://sample.paged.kr/purewhite/js/wrest.js?ver=171222"></script>
<script src="http://sample.paged.kr/purewhite/js/placeholders.min.js"></script>
<script src="http://sample.paged.kr/purewhite/theme/pagedtheme/plugin/shuffleLetters/jquery.shuffleLetters.min.js"></script>
<script src="http://sample.paged.kr/purewhite/theme/pagedtheme/plugin/featherlight/featherlight.min.js"></script>
<!-- 현재위치 및 서브메뉴 활성화 설정// -->
<script>
$(function(){$('.snb.bo_tablebasic, .snb .snb2d_bo_tablebasic').addClass('active');});/*  보테이블 : bo_tablebasic  */
$(document).ready(function(){ if ( $("#snb > li").is(".snb.active") ) { $('.loc1D').text( $('#snb .bo_tablebasic h2 a b').text());$('.loc2D').html( $('.snb2d_bo_tablebasic a b').html());$('.faArr').html('<i class="fa fa-angle-right"></i>');var index = $("#snb > li").index("#snb > li.active");$( "#page_title" ).addClass("subTopBg_0"+($("#snb > li.bo_tablebasic").index() + 1) ); } else { $('.loc1D').text('기본게시판'); $('.noInfoPageTit').html('<h2><a><b>기본게시판</b><sub></sub></a></h2>'); $('.noInfoPageTit').addClass('active');$('#page_title').addClass('subTopBg_00'); } });  </script>
<!-- //현재위치 및 서브메뉴 활성화 설정 -->

</body>
</html>
