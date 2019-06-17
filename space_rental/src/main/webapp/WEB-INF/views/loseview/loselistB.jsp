<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" language="java" contentType="text/html; charset=utf-8"
	     pageEncoding="utf-8"%>
	     
<c:set var="title" value="분실물찾기" scope="request" />
<jsp:include page="/WEB-INF/views/include/header.jsp" /> 

<link rel="stylesheet" type="text/css" href="/spacerental/resources/styles/blog.css">
<link rel="stylesheet" type="text/css" href="/spacerental/resources/styles/blog_responsive.css">

<!-- Menu -->

<div class="menu">
	<div class="menu_container text-right">
		<div class="menu_close">close</div>
		<nav class="menu_nav">
			<ul>
				<li><a href="/spacerental/">홈</a></li>
				<li><a href="listings.html">장소</a></li>
				<li><a href="/spacerental/loseview/lose">분실물</a></li>
				<li><a href="/spacerental/noticeview/notice">공지사항</a></li>
			</ul>
		</nav>
		<div class="menu_link">
			<a href="#">+Add Listing</a>
		</div>
	</div>
</div>

<div class="super_container">

	<!-- Header -->

	<header class="header">
		<div class="header_overlay"></div>
		<div class="header_content d-flex flex-row align-items-center justify-content-start">
			
			<!-- Logo -->
			<div class="logo"><a href="/spacerental/">빌려조<br> 찾아조<br><span>&nbsp;&nbsp;&nbsp;&nbsp;다조</span><span>+</span></a></div>

			<!-- Header Nav -->
			<div class="header_right d-flex flex-row align-items-center justify-content-start ml-auto">
				<nav class="main_nav">
					<ul class="d-flex flex-row align-items-center justify-content-start">
						<li class="active"><a href="/spacerental/">홈</a></li>
						<li><a href="listings.html">장소</a></li>
						<li><a href="/spacerental/loseview/lose">분실물</a></li>
						<li><a href="/spacerental/noticeview/notice">공지사항</a></li>
					</ul>
				</nav>
				<!-- <div class="add_listing text-center trans_200"><a href="#">+Add Listing</a></div> -->
				<div class="log_reg">
					<ul class="d-flex flex-row align-items-center justify-content-start">
						<li><a href="#">Login</a></li>
						<li><a href="#">Register</a></li>
					</ul>
				</div> 
				<div class="hamburger">
					<i class="fa fa-bars trans_200"></i>
				</div>
			</div>

		</div>
	</header>

<script>
</script>

<a id="topID"></a>

<!-- 상단 시작  -->
<aside id="topSpacer"></aside>

<!-- } 상단 끝 --><hr>

<!-- 콘텐츠 시작  -->
<div id="ctWrap">

	<div id="container">
    
<script>
// 글자수 제한
var char_min = parseInt(0); // 최소
var char_max = parseInt(0); // 최대
</script>
<!-- } 댓글 끝 -->

