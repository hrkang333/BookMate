<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <meta http-equiv="X-UA-Compatible" content="ie=edge">
            <title>[책장메이트] - 온라인 중고도서장터</title>
            <link rel="icon" href="resources/img/Fevicon.png" type="image/png">
            <link rel="stylesheet" href="resources/vendors/bootstrap/bootstrap.min.css">
            <link rel="stylesheet" href="resources/vendors/fontawesome/css/all.min.css">
            <link rel="stylesheet" href="resources/vendors/themify-icons/themify-icons.css">
            <link rel="stylesheet" href="resources/vendors/owl-carousel/owl.theme.default.min.css">
            <link rel="stylesheet" href="resources/vendors/owl-carousel/owl.carousel.min.css">

            <link rel="stylesheet" href="resources/css/style.css">
            <link rel="stylesheet" href="resources/css/used.css">

            <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet"
                id="bootstrap-css">
            <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

            <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css"
                integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt"
                crossorigin="anonymous">
        </head>

        <body style="width: 1200px; margin: auto;">
            <!--================ 헤더(로고 + 검색 + 로그인 된 회원) =================-->
            <header class="header_area">
                <div class="main_menu" style="background-color: #f8f9fa !important;">
                    <nav class="navbar navbar-expand-lg navbar-light" style="margin-bottom: 0px !important;">
                        <div class="container" style="padding-right: 55px;">
                            <!--로고링크-->
                            <a href="home.us" class="logo_link">
                                <img src="resources/img/logo1.png" class="logo1">
                            </a>
                            <a href="ubookMain.ub" class="logo_link2">
                                <img src="resources/img/logo2.png" class="logo2">
                            </a>
                            <br />
                            <!--검색-->
                                    <form class="card card-sm searchbar" style="background-color: #f8f9fa !important; width: 360px;">
                                        <div class="card-body row no-gutters align-items-center">
                                            <!--검색 input-->
                                            <div class="col">
                                                <input class="form-control form-control-lg form-control-borderless"
                                                    type="search" placeholder="도서명 혹은 저자를 입력하세요">
                                            </div>
                                            <!--검색버튼-->
                                            <div class="col-auto">
                                                <button class="btn btn-lg searchbtn" type="submit">Search</button>
                                            </div>
                                        </div>
                                    </form>
                            <!--로그인 회원정보-->
                            <c:if test="${ empty sessionScope.loginUser }">
                                <a href="register.me">회원가입</a> |
                                <br>
                                <a href="login.me"">로그인</a> |
		      					<a href=" findId.us">아이디찾기</a>
                            </c:if>

                            <!-- 로그인 후  -->
                            <c:if test="${ !empty sessionScope.loginUser }">
                                <label>${ sessionScope.loginUser.userName }님</label>
                                <c:if test="${ !empty s.sellerId && s.status eq 'Y' }">
                                |
                                <a href="sellerPage.se">판매자 페이지</a>
                                </c:if>
                                |
                                <a href="myPage.me">마이페이지</a>
                                |
                                <a href="logout.us">로그아웃</a>
                            </c:if>
                            <br />
                        </div>
                    </nav>
                </div>
            </header>
        </body>

        </html>