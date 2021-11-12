<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
	<c:set var="contextPath"  value="${pageContext.request.contextPath}"/>
 <!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>교환신청 </title>

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

    
<body>
 <jsp:include page="../common/menubar.jsp" />


 <a href=applyExchangeBook.me> </a>
 
 <script type="text/javascript">
 //히든 인풋으로 들고오는 애 
	function OrderListDetailGo(num){
		
		var pay = $('#paymentNo'+num).val();
		 $('#detailForm1').val(pay);
		 $("#detailForm").submit();
	}
</script>

	<c:forEach var="item" items="${myOrderList}" varStatus="status">
                         
                      <tr class="OrderListTr">       
                       	<td>
                    	<input type="hidden"  id="paymentNo${status.index}" value="${item.paymentNo }"/>
                        	<p><c:out value="${item.paymentNo}"/></p></td>     
                        	<td><fmt:formatDate value="${item.shipDate}" pattern ="yyyy-MM-dd"/></td> 
                  	   		<td class="orderListDetail"><p style="cursor:pointer" onclick="OrderListDetailGo('${status.index}')">주문내역 상세보기</p></td> 
                  	     	<td><c:out value="${item.totalCost}"/>원</td>                <!--  '' 스트링으로 가져온다 -->
                  	     	<td><c:out value="${item.shippingName}"/>님</td>
                          	<td> <input type="button" class="button button-hero" value="주문취소" onclick="orderCancle()"/> </td>
                      </tr>
                            
     </c:forEach>
                 
</body>
</html>