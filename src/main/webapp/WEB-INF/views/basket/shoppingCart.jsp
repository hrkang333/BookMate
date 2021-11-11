<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>fff</title>
    <link rel="stylesheet" href="resources/vendors/bootstrap/bootstrap.min.css">
   
    <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
#basketTable td{
    vertical-align: middle;
    border-bottom: 1px solid lightgray;
}

</style>
<script type="text/javascript">

var savePoint = new Array() 


$(document).ready(function() {
	priceSum();
})



function priceSum() {
	var price = new Array() 
	var quantity = new Array()
	var priceSum = 0;
	var payPrice = 0;
	var deleveryPrice = 0;
	var savePoint = 0;
	$('.price').each(function(i,item) {
		if($("input:checkbox[id=checkBox"+i+"]").is(":checked")==true){
			
		price.push(item.value)
		}
	})
	$('.quantity').each(function(i,item) {
		if($("input:checkbox[id=checkBox"+i+"]").is(":checked")==true){
		
		quantity.push(item.value)
		}
	})
	for(var i = 0 ; i <price.length;i++ ){
	
		priceSum = priceSum + (price[i]*quantity[i])
	}
	
	savePoint = priceSum*0.05
	if(priceSum<10000){
		deleveryPrice = 2500;
		$('#deleveryPriceSpan').html(deleveryPrice.toLocaleString('ko-KR')+"원")
		
	}else{
		deleveryPrice = 0;
		$('#deleveryPriceSpan').html(deleveryPrice.toLocaleString('ko-KR')+"원")
	}
	payPrice = priceSum + deleveryPrice;
	$('#sumPriceSpan').html(priceSum.toLocaleString('ko-KR')+"원")
	$('#payPriceSpan').html(payPrice.toLocaleString('ko-KR')+"원")
	$('#savePointSpan').html(parseInt(savePoint).toLocaleString('ko-KR')+"pt")
	
	
	
}

function changeCheckbox() {
	priceSum()
}


function changeQuantity(status,index) {	
	var checkQuantity = parseInt($('#quantity'+index).val())
	var itemsPrice = 0;
	if(status==1){
		checkQuantity+=1
		$('#quantity'+index).val(checkQuantity)
	}else{
		if(checkQuantity>1){
			checkQuantity-=1
			$('#quantity'+index).val(checkQuantity)
		}else{
			return false;
		}
	}
	itemsPrice = parseInt($('#price'+index).val())*checkQuantity
	$('#itemsPriceSpan'+index).html(itemsPrice.toLocaleString('ko-KR'))
	priceSum()
}

function movePayment() {
	
	$('.price').each(function(i,item) {
		if($("input:checkbox[id=checkBox"+i+"]").is(":checked")==false){
			
			$('#basketInfoTr'+i).remove();
		}
	})
	
	$('#movePaymentForm').submit(); 

	
}
</script>
</head>

<body style="width: 1200px; margin: 0 auto;">
<jsp:include page="../common/menubar.jsp" />
	<hr>
    <main>
        

        <div class="container">
            <div class="cart_inner">
                <form action="movePayment.sc" method="post" id="movePaymentForm">
                <table class="table" id="basketTable">
                    <thead >
                        <tr>
                            <th></th>
                            <th style="width: 35%;">상품정보</th>
                            <th style="width: 15%;">판매가(권당)</th>
                            <th style="width: 10%;">수량</th>
                            <th style="width: 10%;">합계</th>
                            <th style="width: 15%;">예상출고일정<br><span style="font-size: 5px">(오후4시 이전 당일출고)</span></th>
                            <th style="width: 10%;">선택</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${requestScope.cartItemList}" var="list" varStatus="status">
                        <tr id="basketInfoTr${status.index}">
                            <td><input type="checkbox" value="" id="checkBox${status.index}" checked="checked" onchange="changeCheckbox()"></td>
                            <td>
                                <div class="media">
                                    <div class="d-flex">
                                        <img src="${pageContext.servletContext.contextPath}/resources/images/book_img/${list.bookMainImg}" style="height: 150px">
                                    </div>
                                    <div class="media-body">
                                        <p>${list.bookTitle}</p>
                                    </div>
                                </div>
                            </td>
                            <td>
                            	<input type="hidden" id="price${status.index}" class="price" value="${list.bookPrice*0.9}">
                                <span style="text-decoration: line-through"><fmt:formatNumber value="${list.bookPrice}"/>원 </span><br>
                                <span style="color: red;"><fmt:formatNumber value="${list.bookPrice*0.9}"/></span>원(↓ 10%)<br>
                                <span><fmt:formatNumber value="${list.bookPrice*0.05}"/>pt 적립</span>
                            </td>
                            <td>
                                <div style="display: flex; align-items: center;" >
                                	<input type="hidden" name="basketList[${status.index}].basketNo" value="${requestScope.basketList[status.index].basketNo}">
                                	<input type="hidden" value="${sessionScope.loginUser.userId}" name="basketList[${status.index}].user_Id">
                                	<input type="hidden" name="basketList[${status.index}].bookISBN" value="${requestScope.basketList[status.index].bookISBN}">
                                    <input type="text" name="basketList[${status.index}].quantity"id="quantity${status.index}" class="quantity" maxlength="2" value="${requestScope.basketList[status.index].quantity}" style="height: 40px; width: 30px;">&nbsp;
                                    <div>
                                        <button type="button" style="height: 20px; width: 30px; font-size: 10px;" onclick="changeQuantity(1,'${status.index}')">▲</button><br>
                                    <button  type="button" style="height: 20px; width: 30px; font-size: 10px;" onclick="changeQuantity(0,'${status.index}')">▼</button>
                                        </div>
                                </div>
                            </td>
                            <td>
                                <span id="itemsPriceSpan${status.index}"><fmt:formatNumber value="${list.bookPrice*0.9*requestScope.basketList[status.index].quantity}"/></span>원
                            </td>
                            <td>${requestScope.shipDate}</td>
                            <td></td>
                        </tr>
                       </c:forEach>
                       </tbody>
                </table>
                </form>
                <div  style="width: 80%; margin: auto;"> 
                    <table class="table">
                        <thead class="thead-light">
                            <tr>
                                <th style="width: 25%;">총 상품금액</th>
                                <th></th>
                                <th style="width: 20%;">배송비</th>
                                <th></th>
                                <th style="width: 25%;">결제 예정금액</th>
                                <th style="width: 20%;">총 적립 포인트</th>
        
                            </tr>
        
        
                        </thead>
                        <tr>
                            <td><span id="sumPriceSpan" style="font-size: 20px"></span></td>
                            <td>+</td>
                            <td><span id="deleveryPriceSpan" style="font-size: 20px"></span></td>
                            <td>=</td>
                            <td><span id="payPriceSpan" style="color:red; font-size: 20px; font-weight: bold;"></span></td>
                            <td><span id="savePointSpan" style="font-size: 20px"></span></td>
                        </tr>
        
                    </table>
        
        
                </div>
            </div>
        </div>
        <button type="button" onclick="movePayment()">결제하기</button>

    </main>
 
</body>

</html>