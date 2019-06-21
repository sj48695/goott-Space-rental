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

<a id="topID"></a>

<!-- 상단 시작  -->
<aside id="topSpacer"></aside>
<aside id="sideBarCover"></aside>
<!-- } 상단 끝 --><hr>

<!-- 콘텐츠 시작  -->
<div id="ctWrap">
	<div id="container">
			<header>
				<h2 id="lose_title">
					<span class="bo_v_tit">분실물 신고</span>
				</h2>
			</header>
		<form action="/spacerental/loseview/loseupdate" method="post" class="contact_form" id="contact_form">
			<input type="hidden" name="loseNo" value="${ lose.loseNo }">
			<input type="hidden" name="type" value="${ lose.type }">
			<section id="bo_v_info"></section>
			<div class="bo_w_info write_div">
				<label for="wr_uploader" class="sound_only">작성자</label> 
				<input type="text" name="uploader" id="wr_uploader" class="frm_input uploader " placeholder="작성자" value="${ lose.uploader }"/>
				
				<label for="wr_date" class="sound_only">분실일자</label> 
				<input type="date" name="loseDate" id="wr_date" class="frm_input date " required/> 
				
				<label for="wr_roomno" class="sound_only">방 번호</label>
				<input type="text" name="spaceNo" id="wr_type" class="frm_input type " placeholder="방번호" value="${ lose.spaceNo }"/>
			</div>
			<br>
			<div class="bo_w_tit write_div">
				<label for="wr_subject" class="sound_only">제목</label>
				<div id="autosave_wrapper write_div">
					<input type="text" name="title" id="wr_subject" required class="frm_input full_input required" size="30"
						maxlength="230" placeholder="제목" value="${ lose.title }">
				</div>
			</div>
			<br>
			<div class="write_div">
				<label for="wr_content" class="sound_only">내용</label>
				<div class="wr_content smarteditor2">
					<script>
						var g5_editor_url = "", oEditors = [], ed_nonce = "";
					</script>
					<textarea id="wr_content" name="content" class="smarteditor2" maxlength="65536" style="width: 100%; height: 300px">${ lose.content }</textarea>
					<span class="sound_only"></span>
				</div>
			</div>
			<div class="bo_w_flie write_div">
				<div class="file_wr write_div">
					<label for="bf_file_1" class="lb_icon"><i class="fa fa-download" aria-hidden="true"></i>
					<span class="sound_only">파일</span></label> 
					<input type="file" name="attach" class="frm_file "
						id="bf_file_1" title="파일첨부 1 : 용량 1,048,576 바이트 이하만 업로드 가능">
				</div>
			</div>
			<div class="btn_confirm write_div">
				<a href="/spacerental/loseview/loselist" class="btn_cancel btn">취소</a> 
				<button type="submit"  id="btn_submit" class="btn_submit btn">수정완료</button>
			</div>
		</form>
		<script>
			function html_auto_br(obj) {
				if (obj.checked) {
					result = confirm("자동 줄바꿈을 하시겠습니까?\n\n자동 줄바꿈은 게시물 내용중 줄바뀐 곳을<br>태그로 변환하는 기능입니다.");
					if (result)
						obj.value = "html2";
					else
						obj.value = "html1";
				} else
					obj.value = "";
			}

			function fwrite_submit(f) {
				var wr_content_editor_data = oEditors.getById['wr_content']
						.getIR();
				oEditors.getById['wr_content']
						.exec('UPDATE_CONTENTS_FIELD', []);
				if (jQuery.inArray(document.getElementById('wr_content').value
						.toLowerCase().replace(/^\s*|\s*$/g, ''), [ '&nbsp;',
						'<p>&nbsp;</p>', '<p><br></p>', '<div><br></div>',
						'<p></p>', '<br>', '' ]) != -1) {
					document.getElementById('wr_content').value = '';
				}
				if (!wr_content_editor_data
						|| jQuery.inArray(wr_content_editor_data.toLowerCase(),
								[ '&nbsp;', '<p>&nbsp;</p>', '<p><br></p>',
										'<p></p>', '<br>' ]) != -1) {
					alert("내용을 입력해 주십시오.");
					oEditors.getById['wr_content'].exec('FOCUS');
					return false;
				}

				var subject = "";
				var content = "";
				$.ajax({
					url : g5_bbs_url + "/ajax.filter.php",
					type : "POST",
					data : {
						"subject" : f.wr_subject.value,
						"content" : f.wr_content.value
					},
					dataType : "json",
					async : false,
					cache : false,
					success : function(data, textStatus) {
						subject = data.subject;
						content = data.content;
					}
				});

				if (subject) {
					alert("제목에 금지단어('" + subject + "')가 포함되어있습니다");
					f.wr_subject.focus();
					return false;
				}

				if (content) {
					alert("내용에 금지단어('" + content + "')가 포함되어있습니다");
					if (typeof (ed_wr_content) != "undefined")
						ed_wr_content.returnFalse();
					else
						f.wr_content.focus();
					return false;
				}

				if (document.getElementById("char_count")) {
					if (char_min > 0 || char_max > 0) {
						var cnt = parseInt(check_byte("wr_content",
								"char_count"));
						if (char_min > 0 && char_min > cnt) {
							alert("내용은 " + char_min + "글자 이상 쓰셔야 합니다.");
							return false;
						} else if (char_max > 0 && char_max < cnt) {
							alert("내용은 " + char_max + "글자 이하로 쓰셔야 합니다.");
							return false;
						}
					}
				}

				if (!chk_captcha())
					return false;

				document.getElementById("btn_submit").disabled = "disabled";

				return true;
			}
		</script>
<script>
// 글자수 제한
var char_min = parseInt(0); // 최소
var char_max = parseInt(0); // 최대
</script>
<hr>

    </div><!-- // #container 닫음 -->
	<jsp:include page="sideBar.jsp" />

</div><!-- // #ctWrap 닫음 -->
<!-- } 콘텐츠 끝 -->

<hr>

<!-- 하단 시작 { -->
<footer id="footer">
</footer>

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
>>>>>>> branch 'master' of https://github.com/sj48695/goott-Space-rental.git
