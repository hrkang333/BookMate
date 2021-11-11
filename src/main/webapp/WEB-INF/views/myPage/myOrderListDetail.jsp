<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"/>


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
    
    <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    
</head>

 
 			<%-- <c:if test="${msg== '4'}"> <!-- 만약 주문 취소일 때  -->
			      <script type="text/javascript">
						window.onload=function(){
							init();
						}
						function init(){
							alert("주문을 취소 했습니다.");
						}
					</script>
				</c:if> --%>
				
				<script type="text/javascript">
				
				 function cancelOrder(paymentDetailNo,paymentNo){
					var answer=confirm("주문을 취소하시겠습니까?");
					
					if(answer==true){
						//https://ifuwanna.tistory.com/196 
						var formObj=document.createElement("form");
						var i_order_id = document.createElement("input"); 
						var i_order_id2 = document.createElement("input"); 
					    
					    i_order_id.name = "paymentDetailNo";
					    i_order_id.value = paymentDetailNo;
	
					    
					    i_order_id2.name = "paymentNo";
					    i_order_id2.value = paymentNo;
						
					    console.log( formObj );
					    
					    formObj.appendChild(i_order_id2);
					    formObj.appendChild(i_order_id);
					    document.body.appendChild(formObj); 
					    formObj.method="post";
					    formObj.action="${contextPath}/cancelMyOrder.me";
					    formObj.submit();	
					}
				} 
				</script>
<body>
 <jsp:include page="../common/menubar.jsp" />


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
                            <th scope="col">취소여부</th>
                          </tr>
                        </thead>

                        <tbody style="text-align: center;">
                        
                        
                      
           		  <c:forEach var="item" items="${myOrderListDetail}" varStatus="status">
                         	
                        <tr>                            
                        	<td><p><c:out value="${item.paymentDetailNo}"/></p></td>  
                        	
                        	<td style="text-align: left"><img src="${pageContext.servletContext.contextPath }/resources/images/book_img/${item.bookMainImg}" style="width: 40px; height: auto;"/>
                        	<c:out value="${item.bookTitle}"/></td>
                        	
                  	     	<td><c:out value="${item.quantity}"/>개</td>   
                  	     	<td><c:out value="${item.bookPrice}"/>원</td>               
                  	     	<td id="deliveryStatus"><%-- <c:out value="${item.deliveryStatus}"/> --%>
                  	     	<%-- <input type="hidden" id="paymentDetailNo${status.index }" value="${item.paymentDetailNo}"/> --%>
                  	     	<c:choose>
                  	     		<c:when test="${item.deliveryStatus =='1'}">배송준비중</c:when>
                  	     		<c:when test="${item.deliveryStatus =='2'}">배송중</c:when>
                  	     		<c:when test="${item.deliveryStatus =='3'}">배송완료</c:when>
                  	     		
                  	     		<c:when test="${item.deliveryStatus =='4'}">주문취소</c:when>
                  	     	    <c:when test="${item.deliveryStatus =='5'}">반품완료</c:when>
                  	     	    <c:when test="${item.deliveryStatus =='6'}">교환완료</c:when>
                  	     	    <c:when test="${item.deliveryStatus =='7'}">반품/교환 진행중</c:when>  
                  	     	    
                  	       </c:choose>
                  	     	
                  	     	
                  	     	</td>  
                  	     	
                          	<td> <!-- <input type="button" class="button button-hero" value="주문취소" onclick="orderCancle()"/> -->
                          	 <c:choose>
						   <c:when test="${item.deliveryStatus =='1'}"> <!--배송준비중일때 주문취소 버튼 활성화 -->
						       <input  type="button" onclick="cancelOrder('${item.paymentDetailNo}','${item.paymentNo}')" value="주문취소"  />
						   </c:when>
						   <c:when test="${item.deliveryStatus =='4'}">
						      <input  type="button" onclick="cancelOrder('${item.paymentDetailNo}')" value="주문취소" disabled />
						   </c:when>
						   <c:when test="${item.deliveryStatus =='7'}">
						      <input  type="button" onclick="cancelOrder('${item.paymentDetailNo}','${item.paymentNo}')" value="진행중" disabled />
						      <input  type="button" onclick="cancelOrder('${item.paymentDetailNo}','${item.paymentNo}')" value="진행중" disabled />
						   </c:when>
						   <c:otherwise>
						   		 <input  type="button" onclick="cancelOrder('${item.paymentDetailNo}')" value="반품완료" disabled />
						   </c:otherwise>
					  </c:choose>
                          	
                          	 </td>
                       </tr>
                            
                  </c:forEach> 
                         
                        </tbody>
                      </table>
                      
                      <!--  히든으로 숨겨진 상세주문 번호 -->
                     	 <!-- <form id ="cancleForm" action="cancelMyOrder.me" method="post">
                     	 <input type="hidden" id="cancelForm1" name="paymentDetailNo">
                        </form> -->
                        
                        <!-- 교환/환불  구매확정하면(교환, 환불불가) -->
                        
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