<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <link rel="icon" href="resources/img/Fevicon.png" type="image/png">
  <link rel="stylesheet" href="resources/vendors/bootstrap/bootstrap.min.css">
  <link rel="stylesheet" href="resources/vendors/fontawesome/css/all.min.css">
  <link rel="stylesheet" href="resources/vendors/themify-icons/themify-icons.css">
  <link rel="stylesheet" href="resources/vendors/nice-select/nice-select.css">
  <link rel="stylesheet" href="resources/vendors/owl-carousel/owl.theme.default.min.css">
  <link rel="stylesheet" href="resources/vendors/owl-carousel/owl.carousel.min.css">

  <link rel="stylesheet" href="resources/css/style.css">
  <link rel="stylesheet" href="resources/css/used.css">
  <script type="text/javascript" src="resources/js/seller.js"></script>
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet"
    id="bootstrap-css">
</head>
<body style="width: 1200px; margin: auto;">
      
  <!--================ 바디 =================-->
  <div class="mycontainer" style="width: 100% !important; padding:0px 0px 0px 0px !important; margin:0px 0px 0px 0px !important;">
    <div class="row">

      <!--================ 좌측 사이드바(도서 카테고리 선택) =================-->
      <div class="col-xl-2">
        <div class="sidebar-categories" style="text-align: center;">
          <div class="head category"><a href="ubookMain.ub">중고도서</a></div>
		  <div class="categorybody"><a href="ubookCategory.ub?ubCategory=1">소설/시/에세이</a></div>
		      	<div class="categorybody"><a href="ubookCategory.ub?ubCategory=2">경제/경영</a></div>
		      
		          <div class="categorybody"><a href="">과학</a></div>
		      <div class="categorybody"><a href="">인문</a></div>
		        <div class="categorybody"><a href="">컴퓨터/IT</a></div>
		        <div class="categorybody"><a href="">자기계발</a></div>
		        <div class="categorybody"><a href="">정치/사회</a></div>
		      <div class="categorybody"><a href="">역사/문화</a></div>
		       <div class="categorybody"><a href="">취미</a></div>
		       <div class="categorybody"><a href="">가정/육아</a></div>
		      
          <!--background-color: #c9ae9c;-->
        </div>
      </div>
      <!--================ End 좌측 사이드바(도서 카테고리 선택) =================-->


