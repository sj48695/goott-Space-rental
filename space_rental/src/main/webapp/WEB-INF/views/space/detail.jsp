<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><%-- JSTL의 함수를 제공하는 taglib --%>
<c:set var="title" value="공간 상세 페이지" scope="request"/>
<jsp:include page="/WEB-INF/views/include/header.jsp"/>

<div class="site-loader"></div>

<div class="site-wrap">
   <div class="site-mobile-menu">
      <div class="site-mobile-menu-header">
         <div class="site-mobile-menu-close mt-3">
            <span class="icon-close2 js-menu-toggle"></span>
         </div>
      </div>
      <div class="site-mobile-menu-body"></div>
   </div>
</div>

<div class="site-blocks-cover inner-page-cover overlay" data-aos="fade" data-stellar-background-ratio="0.5"
   style="background-image: url(/spacerental/resources/files/space-files/${host.file.savedFileName});"></div>


<!-- 디테일 박스 -->
<div class="site-section site-section-sm container">
   <div class="row">
      <div class="col-lg-8">
         <div class="bg-white property-body border-bottom border-left border-right border-top">
            <!-- 제목 -->
            <div class="row mb-3">
               <h1 class="text-black col-md-12"><b>${ host.name }</b><font size="4">   |   ${ host.type }</font></h1>
            </div>
            
            <!-- 공간 이미지 -->
            <div class="slide-one-item home-slider owl-carousel">
               <c:forEach var="file" items="${ host.files }">
               <img src="/spacerental/resources/files/space-files/${ file.savedFileName }" style="width:668px;height:400px;" class="img-fluid">
               </c:forEach>
            </div>

            <div class="my-4">
               <h4 class="text-black"><b>공간 소개</b></h4>
