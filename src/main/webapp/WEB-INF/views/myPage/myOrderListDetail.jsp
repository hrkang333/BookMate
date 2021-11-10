<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

    <link rel="icon" href="img/Fevicon.png" type="image/png">
    <link rel="stylesheet" href="resources/vendors/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="resources/vendors/fontawesome/css/all.min.css">
    <link rel="stylesheet" href="resources/vendors/themify-icons/themify-icons.css">
    <link rel="stylesheet" href="resources/vendors/linericon/style.css">
    <link rel="stylesheet" href="resources/vendors/owl-carousel/owl.theme.default.min.css">
    <link rel="stylesheet" href="resources/vendors/owl-carousel/owl.carousel.min.css">
  
     <!-- 제이쿼리피커  -->
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/resources/demos/style.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    
 
    <link rel="stylesheet" href="resources/css/style.css">
    
</head>
<body>

<!-- 왼쪽 사이드바  -->
    <section class="section-margin--small mb-5">
        <div class="container">
          <div class="row">
            <div class="col-xl-3 col-lg-4 col-md-5">
              <div class="sidebar-categories">
                <div class="head">마이페이지</div>
                <ul class="main-categories">
                  <li class="common-filter">
                    <form action="#">
                      <ul>
                        <li><a href="myPage.me">내 정보 수정하기 </a> </li>
                        <li>내 비밀번호 변경하기 </li>
                     </ul>
                    </form>
                  </li>
                </ul>
              </div>
              <div class="sidebar-filter">
                <div class="top-filter-head">일반상품 주문관리</div>
                <div class="common-filter">
                  <div class="head">일반상품</div>
                  <form action="#">
                    <ul>
                        <li class="filter-list"><a href="selectMyOrderList.me">나의 주문 조회</a> </li>
                        <li class="filter-list">  취소 리스트 조회 </li>
                        <li class="filter-list">  교환/반품 리스트 조회 </li>
                    </ul>
                  </form>
                </div>
             </div>


             <div class="sidebar-filter">
                <div class="top-filter-head">중고상품 주문관리</div>
                <div class="common-filter">
                  <div class="head">중고상품</div>
                  <form action="#">
                    <ul>
                        <li class="filter-list">  주문 리스트 조회 </li>
                   
                    </ul>
                  </form>
                </div>
             </div>

             <div class="sidebar-filter">
                <div class="top-filter-head">관심작가 및 찜목록</div>
                <div class="common-filter">
                  <form action="myPageOrderList.me" method="post">
                    <ul>
                        <br>
                        <li class="filter-list">  관심작가 리스트 </li>
                        <li class="filter-list">  최근 조회한 상품 </li>
                        <li class="filter-list"> 나의 찜목록  </li>
                        <li class="filter-list"> 나의 리뷰 조회  </li>
                        <li class="filter-list"> <a href="myPoint.me">나의 포인트 조회</a></li>
                    </ul>
                  </form>
                </div>
             </div>


            </div>

            <!-- 기간조회 페이지  -->
            <div class="col-xl-9 col-lg-8 col-md-7">
              <div class="filter-bar d-flex flex-wrap align-items-center">
                <div class="sorting">
                  <select>
                    <option value="1">상품명 </option>
                    <option value="2">주문상품명</option>
                  </select>
                </div>
                <div class="sorting mr-auto">
                  <input type="date" name="publicheDate" data-name="날짜 조 ">
                 ~
                  <input type="date" name="publicheDate" data-name="도서 출간일">
                </div>
                <div>
                  <div class="input-group filter-bar-search">
                    <input type="text" placeholder="Search">
                    <div class="input-group-append">
                      <button type="button"><i class="ti-search"></i></button>
                    </div>
                  </div>
                </div>
              </div>
              

              <!-- 주문리스트 테이블  -->
              <div class="filter-bar d-flex flex-wrap align-items-center">
                <div class="order_details_table">
                    <h2>주문 목록 리스트 </h2>
                       배송전엔 사용자가 취소 가능함
                    <div class="table-responsive">
                      <table class="table" style="text-align: center;">
                        <thead style="text-align: center;">
                          <tr>
                            <th scope="col">상세주문번호</th>
                            <th scope="col">도서 제목 </th>
                            <th scope="col">주문 수량 </th>
                            <th scope="col">도서 가격 </th>
                            <th scope="col">주문상태</th>
                          </tr>
                        </thead>

                        <tbody style="text-align: center;">
                      
           		  <c:forEach var="item" items="${myOrderListDetail }">
                         	
                        <tr>                            
                        	<td><p><c:out value="${item.paymentDetailNo}"/></p></td>  
                        	
                        	<td><c:out value="${item.bookImg}"/><c:out value="${item.bookTitle}"/></td>               
                  	     	<td><c:out value="${item.quantity}"/>개</td>   
                  	     	<td><c:out value="${item.bookPrice}"/></td>               
                  	     	<td><c:out value="${item.deliveryStatus}"/></td>   
                        </tr>
                            
                  </c:forEach> 
                         
                   
                        </tbody>
                      </table>
                    </div>
                </div>
             </div> 
        
          
   		</div>
   		
            </div>
          </div>
       
      </section>
      <jsp:include page="../common/footer.jsp" />

</body>
</html>