<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Aroma Shop - Login</title>
	<link rel="icon" href="img/Fevicon.png" type="image/png">
  <link rel="stylesheet" href="vendors/bootstrap/bootstrap.min.css">
  <link rel="stylesheet" href="vendors/fontawesome/css/all.min.css">
	<link rel="stylesheet" href="vendors/themify-icons/themify-icons.css">
	<link rel="stylesheet" href="vendors/linericon/style.css">
  <link rel="stylesheet" href="vendors/owl-carousel/owl.theme.default.min.css">
  <link rel="stylesheet" href="vendors/owl-carousel/owl.carousel.min.css">
  <link rel="stylesheet" href="vendors/nice-select/nice-select.css">
  <link rel="stylesheet" href="vendors/nouislider/nouislider.min.css">

  <link rel="stylesheet" href="css/style.css">
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
 	<jsp:include page="../common/menubar.jsp"/>

  <!-- ================ start banner area ================= -->	
	<section class="blog-banner-area" id="category">
		<div class="container h-100">
			<div class="blog-banner">
				<div class="text-center">
					<h1>Register</h1>
					<nav aria-label="breadcrumb" class="banner-breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active" aria-current="page">Register</li>
            </ol>
          </nav>
				</div>
			</div>
    </div>
	</section>
	<!-- ================ end banner area ================= -->
  
  <!--================Login Box Area =================-->
	<section class="login_box_area section-margin">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<div class="login_box_img" style="height: 1000px;">
						<div class="hover">
							<h4>이미 계정이 있으신가요?</h4>
							<p>책구메이트에 로그인하시면<br>더 많은 서비스를 이용하실 수 있어요</p>
							<a class="button button-account" href="login.me">지금 바로 로그인하기</a>
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="login_form_inner register_form_inner">
						<h3>책구메이트 회원가입</h3>
						<form class="row login_form" action="insert.us" id="register_form" >
							<div class="col-md-12 form-group">
								<input type="text" class="form-control" id="userId" name="userId" placeholder="아이디" onfocus="this.placeholder = ''" onblur="this.placeholder = '아이디'" required="required">
							</div>
							<div class="col-md-12 form-group">
								<input type="text" class="form-control" id="userName" name="userName" placeholder="이름" onfocus="this.placeholder = ''" onblur="this.placeholder = '이름'" required="required">
							</div>
				
             			 <div class="col-md-12 form-group">
								<input type="password" class="form-control" id="userPwd" name="userPwd" placeholder="비밀번호" onfocus="this.placeholder = ''" onblur="this.placeholder = '비밀번호'" required="required">
            			  </div>
             			 <div class="col-md-12 form-group">
								<input type="password" class="form-control" id="userPwdCheck" name="userPwdCheck" placeholder="비밀번호 확인" onfocus="this.placeholder = ''" onblur="this.placeholder = '비밀번호 확인'" required="required">
						 </div>

								<div class="col" hidden="hidden" >남자</div><input hidden="hidden" type="radio" checked="checked" style="width:20px;height:20px;border:1px;" class="form-control" id="gender" name="gender" value="M" >
								<div class="col" hidden="hidden" >여자</div><input hidden="hidden"  type="radio" style="width:20px;height:20px;border:1px;" class="form-control" id="gender" name="gender" value="F" >
	 
								<div class="col-md-12 form-group">
								<input class="form-control" type="text" id="sample4_postcode" name="post" placeholder="우편번호" readonly required="required">
								</div>
								<div class="col-md-12 form-group">
								<input class="form-control" type="text" id="sample4_roadAddress" name="address1"placeholder="도로명주소" size="60" readonly required="required">
								</div>
								<div class="col-md-12 form-group" style="display: none;">
								<input class="form-control" type="hidden" id="sample4_jibunAddress" placeholder="지번주소" size="60" disabled style="display: none;">
								</div>
								<div class="col-md-12 form-group" style="display: none;">
								<input class="form-control" id="guide" style="color:#999;display:none">
								</div>
								<div class="col-md-12 form-group">
								<input class="form-control" type="text" id="sample4_detailAddress" name="address2" placeholder="상세주소"  size="60" required="required">
								</div>
								<div class="col-md-12 form-group" style="display: none;">
								<input class="form-control" type="hidden" id="sample4_extraAddress" placeholder="참고항목"  size="60" style="display: none;">
								</div>
								<div class="col-md-12 form-group" style="display: none;">
								<input class="form-control" type="hidden" id="sample4_engAddress" placeholder="영문주소"  size="60" style="display: none;">
								</div>
								<div class="col-md-12 form-group">
								<button class="form-control" type="button" onclick="sample4_execDaumPostcode()">우편번호 찾기</button>
								</div>
								<div class="col-md-12 form-group">
								<input type="tel" class="form-control" id="phone" name="phone" placeholder="핸드폰 (- 포함)" onfocus="this.placeholder = ''" onblur="this.placeholder = '핸드폰 (- 포함)'" required="required">
             			 		</div>
								<div class="col-md-12 form-group">
								<input type="email" class="form-control" id="email" name="email" placeholder="이메일 주소" onfocus="this.placeholder = ''" onblur="this.placeholder = '이메일 주소'" required="required">
             			 		</div>
							<div class="col-md-12 form-group">
								<button type="submit" value="submit" class="button button-register w-100">가입하기</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================End Login Box Area =================-->

  <script src="vendors/jquery/jquery-3.2.1.min.js"></script>
  <script src="vendors/bootstrap/bootstrap.bundle.min.js"></script>
  <script src="vendors/skrollr.min.js"></script>
  <script src="vendors/owl-carousel/owl.carousel.min.js"></script>
  <script src="vendors/nice-select/jquery.nice-select.min.js"></script>
  <script src="vendors/jquery.ajaxchimp.min.js"></script>
  <script src="vendors/mail-script.js"></script>
  <script src="js/main.js"></script>
  
   	<jsp:include page="../common/footer.jsp"/>
  
</body>
</html>