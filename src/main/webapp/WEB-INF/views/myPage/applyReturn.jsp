<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>반품 페이지 </title>
<link rel="icon" href="img/Fevicon.png" type="image/png">

    <link rel="stylesheet" href="resources/vendors/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="resources/vendors/fontawesome/css/all.min.css">
    <link rel="stylesheet" href="resources/vendors/themify-icons/themify-icons.css">
    <link rel="stylesheet" href="resources/vendors/linericon/style.css">
    <link rel="stylesheet" href="resources/vendors/owl-carousel/owl.theme.default.min.css">
    <link rel="stylesheet" href="resources/vendors/owl-carousel/owl.carousel.min.css">
  
     <!-- 제이쿼리피커  -->
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    
    <link rel="stylesheet" href="resources/css/style.css">
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    
</head>
<body>

	<h1>반품 신청 페이지 </h1>
	
	
 	<form action="insertReturn.me" method="post">

	  	<table border="1px;" style="text-align: center;">
	  	
	  		<tr>
	  		<th>상세상품번호</th>
	  		  <th>상품정보</th>
	  		  <th>교환수량</th>
	  		  <th>받으실 분 </th>
	  		  <th>휴대폰 번호 </th>
	  		  <th>주소</th>
	  		  <th>사용한 포인트</th>
	  		  <th>총환불포인트</th>
	  		  <th>적립했었던포인트</th>
	  		  <th>결제한 수단</th>
	  		  <th>배송비</th>
	  		  <th>총 환불 금액</th>
	  		  <th>반품사유</th>
	  		
	  		</tr> 
	  		
	  	
	  		<tr>
	  			<td><c:out value="${returnDetail.paymentDetailNo}"/></td>
	  			<td style="text-align: left"><img src="${pageContext.servletContext.contextPath }/resources/images/book_img/${returnDetail.bookMainImg}" style="width: 40px; height: auto;"/>
                 <c:out value="${returnDetail.bookTitle}"/></td>
	  			<td><c:out value="${returnDetail.quantity}"/>개</td>
	  			<td><c:out value="${payNo.shippingName}"></c:out></td>
	  			<td><c:out value="${payNo.shippingPhone}"></c:out></td>
	  			<td><c:out value="${payNo.shippingAddress}"/> </td>
	  			<td><c:out value="${payNo.usePoint}"/> </td>
	  			<td><c:out value="${payNo.usePoint - payNo.totalGetPoint}"/> point</td>
	  			<td><c:out value="${ payNo.totalGetPoint}"/> point</td>
	  			<td>
	  			
	  			<c:choose>
	  			<c:when test="${payNo.paymentMethod == '0' }">카드</c:when>
	  		
	  			</c:choose>
	  
	  			
	  			</td>
	  			<td><c:out value="${payNo.deliveryCost}"/> 원</td>
	  		
	  			<td>
	  			 
	  				<c:out value="${payNo.totalPayCost }"/> 원
	  			
	  			<td>
	  			
	  			<select id="changeReason" onchange="selectBoxChange(this.value);">
	  			
	  			 <option value="1">단순변심 (+2500원)</option> <!-- 얘는 고객과실  -->
	  			 <option value="2">주문실수 (+2500원) </option> 
	  			 <option value="3">파본</option>
	  			 <option value="4">배송중 파손 </option>
	  			</select>

	  			
	  			</td>
	  		
	  		</tr>
	  		
	  		
	  		  	 
	  	</table>
	  				<input type="hidden" value="${payNo.user_Id}" name="user_Id">
	  				<input type="hidden" value="${returnDetail.paymentDetailNo }" name="paymentDetailNo">
	  				<input type="hidden" value="${payNo.shippingName }" name="returnName">
	  				<input type="hidden" id="selectBox" name="returnReason">
	  				<input type="hidden" value="${payNo.paymentMethod }"name ="returnPaymentMethod"> 
	  				<input type="hidden" value="${payNo.usePoint +payNo.totalGetPoint }"name ="returnPoint">
	  				<input type="hidden" value="${payNo.deliveryCost }"name ="returnDeliveryPrice"> 
	  				<input type="hidden" value="${payNo.totalPayCost }"name ="returnTotalPrice"> 
	  				
	  	<br>
		  <button type="submit" onclick="returnSubmit()"> 반품 신청 </button>
		  <input type="hidden" value="${returnDetail.paymentNo }" name="paymentNo"> 
		  
	  </form>
	  
	    <script>
	  		
	    	function returnSubmit(){
	  		
	  			alert("반품이 완료 되었습니다.");
	  		}
	    	
	    	
	    	//반품사유 함수 
	    	var selectBoxChange = function(value){
	    		console.log("값 변경 테스트 :" + value);
	    	var optionVal = $("#selectBox").val(value);
	    	
	    	}
	    	
	  </script>
	  
	
	  
</body>
</html>