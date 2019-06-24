<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="nav" value="space" scope="request"/>
<c:set var="title" value="장소리스트" scope="request"/>
<jsp:include page="/WEB-INF/views/include/header.jsp" />

<div class="site-loader"></div>
  
  <div class="site-wrap">

    <div class="site-mobile-menu">
      <div class="site-mobile-menu-header">
        <div class="site-mobile-menu-close mt-3">
          <span class="icon-close2 js-menu-toggle"></span>
        </div>
      </div>
      <div class="site-mobile-menu-body"></div>
    </div> <!-- .site-mobile-menu -->
    </div>

    <div class="slide-one-item home-slider owl-carousel">

      <div class="site-blocks-cover overlay" style="background-image: url(/spacerental/resources/images/cafebg.jpg);" data-aos="fade" data-stellar-background-ratio="0.5">
        <div class="container">
          <div class="row align-items-center justify-content-center text-center">
            <div class="col-md-10">
              <span class="d-inline-block bg-success text-white px-3 mb-3 property-offer-type rounded">OUR SPACE</span>
              <h1 class="mb-2">CAFE</h1>
              <p class="mb-5"><strong class="h2 text-success font-weight-bold"></strong></p>
              <p><a href="#" class="btn btn-white btn-outline-white py-3 px-5 rounded-0 btn-2">SEE DETAILS</a></p>
            </div>
          </div>
        </div>
      </div>  

      <div class="site-blocks-cover overlay" style="background-image: url(/spacerental/resources/images/partyroombg.jpg);" data-aos="fade" data-stellar-background-ratio="0.5">
        <div class="container">
          <div class="row align-items-center justify-content-center text-center">
            <div class="col-md-10">
              <span class="d-inline-block bg-danger text-white px-3 mb-3 property-offer-type rounded">OUR SPACE</span>
              <h1 class="mb-2">PARTY ROOM</h1>
              <p class="mb-5"><strong class="h2 text-success font-weight-bold"></strong></p>
              <p><a href="#" class="btn btn-white btn-outline-white py-3 px-5 rounded-0 btn-2">SEE DETAILS</a></p>
            </div>
          </div>
        </div>
      </div>  
      
      <div class="site-blocks-cover overlay" style="background-image: url(/spacerental/resources/images/conf2.jpg);" data-aos="fade" data-stellar-background-ratio="0.5">
        <div class="container">
          <div class="row align-items-center justify-content-center text-center">
            <div class="col-md-10">
              <span class="d-inline-block bg-danger text-white px-3 mb-3 property-offer-type rounded">OUR SPACE</span>
              <h1 class="mb-2">CONFERENCE ROOM</h1>
              <p class="mb-5"><strong class="h2 text-success font-weight-bold"></strong></p>
              <p><a href="#" class="btn btn-white btn-outline-white py-3 px-5 rounded-0 btn-2">SEE DETAILS</a></p>
            </div>
          </div>
        </div>
      </div> 
      
      <div class="site-blocks-cover overlay" style="background-image: url(/spacerental/resources/images/study.jpg);" data-aos="fade" data-stellar-background-ratio="0.5">
        <div class="container">
          <div class="row align-items-center justify-content-center text-center">
            <div class="col-md-10">
              <span class="d-inline-block bg-danger text-white px-3 mb-3 property-offer-type rounded">OUR SPACE</span>
              <h1 class="mb-2">STUDY ROOM</h1>
              <p class="mb-5"><strong class="h2 text-success font-weight-bold"></strong></p>
              <p><a href="#" class="btn btn-white btn-outline-white py-3 px-5 rounded-0 btn-2">SEE DETAILS</a></p>
            </div>
          </div>
        </div>
      </div> 

    </div>
    
	<form class="form-inline offset-9 px-5 py-3" action="/spacerental/space/spacelist" method="get" >
		<select name="type" class="form-control" id="type_form">
	        <option value="all" <c:if test="${param.type eq 'all'}">selected</c:if>>전체</option>
	        <option value="카페" <c:if test="${param.type eq '카페'}">selected</c:if>>카페</option>
	        <option value="파티룸" <c:if test="${param.type eq '파티룸'}">selected</c:if>>파티룸</option>
	        <option value="스터디룸" <c:if test="${param.type eq '스터디룸'}">selected</c:if>>스터디룸</option>
	        <option value="회의실" <c:if test="${param.type eq '회의실'}">selected</c:if>>회의실</option>
      	</select>
	</form>
	
	
<!-- 공간 목록 -->
    <div class="site-section site-section-sm bg-light">
      <div class="container">
		<div class="row mb-5">
			<c:if test="${ listCnt == 0 }">
				<div class="text-center">
					<b>등록된 공간이 없습니다.</b>
				</div>
			</c:if>
			<c:forEach var="host" items="${ hosts }">
				<div class="col-md-6 col-lg-4 mb-4">
					<div class="property-entry h-100">
						<a href="/spacerental/space/detail/${ host.hostNo }" class="property-thumbnail"> 
						<img src="/spacerental/resources/files/space-files/${ host.file.savedFileName  }"
							style="width: 400px; height: 300px" alt="Image" class="img-fluid">
						</a>
						<div class="p-4 property-body">
							<h2 class="property-title">
								<a href="detail/${ host.hostNo }">${ host.name }</a>
							</h2>
							<span class="property-location d-block mb-3">
							<span class="property-icon icon-room"></span>${ host.address }</span>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>

		<div class="container row justify-content-center" id="paginationBox">
			<ul class="pagination">
				<c:if test="${pagination.prev}">
					<li class="page-item"><a class="page-link" href="#"
						onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}', '${ param.type }')">Previous</a></li>
				</c:if>
				<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="idx">
					<li class="page-item <c:out value="${pagination.page == idx ? 'active' : ''}"/> ">
						<a class="page-link" href="#" onClick="fn_pagination('${idx}', '${pagination.range}', '${pagination.rangeSize}', '${ param.type }')">${idx}</a>
					</li>
				</c:forEach>

				<c:if test="${pagination.next}">
					<li class="page-item">
						<a class="page-link" href="#" onClick="fn_next('${pagination.range}','${pagination.range}', '${pagination.rangeSize}', '${ param.type }')">Next</a>
					</li>
				</c:if>
			</ul>
		</div>
        
      </div>
    </div>

    
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	
	<script type="text/javascript">              
      $(function(){
                  
         $('#type_form').on('change', function(event){
            
            this.form.submit();
            
         });
      });
 
   
		//이전 버튼 이벤트
		function fn_prev(page, range, rangeSize , type) {

			var page = ((range - 2) * rangeSize) + 1;
			var range = range - 1;
			var url = "${pageContext.request.contextPath}/space/spacelist";

			url = url + "?page=" + page;
			url = url + "&range=" + range; 
			url = url + "&type=" + type ;

			location.href = url;

		}

		//페이지 번호 클릭
		function fn_pagination(page, range, rangeSize, type) {

			var url = "${pageContext.request.contextPath}/space/spacelist";

			url = url + "?page=" + page;
			url = url + "&range=" + range;
			url = url + "&type=" + type ;

			location.href = url;

		}

		//다음 버튼 이벤트
		function fn_next(page, range, rangeSize, type) {

			var page = parseInt((range * rangeSize)) + 1;

			var range = parseInt(range) + 1;

			var url = "${pageContext.request.contextPath}/space/spacelist";

			url = url + "?page=" + page;
			url = url + "&range=" + range;
			url = url + "&type=" + type ;

			location.href = url;
		}
	</script>
    
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>