<c:if test="${ empty list }">

      <!--================ 메인 Content =================-->
      <div class="col-xl-9 col-lg-8 col-md-7 maincon">
        <div class="container">
          <div class="row">
            <div class="col-xs-12 mainslide">
              <nav>
                <div class="nav nav-tabs nav-fill" id="nav-tab" role="tablist">
                  <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab"
                    aria-controls="nav-home" aria-selected="true">Home</a>
                  <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab"
                    aria-controls="nav-profile" aria-selected="false">Profile</a>
                  <a class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab" href="#nav-contact" role="tab"
                    aria-controls="nav-contact" aria-selected="false">Contact</a>
                  <a class="nav-item nav-link" id="nav-about-tab" data-toggle="tab" href="#nav-about" role="tab"
                    aria-controls="nav-about" aria-selected="false">About</a>
                </div>
              </nav>
              <div class="tab-content py-3 px-3 px-sm-0" id="nav-tabContent">
                <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
                  <!--================ 도서 슬라이드 =================-->
                  <div class="container">
                    <div class="row">
                      <div class="col-md-12">
                        <div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="0">
                          <!-- 하단 슬라이드 페이지 표시 -->
                          <ol class="carousel-indicators">
                            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                            <li data-target="#myCarousel" data-slide-to="1"></li>
                            <li data-target="#myCarousel" data-slide-to="2"></li>
                          </ol>
                          <!-- 슬라이드 content -->
                          <div class="carousel-inner">
                            <div class="item carousel-item active">
                              <div class="row">
                                <div class="col-sm-3">
                                  <div class="thumb-wrapper">
                                    <div class="img-box">
                                      <img src="https://image.ibb.co/g0CAPp/ipad.jpg" class="img-responsive img-fluid"
                                        alt="">
                                    </div>
                                    <div class="thumb-content">
                                      <h4>Apple iPad</h4>
                                      <p class="item-price"><strike>$400.00</strike> <span>$369.00</span></p>
                                      <div class="star-rating">
                                        <ul class="list-inline">
                                          <li class="list-inline-item"><i class="fa fa-star"></i></li>
                                          <li class="list-inline-item"><i class="fa fa-star"></i></li>
                                          <li class="list-inline-item"><i class="fa fa-star"></i></li>
                                          <li class="list-inline-item"><i class="fa fa-star"></i></li>
                                          <li class="list-inline-item"><i class="fa fa-star-o"></i></li>
                                        </ul>
                                      </div>
                                      <a href="#" class="btn btn-primary">Add to Cart</a>
                                    </div>
                                  </div>
                                </div>
                                <div class="col-sm-3">
                                  <div class="thumb-wrapper">
                                    <div class="img-box">
                                      <img src="https://image.ibb.co/g0CAPp/ipad.jpg" class="img-responsive img-fluid"
                                        alt="">
                                    </div>
                                    <div class="thumb-content">
                                      <h4>Sony Headphone</h4>
                                      <p class="item-price"><strike>$25.00</strike> <span>$23.99</span></p>
                                      <div class="star-rating">
                                        <ul class="list-inline">
                                          <li class="list-inline-item"><i class="fa fa-star"></i></li>
                                          <li class="list-inline-item"><i class="fa fa-star"></i></li>
                                          <li class="list-inline-item"><i class="fa fa-star"></i></li>
                                          <li class="list-inline-item"><i class="fa fa-star"></i></li>
                                          <li class="list-inline-item"><i class="fa fa-star-o"></i></li>
                                        </ul>
                                      </div>
                                      <a href="#" class="btn btn-primary">Add to Cart</a>
                                    </div>
                                  </div>
                                </div>
                                <div class="col-sm-3">
                                  <div class="thumb-wrapper">
                                    <div class="img-box">
                                      <img src="https://image.ibb.co/g0CAPp/ipad.jpg" class="img-responsive img-fluid"
                                        alt="">
                                    </div>
                                    <div class="thumb-content">
                                      <h4>Macbook Air</h4>
                                      <p class="item-price"><strike>$899.00</strike> <span>$649.00</span></p>
                                      <div class="star-rating">
                                        <ul class="list-inline">
                                          <li class="list-inline-item"><i class="fa fa-star"></i></li>
                                          <li class="list-inline-item"><i class="fa fa-star"></i></li>
                                          <li class="list-inline-item"><i class="fa fa-star"></i></li>
                                          <li class="list-inline-item"><i class="fa fa-star"></i></li>
                                          <li class="list-inline-item"><i class="fa fa-star-half-o"></i></li>
                                        </ul>
                                      </div>
                                      <a href="#" class="btn btn-primary">Add to Cart</a>
                                    </div>
                                  </div>
                                </div>
                                <div class="col-sm-3">
                                  <div class="thumb-wrapper">
                                    <div class="img-box">
                                      <img src="https://image.ibb.co/g0CAPp/ipad.jpg" class="img-responsive img-fluid"
                                        alt="">
                                    </div>
                                    <div class="thumb-content">
                                      <h4>Nikon DSLR</h4>
                                      <p class="item-price"><strike>$315.00</strike> <span>$250.00</span></p>
                                      <div class="star-rating">
                                        <ul class="list-inline">
                                          <li class="list-inline-item"><i class="fa fa-star"></i></li>
                                          <li class="list-inline-item"><i class="fa fa-star"></i></li>
                                          <li class="list-inline-item"><i class="fa fa-star"></i></li>
                                          <li class="list-inline-item"><i class="fa fa-star-o"></i></li>
                                          <li class="list-inline-item"><i class="fa fa-star-o"></i></li>
                                        </ul>
                                      </div>
                                      <a href="#" class="btn btn-primary">Add to Cart</a>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                            <div class="item carousel-item">
                              <div class="row">
                                <div class="col-sm-3">
                                  <div class="thumb-wrapper">
                                    <div class="img-box">
                                      <img src="https://image.ibb.co/g0CAPp/ipad.jpg" class="img-responsive img-fluid"
                                        alt="">
                                    </div>
                                    <div class="thumb-content">
                                      <h4>Sony Play Station</h4>
                                      <p class="item-price"><strike>$289.00</strike> <span>$269.00</span></p>
                                      <div class="star-rating">
                                        <ul class="list-inline">
                                          <li class="list-inline-item"><i class="fa fa-star"></i></li>
                                          <li class="list-inline-item"><i class="fa fa-star"></i></li>
                                          <li class="list-inline-item"><i class="fa fa-star"></i></li>
                                          <li class="list-inline-item"><i class="fa fa-star"></i></li>
                                          <li class="list-inline-item"><i class="fa fa-star-o"></i></li>
                                        </ul>
                                      </div>
                                      <a href="#" class="btn btn-primary">Add to Cart</a>
                                    </div>
                                  </div>
                                </div>
                                <div class="col-sm-3">
                                  <div class="thumb-wrapper">
                                    <div class="img-box">
                                      <img src="https://image.ibb.co/g0CAPp/ipad.jpg" class="img-responsive img-fluid"
                                        alt="">
                                    </div>
                                    <div class="thumb-content">
                                      <h4>Macbook Pro</h4>
                                      <p class="item-price"><strike>$1099.00</strike> <span>$869.00</span></p>
                                      <div class="star-rating">
                                        <ul class="list-inline">
                                          <li class="list-inline-item"><i class="fa fa-star"></i></li>
                                          <li class="list-inline-item"><i class="fa fa-star"></i></li>
                                          <li class="list-inline-item"><i class="fa fa-star"></i></li>
                                          <li class="list-inline-item"><i class="fa fa-star"></i></li>
                                          <li class="list-inline-item"><i class="fa fa-star-half-o"></i></li>
                                        </ul>
                                      </div>
                                      <a href="#" class="btn btn-primary">Add to Cart</a>
                                    </div>
                                  </div>
                                </div>
                                <div class="col-sm-3">
                                  <div class="thumb-wrapper">
                                    <div class="img-box">
                                      <img src="https://image.ibb.co/g0CAPp/ipad.jpg" class="img-responsive img-fluid"
                                        alt="">
                                    </div>
                                    <div class="thumb-content">
                                      <h4>Bose Speaker</h4>
                                      <p class="item-price"><strike>$109.00</strike> <span>$99.00</span></p>
                                      <div class="star-rating">
                                        <ul class="list-inline">
                                          <li class="list-inline-item"><i class="fa fa-star"></i></li>
                                          <li class="list-inline-item"><i class="fa fa-star"></i></li>
                                          <li class="list-inline-item"><i class="fa fa-star"></i></li>
                                          <li class="list-inline-item"><i class="fa fa-star-o"></i></li>
                                          <li class="list-inline-item"><i class="fa fa-star-o"></i></li>
                                        </ul>
                                      </div>
                                      <a href="#" class="btn btn-primary">Add to Cart</a>
                                    </div>
                                  </div>
                                </div>
                                <div class="col-sm-3">
                                  <div class="thumb-wrapper">
                                    <div class="img-box">
                                      <img src="https://image.ibb.co/g0CAPp/ipad.jpg" class="img-responsive img-fluid"
                                        alt="">
                                    </div>
                                    <div class="thumb-content">
                                      <h4>Samsung Galaxy S8</h4>
                                      <p class="item-price"><strike>$599.00</strike> <span>$569.00</span></p>
                                      <div class="star-rating">
                                        <ul class="list-inline">
                                          <li class="list-inline-item"><i class="fa fa-star"></i></li>
                                          <li class="list-inline-item"><i class="fa fa-star"></i></li>
                                          <li class="list-inline-item"><i class="fa fa-star"></i></li>
                                          <li class="list-inline-item"><i class="fa fa-star"></i></li>
                                          <li class="list-inline-item"><i class="fa fa-star-o"></i></li>
                                        </ul>
                                      </div>
                                      <a href="#" class="btn btn-primary">Add to Cart</a>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                            <div class="item carousel-item">
                              <div class="row">
                                <div class="col-sm-3">
                                  <div class="thumb-wrapper">
                                    <div class="img-box">
                                      <img src="https://image.ibb.co/g0CAPp/ipad.jpg" class="img-responsive img-fluid"
                                        alt="">
                                    </div>
                                    <div class="thumb-content">
                                      <h4>Apple iPhone</h4>
                                      <p class="item-price"><strike>$369.00</strike> <span>$349.00</span></p>
                                      <div class="star-rating">
                                        <ul class="list-inline">
                                          <li class="list-inline-item"><i class="fa fa-star"></i></li>
                                          <li class="list-inline-item"><i class="fa fa-star"></i></li>
                                          <li class="list-inline-item"><i class="fa fa-star"></i></li>
                                          <li class="list-inline-item"><i class="fa fa-star"></i></li>
                                          <li class="list-inline-item"><i class="fa fa-star-o"></i></li>
                                        </ul>
                                      </div>
                                      <a href="#" class="btn btn-primary">Add to Cart</a>
                                    </div>
                                  </div>
                                </div>
                                <div class="col-sm-3">
                                  <div class="thumb-wrapper">
                                    <div class="img-box">
                                      <img src="https://image.ibb.co/g0CAPp/ipad.jpg" class="img-responsive img-fluid"
                                        alt="">
                                    </div>
                                    <div class="thumb-content">
                                      <h4>Canon DSLR</h4>
                                      <p class="item-price"><strike>$315.00</strike> <span>$250.00</span></p>
                                      <div class="star-rating">
                                        <ul class="list-inline">
                                          <li class="list-inline-item"><i class="fa fa-star"></i></li>
                                          <li class="list-inline-item"><i class="fa fa-star"></i></li>
                                          <li class="list-inline-item"><i class="fa fa-star"></i></li>
                                          <li class="list-inline-item"><i class="fa fa-star"></i></li>
                                          <li class="list-inline-item"><i class="fa fa-star-o"></i></li>
                                        </ul>
                                      </div>
                                      <a href="#" class="btn btn-primary">Add to Cart</a>
                                    </div>
                                  </div>
                                </div>
                                <div class="col-sm-3">
                                  <div class="thumb-wrapper">
                                    <div class="img-box">
                                      <img src="https://image.ibb.co/g0CAPp/ipad.jpg" class="img-responsive img-fluid"
                                        alt="">
                                    </div>
                                    <div class="thumb-content">
                                      <h4>Google Pixel</h4>
                                      <p class="item-price"><strike>$450.00</strike> <span>$418.00</span></p>
                                      <div class="star-rating">
                                        <ul class="list-inline">
                                          <li class="list-inline-item"><i class="fa fa-star"></i></li>
                                          <li class="list-inline-item"><i class="fa fa-star"></i></li>
                                          <li class="list-inline-item"><i class="fa fa-star"></i></li>
                                          <li class="list-inline-item"><i class="fa fa-star"></i></li>
                                          <li class="list-inline-item"><i class="fa fa-star-o"></i></li>
                                        </ul>
                                      </div>
                                      <a href="#" class="btn btn-primary">Add to Cart</a>
                                    </div>
                                  </div>
                                </div>
                                <div class="col-sm-3">
                                  <div class="thumb-wrapper">
                                    <div class="img-box">
                                      <img src="https://image.ibb.co/g0CAPp/ipad.jpg" class="img-responsive img-fluid"
                                        alt="">
                                    </div>
                                    <div class="thumb-content">
                                      <h4>Apple Watch</h4>
                                      <p class="item-price"><strike>$350.00</strike> <span>$330.00</span></p>
                                      <div class="star-rating">
                                        <ul class="list-inline">
                                          <li class="list-inline-item"><i class="fa fa-star"></i></li>
                                          <li class="list-inline-item"><i class="fa fa-star"></i></li>
                                          <li class="list-inline-item"><i class="fa fa-star"></i></li>
                                          <li class="list-inline-item"><i class="fa fa-star"></i></li>
                                          <li class="list-inline-item"><i class="fa fa-star-o"></i></li>
                                        </ul>
                                      </div>
                                      <a href="#" class="btn btn-primary">Add to Cart</a>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                          <!-- 화살표(왼/오) -->
                          <a class="carousel-control left carousel-control-prev" href="#myCarousel" data-slide="prev">
                            <i class="fa fa-angle-left"></i>
                          </a>
                          <a class="carousel-control right carousel-control-next" href="#myCarousel" data-slide="next">
                            <i class="fa fa-angle-right"></i>
                          </a>
                        </div>
                      </div>
                    </div>
                  </div>
                  <!--================ End 도서 슬라이드 =================-->
                </div>
              </div>
            </div>
          </div>
        </div>
        <main class="site-main">

          <br>
          <br>
          <!-- ================ 도서 검색 ================= -->
          <section class="subscribe-position">
            <div class="container">
              <div class="subscribe text-center">
                <h3 class="subscribe__title">내가 보고싶은 그 책!</h3>
                <p>지금 중고 매입가를 확인해보세요</p>
                <center>
                <!--검색-->
                <div class="row justify-content-center searchbar">
                  <div class="col-12 col-md-10 col-lg-8 searchbar">
                    <form class="card card-sm searchbar" action="ubookDetail.ub" method="post">
                      <div class="card-body row no-gutters align-items-center">
                        <!--검색 input-->
                        <div class="col">
                          <input class="form-control form-control-lg form-control-borderless" type="text"
                          	name="ubookNo"
                            placeholder="도서명 혹은 저자를 입력하세요">
                        </div>
                        <!--검색버튼-->
                        <div class="col-auto">
                          <button class="btn btn-lg searchbtn" type="submit">Search</button>
                        </div>
                      </div>
                    </form>
                  </div>
                </div>
              </center>
              </div>
            </div>
          </section>
          <!-- ================ End 도서검색 ================= -->

          <!-- ================ 판매자 버튼 ================= -->
          <div class="row sellerbtn">
          
          <!-- ================ 로그인 안했을 때 -> alert로 로그인 진행하게끔 ================= -->
              <c:if test="${ empty sessionScope.loginUser && empty s.sellerId }">
	            <section class="goseller">
	              <div class="container">
	              
	                <button class="gobtn text-center" type="button" onclick="loginChk();">
	                  <h3 class="subscribe__title">아직 판매자가 아니라면?</h3>
	                  <h4>로그인 먼저 진행 후 판매자 가입해주세요</h4>
	                </button>
	                <script type="text/javascript">
	                	function loginChk() {
								alert("책구메이트 로그인 혹은 회원가입을 우선 진행해주세요!");
								document.location.href="login.me";
						}
					</script>
	              </div>
	            </section>
	            <section class="goseller">
	              <div class="container">
	                <button class="gobtn text-center" onclick="loginChk();">
	                  <h3 class="subscribe__title">안읽는 책을 팔고싶다면?</h3>
	                  <h4>로그인 먼저 진행 후 판매자 가입해주세요</h4>
	                </button>
	              </div>
	            </section>
            </c:if>
          <!-- ================ 판매자 가입 안했을 때 =================-->
              <c:if test="${ !empty sessionScope.loginUser && empty s.sellerId }">
	            <section class="goseller">
	              <div class="container">
	                <button class="gobtn text-center" type="button" onclick="location.href='sellerInsertForm.se'">
	                  <h3 class="subscribe__title">아직 판매자가 아니라면?</h3>
	                  <h4>판매자 가입하기</h4>
	                </button>
	              </div>
	            </section>
	            <section class="goseller">
	              <div class="container">
	                <button class="gobtn text-center" onclick="location.href='sellerInsertForm.se'">
	                  <h3 class="subscribe__title">안읽는 책을 팔고싶다면?</h3>
	                  <h4>도서 등록하기</h4>
	                </button>
	              </div>
	            </section>	            
            </c:if>
          <!-- ================ 로그인도하고 판매자 가입도 된 상태일 때 ================= -->
              <c:if test="${ !empty s.sellerId && s.status eq 'Y' }">
	            <section class="goseller">
	              <div class="container">
	                <button class="gobtn text-center" type="button" onclick="location.href='sellerPage.se'">
	                  <h3 class="subscribe__title">${ s.sellerNickN }님 환영합니다</h3>
	                  <h4>판매자 페이지로 이동</h4>
	                </button>
	              </div>
	            </section>
	            <section class="goseller">
	              <div class="container">
	                <button class="gobtn text-center" onclick="location.href='sellerPage.se'">
	                  <h3 class="subscribe__title">안읽는 책을 팔고싶다면?</h3>
	                  <h4>도서 등록하기</h4>
	                </button>
	              </div>
	            </section>         
            </c:if>
          <!-- ================ 판매자 휴면한 상태일 때 ================= -->
              <c:if test="${ s.status eq 'N' }">
	            <section class="goseller">
	              <div class="container">
	                <button class="gobtn text-center" type="button" onclick="location.href='#'">
	                  <h3 class="subscribe__title">현재 판매자 계정이<br>휴면 상태입니다.</h3>
	                  <h4>고객센터에 휴면 해제를 요청해주세요.</h4>
	                </button>
	              </div>
	            </section>
	            <section class="goseller">
	              <div class="container">
	                <button class="gobtn text-center" onclick="location.href='#'">
	                  <h3 class="subscribe__title">현재 판매자 계정이<br>휴면 상태입니다.</h3>
	                  <h4>고객센터에 휴면 해제를 요청해주세요.</h4>
	                </button>
	              </div>
	            </section>         
            </c:if>
          </div>
        </main>
      </div>
