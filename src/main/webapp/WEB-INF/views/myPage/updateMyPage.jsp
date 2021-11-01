<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
    	
    	.innerOuter{
    	
    		padding-left: 200px;
    	
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
				
				
				

				<!-- 회원정보 수정할수 있는 곳  -->
	<div class="col-xl-9 col-lg-8 col-md-7">
		<div class="filter-bar d-flex flex-wrap align-items-center">
			<div class="sorting"></div>
				<div class="sorting mr-auto">

					
     <div class="content">
        <br><br>
        <div class="innerOuter">
            <h2>내 정보 수정하기 </h2>
            <br>

            <form action="update.me" method="post" onsubmit="">
                <div class="form-group">
                    <label>* ID :</label>
                    <input type="text" class="form-control" name="userId" value="${ loginUser.userId }" readonly><br>
                    
                    <label>* PW :</label>
                    <input type="text" class="form-control" name="userPwd" value="" placeholder="비밀번호 변경을 원하실경우 비밀번호를 입력하세요"><br>
                    
                    
                    <label for="userName">* Name :</label>
                    <input type="text" class="form-control" id="userName" name="userName" value="${ loginUser.userName }" readonly><br>
                    
                    <label for="email"> &nbsp; Email :</label>
                    <input type="email" class="form-control" id="email" name="email" value="${ loginUser.email }"><br>
                    
                    <label for="age"> &nbsp; Age :</label>
                    <input type="number" class="form-control" id="age" name="age" value="${ loginUser.age }"><br>
                    
                    <label for="phone"> &nbsp; Phone :</label>
                    <input type="tel" class="form-control" id="phone" name="phone" value="${ loginUser.phone }"><br>
                    
                    <label for="address"> &nbsp; Address :</label><br>
                    
              	
				<c:forTokens var="addr" items="${ loginUser.address }" delims="/" varStatus="status">
					<c:if test="${ status.index eq 0 && addr >= '0' && addr <= '99999' }">
						<c:set var="post" value="${ addr }"/>
					</c:if>
					<c:if test="${ status.index eq 0 && !(addr >= '0' && addr <= '99999') }">
						<c:set var="address1" value="${ addr }"/>
					</c:if>
					<c:if test="${ status.index eq 1 }">
						<c:set var="address1" value="${ addr }"/>
					</c:if>
					<c:if test="${ status.index eq 2 }">
						<c:set var="address2" value="${ addr }"/>
					</c:if>
				</c:forTokens>
					<div class="form-inline">
					<label> &nbsp; 우편번호 : &nbsp;</label>
					<input type="text"  name="post" class="form-control mr-2 postcodify_postcode5" value="${ post }" size="6">
					<button type="button" class="btn btn-primary" id="postcodify_search_button">검색</button>
					</div>
					<br>
					<label> &nbsp; 도로명주소 : </label>
					<input type="text" name="address1" class="form-control postcodify_address" value="${ address1 }" size="30">
					<br>
				    <label> &nbsp; 상세주소 : </label>
					<input type="text" name="address2" class="form-control postcodify_extra_info" value="${ address2 }" size="30">
				
				
				<!-- jQuery와 Postcodify를 로딩한다. -->
				<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
				<script>
					// 검색 단추를 누르면 팝업 레이어가 열리도록 설정한다.
					$(function(){
						$("#postcodify_search_button").postcodifyPopUp();
					});
				</script>
				<br><br>
                    <label for=""> &nbsp; Gender : </label> &nbsp;&nbsp;
                    <input type="radio" name="gender" id="Male" value="M">
                    <label for="Male">남자</label> &nbsp;&nbsp;
                    <input type="radio" name="gender" id="Female" value="F">
                    <label for="Female">여자</label><br>
                    
                    <script>
                    	$(function(){
                    		if("${loginUser.gender}" == "M"){
                    			$("#Male").attr("checked", true);
                    		}else if("${loginUser.gender}" == "F"){
                    			$("#Female").attr("checked", true);
                    		}
                    	});
                    </script>
                    
                </div>
                <br>
                
                <div class="btns" align="center">
                    <button type="submit" class="btn btn-primary">수정하기</button>
                    <button type="button" onclick="$('#postForm').submit();" class="btn btn-danger">탈퇴하기</button>
                </div>
            </form>

        </div>
        <br><br>
    </div>
    
    <form action="delete.me" method="post" id="postForm">
    	<input type="hidden" name="userId" value="${ loginUser.userId }">
    </form>
				
					
				</div>
			</div>
			
			
			
			


		</div>
    
  </section>

</body>
</html>