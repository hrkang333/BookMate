<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>책구메이트-독서모임</title>
    <link rel="icon" href="resources/img/Fevicon.png" type="image/png">
    <link rel="stylesheet" href="resources/vendors/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="resources/vendors/fontawesome/css/all.min.css">
    <link rel="stylesheet" href="resources/vendors/themify-icons/themify-icons.css">
    <link rel="stylesheet" href="resources/vendors/nice-select/nice-select.css">
    <link rel="stylesheet" href="resources/vendors/owl-carousel/owl.theme.default.min.css">
    <link rel="stylesheet" href="resources/vendors/owl-carousel/owl.carousel.min.css">

    <link rel="stylesheet" href="resources/css/style.css">
    
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

    <style>
       .searchBox {
            padding: 30px;
        }
        
        .searchBox ul {
            margin-bottom: 30px;
            width: 100%;
            display: flex;
        }
        
        .searchBox li:first-child {
            width: 15%;
        }
        
        .searchBox li {
            width: 80%;
        }
        
        .type_wrap {
            display: flex;
        }
    </style>
</head>

<body style="width:1200px; margin:auto">
    
    <jsp:include page="../club/clubMenubar.jsp"/>

    <main class="site-main">
  
	    
	        <div class="container">
	            <div class="billing_details">
	
	                <div class="col-lg-12" style="margin-bottom: 50px;">
	                    <h3 style="font-size: 30px; ">나에게 맞는 독서 모임을 선택해 보세요!</h3>
	                </div>
	
	                <div class="searchBox" style="background-color: #FAFAD2">
	                    <form id="searchForm" action="">
	                        <ul>
	                            <li>지역</li>
	                            <li>
	                                <div class="type_wrap">
	                                    <input id="s1_1" type="checkbox" value="온라인">
	                                    <div><label for="s1_1">온라인</label></div>
	                                    <input id="s1_2" type="checkbox" value="오프라인">
	                                    <div><label for="s1_2">오프라인</label></div>
	                                </div>
	                            </li>
	                        </ul>
	                        <ul>
	                            <li>독서모임 테마</li>
	                            <li>
	                                <div class="type_wrap">
	                                    <input id="s2_1" type="checkbox" value="인문/과학/심리">
	                                    <div><label for="s2_1">인문/과학/심리</label></div>
	                                    <input id="s2_2" type="checkbox" value="문학/에세이">
	                                    <div><label for="s2_2">문학/에세이</label></div>
	                                    <input id="s2_3" type="checkbox" value="예술/음악">
	                                    <div><label for="s2_3">예술/음악</label></div>
	                                    <input id="s2_4" type="checkbox" value="경영/경제/마케팅">
	                                    <div><label for="s2_4">경영/경제/마케팅</label></div>
	                                    <input id="s2_5" type="checkbox" value="글쓰기">
	                                    <div><label for="s2_5">글쓰기</label></div>
	                                    <input id="s2_6" type="checkbox" value="강연">
	                                    <div><label for="s2_6">강연</label></div>
	                                </div>
	                            </li>
	                        </ul>
	                        <ul>
	                            <li>독서모임 횟수</li>
	                            <li>
	                                <div class="type_wrap">
	                                    <input id="s3_1" type="checkbox" value="한 번 만나요">
	                                    <div><label for="s3_1">한 번 만나요</label></div>
	                                    <input id="s3_2" type="checkbox" value="여러 번 만나요">
	                                    <div><label for="s3_2">여러 번 만나요</label></div>
	                                </div>
	                            </li>
	                        </ul>
	                        <ul>
	                            <li>독서모임 기간</li>
	                            <li>
	                                <div class="type_wrap">
	                                    <div><label for="s3_1">시작</label></div>
	                                    <input id="s3_1" type="date"> ~
	                                    <div><label for="s3_2">끝</label></div>
	                                    <input id="s3_3" type="date">
	                                </div>
	                            </li>
	                        </ul>
	                        <div style="text-align: right;">
	                            <input type="search"> <button>검색</button>
	                        </div>
	                    </form>
	                </div>
	            </div>
	        </div>
	    
	    
	    <section id="clubs">
	    	<c:if test="${fn:length(clubList) == 0}">
		   		<div class="row" id="categoryList1">해당카테고리에 독서모임은 없습니다.</div>
			</c:if>
			<c:if test="${fn:length(clubList)>0}">
				<div class="row" id="categoryList">
					<c:forEach items="${clubList}" var="club" varStatus="s">
						<div id="c_clubTotal${s.index}">
							<input id="c_clubNo${s.index}" type="hidden" value="${club.clubNo}">
							<div class="card card-blog">
								<div class="card-blog__img">
									<div class="titleBackImg" style="background-image: url('${pageContext.servletContext.contextPath }/resources/upload_files/club_img/${ca.changeName}')"></div>
								</div>
								<div class="card-body">
									<ul class="card-blog__info">
										<li>
											<span id="c_category${s.index}"><c:out value="${club.category}"/></span> &nbsp; 
											<span id="c_onoffLine${s.index}">[<c:out value="${club.onoffLine}"/>]</span>
										</li>
										<li>
											<i class="ti-comments-smiley"></i> <c:out value="${club.heartCount}"/> Likes
										</li>
									</ul>
									<h4 id="c_title${s.index}" class="card-blog__title"><c:out value="${club.clubTitle}"/></h4>
									<p><span id="c_intro${s.index}"> 독서모임 소개 독서모임 소개 독서모임 소개독서모임 소개 독서모임 소개 독서모임 소개</span></p>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</c:if>
	    </section>
    	
    </main>

    <!--================ Start footer Area  =================-->
    <footer class="footer">
        <div class="footer-area">
            <div class="container">
                <div class="row section_gap">
                    <div class="col-lg-3 col-md-6 col-sm-6">
                        <div class="single-footer-widget tp_widgets">
                            <h4 class="footer_title large_title">Our Mission</h4>
                            <p>
                                So seed seed green that winged cattle in. Gathering thing made fly you're no divided deep moved us lan Gathering thing us land years living.
                            </p>
                            <p>
                                So seed seed green that winged cattle in. Gathering thing made fly you're no divided deep moved
                            </p>
                        </div>
                    </div>
                    <div class="offset-lg-1 col-lg-2 col-md-6 col-sm-6">
                        <div class="single-footer-widget tp_widgets">
                            <h4 class="footer_title">Quick Links</h4>
                            <ul class="list">
                                <li><a href="#">Home</a></li>
                                <li><a href="#">Shop</a></li>
                                <li><a href="#">Blog</a></li>
                                <li><a href="#">Product</a></li>
                                <li><a href="#">Brand</a></li>
                                <li><a href="#">Contact</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-6 col-sm-6">
                        <div class="single-footer-widget instafeed">
                            <h4 class="footer_title">Gallery</h4>
                            <ul class="list instafeed d-flex flex-wrap">
                                <li><img src="img/gallery/r1.jpg" alt=""></li>
                                <li><img src="img/gallery/r2.jpg" alt=""></li>
                                <li><img src="img/gallery/r3.jpg" alt=""></li>
                                <li><img src="img/gallery/r5.jpg" alt=""></li>
                                <li><img src="img/gallery/r7.jpg" alt=""></li>
                                <li><img src="img/gallery/r8.jpg" alt=""></li>
                            </ul>
                        </div>
                    </div>
                    <div class="offset-lg-1 col-lg-3 col-md-6 col-sm-6">
                        <div class="single-footer-widget tp_widgets">
                            <h4 class="footer_title">Contact Us</h4>
                            <div class="ml-40">
                                <p class="sm-head">
                                    <span class="fa fa-location-arrow"></span> Head Office
                                </p>
                                <p>123, Main Street, Your City</p>

                                <p class="sm-head">
                                    <span class="fa fa-phone"></span> Phone Number
                                </p>
                                <p>
                                    +123 456 7890 <br> +123 456 7890
                                </p>

                                <p class="sm-head">
                                    <span class="fa fa-envelope"></span> Email
                                </p>
                                <p>
                                    free@infoexample.com <br> www.infoexample.com
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="footer-bottom ">
            <div class="container ">
                <div class="row d-flex ">
                    <p class="col-lg-12 footer-text text-center ">
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                        Copyright &copy;
                        <script>
                            document.write(new Date().getFullYear());
                        </script> All rights reserved | This template is made with <i class="fa fa-heart " aria-hidden="true "></i> by <a href="https://colorlib.com " target="_blank ">Colorlib</a>
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                    </p>
                </div>
            </div>
        </div>
    </footer>
    <!--================ End footer Area  =================-->



    <script src="resources/vendors/jquery/jquery-3.2.1.min.js "></script>
    <script src="resources/vendors/bootstrap/bootstrap.bundle.min.js "></script>
    <script src="resources/vendors/skrollr.min.js "></script>
    <script src="resources/vendors/owl-carousel/owl.carousel.min.js "></script>
    <script src="resources/vendors/nice-select/jquery.nice-select.min.js "></script>
    <script src="resources/vendors/jquery.ajaxchimp.min.js "></script>
    <script src="resources/vendors/mail-script.js "></script>
    <script src="resources/js/main.js "></script>
    
</body>

</html>