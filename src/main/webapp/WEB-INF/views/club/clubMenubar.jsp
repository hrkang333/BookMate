<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>책구메이트</title>
   <link rel="icon" href="resources/img/Fevicon.png" type="image/png">
  <link rel="stylesheet" href="resources/vendors/bootstrap/bootstrap.min.css">
  <link rel="stylesheet" href="resources/vendors/fontawesome/css/all.min.css">
   <link rel="stylesheet" href="resources/vendors/themify-icons/themify-icons.css">
  <link rel="stylesheet" href="resources/vendors/nice-select/nice-select.css">
  <link rel="stylesheet" href="resources/vendors/owl-carousel/owl.theme.default.min.css">
  <link rel="stylesheet" href="resources/vendors/owl-carousel/owl.carousel.min.css">

  <link rel="stylesheet" href="resources/css/style.css">
  
  <!-- 11.09 추가 괜찮은가? -->
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
</head>
<body>
  <!--================ Start Header Menu Area =================-->
   <header class="header_area">
    <div class="main_menu">
      <nav class="navbar navbar-expand-lg navbar-light">
        <div class="container">
           <a class="navbar-brand logo_h" href="home.us"><img src="resources/img/ss2.png" alt=""></a>
          <!-- <a class="navbar-brand logo_h" href="home.us">
          	<img src="resources/img/logo1.png" alt="">
          </a> -->
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <div class="collapse navbar-collapse offset" id="navbarSupportedContent">
            <ul class="nav navbar-nav menu_nav ml-auto mr-auto">
             
              <li class="nav-item"><a class="nav-link" href="clubMain.cl">독서모임 홈</a></li>
              <li class="nav-item"><a class="nav-link" href="#">모든 독서모임</a></li>
              
              <li class="nav-item"><a class="nav-link" href="#">나에게 맞는 독서모임</a></li>
              
              <li class="nav-item submenu dropdown">
                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                  aria-expanded="false">커뮤니티</a>
                <ul class="dropdown-menu">
                  <li class="nav-item"><a class="nav-link" href="#">실시간 독서모임 커뮤니티</a></li>
                  <li class="nav-item"><a class="nav-link" href="#">나의 독서모임 커뮤니티</a></li>
                </ul>
              </li>
              
              
              
                    <c:if test="${ empty sessionScope.loginUser }">
	                <a href="register.me">회원가입</a> | 
	                
	                <br>
	                <a href="login.me"">로그인</a>  
	                  <br>
	                
	                
                </c:if>
                
                <!-- 로그인 후  -->
                <c:if test="${ !empty sessionScope.loginUser }">
                
	                <li class="nav-item submenu dropdown">
		                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
		                  aria-expanded="false">마이페이지</a>
		                <ul class="dropdown-menu">
		                  <li class="nav-item"><a class="nav-link" href="mypage1.cl">독서모임 신청내역</a></li>
		                  <li class="nav-item"><a class="nav-link" href="mypage2.cl">찜한 독서모임</a></li>
		                  <li class="nav-item"><a class="nav-link" href="mypage3.cl">내 독서모임 관리</a></li>
		                </ul>
		              </li>
                
	                <label>${ sessionScope.loginUser.userName }님 환영합니다</label> &nbsp;&nbsp;
	                <a href="logout.us">로그아웃</a>
	                
 	           
                </c:if>  
            </ul>


          </div>
        </div>
      </nav>
    </div>
  </header>
</body>
</html>