<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
#paymentInnerWrap_1{
width: 750px;
height: 2600px;

}
#paymentInnerWrap_2{
width: 450px;
height: 1200px;

}
.paymentInnerWrap_1{
    width: 650px;
    margin: auto;

}
#userAccountDiv,#paymentInfo,#paymentInfoWrap,#usePoint{
    padding-left: 40px;
    padding-right: 40px;
}
#deliveryRequest{
    width: 60%;
    display: none;
    resize: none;
}
#paymentInfo{
    border: 1px solid gray;
}
#paymentInfo .innerInfo{
    display: flex;
}
.rightValue{
    margin-left: auto;
}
.paymentButton{
    width: 200px;
    height: 50px;
    font-size: 20px;
    font-family: "맑은 고딕";
    margin-top: 10px;
}
#usePointWrap .tdd{
    width: 45%;
    text-align: center;
}
.paymentMethod{
    border: 1px solid gray;
    display: flex;
    padding-left: 10px;
    padding-right: 10px;
}
.nomalMethod{
    
    width: 33.3%;
    border: gray 1px solid;
    text-align: center;
    height: 40px;
    align-items: center;
}
.nomalMethod p{
   margin: 10px;
}
.nomalMethodDiv,#paymentMethodDiv_2{
    display: none;
}
</style>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function daumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
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

    function phoneNumber(type,num) {
        var input = $("#phoneNum_"+num).val();

    //focus out인 경우 
    //input type을 text로 바꾸고 '-'추가
        if(type == 'blur'){
            $("#phoneNum_"+num).prop('type', 'text');
            var phone = checkPhoneNumber(input);
        }
        
    //focus인 경우
    //input type을 number로 바꾸고 '-' 제거
        if(type == 'focus'){
            var phone = input.replace( /-/gi, '');
            $("#phoneNum_"+num).prop('type', 'number');
        }

        $("#phoneNum_"+num).val(phone);
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
        
        if($('#deliveryRequest').css("display")=='none'){

            
            $('#deliveryRequest').css("display","inline")
        }else{
            $('#deliveryRequest').css("display","none")
        }
    }

    function checkPaymentMethodDiv(num) {
        if(num==1){
            var arrNum = ['1','2'];
            
        }else{
            var arrNum = ['2','1'];
        }
        if($('#paymentMethodDiv_'+arrNum[0]).css("display")=='block'){
                $('#paymentMethodP_'+arrNum[0]).html("열기 ▽");
                $('#paymentMethodDiv_'+arrNum[0]).css("display","none");
        }else{
                $('#paymentMethodP_'+arrNum[0]).html("닫기 △");
                $('#paymentMethodDiv_'+arrNum[0]).css("display","block");
                $('#paymentMethodP_'+arrNum[1]).html("열기 ▽");
                $('#paymentMethodDiv_'+arrNum[1]).css("display","none");
        }
        
    }
    function checkNomalMethodDiv(num) {
        $( '#nomalMethodDiv_'+num ).css( 'display', 'block');
        $( '.nomalMethodDiv' ).not( '#nomalMethodDiv_'+num ).css( 'display', 'none');

        $( '#nomalMethod_'+num ).css( 'border-bottom', 'none');
        $( '.nomalMethod' ).not( '#nomalMethod_'+num ).css( 'border-bottom', 'solid 1px gray');
    }
