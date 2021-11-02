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
  
     <style>

       #insertCoupon{
    
        width: 300px;
        text-align: center;
           
       }

     </style>
  
</head>
<body>
   <!-- 왼쪽 사이드바  -->
   <section class="section-margin--small mb-5">
    <div class="container">
			<div class="row">
				<div class="col-xl-3 col-lg-4 col-md-5">
					<div class="sidebar-categories">
						<div class="head">마이페이지</div>
						<ul class="main-categories">
							<li class="common-filter">
								<form action="#">
									<ul>
										<li>내 정보 수정하기</li>
										<li>내 비밀번호 변경하기</li>
									</ul>
								</form>
							</li>
						</ul>
					</div>
					<div class="sidebar-filter">
						<div class="top-filter-head">일반상품 주문관리</div>
						<div class="common-filter">
							<div class="head">일반상품</div>
							<form action="#">
								<ul>
									<li class="filter-list">주문 리스트 조회</li>
									<li class="filter-list">취소 리스트 조회</li>
									<li class="filter-list">교환 리스트 조회</li>
								</ul>
							</form>
						</div>
					</div>


					<div class="sidebar-filter">
						<div class="top-filter-head">중고상품 주문관리</div>
						<div class="common-filter">
							<div class="head">중고상품</div>
							<form action="#">
								<ul>
									<li class="filter-list">주문 리스트 조회</li>

								</ul>
							</form>
						</div>
					</div>

					<div class="sidebar-filter">
						<div class="top-filter-head">관심작가 및 찜목록</div>
						<div class="common-filter">
							<form action="#">
								<ul>
									<br>
									<li class="filter-list">관심작가 리스트</li>
									<li class="filter-list">최근 조회한 상품</li>
									<li class="filter-list">나의 찜목록</li>
									<li class="filter-list">나의 리뷰 조회</li>
									<li class="filter-list">나의 포인트 조회</li>
								</ul>
							</form>
						</div>
					</div>


				</div>

				<!-- 회원의 포인트 조회를 할 수 있는 란  -->
				<div class="col-xl-9 col-lg-8 col-md-7">
					<div class="filter-bar d-flex flex-wrap align-items-center">
						<div class="sorting"></div>
						<div class="sorting mr-auto">

							<br>
							<h2>현재 <c:out value="${loginUser.userName}"/>님의 잔여 포인트는</h2>
							<br>
						</div>
 						<h4> <c:out value="${loginUser.point}"/>point 입니다</h4>
					</div>


					<!-- 쿠폰을 등록하는 곳  -->
					<div class="col-xl-9 col-lg-8 col-md-7">
						<div class="filter-bar d-flex flex-wrap align-items-center">
							<div class="sorting">
								<div class="redeemPoint">
									<form class="" action="#" method="post">
										<div class="col-md-12 form-group">
											<br> <input type="text" class="" id="insertCoupon"
												name="insertCoupon" placeholder="쿠폰번호를 입력해주세요" required>
											<button type="submit" value="submit"
												class="button button-tracking">쿠폰 등록하기</button>
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
</html>