</c:if>
<c:if test="${ !empty list }">
      <!--================ 메인 Content =================-->
      <div class="col-xl-9 col-lg-8 col-md-7 maincon">
        <section class="content">
			<input value="${ s.sellerNo }" name="sellerNo">
            <div>
				<div class="sorting" style="float: right;">
                    <select>
                    	<option value="1">가격 낮은 순</option>
                        <option value="2">가격 높은 순</option>
                        <option value="3">상태 좋은 순</option>
                	</select>
                </div>
			</div>
			<div class="col-md-offset-2 qnaTable">
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="table-container bookListF">
						<form id="myUbookListForm" action="" method="post">
						<c:if test="${ list[0].ubCategory eq 1 }">
							<h1 style="float: left;">소설/시/에세이</h1>
						</c:if>
							<table class="table table-filter" id="ubookListTb">
								<colgroup>
									<col width="45px" style="text-align: center;">
									<col width="150px" style="text-align: center;">
									<col width="150px" style="text-align: center;">
									<col width="90px" style="text-align: center;">
									<col width="110px" style="text-align: center;">
									<col width="60px" style="text-align: center;">
									<col width="60px" style="text-align: center;">
									<col width="130px" style="text-align: center;">
								</colgroup>
								<thead>
									<tr>
										<th class="fixedHeader">No</th>
										<th class="fixedHeader">표지</th>
										<th class="fixedHeader">제목</th>
										<th class="fixedHeader">저자</th>
										<th class="fixedHeader">가격</th>
										<th class="fixedHeader">재고</th>
										<th class="fixedHeader">상태</th>
										<th class="fixedHeader">구매</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach var="u" items="${ list }" varStatus="status">
									<tr data-status="pagado">
											<td>
												<div class="tbNo1">${status.index + 1 }</div>
											</td>
											<td>
												<div class="ubookImg">
													<img src="${pageContext.servletContext.contextPath }/resources/images/Ubookimg/${u.ubookImg }" class="media-photo" style="width: 145px; height: auto;">
												</div>
											</td>
											<td>
												<div class="tbNo1">
													<input name="ubookNo" hidden="hidden" value="${ u.ubookNo }"/>
													<a href="ubookDetailTest.ub?ubookNo=${ u.ubookNo }">${u.ubookName }</a>
												</div>
											</td>
											<td>
												<div class="tbNo1">${u.ubookWriter }</div>
											</td>
											<td>
												<div class="tbNo1">
													<del>${u.ubookOPrice }원</del>
													<br>
													<strong>${u.ubookPrice }원</strong>
												</div>
											</td>
											<td>
												<div class="tbNo1">${u.ubookStock }</div>
											</td>
											<td>
												<div class="tbNo1">
												<c:if test="${u.ubookQual eq 'S' }">
													<div style="background-color: red; color: white;">${u.ubookQual}</div>
												</c:if>
												<c:if test="${u.ubookQual eq 'A' }">
													<div style="background-color: orange;">${u.ubookQual}</div>
												</c:if>
												<c:if test="${u.ubookQual eq 'B' }">
													<div style="background-color: yellow;">${u.ubookQual}</div>
												</c:if>
												<c:if test="${u.ubookQual eq 'C' }">
													<div style="background-color: green; color: white;">${u.ubookQual}</div>
												</c:if>
												<c:if test="${u.ubookQual eq 'D' }">
													<div style="background-color: blue; color: white;">${u.ubookQual}</div>
												</c:if>
												
												</div>
											</td>
											<td>
												<c:if test="${ s.sellerNo eq u.BSellerNo }">
													<div class="tbNo1">
														<button style="background-color: #5cb85c; color:#ffffff; border:none; width: 100%; margin-bottom:10px; border-radius: 0.3rem;" onclick="updateUbook()">수정</button>
	                                        			<button class="btn-danger" style="border:none;width: 100%; border-radius: 0.3rem;" onclick="deleteUbook()">삭제</button>
                                        			</div>
												</c:if>
												<c:if test="${ empty s.sellerNo || s.sellerNo ne u.BSellerNo }">
													<div class="tbNo1">
														<button style="background-color: #5cb85c; color:#ffffff; border:none; width: 100%; margin-bottom:10px; border-radius: 0.3rem;" onclick="updateUbook()">장바구니</button>
	                                        			<button style="background-color: #5b8a5b; color:#ffffff; border:none;width: 100%; border-radius: 0.3rem;" onclick="deleteUbook()">바로구매</button>
													</div>
												</c:if>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</form>
						</div>
					</div>
				</div>
			</div>
		</section>
      </div>
</c:if>
    </div>
  </div>
</body>
</html>