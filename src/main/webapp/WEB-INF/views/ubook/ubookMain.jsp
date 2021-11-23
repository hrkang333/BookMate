<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>[책장메이트] 책장메이트 메인</title>

<link rel="icon" href="resources/img/logo1.png" type="image/png">
</head>

<body style="width: 1200px; margin: auto;">

  <!--================ 바디 =================-->
  <div class="f" style="width: 1200px;">
    <div class="row">
 	<jsp:include page="../ubook/ubookCategory.jsp"/>

      <!--================ 메인 Content =================-->
      <div class="col-xl-9 col-lg-8 col-md-7 maincon" style="margin-left: 205px; width: 1060px;">
        <div class="container" style="padding-top: 100px;">
          <div class="row">
            <div class="col-xs-12 mainslide">
              <nav style="width: 900px; margin-left: -15px; margin-top: -8px; height: 70px; background-color: #915549; color: #fff; text-align: center;">
                <div id="nav-tab" role="tablist" style="padding-top: 20px;">
                  	책장메이트에 등록된 도서
                </div>
              </nav>
              <div class="tab-content py-3 px-3 px-sm-0" id="nav-tabContent">
                <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
                  <!--================ 도서 슬라이드 =================-->
                  <div class="container" style="padding-top: 20px; width: 870px;">
                    <div class="row">
                      <div class="col-md-12" style="background-color: #fff; border-radius: 15px;">
				   		<c:if test="${fn:length(randomBookList) > 8}">
                        <div id="myCarousel" class="carousel slide" data-ride="carousel" style="padding : 0 0 0 0px !important;">
                          <!-- 하단 슬라이드 페이지 표시 -->
                          <ol class="carousel-indicators">
                            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                            <li data-target="#myCarousel" data-slide-to="1"></li>
                            <li data-target="#myCarousel" data-slide-to="2"></li>
                          </ol>
                          <!-- 슬라이드 content -->
                          <div class="carousel-inner">
                            	<c:forEach var="i" begin="0" end="${fn:length(randomBookList)-1}" step="8">
                            	<c:choose>
                            			<c:when test="${i eq 0}">
                            				<c:set var="activeD" value="carousel-item active"/>
                            			</c:when>
                            			<c:otherwise>
                            				<c:set var="activeD" value="carousel-item"/>
                            			</c:otherwise>
                            		</c:choose>
                            <div class="${activeD}">
                              <div class="row">
	                			<c:forEach items="${randomBookList}" var="list" begin="${i}" end="${i+7}">
                                <div class="col-sm-3">
                                  <div class="card text-center card-product"style="width:180px; height: 350px; background-color: #fbf5f5;" onclick="location.href='ubookDetailTest.ub?ubookNo=${ list.ubookNo }&bSellerNo=${ list.BSellerNo}'">
                                    <div class="img-box">
                                      <img src="${pageContext.servletContext.contextPath }/resources/images/Ubookimg/${list.ubookImg }" class="media-photo"
                                       style="width: 145px; height: 215px; cursor: pointer; padding-top: 20px;"
                                        alt="">
                                    </div>
                                    <div class="thumb-content">
                                      <h4>${list.ubookName }</h4>
                                      <p class="item-price"><strike>${list.ubookOPrice }원</strike> <span>${list.ubookPrice }원</span></p>
                                      <span class="grade_s"
												style="font-size: 11px; line-height: 15px; display: inline-block; padding: 0px 2px 0px; background-color: #d4ddf8; border: 1px solid #00006d; color: #00006d;">
												<c:if test="${ list.ubookQual == 'S' }">
													<c:out value="최상">최상</c:out>
												</c:if>
												<c:if test="${ list.ubookQual == 'A' }">
													<c:out value="상급">상급</c:out>
												</c:if>
												<c:if test="${ list.ubookQual == 'B' }">
													<c:out value="보통">보통</c:out>
												</c:if>
												<c:if test="${ list.ubookQual == 'C' }">
													<c:out value="하급">하급</c:out>
												</c:if>
												<c:if test="${ list.ubookQual == 'D' }">
													<c:out value="최하">최하</c:out>
												</c:if>
												</span>
                                    </div>
                                  </div>
                                </div>
                                </c:forEach>
                              </div>
                            </div>
                            </c:forEach>
                          </div>
                        </div>
                        </c:if>
                      </div>
                    </div>
                  </div>
                  <!--================ End 도서 슬라이드 =================-->
                </div>
              </div>
            </div>
          </div>
        </div>
        <main class="site-main" style="padding-bottom: 50px;">

          <br>
          <br>
          <!-- ================ 도서 검색 ================= -->
          <section class="">
            <div class="container">
              <div class="subscribe text-center" style="background-color:#d1e7d1; border-radius: 15px; box-shadow: none !important; height: 320px;">
                <div class="row sellerbtn">
          
          <!-- ================ 로그인 안했을 때 -> alert로 로그인 진행하게끔 ================= -->
              <c:if test="${ empty sessionScope.loginUser && empty s.sellerId }">
	            <section class="goseller">
	              <div class="container">
	              
	                <button class="gobtn text-center" type="button" onclick="loginChk();">
	                  <h3 class="subscribe__title">아직 판매자가<br>아니라면?</h3>
	                  <h4>로그인을 하신 후에 판매자 가입해주세요</h4>
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
	                  <h3 class="subscribe__title">안읽는 책을<br>팔고싶다면?</h3>
	                  <h4>로그인을 하신 후에 판매자 가입해주세요</h4>
	                </button>
	              </div>
	            </section>
            </c:if>
          <!-- ================ 판매자 가입 안했을 때 =================-->
              <c:if test="${ !empty sessionScope.loginUser && empty s.sellerId }">
	            <section class="goseller">
	              <div class="container">
	                <button class="gobtn text-center" type="button" onclick="location.href='sellerInsertForm.se'">
	                  <h3 class="subscribe__title">아직 판매자가<br>아니라면?</h3>
	                  <h4>판매자 가입하기</h4>
	                </button>
	              </div>
	            </section>
	            <section class="goseller">
	              <div class="container">
	                <button class="gobtn text-center" onclick="location.href='sellerInsertForm.se'">
	                  <h3 class="subscribe__title">안읽는 책을<br>팔고싶다면?</h3>
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
	                  <h3 class="subscribe__title">안읽는 책을<br>팔고싶다면?</h3>
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
              </div>
            </div>
          </section>
          <!-- ================ End 도서검색 ================= -->

        </main>
      </div>
    </div>
  </div>
 	<jsp:include page="../common/footer.jsp"/>
</body>

</html>