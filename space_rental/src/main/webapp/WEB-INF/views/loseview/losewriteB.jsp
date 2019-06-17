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

<a id="topID"></a>

<!-- 상단 시작  -->
<aside id="topSpacer"></aside>
<aside id="sideBarCover"></aside>
<!-- } 상단 끝 --><hr>

<!-- 콘텐츠 시작  -->
<div id="ctWrap">
<div id="container">

<div class="bo_w_info write_div">
            <label for="wr_uploader" class="sound_only">작성자</label>
            <input type="text" name="wr_uploader" value="" id="wr_uploader" class="frm_input uploader " placeholder="작성자">
    
            <label for="wr_date" class="sound_only">날짜</label>
            <input type="text" name="wr_date" value="" id="wr_date" class="frm_input date " placeholder="날짜">
            
            <label for="wr_email" class="sound_only">유형</label>
            <input type="text" name="wr_type" value="" id="wr_type" class="frm_input type " placeholder="유형">
        </div>

        
    <br>
    
    
    <div class="bo_w_tit write_div">
        <label for="wr_subject" class="sound_only">제목</label>
        
        <div id="autosave_wrapper write_div">
            <input type="text" name="wr_subject" value="" id="wr_subject" required class="frm_input full_input required" size="30" maxlength="230" placeholder="제목">
                    </div>
        
    </div>
    
      <br>

    <div class="write_div">
        <label for="wr_content" class="sound_only">내용</label>
        <div class="wr_content smarteditor2">
                        
<script src="http://sample.paged.kr/purewhite/plugin/editor/smarteditor2/js/service/HuskyEZCreator.js"></script>
<script>var g5_editor_url = "http://sample.paged.kr/purewhite/plugin/editor/smarteditor2", oEditors = [], ed_nonce = "s7e41aDCwX|1560740220|7d4cce05c3722c8566ceb0c94fcc2f6f36c3f7d9";</script>
<script src="http://sample.paged.kr/purewhite/plugin/editor/smarteditor2/config.js"></script>

<textarea id="wr_content" name="wr_content" class="smarteditor2" maxlength="65536" style="width:100%;height:300px"></textarea>
<span class="sound_only">웹 에디터 끝</span>                    </div>
        
    </div>

	
       
    
        <div class="bo_w_flie write_div">
        <div class="file_wr write_div">
            <label for="bf_file_1" class="lb_icon"><i class="fa fa-download" aria-hidden="true"></i><span class="sound_only">파일</span></label>
            <input type="file" name="bf_file[]" id="bf_file_1" title="파일첨부 1 : 용량 1,048,576 바이트 이하만 업로드 가능" class="frm_file ">
        </div>
        
                
    </div>
    

    <div class="btn_confirm write_div">
        <a href="loselistB" class="btn_cancel btn">취소</a>
        <input type="submit" value="작성완료" id="btn_submit" accesskey="s" class="btn_submit btn">
    </div>
    </form>

    <script>
        function html_auto_br(obj)
    {
        if (obj.checked) {
            result = confirm("자동 줄바꿈을 하시겠습니까?\n\n자동 줄바꿈은 게시물 내용중 줄바뀐 곳을<br>태그로 변환하는 기능입니다.");
            if (result)
                obj.value = "html2";
            else
                obj.value = "html1";
        }
        else
            obj.value = "";
    }

    function fwrite_submit(f)
    {
        var wr_content_editor_data = oEditors.getById['wr_content'].getIR();
oEditors.getById['wr_content'].exec('UPDATE_CONTENTS_FIELD', []);
if(jQuery.inArray(document.getElementById('wr_content').value.toLowerCase().replace(/^\s*|\s*$/g, ''), ['&nbsp;','<p>&nbsp;</p>','<p><br></p>','<div><br></div>','<p></p>','<br>','']) != -1){document.getElementById('wr_content').value='';}
if (!wr_content_editor_data || jQuery.inArray(wr_content_editor_data.toLowerCase(), ['&nbsp;','<p>&nbsp;</p>','<p><br></p>','<p></p>','<br>']) != -1) { alert("내용을 입력해 주십시오."); oEditors.getById['wr_content'].exec('FOCUS'); return false; }

        var subject = "";
        var content = "";
        $.ajax({
            url: g5_bbs_url+"/ajax.filter.php",
            type: "POST",
            data: {
                "subject": f.wr_subject.value,
                "content": f.wr_content.value
            },
            dataType: "json",
            async: false,
            cache: false,
            success: function(data, textStatus) {
                subject = data.subject;
                content = data.content;
            }
        });

        if (subject) {
            alert("제목에 금지단어('"+subject+"')가 포함되어있습니다");
            f.wr_subject.focus();
            return false;
        }

        if (content) {
            alert("내용에 금지단어('"+content+"')가 포함되어있습니다");
            if (typeof(ed_wr_content) != "undefined")
                ed_wr_content.returnFalse();
            else
                f.wr_content.focus();
            return false;
        }

        if (document.getElementById("char_count")) {
            if (char_min > 0 || char_max > 0) {
                var cnt = parseInt(check_byte("wr_content", "char_count"));
                if (char_min > 0 && char_min > cnt) {
                    alert("내용은 "+char_min+"글자 이상 쓰셔야 합니다.");
                    return false;
                }
                else if (char_max > 0 && char_max < cnt) {
                    alert("내용은 "+char_max+"글자 이하로 쓰셔야 합니다.");
                    return false;
                }
            }
        }

        if (!chk_captcha()) return false;

        document.getElementById("btn_submit").disabled = "disabled";

        return true;
    }
    </script>
</section>

    
<script>
// 글자수 제한
var char_min = parseInt(0); // 최소
var char_max = parseInt(0); // 최대
</script>
<!-- 댓글 시작 { -->
<hr class="dashHr">
</section>
<!-- } 댓글 끝 -->

<!-- 댓글 쓰기 시작 { -->



<!-- } 게시글 읽기 끝 -->

    </div><!-- // #container 닫음 -->

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
				<strong><i class="fa fa-phone-square"></i> <span> Tel. 070-0000-0000</span> </strong>
				<b><span> E-mail. <a href='mailto:admin@websiting.co.kr'>admin@space.co.kr</a></span> </b>
				<b><span> Fax. 050-0000-0000</span> </b>
				
				<br>
				<span>고객센터 운영시간 <br>09:00 ~ 18:00</span>
			</dd>
		</dl>
		<div id="snbMvAr"></div>
		</div>
				<!-- //서브메뉴바 하단 정보 -->
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
<script>$(function() { /* 모바일용 메뉴바 */ var articleMgnb = $("#snb li.snb"); articleMgnb.addClass("hide"); $("#snb li.active").removeClass("hide").addClass("show"); $("#snb li.active .snb2dul").show(); $(".snb2dDown").click(function(){ var myArticle = $(this).parents("#snb li.snb"); if(myArticle.hasClass("hide")){ articleMgnb.addClass("hide").removeClass("show"); articleMgnb.find(".snb2dul").slideUp("fast"); myArticle.removeClass("hide").addClass("show"); myArticle.find(".snb2dul").slideDown("fast"); } else { myArticle.removeClass("show").addClass("hide");myArticle.find(".snb2dul").slideUp("fast"); } }); });</script>

</body>
</html>
