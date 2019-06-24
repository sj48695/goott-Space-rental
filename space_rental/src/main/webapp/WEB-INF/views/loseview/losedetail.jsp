<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import ="com.spacerental.vo.Lose" %>
<%@ page import ="com.spacerental.vo.LoseFile" %>
	     
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

<!-- 상단 시작  -->
<aside id="topSpacer"></aside>
<aside id="sideBarCover"></aside>
<!-- } 상단 끝 --><hr>

<!-- 콘텐츠 시작  -->
<div id="ctWrap">
	<div id="container">
		<!-- 게시물 읽기 시작 { -->
		<article id="detail_v" style="width: 100%">
			<script>
				// 글자수 제한
				var char_min = parseInt(0); // 최소
				var char_max = parseInt(0); // 최대
			</script>

			<section id="bo_v_atc">

				<h2 id="bo_v_atc_title">본문</h2>

				<h5>
					<div class="contents">
						<div class="pageSection">
							<form name="viewForm" id="viewForm" method="get">
								<input type="hidden" name="currentPageNo" value="1" /> <input
									type="hidden" name="searchCondition" value="title" /> <input
									type="hidden" name="searchKeyword" value="" /> <input
									type="hidden" name="procMode" id="procMode" value="INSERT" /> <input
									type="hidden" name="idx" id="idx" value="544" /> <input
									type="hidden" name="fileIdx" id="fileIdx" value="" />
								<div class="tblWrap">
									<table border='1'
										style="height: 100px; width: 1000px; text-align: center">
										<tr>
											<td colspan='3'><h2>제목</h2></td>
											<td colspan='5' style="text-align: center">${ lose.title }</td>
										</tr>
										<tr>
											<td><strong><h3>작성자</h3></strong></td>
											<td>${ lose.uploader }</td>

											<td><strong><h3>분실일자</h3></strong></td>
											<td>${ d.substring(0,10) }</td>

											<td><strong><h3>유형</h3></strong></td>
											<td>${ lose.type }</td>

											<td><strong><h3>방번호</h3></strong></td>
											<td>${ lose.spaceNo }</td>
										</tr>
										<tr>
											<c:forEach var="file" items="${ lose.files }">
												<td style="height: 400px" colspan="2"><strong>이미지</strong></td>
												<td colspan="6" style="text-align: center">
												<img src="/spacerental/resources/files/lose-files/${ file.savedFileName } "width="600" height="300"></td>
											</c:forEach>
										</tr>
										<tr>
											<td style="height: 100px" colspan="2">내용</td>
											<td colspan="6" style="text-align: center">${ lose.content }</td>
										</tr>
									</table>
								</div>
							</form>
							</div>
						</div>
							
					</h5>
				</section>
<%-- =======
				
				<h5><div class="contents">
					<div class="pageSection">
						<form name="viewForm" id="viewForm" method="get">
						<input type="hidden" name="currentPageNo" value="1" />
						<input type="hidden" name="searchCondition" value="title" />
						<input type="hidden" name="searchKeyword" value="" />
						<input type="hidden" name="procMode" id="procMode" value="INSERT"/>
						<input type="hidden" name="idx" id="idx" value="544"/>
						<input type="hidden" name="fileIdx" id="fileIdx" value=""/>
						<div class="tblWrap">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" class="bd00view">
								<colgroup>
									<col width="120px" />
									<col width="240px" />
									<col width="120px" />
									<col />
								</colgroup>
								<tr>
									<th class="bd01th" scope="row"><h4>제 목</h4></th>
									<td class="bd01td"><h5>${ lose.title }</h5></td>
								</tr>
								<tr>
								<td>&nbsp;</td>
								</tr>
								<tr>
									<td class="bd01th" scope="row"><h5>작성자</h5></td>
									<td class="bd01td">${ lose.uploader }</td>
									<td class="bd01th" scope="row"><h5>분실일자</h5></td>
									<td class="bd01td">${ lose.loseDate }</td>
									<td class="bd01th" scope="row"><h5>유 형</h5></td>
									<td class="bd01td">${ lose.type }</td>
									<td class="bd01th" scope="row"><h5>방 번호</h5></td>
									<td class="bd01td">${ lose.spaceNo }</td>
								</tr>
								<tr>
									<th class="bd01th" scope="row"><h5>첨부파일</h5></th>
								</tr>
								<tr>
									<c:forEach var="file" items="${ lose.files }">
										<td colspan="3" class="bd01td"><img
											src="/spacerental/resources/files/lose-files/${ file.savedFileName }"
											width="100" height="100"></td>
									</c:forEach>
								</tr>
								<hr>
							</table>
						</div></h5>
				<!-- 본문 내용 시작 { -->
				<br><br>
				<h5><div>내 용</div></h5>
				<h5><div id="bo_v_con">${ lose.content }</div></h5>
				<!-- } 본문 내용 끝 -->
			</section>
>>>>>>> branch 'master' of https://github.com/sj48695/goott-Space-rental.git --%>

			<div id="bo_v_share"></div>

			<!-- 게시물 상단 버튼 시작 { -->
			<div id="bo_v_top">
				<ul class="bo_v_left">
					<li>
						<c:if test="${ loginuser.id eq lose.uploader }">
						<a class="btn_b01 btn" id="update">
						<i class="fa fa-pencil-square-o" aria-hidden="true" id="update"></i>수정</a>
						<a class="btn_b01 btn" id="delete">
						<i class="fa fa-trash-o" aria-hidden="true"></i>삭제</a>
						</c:if>
						<a href="/spacerental/loseview/loselist/${ lose.type }" class="btn_b01 btn" id="loselist">
						<i class="fa fa-list" aria-hidden="true"></i>목록</a>
					</li>
				</ul>
			</div>
			<!-- } 게시물 상단 버튼 끝 -->
			<hr class="dashHr">
		</article>
	</div>
	<!-- // #container 닫음 -->
	
		<jsp:include page="sideBar.jsp" />
	</div>
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
window.addEventListener('load', function(event) {
	var btnUpdate = document.querySelector('#update');
	btnUpdate.addEventListener('click', function(event) {
		location.href="/spacerental/loseview/loseupdate/${lose.loseNo}";
	});
	
	var btnUpdate = document.querySelector('#delete');
	btnUpdate.addEventListener('click', function(event) {
		var ok = confirm("${lose.loseNo}번 자료를 삭제할까요?");
		if (ok) {
			location.href = "/spacerental/loseview/losedelete/${lose.loseNo}";		        			
		}
	});
	
	var btnUpdate = document.querySelector('#loselist');
	btnUpdate.addEventListener('click', function(event) {
		location.href="/spacerental/loseview/loselist/${lose.type}";
	});
});
$(function(){$('.snb.bo_tablebasic, .snb .snb2d_bo_tablebasic').addClass('active');});
$(document).ready(function(){ 
	if ( $("#snb > li").is(".snb.active") ) {
		$('.loc1D').text( $('#snb .bo_tablebasic h2 a b').text());
		$('.loc2D').html( $('.snb2d_bo_tablebasic a b').html());
		$('.faArr').html('<i class="fa fa-angle-right"></i>');
		var index = $("#snb > li").index("#snb > li.active");
		$( "#page_title" ).addClass("subTopBg_0"+($("#snb > li.bo_tablebasic").index() + 1) ); 
	} else { 
		$('.loc1D').text('기본게시판'); 
		$('.noInfoPageTit').html('<h2><a><b>기본게시판</b><sub></sub></a></h2>'); 
		$('.noInfoPageTit').addClass('active');
		$('#page_title').addClass('subTopBg_00'); 
	} 
	
});  
</script>
<!-- //현재위치 및 서브메뉴 활성화 설정 -->

</body>
</html>