<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
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
<body style="width:1200px">

	<table class="table" style="text-align: center;" border="1px;">		
		<tr>
			<th scope="col">상세주문번호</th>
			<!-- <th scope="col">주문한 날짜</th> -->
			<th scope="col">도서 제목</th>
			<th scope="col">주문 수량</th>
			<th scope="col">도서 가격</th>
			<th scope="col">주문상태</th>
			
		</tr>	
		
			<c:if test="${empty cList}">
	           <td colspan="5"><h2>취소하신 상품이 없습니다. </h2></td>
	       	</c:if>
                          
		<c:forEach var="item" items="${cList }" varStatus="status" >
		  <tr>
			<td><c:out value="${item.paymentDetailNo }"/></td>
			<td><c:out value="${item.bookTitle }"/></td>
			<td><c:out value="${item.quantity}" />개</td>
			<td><c:out value="${item.bookPrice}"/> 원</td>
			 
			 <td>
			  <c:choose>
			 	<c:when test="${item.deliveryStatus == '4' }">구매취소</c:when>
			  </c:choose>
			 <td>	
		  </tr>
		</c:forEach>
	</table>
	
	

</body>
</html>