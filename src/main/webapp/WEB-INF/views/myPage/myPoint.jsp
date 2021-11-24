<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>포인트 조회 </title>
    
 	<link rel="icon" href="img/Fevicon.png" type="image/png">
    <link rel="stylesheet" href="resources/vendors/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="resources/vendors/fontawesome/css/all.min.css">
    <link rel="stylesheet" href="resources/vendors/themify-icons/themify-icons.css">
    <link rel="stylesheet" href="resources/vendors/linericon/style.css">
    <link rel="stylesheet" href="resources/vendors/owl-carousel/owl.theme.default.min.css">
    <link rel="stylesheet" href="resources/vendors/owl-carousel/owl.carousel.min.css">
  
    <link rel="stylesheet" href="resources/css/style.css">
  
  
  <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  
     <style>

       #insertCoupon{
    
        width: 300px;
        text-align: center;
           
       }

		body{
		 
		width: 1200px;
		
		} 
     </style>
  
</head>
<body style="width: 1200px; margin: auto;">
 <jsp:include page="../common/menubar.jsp" />

<!-- 왼쪽 사이드바  -->
    <section  style="padding-top: 180px;" >
        <div class="container">
          <div class="row">
         <jsp:include page="../myPageSideBar/sideBar.jsp" />

				<!-- 회원의 포인트 조회를 할 수 있는 란  -->
				<div class="col-xl-9 col-lg-8 col-md-7">
					<div class="filter-bar d-flex flex-wrap align-items-center">
						<div class="sorting"></div>
						<div class="sorting mr-auto">

							<br>
							<h2>현재 <c:out value="${userPoint.userName}"/>님의 잔여 포인트는</h2>
							<br>
						</div>
 						<h4> <c:out value="${userPoint.point}"/>point 입니다</h4>
					</div>


					<!-- 쿠폰을 등록하는 곳  -->
					<div class="col-xl-9 col-lg-8 col-md-7">
						<div class="filter-bar d-flex flex-wrap align-items-center">
							<div class="sorting">
								<div class="redeemPoint">
								
									<form class="" action="addCoupon.me" method="post">
										<div class="col-md-12 form-group">
											<br> <input type="text" class="" id="checkCu"
												name="couponNo" placeholder="쿠폰번호를 입력해주세요" required>
											<button type="button" onclick="checkCoupon();"  value="확인" class="button button-tracking">쿠폰 등록하기</button>
										</div>
									</form>
								
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
    
  </section>
    
 

</body>

	 <script type="text/javascript">
	 
	 
	 
		 function checkCoupon(){
			var coupon = $('#couponNo').val(); // id 값이 couponNo 입력란의 값을 저장 
			 
			$.ajax({
				url:'checkCoupon.me',
				type:'post',
				data: {coupon : coupon} ,
				
				success:function(str){
					if(str == 'pass'){
						console.log("사용가능한 쿠폰 아님");
						alert("사용하실 수 없는 쿠폰번호 입니다.")
					}else{
						console.log("쿠폰 있음");
						alert("사용하실 수 있는 쿠폰입니다. ")
					}
					
					console.log("성공")
				},
				
				error:function(){
					alert("..에러다..  ")
				}
			});
		}; 
	
	</script> 
</html>