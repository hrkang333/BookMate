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

  <link rel="stylesheet" href="resources/vendors/fontawesome/css/all.min.css">
   <link rel="stylesheet" href="resources/vendors/themify-icons/themify-icons.css">
  <link rel="stylesheet" href="resources/vendors/nice-select/nice-select.css">
  <link rel="stylesheet" href="resources/vendors/owl-carousel/owl.theme.default.min.css">
  <link rel="stylesheet" href="resources/vendors/owl-carousel/owl.carousel.min.css">

</head> 
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> 
<!--   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 --><style>


	.searchingInput{
	
	width: 400px; 
	height:50px; 
	border-radius: 10px;
	
	}
	
	.searchingArea{
	
	margin-top: 10px;
	
	}
	
	.loginArea{
	
	margin-top: 10px;
	text-align: right;
	padding-right: 150px;
	color: brown;
	
	}

</style>

<body  style="margin: auto; width: 1200px">
  <!--================ Start Header Menu Area =================-->
	<header class="mainHeader"  style="text-align: center; z-index: 9999; background-color:#ffff; position:fixed;  width: 1200px;  box-shadow: none; margin: ">
		
		<div class="loginArea">
			<c:if test="${ empty sessionScope.loginUser }">
				<a href="register.me">회원가입</a> | 
	            				<a data-toggle="modal" data-target="#loginModal">로그인</a>  | 
									<a href="findId.us">아이디찾기</a> |
									<a href="findPwd.us">비밀번호찾기</a>
			</c:if>

			<!-- 로그인 후  -->
		   	<c:if test="${ !empty sessionScope.loginUser }">
				<label>${ sessionScope.loginUser.userName }님 환영합니다</label> &nbsp;&nbsp;
					                <a href="myPageMain.me">마이페이지</a>
									<a href="logout.us">로그아웃</a>
			</c:if>
		</div>


		<div class="searchingArea">
		
		<a class="imgHome" href="home.us" style="margin-right: 10px"><img src="resources/img/ss2.png" alt=""></a>
					<input class="searchingInput" type="text" placeholder="검색어를 입력하세요" >
					<button class="btn btn-success" type="submit" style="height:50px; color: black; cursor: pointer;">검색</button>
		</div>
		
		
		<!--  -->
 

		<!--카테고리  -->
		<nav style="width: 1200px; text-align: center;">
			<ul class="navbar">
				<li class="nav-item"><a class="nav-link" href="indexKor.book">국내도서</a></li>


				<li class="nav-item submenu dropdown"><a href="#"
					class="nav-link dropdown-toggle" data-toggle="dropdown"
					role="button" aria-haspopup="true" aria-expanded="false">Ebook</a>


					<ul class="dropdown-menu">
						<li class="nav-item"><a class="nav-link" href="blog.html">Blog</a></li>
						<li class="nav-item"><a class="nav-link" href="single-blog.html">Blog Details</a></li>
					</ul>
					
				</li>
				
				<li class="nav-item"><a class="nav-link" href="ubookMain.ub">중고장터</a></li>
				<li class="nav-item"><a class="nav-link" href="clubMain.cl">독서모임</a></li>
			

			</ul>
		</nav>
		<div>



			<!-- 로그인 모달  -->
			<div class="modal fade" id="loginModal">
				<div class="modal-dialog modal-sm">
					<div class="modal-content">
						<!-- Modal Header -->
						<div class="modal-header">
							<h4 class="modal-title">Login</h4>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>

						<form action="login.us" method="post">
							<!-- Modal Body -->
							<div class="modal-body">
								<label for="userId" class="mr-sm-2">ID :</label> <input
									type="text" class="form-control mb-2 mr-sm-2"
									placeholder="아이디를 입력해주세요" id="userId" name="userId"> <br>
								<label for="userPwd" class="mr-sm-2">Password:</label> <input
									type="password" class="form-control mb-2 mr-sm-2"
									placeholder="비밀번호를 입력해주세요" id="userPwd" name="userPwd">
							</div>

							<!-- Modal footer -->
							<div class="modal-footer">
								<button type="submit" class="btn btn-primary">로그인</button>
								<button type="button" class="btn btn-danger"
									data-dismiss="modal">취소</button>
							</div>
						</form>
					</div>
				</div>
			</div>

		</div>
	</header>


</body>
</html>