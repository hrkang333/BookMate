<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>[책장메이트] - 온라인 중고도서장터</title>
<link rel="icon" href="resources/img/logo1.png" type="image/png">
<link rel="stylesheet"
	href="resources/vendors/bootstrap/bootstrap.min.css">
<link rel="stylesheet"
	href="resources/vendors/fontawesome/css/all.min.css">
<link rel="stylesheet"
	href="resources/vendors/themify-icons/themify-icons.css">
<link rel="stylesheet"
	href="resources/vendors/owl-carousel/owl.theme.default.min.css">
<link rel="stylesheet"
	href="resources/vendors/owl-carousel/owl.carousel.min.css">

<link rel="stylesheet" href="resources/css/style.css">
<link rel="stylesheet" href="resources/css/used.css">

<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> -->

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.1.0/css/all.css"
	integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt"
	crossorigin="anonymous">

<style type="text/css">
.fixed {
	margin-left: 170px !important;
}

.header-area {
	box-shadow: none !important;
}

.searchingInput {
	width: 400px;
	height: 50px;
	border-radius: 10px;
}

.searchingArea {
	margin-top: 10px;
}

.loginArea {
	font-size: 16px;
	margin-top: 10px;
	text-align: right;
	padding-right: 20px;
	color: brown;
}
</style>
</head>

<body style="margin: auto; width: 1200px">
	<!--================ Start Header Menu Area =================-->
	<header class="mainHeader"
		style="height: 180px; text-align: center; z-index: 9999; background-color: #f9f1e2; width: 100vw; left: 0%; position: fixed; box-shadow: none; top: 0;">

		<div style="margin: auto; width: 1200px">
			<div class="loginArea">
				<!--로그인 회원정보-->
				<c:if test="${ empty sessionScope.loginUser }">

					<!-- <a href="http://localhost:8090/spring/">책구메이트 홈</a>  -->
					<a href="register.me">회원가입</a> |
                                <a data-toggle="modal"
						data-target="#loginModal">로그인</a> | 
									<a href="findId.us">아이디찾기</a> |
									<a href="findPwd.us">비밀번호찾기</a>

				</c:if>

				<!-- 로그인 후  -->
				<c:if test="${ !empty sessionScope.loginUser }">
					<label style="color: brown;">${ sessionScope.loginUser.userName }님</label>
					<c:if test="${ !empty s.sellerId && s.status eq 'Y' }">
                                |
                                <a href="sellerPage.se">판매자페이지</a>
                                |
                                </c:if>
					<a href="ubookCart.ub">장바구니</a>
					<!-- |
                                <a href="http://localhost:8090/spring/">책구메이트 홈</a> -->
                                |
                                <a href="logout.us">로그아웃</a>
				</c:if>
			</div>

			<div style="display: flex;">
				<div>

					<a class="imgHome" href="${pageContext.servletContext.contextPath }/"
						style="margin-right: 10px"><img src="resources/img/logo.png"
						alt="" style="width: 300px;"></a>
				</div>
				<div class="searchingArea">
					<!--검색-->
					<form id="search" action="ubookSearch.ub" style="width: 455px;">
						<div class="row no-gutters align-items-center">
							<!--검색 input-->
							<div class="col">
								<input
									class="form-control form-control-lg form-control-borderless"
									name="keyword" type="search" placeholder="도서명 혹은 저자를 입력하세요">
							</div>
							<!--검색버튼-->
							<div class="col-auto">
								<button class="btn btn-lg searchbtn" type="button"
									onclick="searchChk()">검색</button>
							</div>
							<script>
								function searchChk() {
									var keyword = $("input[name='keyword']")
											.val();
									if (keyword == "") {
										alert("검색할 도서 제목이나 작가명을 입력해주세요.");
										keyword.focus();
										return false;
									} else if (keyword == " ") {
										alert("공백은 입력할 수 없습니다.");
										keyword.val('');
										keyword.focus();
										return false;
									}
									$("#search").submit();
								}
							</script>
						</div>
					</form>
				</div>
			</div>

			<!--카테고리  -->
			<nav style="width: 1175px; text-align: center; margin-left: 11px;">
				<ul class="navbar" id="tree" style="margin-top: 4px;">
					<li class="nav-item"><a class="nav-link"
						style="color: #503535; font-weight: 700; font-size: 18px;"
						class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">국내도서</a>

						<ul class="dropdown-menu">
							<li class="nav-item"><a class="nav-link">국내도서 전체</a></li>
							<li class="nav-item"><a class="nav-link"
								href="single-blog.html"></a></li>
						</ul></li>
					<li class="nav-item submenu dropdown"><a href="#"
						role="button"
						style="color: #503535; font-weight: 700; font-size: 18px;"
						value="12">eBook</a></li>

					<li class="nav-item"><a class="nav-link" href="ubookMain.ub"
						style="color: #503535; font-weight: 700; font-size: 18px;">중고장터</a></li>
					<li class="nav-item"><a class="nav-link" href="clubMain.cl"
						style="color: #503535; font-weight: 700; font-size: 18px;">독서모임</a></li>


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
		</div>
	</header>
</body>

</html>