<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<style>
#paymentInnerWrap_1 {
	width: 750px;
	height: 2600px;
}

#paymentInnerWrap_2 {
	width: 450px;
	height: 1200px;
}

.paymentInnerWrap_1 {
	width: 650px;
	margin: auto;
}

#userAccountDiv, #paymentInfo, #paymentInfoWrap, #usePoint {
	padding-left: 40px;
	padding-right: 40px;
}

#deliveryRequest {
	width: 60%;
	display: none;
	resize: none;
}

#paymentInfo {
	border: 1px solid gray;
}

#paymentInfo .innerInfo {
	display: flex;
}

.rightValue {
	margin-left: auto;
}

.paymentButton {
	width: 200px;
	height: 50px;
	font-size: 20px;
	font-family: "맑은 고딕";
	margin-top: 10px;
}

#usePointWrap .tdd {
	width: 45%;
	text-align: center;
}

.paymentMethod {
	border: 1px solid gray;
	display: flex;
	padding-left: 10px;
	padding-right: 10px;
}

.nomalMethod {
	width: 33.3%;
	border: gray 1px solid;
	text-align: center;
	height: 40px;
	align-items: center;
}

.nomalMethod p {
	margin: 10px;
}

.nomalMethodDiv, #paymentMethodDiv_2 {
	display: none;
}

