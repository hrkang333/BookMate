<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>교환/반품 페이지 </title>
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
    
    
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
  <script>
 function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
         
                document.getElementById("sample4_engAddress").value = data.addressEnglish;
                       
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

             
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>

</head>
<body>

	<!-- 여기서 교환 환불 신청 하면 상태가 업데이트 해주는걸로 해주자  -->
	<!-- 기존에 리스트 paymentDetailNo 조회해서 그걸 인서트로 넣어야되는디..  --> 
	<form action="insertExchangeItem.me" method="post">
		 
		 
	  <c:forEach var="item" items="${myOrderListDetail}" varStatus="status">
	  
	  	<table>
	  	
	  		<tr>
	  		  <th>상품정보</th>
	  		  <th>교환수량</th>
	  		  <th>받으실 분 </th>
	  		  <th>받으실 분 휴대폰번호</th>
	  		  <th>주소 입력 </th>
	  		
	  		</tr>
	  	
	  	
	  	
	  		<tr>
	  			<td style="text-align: left"><img src="${pageContext.servletContext.contextPath }/resources/images/book_img/${item.bookMainImg}" style="width: 40px; height: auto;"/>
                        	<c:out value="${item.bookTitle}"/></td>
	  			
	  			<td><c:out value="${item.quantity}"/>개 </td>
	  			<td><input type="text" value="" style="width:500px;" maxlength="100" placeholder="교환사유를 입력해주세요"></td>
	  			<td><input type="text" value="" style="width:500px;" maxlength="100"></td>
	  			<td>
	  			
	  				<div class="col-md-12 form-group">
					<input class="form-control" type="text" id="sample4_postcode" name="post" placeholder="우편번호" readonly>
					</div>
					<div class="col-md-12 form-group">
					<input class="form-control" type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
					</div>
					<div class="col-md-12 form-group">
					<input class="form-control" type="text" id="sample4_roadAddress" name="address1"placeholder="도로명주소" size="60" readonly>
					</div>
					<div class="col-md-12 form-group">
					<input class="form-control" type="hidden" id="sample4_jibunAddress" placeholder="지번주소" size="60" disabled>
					</div>
					<div class="col-md-12 form-group">
					<input class="form-control" id="guide" style="color:#999;display:none">
					</div>
					<div class="col-md-12 form-group">
					<input class="form-control" type="text" id="sample4_detailAddress" name="address2" placeholder="상세주소"  size="60">
					</div>
					<div class="col-md-12 form-group">
					<input class="form-control" type="hidden" id="sample4_extraAddress" placeholder="참고항목"  size="60">
					</div>
					<div class="col-md-12 form-group">
					<input class="form-control" type="hidden" id="sample4_engAddress" placeholder="영문주소"  size="60">
					</div>
	  			
	  			
	  			</td>
	  			
	  		</tr>
	  		
	  	
	  	</table>
	  
	  
		</c:forEach>
	 
	
	</form>

<!-- 교환 신청하면 교환 폼으로 인서트 되게 하라  -->
	
</body>
</html>