<!-- 게시판 목록 시작 { -->
<div id="bo_list" style="width:100%">

    <!-- 게시판 페이지 정보 및 버튼 시작 { -->

                <ul class="btn_bo_user">

            </div>
            <br>

    <!-- 게시판 카테고리 시작 { -->
        <!-- } 게시판 카테고리 끝 -->

    <form name="fboardlist" id="fboardlist" action="./board_list_update.php" onsubmit="return fboardlist_submit(this);" method="post">
    <input type="hidden" name="bo_table" value="basic">
    <input type="hidden" name="sfl" value="">
    <input type="hidden" name="stx" value="">
    <input type="hidden" name="spt" value="">
    <input type="hidden" name="sca" value="">
    <input type="hidden" name="sst" value="wr_num, wr_reply">
    <input type="hidden" name="sod" value="">
    <input type="hidden" name="page" value="1">
    <input type="hidden" name="sw" value="">

    <div class="likeTbl">
        <ul>
        <li class="likeTblTr likeTblTh">
            <div class="mvInlineN">번호</div>
            <div>제목</div>
            <div class="mvInlineN">작성자</div>
            <div class="mvInlineN">유형</div>
            <div class="mvInlineN">날짜</div>
        </li>
                <li class="bo_notice likeTblTr likeTblTd">
                        <div class="mvInlineN td_num2">
            <strong class="notice_icon"><i class="fa fa-bullhorn" aria-hidden="true"></i><span class="sound_only">공지</span></strong>            </div>

            <div class="td_subject" style="padding-left:0px">
                    <div class="bo_tit">
                    <a href="">분실물 찾아가세요 게시판입니다.</a>
                </div>

            </div>
			<span class="onlyMvV" style="padding-left:0px"></span>
            <div class="mvInlinev td_name sv_use"><span class="sv_member">매니저</span></div>
            <div class="mvInlinev td_num"><i class="fa fa-eye"></i>-</div>
                                    <div class="mvInlinev td_datetime"><i class="fa fa-clock-o"></i>-</div>

        </li>
                <li class=" likeTblTr likeTblTd">
                        <div class="mvInlineN td_num2"></li>
                <li class=" likeTblTr likeTblTd">
                        <div class="mvInlineN td_num2"></li>
                        </div>

           <div class="td_subject" style="padding-left:0px">
                             <div class="bo_tit">
                    
            </div>
       <div class="bo_fx">
                <ul class="btn_bo_user">
                <li><a href="losewriteB" class="btn_b02 btn"><i class="fa fa-pencil" aria-hidden="true"></i> 글쓰기</a></li></ul>
            </div>
</div>


<!-- 페이지 -->
<!-- } 게시판 목록 끝 -->
    </div><!-- // #container 닫음 -->
<!-- } 게시글 읽기 끝 -->
 

	<aside id="sideBar">

		<!-- SNB // -->
		<ul id="snb">
			<li class="snb bo_tablebasic  bo_tablebasic bo_tableqna bo_tablefaq bo_tablewebzine bo_tableform "><h2>
					<a href="lose" target="_self"><b>분실물 게시판</b></a>
				</h2>
				<em class="snb2dDown"><i class="fa fa-angle-down"></i><u
					class="fa fa-angle-up"></u></em>
			<ul class="snb2dul">
					<li class="snb2d snb2d_bo_tableqna"><a href="loselistA"
						target="loselist"><b><i class="fa fa-angle-right"></i>찾아주세요</b></a></li>
					<li class="snb2d snb2d_bo_tablefaq"><a href="loselistB"
						target="_self"><b><i class="fa fa-angle-right"></i> 찾아가세요</b></a></li>
				</ul></li>
			
			<li class="snb noInfoPageTit"></li>
		</ul>
		<!-- // SNB -->
		
		<dl class="snbCS">
			<dt>CS CENTER</dt>
			<dd>
				<strong><i class="fa fa-phone-square"></i><span> Tel. 070-0000-0000</span> </strong>
				<b><span> E-mail. <a href='mailto:admin@websiting.co.kr'>admin@space.co.kr</a></span> </b>
				<b><span> Fax. 050-0000-0000</span></b>
				<br>
				<span>고객센터 운영시간 <br>09:00 ~ 18:00</span>
			</dd>
		</dl>
		<div id="snbMvAr"></div>
		</div>
    </aside>

	<aside class="clb"></aside>

</div><!-- // #ctWrap 닫음 -->
<!-- } 콘텐츠 끝 -->

<hr>

<!-- 하단 시작 { -->
<footer id="footer">
</footer>

<!-- 현재위치 및 서브메뉴 활성화 설정// -->
<script>
$(function(){$('.snb.bo_tablebasic, .snb .snb2d_bo_tablebasic').addClass('active');});/*  보테이블 : bo_tablebasic  */
$(document).ready(function(){ if ( $("#snb > li").is(".snb.active") ) { $('.loc1D').text( $('#snb .bo_tablebasic h2 a b').text());$('.loc2D').html( $('.snb2d_bo_tablebasic a b').html());$('.faArr').html('<i class="fa fa-angle-right"></i>');var index = $("#snb > li").index("#snb > li.active");$( "#page_title" ).addClass("subTopBg_0"+($("#snb > li.bo_tablebasic").index() + 1) ); } else { $('.loc1D').text('기본게시판'); $('.noInfoPageTit').html('<h2><a><b>기본게시판</b><sub>sample.paged.kr</sub></a></h2>'); $('.noInfoPageTit').addClass('active');$('#page_title').addClass('subTopBg_00'); } });  </script>
<!-- //현재위치 및 서브메뉴 활성화 설정 -->


</body>
</html>
