<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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


<link rel="stylesheet" type="text/css" href="/spacerental/resources/styles/blog.css">
<link rel="stylesheet" type="text/css" href="/spacerental/resources/styles/blog_responsive.css">

<!-- 상단 시작  -->
<aside id="topSpacer"></aside>
<aside id="sideBarCover"></aside>
<!-- } 상단 끝 --><hr>

<!-- 콘텐츠 시작  -->
<div id="ctWrap">

	<div id="container">

<!-- 게시물 읽기 시작 { -->
<article id="lose_v" style="width:100%">
  <header>
      <h2 id="lose_title">
         <span class="bo_v_tit">소 개</span>
      </h2>
  </header>

  <section id="bo_v_info"></section>

  <section id="bo_v_atc">
      <div id="bo_v_img">
</div>
<h1>
      <!-- 본문 내용 시작 { -->
  <div id="bo_v_con"><div>분실물 찾기 게시판입니다.</div><div><br /></div><div><br />
  </div><div>공간 사용시 발생한 분실물을 찾을 수 있는 게시판입니다 .</div><div><br />
  </div><div><br /></div><div>분실물을 습득한 경우 찾아가세요에 등록하세요.</div><div><br /></div><div><br />
  </div><div>분실물을 잃어버린 경우 찾아주세요에 등록하세요</div></h1>
  <!-- } 본문 내용 끝 -->
    </section>

</section>

<hr class="dashHr">

    </div><!-- // #container 닫음 -->

<aside id="sideBar">

	<!-- SNB // -->
<ul id="snb">
	<li class="snb bo_tablebasic  bo_tablebasic bo_tableqna bo_tablefaq bo_tablewebzine bo_tableform ">
		<h2><a href="" target="_self"><b>분실물 게시판</b></a></h2>
		<em class="snb2dDown"><i class="fa fa-angle-down"></i><u
			class="fa fa-angle-up"></u></em>
		<ul class="snb2dul">
			<li class="snb2d snb2d_bo_tableqna"><a href="/spacerental/loseview/loselist"
				target="loselist"><b><i class="fa fa-angle-right"></i>찾아주세요</b></a></li>
			<li class="snb2d snb2d_bo_tablefaq"><a href="/spacerental/loseview/findlist"
				target="_self"><b><i class="fa fa-angle-right"></i> 찾아가세요</b></a></li>
		</ul>
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
$(function(){$('.snb.bo_tablebasic, .snb .snb2d_bo_tablebasic').addClass('active');});
$(document).ready(function(){ if ( $("#snb > li").is(".snb.active") ) { $('.loc1D').text( $('#snb .bo_tablebasic h2 a b').text());
$('.loc2D').html( $('.snb2d_bo_tablebasic a b').html());
$('.faArr').html('<i class="fa fa-angle-right"></i>');
var index = $("#snb > li").index("#snb > li.active");$( "#page_title" ).addClass("subTopBg_0"+($("#snb > li.bo_tablebasic").index() + 1) ); } else { $('.loc1D').text('기본게시판'); 
$('.noInfoPageTit').html('<h2><a><b>기본게시판</b><sub></sub></a></h2>'); 
$('.noInfoPageTit').addClass('active');
$('#page_title').addClass('subTopBg_00'); } });  
</script>
}
}
<!-- //현재위치 및 서브메뉴 활성화 설정 -->

</body>
</html>