<%-- 줄바꿈 문자열을 저장하고 있는 변수 만들기 --%>
<c:set var="enter" value="
" />
               <p>${ fn:replace(host.content, enter, '<br>') }</p>
               <ul class="py-3" style="list-style: none; padding-left: 0px;">
                  <li><span class="pr-3 text-black"><strong>영업시간</strong></span> <span>${ host.openStart }시 ~ ${ host.openEnd }시</span></li>
                  <li><span class="pr-3 text-black"><strong>휴무일</strong></span> <span>${ host.holiday }</span></li>
                  <li><span class="pr-3 text-black"><strong>주차</strong></span> <span>${ host.parking }</span></li>
               </ul>
            </div>
            
            <!-- 갤러리 -->
            <div class="row no-gutters mt-5">
               <div class="col-12">
                  <h4 class="text-black mb-3"><b>Gallery</b></h4>
               </div>
               <c:forEach var="file" items="${ host.files }">
               <div class="col-sm-6 col-md-4 col-lg-3">
                  <a href="/spacerental/resources/files/space-files/${ file.savedFileName }" class="image-popup gal-item">
                     <img src="/spacerental/resources/files/space-files/${ file.savedFileName }"style="max-width: 100%;width:200px;"class="img-fluid">
                  </a>
               </div>
               </c:forEach>
            </div>

            <!-- 지도 -->
            <div class="py-5">
               <h4 class="text-black"><b>지도</b></h4>
               <div><span class="property-icon icon-room"></span>${ host.address }</div>
               <div id="map" style="width: 650px; height: 400px;"></div>
               <script type="text/javascript"
                  src="//dapi.kakao.com/v2/maps/sdk.js?appkey=28206a2925ab959e756fce927cd2cde4&libraries=services"></script>
               <script>
                  var container = document.getElementById('map');
                  var options = {
                     center: new daum.maps.LatLng(33.450701, 126.570667),
                     level: 3
                  };
                        var map = new daum.maps.Map(container, options);
   
                        var geocoder = new daum.maps.services.Geocoder();
   
                        geocoder.addressSearch('${ host.address }', function(result, status) {
   
                             if (status === daum.maps.services.Status.OK) {
   
                                var coords = new daum.maps.LatLng(result[0].y, result[0].x);
   
                                var marker = new daum.maps.Marker({
                                    map: map,
                                    position: coords
                                });
   
                                var infowindow = new daum.maps.InfoWindow({
                                    content: '<div style="width:150px;text-align:center;padding:6px 0;">${ host.name }</div>'
                                });
                                infowindow.open(map, marker);
   
                                map.setCenter(coords);
                            } 
                        });    
               </script>
            </div>

            <!-- 댓글 -->
            <form id="reviewform" class="form-inline row">
               <h4 class="text-black col-md-12"><b>후기</b></h4>
               <input type="hidden" name="spaceNo" value="${ spaceNo }"> 
               <input type="hidden" name="writer" value="${ loginuser.id }">
               <div class="col-md-12">
                  <textarea class="form-control mr-1" id="review_content" name="content" cols="65" rows="3"></textarea>
                  <a class="btn btn-primary py-3 px-4" id="writereview" href="javascript:">댓글<br>등록</a>
               </div>
            </form>
				<!-- review list -->
				<c:if test="${ not empty upload.reviews and upload.reviews[0].reviewNo != 0 }">
					<table id="review-list" style="width: 550px; border: solid 1px; margin: 0 auto">
						<c:forEach var="review" items="${ upload.reviews }">
							<tr id="tr${ review.reviewNo }">
								<td
									style="text-align:left; border-bottom: solid 1px;padding-left:${ review.depth*20 }px + 10px">
									<div id='reviewview${ review.reviewNo }'>
										${ review.writer } &nbsp;&nbsp; [${ review.regDate }] <br />
										<br />
										<span>${ review.content }</span><br />
										<br />
										<div
											style='display:${ loginuser.memberId eq review.writer ? "block" : "none" }'>
											<a class="editreview" data-reviewno='${ review.reviewNo }'
												href="javascript:">편집</a> &nbsp; <a class="deletereview"
												href="javascript:" data-reviewno="${ review.reviewNo }">삭제</a>
										</div>
										<a class="rereview-link btn btn-outline-dark"
											data-reviewno='${ review.reviewNo }' href="javascript:">답글쓰기</a>
									</div>
									<div id='reviewedit${ review.reviewNo }' style="display: none">
										${ review.writer } &nbsp;&nbsp; [${ review.regDate }] <br />
										<br />
										<form id="updateform${ review.reviewNo }">
											<input type="hidden" name="reviewNo"
												value="${ review.reviewNo }" />
											<textarea name="content" style="width: 550px" rows="3"
												maxlength="200">${ review.content }</textarea>
										</form>
										<br />
										<div>
											<a class="updatereview" href="javascript:"
												data-reviewno="${ review.reviewNo }">수정</a> &nbsp; <a
												class="cancel" data-reviewno="${ review.reviewNo }"
												href="javascript:">취소</a>
										</div>
									</div>
								</td>
							</tr>
						</c:forEach>
					</table>
				</c:if>
			</div>
		</div>
		<div class="col-lg-4">
			<div class="bg-white widget border rounded">
				<h4 class="text-black widget-title mb-3"><b>세부공간 선택</b></h4>
				<hr>
				<form action="/spacerental/space/rent" class="form-contact-agent" method="get">
					<input type="hidden" name="year" value="0">
					<input type="hidden" name="month" value="0">
					<c:forEach var="space" items="${ spaces }">
					<div class="custom-control custom-radio mb-3">
						<input type="radio" class="custom-control-input" id="space${ space.spaceNo }" 
							name="spaceNo" value="${ space.spaceNo }" required="required"> 
						<label class="custom-control-label" for="space${ space.spaceNo }">
							${ space.spaceName }
						</label>
					</div>
					</c:forEach>	
					<div class="form-group">
						<input type="submit" id="btn" class="btn btn-primary" value="예약 신청하기">
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
   
   
<footer class="site-footer">
   <div class="container">
      <div class="row">
         <div class="col-lg-4">
            <div class="mb-5">
               <h3 class="footer-heading mb-4">About Homeland</h3>
               <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
                  Saepe pariatur reprehenderit vero atque, consequatur id ratione,
                  et non dignissimos culpa? Ut veritatis, quos illum totam quis
                  blanditiis, minima minus odio!</p>
            </div>
         </div>
         <div class="col-lg-4 mb-5 mb-lg-0">
            <div class="row mb-5">
               <div class="col-md-12">
                  <h3 class="footer-heading mb-4">Navigations</h3>
               </div>
               <div class="col-md-6 col-lg-6">
                  <ul class="list-unstyled">
                     <li><a href="#">Home</a></li>
                     <li><a href="#">Buy</a></li>
                     <li><a href="#">Rent</a></li>
                     <li><a href="#">Properties</a></li>
                  </ul>
               </div>
               <div class="col-md-6 col-lg-6">
                  <ul class="list-unstyled">
                     <li><a href="#">About Us</a></li>
                     <li><a href="#">Privacy Policy</a></li>
                     <li><a href="#">Contact Us</a></li>
                     <li><a href="#">Terms</a></li>
                  </ul>
               </div>
            </div>
         </div>
         <div class="col-lg-4 mb-5 mb-lg-0">
            <h3 class="footer-heading mb-4">Follow Us</h3>
            <div>
               <a href="#" class="pl-0 pr-3"><span class="icon-facebook"></span></a>
               <a href="#" class="pl-3 pr-3"><span class="icon-twitter"></span></a>
               <a href="#" class="pl-3 pr-3"><span class="icon-instagram"></span></a>
               <a href="#" class="pl-3 pr-3"><span class="icon-linkedin"></span></a>
            </div>
         </div>
      </div>
      <div class="row pt-5 mt-5 text-center">
         <div class="col-md-12">
            <p>
               Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. Copyright &copy;
               <script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
               <script>document.write(new Date().getFullYear());</script>
               All rights reserved | This template is made with 
               <i class="icon-heart text-danger" aria-hidden="true"></i> by 
               <a href="https://colorlib.com" target="_blank">Colorlib</a> Link
               back to Colorlib can't be removed. Template is licensed under CC BY 3.0.
            </p>
         </div>
      </div>
   </div>