#paymentInnerWrap_2 {
	position: fixed;
	left: 50%;
	transform: translate(150px, 0)
}
</style>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	var mainPayment = "${requestScope.PMDetail.paymentMethodDetailNo}"
	var methodStatus = 0;
	function daumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var addr = ''; // 주소 변수
				var extraAddr = ''; // 참고항목 변수

				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('postcode').value = data.zonecode;
				document.getElementById("address").value = addr;
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("detailAddress").focus();
			}
		}).open();
	}

	function phoneNumber(type, num) {
		var input = $("#phoneNum_" + num).val();

		//focus out인 경우 
		//input type을 text로 바꾸고 '-'추가
		if (type == 'blur') {
			$("#phoneNum_" + num).prop('type', 'text');
			var phone = checkPhoneNumber(input);
		}

		//focus인 경우
		//input type을 number로 바꾸고 '-' 제거
		if (type == 'focus') {
			var phone = input.replace(/-/gi, '');
			$("#phoneNum_" + num).prop('type', 'number');
		}

		$("#phoneNum_" + num).val(phone);
	}

	//전화번호 문자(-)
	function checkPhoneNumber(temp) {
		var number = temp.replace(/[^0-9]/g, "");
		var phone = "";

		if (number.length < 9) {
			return number;
		} else if (number.length < 10) {
			phone += number.substr(0, 2);
			phone += "-";
			phone += number.substr(2, 3);
			phone += "-";
			phone += number.substr(5);
		} else if (number.length < 11) {
			phone += number.substr(0, 3);
			phone += "-";
			phone += number.substr(3, 3);
			phone += "-";
			phone += number.substr(6);
		} else {
			phone += number.substr(0, 3);
			phone += "-";
			phone += number.substr(3, 4);
			phone += "-";
			phone += number.substr(7);
		}

		return phone;
	}

	function name111() {

		if ($('#deliveryRequest').css("display") == 'none') {

			$('#deliveryRequest').css("display", "inline")
		} else {
			$('#deliveryRequest').css("display", "none")
		}
	}

	function checkPaymentMethodDiv(num) {
		if (num == 1) {
			var arrNum = [ '1', '2' ];

		} else {
			var arrNum = [ '2', '1' ];

			$('#paymentMethodForm')[0].reset();
		}
		if ($('#paymentMethodDiv_' + arrNum[0]).css("display") == 'block') {
			$('#paymentMethodP_' + arrNum[0]).html("열기 ▽");
			$('#paymentMethodDiv_' + arrNum[0]).css("display", "none");
		} else {
			$('#paymentMethodP_' + arrNum[0]).html("닫기 △");
			$('#paymentMethodDiv_' + arrNum[0]).css("display", "block");
			$('#paymentMethodP_' + arrNum[1]).html("열기 ▽");
			$('#paymentMethodDiv_' + arrNum[1]).css("display", "none");
		}

	}
	function checkNomalMethodDiv(num) {
		$('#nomalMethodDiv_' + num).css('display', 'block');
		$('.nomalMethodDiv').not('#nomalMethodDiv_' + num).css('display',
				'none');

		$('#nomalMethod_' + num).css('border-bottom', 'none');
		$('.nomalMethod').not('#nomalMethod_' + num).css('border-bottom',
				'solid 1px gray');
		methodStatus = parseInt(num);
		console.log(methodStatus)
	}
	function insertMethodCheck(num) {
		var userReg;
		if(num==1){
			if(!$('#cardCVC').val()||!$('#cardNo').val()||!$('input[name=cardCompany]:checked').val()){
				alert("모든 결제 정보를 입력하셔야 합니다.")
				return false;
			}
		}
		else if(num==2){
			if(!$('#userReg_1_1').val()||!$('#userReg_1_2').val()||!$('#bankAccount').val()||!$('#bankPwd').val()||!$('input[name=bankName]:checked').val()){
				alert("모든 결제 정보를 입력하셔야 합니다.")
				return false;
			}else{
				userReg=$('#userReg_1_1').val()+"-"+$('#userReg_1_2').val()
			}
		}else{
			if(!$('#userReg_2_1').val()||!$('#userReg_2_2').val()||!$('#phoneNum_2').val()){
				alert("모든 결제 정보를 입력하셔야 합니다.")
				return false;
			}else{
				userReg=$('#userReg_2_1').val()+"-"+$('#userReg_2_2').val()
			}
		}
		if(confirm("입력하신 결제정보를 저장하시겠습니까?")){
			$.ajax({
				url : "insertPaymentMethod.sc",
				method : "post",
				data : {
					methodStatus : methodStatus,
					cardCompany : $('input[name=cardCompany]:checked').val(),
					cardNo : $('#cardNo').val(),
					cardCVC : $('#cardCVC').val(),
					phoneNo : $('#phoneNum_2').val(),
					userReg : userReg,
					bankName : $('input[name=bankName]:checked').val(),
					bankPwd : $('#bankPwd').val(),
					bankAccount : $('#bankAccount').val(),
					user_Id : $('#user_Id').val(),
					methodPwd : $('#methodPwd').val()
				},
				success : function(str) {
					alert(str)
				}
				
			})
			
		}
		
		
	}
	function selectMethod(num) {
		$.ajax({
		
			url : "selectPaymentMethod",
			type : "post",
			data : {
				selectMethodIndex : num,
				mainPayment : mainPayment,
				user_Id : $('#user_Id').val()
			},
			success : function(map) {
				console.log(map['pop'].bankAccount)
				console.log(map['11'])
			}
			
		})
		
	}
	  function aaaaaa() {
	        var eee = $('#userId').val();
	        console.log(eee)
	        $('.ppp').click();
	    }
	  
	  function paymentOrder() {
		
	}
	  function checkUsePoint() {
		  var itemsPrise = parseInt('${requestScope.order.totalCost}');
		  var keepPoint = parseInt($('#hiddenPoint').val());
		  var usePoint = $('#usePointInput').val();
		  if(usePoint > keepPoint){
			  $('#usePointInput').val(keepPoint);
			  usePoint = keepPoint;
		  }
		  $('#pointInfoSpan').text(keepPoint-usePoint)
		  
		  $('#userPointP').html(usePoint)
		  if($('#userPointP').html()=='' ){
			  $('#userPointP').html(0) 
		  }
		  $('#totalPrice').html((itemsPrise-usePoint).toLocaleString('ko-KR')+" 원")
		  
		  $('#usePointInput_2').val(usePoint)
		  $('#totalPayCost').val(itemsPrise-usePoint)
	}
	  
	  function allUsePoint() {
		  $('#usePointInput').val($('#hiddenPoint').val())
		  checkUsePoint()
	}
	  
	  function moveInsertPayment() {
		  $('#insertPaymentForm').submit()
	}
