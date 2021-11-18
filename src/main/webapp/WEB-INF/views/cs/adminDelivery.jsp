<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 배송대기중 업데이트 리스트 </title>
</head>
<body> 

	<table class="table" style="text-align: center; width: 1200px;">
	
		<tr>
			<th>상세주문 번호</th>
			<th>성함</th>
			<th>책 제목 </th>
			<th>주문 수량</th>
			<th>주문상태</th>
			<th>상태</th>
		</tr>
		
		<c:forEach items="${myOrderListDetail}" var="item">
		<tr>
			<td><c:out value="${item.paymentDetailNo }"/></td>
			<td><c:out value="${item.shippingName }"/></td>
			<td><c:out value="${item.bookTitle }"/></td>
			<td><c:out value="${item.quantity }"/>개</td>
			<td><c:out value="${item.deliveryStatus }"/></td>
			
		</tr>
	</c:forEach>
	</table>

</body>
</html>