</footer>

<script type="text/javascript">
   $(function () {
      $('#writereview').on('click', function (event) {

         //serialize   -   form에 포함된 입력요소의 값을 이름=값&이름=값...형식으로 만드는 함수
         var formData = $('#reviewform').serialize();
         //alert(formData);

         $.ajax({
            url: "/spacerental/space/write-review",
            method: "POST",
            data: formData,
            success: function (data, status, xhr) {
               $("#review-list").load('/springdemoweb5/upload/review-list', 
                     { "uploadNo" : ${ upload.uploadNo } }, 
                     function() {})
            },
            error:function(xhr,status,err){
               alert(err);
            }
         });
      });
      

      var currentreviewNo= -1;
      /* $('.editreview').on('click', function (event) {  */
       $('#review-list').on('click', '.editreview', function(event) { 
         reviewNo=$(this).attr('data-reviewno');
         if(currentreviewNo != -1){
            $('#reviewview' + currentreviewNo).css('display','');
            $('#reviewedit' + currentreviewNo).css('display','none');
         }
         $('#reviewview' + reviewNo).css('display','none');
         $('#reviewedit' + reviewNo).css('display','');
         currentreviewNo = reviewNo;
      });
      
      /* $('.cancel').on('click', function (event) {  */
       $('#review-list').on('click','.cancel',function (event) { 
         reviewNo=$(this).attr('data-reviewno');
         $('#reviewview' + reviewNo).css('display','');
         $('#reviewedit' + reviewNo).css('display','none');
         currentreviewNo = -1;
      });
      
   /*    $('.deletereview').on('click', function (event) {  */
       $('#review-list').on('click','.deletereview',function(event){ //새로 만들어지는 객체에도 이벤트를 적용시키도록 하는 것??
         reviewNo= $(this).attr('data-reviewno');
         $.ajax({
            url:"/spacerental/space/delete-review",
            method:"GET",
            data:"reviewNo="+reviewNo,
            success:function(data, status,xhr){
               if(data=='success'){ 
                  $('#tr' + reviewNo).remove();
                  alert('삭제했습니다');
               }
               else alert('삭제실패');
            },
            error:function(xhr,status,err){
               console.log(err);
            }
         });
      });
      
      
      /* $('.updatereview').on('click', function (event) {  */
       $('#review-list').on('click', '.updatereview', function(event) { 
         //현재 클릭된 <a 의 data-reviewno 속성 값 읽기
         var reviewNo = $(this).attr('data-reviewno');
         var content = $('#updateform' + reviewNo + ' textarea').val();
         var inputData = $('#updateform' + reviewNo).serialize();
         
         //ajax 방식으로 데이터 수정
         $.ajax({
            "url": "/spacerental/space/update-review",
            "method": "POST",
            "data": inputData,
            "success": function(data, status, xhr) {
               alert('댓글을 수정했습니다.');
               var span = $('#reviewview' + reviewNo + ' span');               
               span.html(content.replace(/\n/gi, '<br>'));
               //view-div는 숨기고, edit-div는 표시하기   
               $('#reviewview' + reviewNo).css('display', 'block');
               $('#reviewedit' + reviewNo).css('display', 'none');
            },
            "error": function(xhr, status, err) {
               alert('댓글 수정 실패');
            }
         });
      });
      
       $('#review-list').on('click', '.rereview-link', function(event) {
         var reviewNo = $(this).attr('data-reviewno');
         $('#write-rereview-modal input[name=reviewNo]').val(reviewNo);
         $('#write-rereview-modal').modal('show');
      });
      $('#write-rereview').on('click', function(event) {
         var content = $('#rereview-form textarea').val();
         if (content.length == 0) return;
         
         var rereviewData = $('#rereview-form').serialize();
         
         $.ajax({
            url: "/spacerental/space/write-rereview",
            method: "POST",
            data: rereviewData,
            success: function(data, status, xhr) {
               alert('success');               
               $('#write-rereview-modal').modal('hide'); //hide bootstrap modal
               $('#rereview-form').each(function() {
                  this.reset();
               });
               
            },
            error: function(xhr, status, err) {
               alert('fail');
            }
         });
      
      });   
   });
</script>

<jsp:include page="/WEB-INF/views/include/footer.jsp" />
