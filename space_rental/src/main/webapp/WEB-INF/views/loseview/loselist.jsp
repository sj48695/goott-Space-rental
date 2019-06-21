<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="false" language="java" contentType="text/html; charset=utf-8"
	     pageEncoding="utf-8"%>
	     
<c:set var="title" value="분실물찾기" scope="request" />
<jsp:include page="/WEB-INF/views/include/header.jsp" /> 
<!-- lose -->
<link rel="stylesheet" href="http://sample.paged.kr/purewhite/theme/pagedtheme/css/default.css?ver=1011">
<link rel="stylesheet" href="http://sample.paged.kr/purewhite/theme/pagedtheme/skin/board/basic/style.css?v2">
<link rel="stylesheet" href="http://sample.paged.kr/purewhite/theme/pagedtheme/css/board.common.css?ver=1011">
<link rel="stylesheet" href="http://sample.paged.kr/purewhite/js/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="http://sample.paged.kr/purewhite/theme/pagedtheme/css/mobile.css?ver=1011">
<link rel="stylesheet" href="http://sample.paged.kr/purewhite/theme/pagedtheme/css/contents.css?ver=1011">
<link rel="stylesheet" href="http://sample.paged.kr/purewhite/theme/pagedtheme/plugin/featherlight/featherlight.min.css?ver=1011">

<script src="http://sample.paged.kr/purewhite/theme/pagedtheme/js/jquery-1.11.0.min.js"></script>
<script src="http://sample.paged.kr/purewhite/theme/pagedtheme/js/jquery.menu.min.js?ver=171222"></script>
<script src="http://sample.paged.kr/purewhite/js/common.js?ver=171222"></script>
<script src="http://sample.paged.kr/purewhite/theme/pagedtheme/js/WEBsiting.js?ver=221712222"></script>
<script src="http://sample.paged.kr/purewhite/js/wrest.js?ver=171222"></script>
<script src="http://sample.paged.kr/purewhite/js/placeholders.min.js"></script>
<script src="http://sample.paged.kr/purewhite/theme/pagedtheme/plugin/shuffleLetters/jquery.shuffleLetters.min.js"></script>
<script src="http://sample.paged.kr/purewhite/theme/pagedtheme/plugin/featherlight/featherlight.min.js"></script>

<link rel="stylesheet" type="text/css" href="/spacerental/resources/styles/blog.css">
<link rel="stylesheet" type="text/css" href="/spacerental/resources/styles/blog_responsive.css">

	<a id="topID"></a>

	<aside id="topSpacer"></aside>
	<hr>

	<!-- 콘텐츠 시작  -->
	<div id="ctWrap">
		<div id="container">
			<script>
				// 글자수 제한
				var char_min = parseInt(0); // 최소
				var char_max = parseInt(0); // 최대
			</script>
			<br>
			<form name="fboardlist" id="fboardlist" onsubmit="return fboardlist_submit(this);" method="post">
				<input type="hidden" name="bo_table" value="basic">
				<input type="hidden" name="sst" value="wr_num, wr_reply">
				<input type="hidden" name="page" value="1"> 

				<div class="likeTbl">
					<ul>
						<li class="likeTblTr likeTblTh">
							<div class="mvInlineN">번호</div>
							<div>제목</div>
							<div class="mvInlineN">작성자</div>
							<div class="mvInlineN">분실일</div>
							<div class="mvInlineN">유형</div>
						</li>
						<li class="bo_notice likeTblTr likeTblTd">
							<div class="mvInlineN td_num2">
								<strong class="notice_icon"><i class="fa fa-bullhorn"
									aria-hidden="true"></i><span class="sound_only">공지</span></strong>
							</div>
							<div class="td_subject" style="padding-left: 0px">
								<div class="bo_tit">
									분실물 
									<c:choose>
										<c:when test="${ type eq '분실물' }">
									찾아주세요 
									</c:when>
										<c:when test="${ type eq '습득물' }">
									찾아가세요
									</c:when>
									</c:choose> 게시판입니다.
								</div>
							</div> <span class="onlyMvV" style="padding-left: 0px"></span>
							<div class="mvInlinev td_name sv_use">
								<span class="sv_member">매니저</span>
							</div>
							<div class="mvInlinev td_num">
								<i class="fa fa-eye"></i>-
							</div>
							<div class="mvInlinev td_datetime">
								<i class="fa fa-clock-o"></i>-
							</div>
						</li>
						 <c:forEach var="lose" items="${ loses }" varStatus="i">
						<li class="likeTblTr likeTblTh" style="background: white;">
							<div class="mvInlineN">${ fn:length(loses) - i.index }</div>
							<div><a href="/spacerental/loseview/losedetail/${ lose.loseNo }">${ lose.title }</a></div>
							<div class="mvInlineN">${ lose.uploader }</div><%-- 
							<div class="mvInlineN">${ lose.loseDate.toString().substring(0,10) }</div> --%>
							<fmt:formatDate var="date" value="${ lose.loseDate }" type="date" />
							<div class="mvInlineN">${ date }</div>
							<div class="mvInlineN">${ lose.type }</div>
						</li>
						</c:forEach>
					</ul>
				</div>
				<div class="td_subject" style="padding-left: 0px">
					<div class="bo_tit"></div>
					<div class="bo_fx">
						<ul class="btn_bo_user">
							<li>
							<c:if test="${ type eq '분실물' && loginuser.type eq 'customer' }">
								<a href="/spacerental/loseview/losewrite/${ type }" class="btn_b02 btn">
								<i class="fa fa-pencil" aria-hidden="true"></i> 글쓰기</a>
							</c:if>
							<c:if test="${ type eq '습득물' && loginuser.type eq 'host' }">
								<a href="/spacerental/loseview/losewrite/${ type }" class="btn_b02 btn">
								<i class="fa fa-pencil" aria-hidden="true"></i> 글쓰기</a>
							</c:if>
							</li>
						</ul>
					</div>
				</div>
			</form>
		</div>
		<!-- // #container 닫음 -->
		<jsp:include page="sideBar.jsp" />
	</div>

	<hr>

<!-- 하단 시작 { -->
<footer id="footer"></footer>

<!-- 현재위치 및 서브메뉴 활성화 설정// -->
<script>
	$(function() {
		$('.snb.bo_tablebasic, .snb .snb2d_bo_tablebasic').addClass('active');
	});/*  보테이블 : bo_tablebasic  */
	$(document).ready(
			function() {
				if ($("#snb > li").is(".snb.active")) {
					$('.loc1D').text($('#snb .bo_tablebasic h2 a b').text());
					$('.loc2D').html($('.snb2d_bo_tablebasic a b').html());
					$('.faArr').html('<i class="fa fa-angle-right"></i>');
					var index = $("#snb > li").index("#snb > li.active");
					$("#page_title")
							.addClass(
									"subTopBg_0"
											+ ($("#snb > li.bo_tablebasic")
													.index() + 1));
				} else {
					$('.loc1D').text('기본게시판');
					$('.noInfoPageTit').html(
							'<h2><a><b>기본게시판</b><sub></sub></a></h2>');
					$('.noInfoPageTit').addClass('active');
					$('#page_title').addClass('subTopBg_00');
				}
			});
</script>
<!-- //현재위치 및 서브메뉴 활성화 설정 -->

</body>
</html>