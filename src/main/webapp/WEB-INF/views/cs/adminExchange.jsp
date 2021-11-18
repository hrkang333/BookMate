<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
    
<!DOCTYPE html>
<html>
<head>
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

<meta charset="UTF-8">
<title>관리자 교환페이지 </title>
</head>
<body>

	<!-- -->
	<h2>교환 리스트 목록</h2>


<form action="updateExchangeList.cs" method="post">
	<table class="table" style="text-align: center; width: 1200px;">


		<tr>
			<th>교환 상세주문 번호</th>
			<th>교환 주문 번호</th>
			<th>성함</th>
			<th>책 제목 </th>
			<th>주문 수량</th>
			<th>주문상태</th>
			<th>상태</th>
		</tr>
		
		
	
	 <c:forEach  items="${exchangeList}" var="exchangeItem" varStatus="status">		
			<tr>
			
		<c:forEach items="${orderDetailList}" var="paymentDetail" begin="0" end="1">	
			<c:if test="${exchangeItem.paymentDetailNo eq paymentDetail.paymentDetailNo}">
				<c:set var="pd" value="${paymentDetail}"/>
			</c:if>
			
				<td><c:out value="${exchangeItem.exchangeNo}"/></td>
				<td><c:out value="${exchangeItem.paymentDetailNo}"/></td>
				<td><c:out value="${exchangeItem.exchangeName}"/></td>
	 			 <td><c:out value="${pd.bookTitle }"/></td>
				<td><c:out value="${pd.quantity }"/>개</td> 
			 	
				
				<td>
			
			<c:choose> 
			<c:when test="${exchangeItem.exchangeStatus == '1'}"> 교환대기중 </c:when>
			<c:when test="${exchangeItem.exchangeStatus == '2'}"> 교환완료 </c:when>
			</c:choose>
			
				</td>
				
				<input type="hidden" value="${exchangeItem.exchangeStatus}" name="exchangeStatus"/>
				<input type="hidden" value="${exchangeItem.paymentDetailNo }" name="paymentDetailNo"/>
				<td><button type="submit">승인 </button></td>
			
		</c:forEach>
			</tr>
		
	</c:forEach>
	</table>
</form>

</body>
</html>