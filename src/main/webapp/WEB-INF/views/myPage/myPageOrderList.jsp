<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%--  <c:set var="contextPath"  value="${pageContext.request.contextPath}"/> --%>
 <!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지 수정</title>

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

    
    <style>
      body{
    width:1200px
    }
        
        .order_details_table{
           text-align: center;
            padding-left: 10%;
           padding-right: 12%; 
        }
        
    </style>
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
                  <form action="myPageOrderList.me" method="post"> </form>
                    <ul>
                        <br>
                        <li class="filter-list">  관심작가 리스트 </li>
                        <li class="filter-list">  최근 조회한 상품 </li>
                        <li class="filter-list"> 나의 찜목록  </li>
                        <li class="filter-list"> 나의 리뷰 조회  </li>
                        <li class="filter-list"> <a href="myPoint.me">나의 포인트 조회</a></li>
                    </ul>
                 
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
                            <th scope="col">주문번호</th>
                            <th scope="col">주문일 </th>
                            <th scope="col">주문내역 상세보기</th>
                            <th scope="col">총 결제금액</th>
                            <th scope="col">주문취소여부</th>
                          </tr>
                        </thead>
              
				    	    
                        <tbody style="text-align: center;">
                      
                         
                         <c:forEach var="item" items="${myOrderList}">
                        <tr class="OrderListTr">       
                        	<td><input type="hidden" name="paymentNo" value="${item.paymentNo}"/>  
                        	<p><c:out value="${item.paymentNo}"/></p></td>     
                        	<td><fmt:formatDate value="${item.shipDate}" pattern ="yyyy-MM-dd"/></td> 
                  	   		<td class="orderListDetail"><p style="cursor:pointer">주문내역 상세보기</p></td> 
                  	     	<td><c:out value="${item.totalCost}"/>원</td>               
                          	<td> <input type="button" class="button button-hero" value="주문취소" onclick="orderCancle()"/> </td>
                        </tr>
                            
                         </c:forEach>
                         
                        </tbody>
                      </table>
                    </div>
                </div>
             </div> 
        <script type="text/javascript">
        
        
        
        </script>
            <!-- 페이징 바  -->
            <nav class="blog-pagination justify-content-center d-flex">
               <ul class="pagination">

				<c:choose>
					<c:when test="${ pi.currentPage ne 1 }">
						<li class="page-item"><a class="page-link"
							href="selectMyOrderList.me?currentPage=${ pi.currentPage-1 }">Previous</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item disabled"><a class="page-link"
							href="">Previous</a></li>
					</c:otherwise>
				</c:choose>

				<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }"
					var="p">
					<c:choose>
						<c:when test="${ pi.currentPage ne p }">
							<li class="page-item"><a class="page-link"
								href="selectMyOrderList.me?currentPage=${ p }">${ p }</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item disabled"><a class="page-link"
								href="">${ p }</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>


				<c:choose>
					<c:when test="${ pi.currentPage ne pi.maxPage }">
						<li class="page-item"><a class="page-link"
							href="selectMyOrderList.me?currentPage=${ pi.currentPage+1 }">Next</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item disabled"><a class="page-link"
							href="selectMyOrderList.me?currentPage=${ pi.currentPage+1 }">Next</a></li>
					</c:otherwise>
				</c:choose>
						<!-- <li class="page-item">
                        <a href="#" class="page-link" aria-label="Previous">
                            <span aria-hidden="true">
                                <span class="lnr lnr-chevron-left"></span>
                            </span>
                        </a>
                    </li>
                    <li class="page-item">
                        <a href="#" class="page-link">01</a>
                    </li>
                    <li class="page-item active">
                        <a href="#" class="page-link">02</a>
                    </li>
                    <li class="page-item">
                        <a href="#" class="page-link">03</a>
                    </li>
                    <li class="page-item">
                        <a href="#" class="page-link">04</a>
                    </li>
                    <li class="page-item">
                        <a href="#" class="page-link">09</a>
                    </li>
                    <li class="page-item">
                        <a href="#" class="page-link" aria-label="Next">
                            <span aria-hidden="true">
                                <span class="lnr lnr-chevron-right"></span>
                            </span>
                        </a>
                    </li>  -->
                    
                    
                </ul>
            </nav>
   		</div>
   		
            </div>
          </div>
       
      </section>


		<script type="text/javascript">
		
		// 주문리스트에서 상세보기 클릭시 해당 주문번호로 들어감 
		 $(function(){
             $("tr.OrderListTr td.orderListDetail").click(function(){
                 console.log($(this).next().val());
                 location.href="selectMyOrderListDetail.me?pno=" + $(this).next().val();
             });
         })
	
 		//주문 취소 버튼 
		function orderCancle() {
			if (confirm("정말 취소하시겠습니까? ") == true) { //확인
				document.form.submit();
			} else { //취소
				return;
			}
		}
		</script>
    	<!--    
	
	 <script>
        $.datepicker.setDefaults({
            dateFormat: 'yy-mm-dd',
            prevText: '이전 달',
            nextText: '다음 달',
            monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
            monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
            dayNames: ['일', '월', '화', '수', '목', '금', '토'],
            dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
            dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
            showMonthAfterYear: true,
            yearSuffix: '년'
        });
    
        $(function() {
            $("#datepicker1").datepicker();
        });

        $(function() {
            $("#datepicker2").datepicker();
        });
    
    </script> -->
    
    
	   <jsp:include page="../common/footer.jsp" />
		
</body>
</html>