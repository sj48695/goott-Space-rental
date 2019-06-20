<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>

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

      <div class="site-blocks-cover overlay" style="background-image: url(/spacerental/resources/space/images/hero_bg_1.jpg);" data-aos="fade" data-stellar-background-ratio="0.5">
        <div class="container">
          <div class="row align-items-center justify-content-center text-center">
            <div class="col-md-10">
              <span class="d-inline-block bg-success text-white px-3 mb-3 property-offer-type rounded">For Rent</span>
              <h1 class="mb-2">871 Crenshaw Blvd</h1>
              <p class="mb-5"><strong class="h2 text-success font-weight-bold">$2,250,500</strong></p>
              <p><a href="#" class="btn btn-white btn-outline-white py-3 px-5 rounded-0 btn-2">See Details</a></p>
            </div>
          </div>
        </div>
      </div>  

      <div class="site-blocks-cover overlay" style="background-image: url(/spacerental/resources/space/images/hero_bg_2.jpg);" data-aos="fade" data-stellar-background-ratio="0.5">
        <div class="container">
          <div class="row align-items-center justify-content-center text-center">
            <div class="col-md-10">
              <span class="d-inline-block bg-danger text-white px-3 mb-3 property-offer-type rounded">For Sale</span>
              <h1 class="mb-2">625 S. Berendo St</h1>
              <p class="mb-5"><strong class="h2 text-success font-weight-bold">$1,000,500</strong></p>
              <p><a href="#" class="btn btn-white btn-outline-white py-3 px-5 rounded-0 btn-2">See Details</a></p>
            </div>
          </div>
        </div>
      </div>  

    </div>

        <div class="row">
          <div class="col-md-3">
            <div class="view-options bg-white py-3 px-3 d-md-flex align-items-center">
              <div class="mr-auto">
                <a href="index.html" class="icon-view view-module active"><span class="icon-view_module"></span></a>
                <a href="view-list.html" class="icon-view view-list"><span class="icon-view_list"></span></a>
                
              </div>
              <div class="ml-auto d-flex align-items-center">
                <div>
                  <a href="#" class="view-list px-3 border-right active">All</a>
                  <a href="#" class="view-list px-3 border-right">Rent</a>
                  <a href="#" class="view-list px-3">Sale</a>
                </div>

              </div>
            </div>
          </div>
        </div>


	<!-- 공간 목록 -->
    <div class="site-section site-section-sm bg-light">
      <div class="container">
      
        <div class="row mb-5">
        <c:forEach var="host" items="#{ hosts }">
          <div class="col-md-6 col-lg-4 mb-4">
            <div class="property-entry h-100">
              <a href="/spacerental/space/detail/${ host.hostNo }" class="property-thumbnail">
                <img src="/spacerental/resources/files/space-files/${ host.file.savedFileName  }" style="width:400px;height:300px" alt="Image" class="img-fluid">
              </a>
              <div class="p-4 property-body">
                <h2 class="property-title"><a href="detail/${ host.hostNo }">${ host.name }</a></h2>
                <span class="property-location d-block mb-3"><span class="property-icon icon-room"></span>${ host.address }</span>
                <strong class="property-price text-primary mb-3 d-block text-success">$2,265,500</strong>
                <ul class="property-specs-wrap mb-3 mb-lg-0">
                  <li>
                    <span class="property-specs">Beds</span>
                    <span class="property-specs-number">2 <sup>+</sup></span>
                    
                  </li>
                  <li>
                    <span class="property-specs">Baths</span>
                    <span class="property-specs-number">2</span>
                    
                  </li>
                  <li>
                    <span class="property-specs">SQ FT</span>
                    <span class="property-specs-number">7,000</span>
                    
                  </li>
                </ul>

              </div>
            </div>
          </div>
          </c:forEach>
	</div>
     
        <div class="row">
          <div class="col-md-12 text-center">
            <div class="site-pagination">
              <a href="#" class="active">1</a>
              <a href="#">2</a>
              <a href="#">3</a>
              <a href="#">4</a>
              <a href="#">5</a>
              <span>...</span>
              <a href="#">10</a>
            </div>
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
              <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Saepe pariatur reprehenderit vero atque, consequatur id ratione, et non dignissimos culpa? Ut veritatis, quos illum totam quis blanditiis, minima minus odio!</p>
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
            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
            Copyright &copy;<script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script><script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart text-danger" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank" >Colorlib</a>
            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
            </p>
          </div>
          
        </div>
      </div>
    </footer>
    
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>