</script>
</head>
<body style="width: 1200px;margin: auto;">

    <main>
        <br><hr><br><br>
        <div id="paymentWrap" style="display: flex;">
            <div id="paymentInnerWrap_1">
                <div id="userAccountWrap" class="paymentInnerWrap_1">
                    배송지 정보
                    <br><br><hr><br>
                    <div id="userAccountDiv">
                    <input type="text" placeholder="이름" value="${requestScope.order.shippingName}">
                    <input type="button" onclick="daumPostcode()" value="새 주소 입력">
                    <input type="button" onclick="" value="주소록 불러오기">
                    <br><br>
                    <input type="text" id="postcode" placeholder="우편번호" value="${requestScope.order.shippingPostCode}"><br>
                    <input type="text" id="address" placeholder="주소" value="${requestScope.order.shippingAddress}"><br>
                    <input type="text" id="detailAddress" placeholder="상세주소" value="${requestScope.order.shippingAddressDetail}"><br><br>
                    <input type="text" placeholder="전화번호(- 를 제외 숫자만)" onfocus="phoneNumber('focus','1')" onblur="phoneNumber('blur','1')" id="phoneNum_1" value="${requestScope.order.shippingPhone}" ><br><br>
                    <div style="text-align: right;"><span style="cursor: pointer;" onclick="name111()">배송요청사항</span><br><br>
                    <textarea name="deliveryRequest" id="deliveryRequest" cols="30" rows="5" placeholder="100자 이하로 입력해주세요" maxlength="100"></textarea>
                    </div>
                    
                </div>
                <hr>
                </div>
                <br><br><br>
                <div id="buyingBookWrap" class="paymentInnerWrap_1">
                    주문상품<br><br><hr><br>
                    <c:forEach items="${requestScope.orderList}" var="list" varStatus="status">
                    <div id="buyingBook" style="display: flex;">
                        <div class="media" style="width: 50%;display: flex;">
                            <div class="d-flex">
                                <img src="${pageContext.servletContext.contextPath }/resources/images/book_img/${list.bookMainImg}" style="height: 150px">
                            </div>
                            <div class="media-body">
                                <p>${list.bookTitle}</p>
                            </div>
                        </div>
                    
                        <div style="display: flex; align-items: center; width: 50%; text-align: center;">
                            
                            <div style="width: 50%;">
                            <span style="text-decoration: line-through"><fmt:formatNumber value="${list.bookPrice}" />원 </span><br> 
                            <span><fmt:formatNumber value="${list.salePrice}" /></span>원(↓ 10%)<br> 
                            <span><fmt:formatNumber value="${list.getPoint}" />pt 적립</span><br><br>
                                    <span>${list.quantity}권</span>
                                </div>
                                <div style="width: 50%;">
                                    <fmt:formatNumber value="${list.salePrice*list.quantity}"/>원
                                </div>
                        </div>
                     </div>                     
                <br><br>
		</c:forEach>
                    
                <hr>
                </div>
                <br><br><br>
                <div id="usePointWrap"  class="paymentInnerWrap_1">
                포인트사용<br><br><hr><br>
                    <div id="usePoint">
                        <table>
                            <tr>
                                <td class="tdd">보유포인트 : 203810pt</td>
                                <td class="tdd">사용 : <input type="number" style="width: 100px;"> pt</td>
                                <td><input type="button" value="모두사용"></td>
                            </tr>
                        </table>
                    </div>
                    <br><hr>
                </div>
                <br><br><br>
                
                <div id="paymentMethodWrap" class="paymentInnerWrap_1">
                    결제정보<br><br><hr><br>
                    <div class="paymentMethod">
                        <p>저장된 결제수단</p><p class="rightValue" id="paymentMethodP_1" onclick="checkPaymentMethodDiv(1)">닫기 △</p>
                    </div>
                    <div id="paymentMethodDiv_1">
                        저장된 결제수단이 없습니다
                    </div>
                    <br>
                    <div class="paymentMethod">
                        <p>일반 결제 수단</p><p class="rightValue" id="paymentMethodP_2" onclick="checkPaymentMethodDiv(2)">열기 ▽</p>
                    </div>
                    <br>
                    <div id="paymentMethodDiv_2">
                    <div style="display: flex;">
                        <div id="nomalMethod_1" class="nomalMethod" onclick="checkNomalMethodDiv('1')"><p>신용카드 결제</p></div>
                        <div id="nomalMethod_2" class="nomalMethod" onclick="checkNomalMethodDiv('2')"><p>실시간 계좌이체</p></div>
                        <div id="nomalMethod_3" class="nomalMethod" onclick="checkNomalMethodDiv('3')"><p>휴대폰 결제</p></div>

                    </div>
                    <div id="nomalMethodDiv_1" class="nomalMethodDiv">
                        <br>
                        카드 회사<br><br>
                        <input type="radio" name="cardCompany" value="신한">신한카드         
                        <input type="radio" name="cardCompany" value="KB국민">KB국민카드
                        <input type="radio" name="cardCompany" value="BC">BC카드
                        <input type="radio" name="cardCompany" value="현대">현대카드
                        <input type="radio" name="cardCompany" value="롯데">롯데카드<br>
                        <input type="radio" name="cardCompany" value="하나">하나카드
                        <input type="radio" name="cardCompany" value="삼성">삼성카드
                        <input type="radio" name="cardCompany" value="우리">우리카드
                        <input type="radio" name="cardCompany" value="씨티">씨티카드
                        <input type="radio" name="cardCompany" value="NH">NH카드
                        <br><br>
                        카드 번호 : <input type="number" name="cardNo" placeholder="- 를 제외한 숫자만 입력">
                        <br><br>
                        카드 CVC : <input type="number" name="cardCVC" placeholder="CVC 를 입력해주세요" style="-webkit-text-security: disc;">
                        <br><br> <hr>
                    </div>
                    <div id="nomalMethodDiv_2"  class="nomalMethodDiv">
                        <br>
                        결제 은행<br><br>
                        <input type="radio" name="bankName" value="신한">신한은행        
                        <input type="radio" name="bankName" value="KB국민">KB국민은행
                        <input type="radio" name="bankName" value="기업">기업은행
                        <input type="radio" name="bankName" value="우체국">우체국
                        <input type="radio" name="bankName" value="하나">하나은행<br>
                        <input type="radio" name="bankName" value="우리">우리은행
                        <input type="radio" name="bankName" value="씨티">씨티은행
                        <input type="radio" name="bankName" value="NH">NH은행
                        <br><br>
                        은행 계좌번호 : <input type="number" name="bankAccount" placeholder="- 를 제외한 숫자만 입력">
                        <br><br>
                        은행 비밀번호 : <input type="number" name="bankPwd" placeholder="CVC 를 입력해주세요" style="-webkit-text-security: disc;">
                        <br><br>
                        예금주 주민등록번호 : <br>
                        <input type="hidden" name="userReg">
                        <input type="number" id="" placeholder="주민번호 앞자리"> - <input type="number" id="" placeholder="주민번호 뒷자리" style="-webkit-text-security: disc;" > 
                        <br><br> <hr>
                    </div>
                    <div id="nomalMethodDiv_3"  class="nomalMethodDiv">
                        <br>
                        결제 할 휴대폰 번호<br>
                        <input type="text" placeholder="전화번호(- 를 제외 숫자만)" onfocus="phoneNumber('focus','2')" onblur="phoneNumber('blur','2')" id="phoneNum_2" name="phoneNo">
                        <br><br>
                        결제 주민등록번호 : <br>
                        <input type="hidden" name="userReg">
                        <input type="number" id="" placeholder="주민번호 앞자리"> - <input type="number" id="" placeholder="주민번호 뒷자리" style="-webkit-text-security: disc;" >
                        <br><br> <hr>
                    </div>
                </div>
                </div>
            

            </div>
	
            <div id="paymentInnerWrap_2">
                <div id="paymentInfoWrap">
                    <div id="paymentInfo">
                        <div style="text-align: center; font-weight: bold; font-size: 20px;">
                        <br>
                        xxxx월 xx일 출고 예정
                        </div><br>
                        <div>상품별 출고일정이 다른경우 가장 늦은 상품 기준으로 함께 출고됩니다.</div>
                        <br><hr>
                        <div class="innerInfo">
                            <p>상품금액</p><p class="rightValue"><fmt:formatNumber value="${requestScope.order.totalCost}"/>원</p>
                        </div>
                        <div class="innerInfo">
                            <p>배송비</p><p class="rightValue">0원</p>
                        </div>
                        <div class="innerInfo">
                            <p>사용포인트</p><p class="rightValue">0pt</p>
                        </div>
                        <hr>   
                        <div class="innerInfo">
                            <p>최종 결제 금액</p><p class="rightValue" style="font-size: 25px;color: red;font-weight: bold"><fmt:formatNumber value="${requestScope.order.totalCost}"/>원</p>
                        </div>
                        <hr>   
                        <div class="innerInfo">
                            <p>적립예정 포인트</p><p class="rightValue"><fmt:formatNumber value="${requestScope.order.getPoint}"/>pt</p>
                        </div>
                        <hr>  
                        <div class="innerInfo" style="align-items: center;">
                             <input type="checkbox" style="zoom: 1.5;"><p>주문내역확인 동의(필수)</p>
                        </div>
                        <hr>
                        <div style="text-align: center;">
                            <button class="paymentButton">결제하기</button><br>
                            <button class="paymentButton">장바구니로 가기</button>
                        </div>
                        <br><br>
                    </div>
                </div>
            </div>
        </div>


    </main>
</body>
</html>