</script>
</head>
<body style="width: 1200px; margin: auto;">

	<main>
		<br>
		<hr>
		<br>
		<br>
		<div id="paymentWrap" style="display: flex;">
			<div id="paymentInnerWrap_1">
				<div id="userAccountWrap" class="paymentInnerWrap_1">
					배송지 정보 <br>
					<br>
					<hr>
					<br>
					<form action="insertPayment" method="post" id="insertPaymentForm">
					<input type="hidden" id="user_Id" name="user_Id" value="${sessionScope.loginUser.userId}">
					<input type="hidden" id="usePointInput_2" name="usePoint" value="">
					<input type="hidden" id="" name="totalGetPoint" value="${requestScope.order.totalGetPoint}">
					<input type="hidden" id="totalPayCost" name="totalPayCost" value="">
				<!-- 	<input type="hidden" id="" name="deliveryCost" value=""> -->
					<input type="hidden" id="" name="totalCost" value="${requestScope.order.totalCost}">
					<c:forEach items="${requestScope.orderList}" var="list"
						varStatus="status">
						<input type="hidden" name="paymentDetailList[${status.index}].bookISBN" value="${list.bookISBN}">
						<input type="hidden" name="paymentDetailList[${status.index}].bookMainImg" value="${list.bookMainImg}">
						<input type="hidden" name="paymentDetailList[${status.index}].bookTitle" value="${list.bookTitle}">
						<input type="hidden" name="paymentDetailList[${status.index}].quantity" value="${list.quantity}">
						<input type="hidden" name="paymentDetailList[${status.index}].bookPrice" value="${list.bookPrice}">
						<input type="hidden" name="paymentDetailList[${status.index}].salePrice" value="${list.salePrice}">
						<input type="hidden" name="paymentDetailList[${status.index}].getPoint" value="${list.getPoint}">
						
						
						</c:forEach>
				
	
					
					
					<div id="userAccountDiv">
						<input type="text" placeholder="이름"
							value="${requestScope.order.shippingName}" name="shippingName"> <input
							type="button" onclick="daumPostcode()" value="새 주소 입력"> <input
							type="button" onclick="" value="주소록 불러오기"> <br>
						<br> <input type="text" id="postcode" placeholder="우편번호"
							value="${requestScope.order.shippingPostCode}" name="shippingPostCode"><br>
						<input type="text" id="address" placeholder="주소"
							value="${requestScope.order.shippingAddress}" name="shippingAddress"><br> <input
							type="text" id="detailAddress" placeholder="상세주소"
							value="${requestScope.order.shippingAddressDetail}" name="shippingAddressDetail"><br>
						<br> <input type="text" placeholder="전화번호(- 를 제외 숫자만)"
							onfocus="phoneNumber('focus','1')"
							onblur="phoneNumber('blur','1')" id="phoneNum_1"
							value="${requestScope.order.shippingPhone}" name="shippingPhone"><br>
						<br>
						<div style="text-align: right;">
							<span style="cursor: pointer;" onclick="name111()">배송요청사항</span><br>
							<br>
							<textarea name="deliveryRequest" id="deliveryRequest" cols="30"
								rows="5" placeholder="100자 이하로 입력해주세요" maxlength="100"></textarea>
						</div>

					</div>
					</form>
					<hr>
				</div>
				<br>
				<br>
				<br>
				<div id="buyingBookWrap" class="paymentInnerWrap_1">
					주문상품<br>
					<br>
					<hr>
					<br>
					<c:forEach items="${requestScope.orderList}" var="list"
						varStatus="status">
						<div id="buyingBook" style="display: flex;">
							<div class="media" style="width: 50%; display: flex;">
								<div class="d-flex">
									<img
										src="${pageContext.servletContext.contextPath }/resources/images/book_img/${list.bookMainImg}"
										style="height: 150px">
								</div>
								<div class="media-body">
									<p>${list.bookTitle}</p>
								</div>
							</div>

							<div
								style="display: flex; align-items: center; width: 50%; text-align: center;">

								<div style="width: 50%;">
									<span style="text-decoration: line-through"><fmt:formatNumber
											value="${list.bookPrice}" />원 </span><br> <span><fmt:formatNumber
											value="${list.salePrice}" /></span>원(↓ 10%)<br> <span><fmt:formatNumber
											value="${list.getPoint}" />pt 적립</span><br>
									<br> <span>${list.quantity}권</span>
								</div>
								<div style="width: 50%;">
									<fmt:formatNumber value="${list.salePrice*list.quantity}" />
									원
								</div>
							</div>
						</div>
						<br>
						<br>
					</c:forEach>

					<hr>
				</div>
				<br>
				<br>
				<br>
				<div id="usePointWrap" class="paymentInnerWrap_1">
					포인트사용<br>
					<br>
					<hr>
					<br>
					<div id="usePoint">
					<input type="hidden" id="hiddenPoint" value="${sessionScope.loginUser.point}">
						<table>
							<tr>
								
								<td class="tdd">보유포인트 : <span id="pointInfoSpan">${sessionScope.loginUser.point}</span>pt</td>
								<td class="tdd">사용 : <input type="number"
									style="width: 100px;" id="usePointInput" onkeyup="checkUsePoint()" min="0"> pt
								</td>
								<td><input type="button" value="모두사용" onclick="allUsePoint()"></td>
							</tr>
						</table>
					</div>
					<br>
					<hr>
				</div>
				<br>
				<br>
				<br>

				<div id="paymentMethodWrap" class="paymentInnerWrap_1">
					결제정보<br>
					<br>
					<hr>
					<br>
					<div class="paymentMethod">
						<p>저장된 결제수단</p>
						<p class="rightValue" id="paymentMethodP_1"
							onclick="checkPaymentMethodDiv(1)">닫기 △</p>
					</div>
					<div id="paymentMethodDiv_1">
						<img src="${pageContext.servletContext.contextPath }/resources/img/wallet1.png" style="height: 300px"><br>
						<c:choose>
						<c:when test="${requestScope.PMDetail.methodStatus==1}">
						<span id="methodNameSpan">${requestScope.PMDetail.cardCompany}카드</span><br>
						<span id="methodNumSpan">${fn:substring(requestScope.PMDetail.cardNo,0,4) }</span>
						</c:when>
						<c:when test="${requestScope.PMDetail.methodStatus==2}">
						<span id="methodNameSpan">${requestScope.PMDetail.bankName}은행</span><br>
						<span id="methodNumSpan">${fn:substring(requestScope.PMDetail.bankAccount,0,6) }</span>
						</c:when>
						<c:when test="${requestScope.PMDetail.methodStatus==3}">
						<span id="methodNameSpan">${requestScope.PMDetail.phoneNo}</span><br>
						<span id="methodNumSpan">${fn:substring(requestScope.PMDetail.phoneNo,fn:length(requestScope.PMDetail.phoneNo-5),4) }</span>
						</c:when>
						<c:otherwise>
						<span id="methodNameSpan">저장된 결제 수단이 없습니다</span><br>
						<span id="methodNumSpan"></span>
						</c:otherwise>
						</c:choose>
						
							
					</div>
					<br>
					<form action="" id="paymentMethodForm">
						<div class="paymentMethod">
							<p>일반 결제 수단</p>
							<p class="rightValue" id="paymentMethodP_2"
								onclick="checkPaymentMethodDiv(2)">열기 ▽</p>
						</div>
						<br>
						<div id="paymentMethodDiv_2">
							<div style="display: flex;">
								<div id="nomalMethod_1" class="nomalMethod"
									onclick="checkNomalMethodDiv('1')">
									<p>신용카드 결제</p>
								</div>
								<div id="nomalMethod_2" class="nomalMethod"
									onclick="checkNomalMethodDiv('2')">
									<p>실시간 계좌이체</p>
								</div>
								<div id="nomalMethod_3" class="nomalMethod"
									onclick="checkNomalMethodDiv('3')">
									<p>휴대폰 결제</p>
								</div>
								<input type="hidden" name="methodPwd" id="methodPwd" value="127737">
								<input type="hidden" name="userReg" id="userReg"> 
							</div>
							<div id="nomalMethodDiv_1" class="nomalMethodDiv">
								<br> 카드 회사<br>
								<br> <input type="radio" name="cardCompany" value="신한">신한카드
								<input type="radio" name="cardCompany" value="KB국민">KB국민카드
								<input type="radio" name="cardCompany" value="BC">BC카드 <input
									type="radio" name="cardCompany" value="현대">현대카드 <input
									type="radio" name="cardCompany" value="롯데">롯데카드<br>
								<input type="radio" name="cardCompany" value="하나">하나카드 <input
									type="radio" name="cardCompany" value="삼성">삼성카드 <input
									type="radio" name="cardCompany" value="우리">우리카드 <input
									type="radio" name="cardCompany" value="씨티">씨티카드 <input
									type="radio" name="cardCompany" value="NH">NH카드 <br>
								<br> 카드 번호 : <input type="number" id="cardNo" name="cardNo"
									placeholder="- 를 제외한 숫자만 입력"> <br>
								<br> 카드 CVC : <input type="number" id="cardCVC" name="cardCVC"
									placeholder="CVC 를 입력해주세요" style="-webkit-text-security: disc;">
								<br>
								<br>
								<button type="button" onclick="insertMethodCheck(1)">결제수단 정보 저장</button>
								<hr>
							</div>
							<div id="nomalMethodDiv_2" class="nomalMethodDiv">
								<br> 결제 은행<br>
								<br> <input type="radio" name="bankName" value="신한">신한은행
								<input type="radio" name="bankName" value="KB국민">KB국민은행
								<input type="radio" name="bankName" value="기업">기업은행 <input
									type="radio" name="bankName" value="우체국">우체국 <input
									type="radio" name="bankName" value="하나">하나은행<br> <input
									type="radio" name="bankName" value="우리">우리은행 <input
									type="radio" name="bankName" value="씨티">씨티은행 <input
									type="radio" name="bankName" value="NH">NH은행 <br>
								<br> 은행 계좌번호 : <input type="number" name="bankAccount"
									placeholder="- 를 제외한 숫자만 입력" id="bankAccount"> <br>
								<br> 은행 비밀번호 : <input type="number" name="bankPwd"
									placeholder="CVC 를 입력해주세요" style="-webkit-text-security: disc;" id="bankPwd">
								<br>
								<br> 예금주 주민등록번호 : <br>  <input type="number" id="userReg_1_1"
									placeholder="주민번호 앞자리"> - <input type="number" id="userReg_1_2"
									placeholder="주민번호 뒷자리" style="-webkit-text-security: disc;">
								<br>
								<br>
								<button type="button" onclick="insertMethodCheck(2)">결제수단 정보 저장</button>
								<hr>
							</div>
							<div id="nomalMethodDiv_3" class="nomalMethodDiv">
								<br> 결제 할 휴대폰 번호<br> <input type="text"
									placeholder="전화번호(- 를 제외 숫자만)"
									onfocus="phoneNumber('focus','2')"
									onblur="phoneNumber('blur','2')" id="phoneNum_2" name="phoneNo">
								<br>
								<br> 결제 주민등록번호 : <br> <input type="number" id="userReg_2_1"
									placeholder="주민번호 앞자리"> - <input type="number" id="userReg_2_2"
									placeholder="주민번호 뒷자리" style="-webkit-text-security: disc;">
								<br>
								<br>
								<button type="button" onclick="insertMethodCheck(3)">결제수단 정보 저장</button>
								<hr>
							</div>
						</div>
					</form>


				</div>


			</div>

			<div id="paymentInnerWrap_2">
				<div id="paymentInfoWrap">
					<div id="paymentInfo">
						<div
							style="text-align: center; font-weight: bold; font-size: 20px;">
							<br> xxxx월 xx일 출고 예정
						</div>
						<br>
						<div>상품별 출고일정이 다른경우 가장 늦은 상품 기준으로 함께 출고됩니다.</div>
						<br>
						<hr>
						<div class="innerInfo">
							<p>상품금액</p>
							<p class="rightValue">
								<fmt:formatNumber value="${requestScope.order.totalCost}" />
								원
							</p>
						</div>
						<div class="innerInfo">
							<p>배송비</p>
							<p class="rightValue">0</p>원
						</div>
						<div class="innerInfo">
							<p>사용포인트</p>
							<p class="rightValue" id="userPointP">0</p>pt
						</div>
						<hr>
						<div class="innerInfo">
							<p>최종 결제 금액</p>
							<p class="rightValue"
								style="font-size: 25px; color: red; font-weight: bold" id="totalPrice">
								<fmt:formatNumber value="${requestScope.order.totalCost}" />
								원
							</p>
						</div>
						<hr>
						<div class="innerInfo">
							<p>적립예정 포인트</p>
							<p class="rightValue">
								<fmt:formatNumber value="${requestScope.order.totalGetPoint}" />
								pt
							</p>
						</div>
						<hr>
						<div class="innerInfo" style="align-items: center;">
							<input type="checkbox" style="zoom: 1.5;">
							<p style="margin: 5px">주문내역확인 동의(필수)</p>
						</div>
						<hr>
						<div style="text-align: center;">
							<button class="paymentButton" onclick="moveInsertPayment()">결제하기</button>
							<br>
							<button class="paymentButton">장바구니로 가기</button>
						</div>
						<br>
						<br>
					</div>
				</div>
			</div>
		</div>


						<!-- <button type="button" class="btn btn-primary" data-toggle="modal"
							data-target="#loginModal">Launch demo modal</button>
							
							<button type="button" onclick="selectMethod(0)"></button> -->
							
		<div class="modal fade" id="loginModal">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">Login</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>

					<form action="login.me" method="post">
						<!-- Modal Body -->
						<div class="modal-body">
							<label for="userId" class="mr-sm-2">ID :</label> <input
								type="text" class="form-control mb-2 mr-sm-2"
								placeholder="Enter ID" id="userId" name="userId"> <br>
							<label for="userPwd" class="mr-sm-2">Password:</label> <input
								type="password" class="form-control mb-2 mr-sm-2"
								placeholder="Enter password" id="userPwd" name="userPwd">
						</div>

						<!-- Modal footer -->
						<div class="modal-footer">
							<button type="button" class="btn btn-primary" onclick="aaaaaa()">로그인</button>
							<button type="button" class="btn btn-danger ppp"
								data-dismiss="modal">취소</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		
	</main>
</body>
</html>