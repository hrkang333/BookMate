<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<!-- 11.07
	디자인 수정 필요
	이력 화면에 나타내기 필요 -->

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>독서모임 - 상세페이지</title>
    <link rel="icon" href="resources/img/Fevicon.png" type="image/png">
    <link rel="stylesheet" href="resources/vendors/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="resources/vendors/fontawesome/css/all.min.css">
    <link rel="stylesheet" href="resources/vendors/themify-icons/themify-icons.css">
    <link rel="stylesheet" href="resources/vendors/linericon/style.css">
    <link rel="stylesheet" href="resources/vendors/nice-select/nice-select.css">
    <link rel="stylesheet" href="resources/vendors/owl-carousel/owl.theme.default.min.css">
    <link rel="stylesheet" href="resources/vendors/owl-carousel/owl.carousel.min.css">

    <link rel="stylesheet" href="resources/css/style.css">

    <style>
        .total p {
            padding-top: 0px !important;
            border-top: 0px !important;
            border-bottom: 0px !important;
            margin-top: 0px !important;
            padding-bottom: 0px !important;
        }
        
        .times {
            border: 1px solid #bebebe;
            display: flex;
            align-items: center;
            width: 80%;
        }
        
        .left {
            flex: 0 0 auto;
            margin: 20px;
        }
        
        .right {
            flex: 1 1 auto;
            display: flex;
        }
        
        .applys {
            zoom: 1.5;
            margin: auto;
        }
        
        .detail_title1 {
            font-size: 26px;
            font-weight: 900;
            color: #FFAE42;
        }
        
        .detail_title2 {
            font-size: 19px;
            font-weight: bold;
        }
        /*div 반으로 나누기*/
        
        .left_1 {
            width: 20%;
            float: left;
            box-sizing: border-box;
            margin-left: 5%;
    		margin-top: 3%;
        }
        
        .right_1 {
            width: 60%;
            padding-top: 4%;
            box-sizing: border-box;
        }
    </style>
</head>

<body style="width:1200px; margin:auto">
    
    <jsp:include page="../club/clubMenubar.jsp"/>
    
    <!--================ 독서모임 디테일 =================-->
    <div class="product_image_area">
        <div class="container">
            <div class="row s_product_inner">
                <div class="col-lg-5">
                    <div>
                        <div class="single-prd-item">
                        	<c:forEach var="ca" items="${club.clubAttachments}">
                        		<c:if test="${ca.fileType eq 2}">
                        			<img class="img-fluid" src="resources/upload_files/club_img/${ca.changeName}" alt="">
                        		</c:if>         		
                        	</c:forEach> 
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 offset-lg-1">
                    <div class="s_product_text total" style="margin-top:0px">
                        <h3 style="font-size: 37px;">${club.clubTitle}</h3>
                        <h2 style="font-size: 17px;">#${club.category} &nbsp; #${club.onoffLine} &nbsp; #${club.times} </h2>

						<c:forEach var="ct" items="${club.clubTimes}">
							<div class="times">
                            <div class="left">
                                <p class="time">
                                    <span>
                                    	<fmt:parseDate var="clubD" value="${ct.clubDate}" pattern="yyyy-MM-dd" /> <!-- string -> Date로 -->	
										<fmt:parseDate value="${ct.clubDate}" var="dateK" pattern="yyyy-MM-dd"/>
										<fmt:formatDate value="${dateK}" pattern="yyyy년 MM월 dd일"/>
                                    	(<fmt:formatDate value="${clubD}" pattern="E"/>)
                                    	</span>
                                    <span>|</span>
                                    <span>${ct.startTime} ~ ${ct.endTime}</span>
                                </p>
                                <p class="apply" style="display:flex">
                                    <span style="margin-left: auto;">신청 2 / 정원 ${club.clubCapacity}</span>
                                </p>
                            </div>
                            <div class="right">
                            	<c:if test="${club.times eq '한 번 만나요'}">
                            		<input type="checkbox" class="applys">
                            	</c:if>
                            </div>
                        </div>
						</c:forEach>


                        <div class="product_count">
                            <a class="button primary-btn" href="#">찜하기</a>
                            <a class="button primary-btn" href="#">신청하기</a>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--================End Single Product Area =================-->

    <br><br>
    <hr>
    <br>

    <section class="club_detail">
        <div class="container">
            <!-- <div class="datail_first" style="width: 100%; height: 200px; background-color: darksalmon;">
                <span>독서모임 제목</span>
            </div> -->

            <div class="detail_club">
                <h4 class="detail_title1">모임 소개</h4>
                <span><c:out value="${club.intro}"/></span>
				<br><br>
				
                <h5 class="detail_title2">우리모임에서 할 활동들</h5>
                <p><c:out value="${club.intro}"/></p>
                <h5 class="detail_title2">이런 멤버들을 만나고 싶어요</h5>
                <p><c:out value="${club.want}"/></p>
                <h5 class="detail_title2">이런 분과는 맞지 않아요</h5>
                <p><c:out value="${club.notwant}"/></p>

            </div>

            <div class="detail_onoff">
                <h4 class="detail_title1">참여 안내</h4>
                <p> 이 모임은 [<c:out value="${club.times}"/>]</p>

                <h5 class="detail_title2">모임 일정</h5>
                <p>
                	<ul>
	                	<c:forEach var="ct" items="${club.clubTimes}">
	                			<li>
	                				<fmt:parseDate var="clubD" value="${ct.clubDate}" pattern="yyyy-MM-dd" /> <!-- string -> Date로 -->	
									<fmt:parseDate value="${ct.clubDate}" var="dateK" pattern="yyyy-MM-dd"/>
									<fmt:formatDate value="${dateK}" pattern="yyyy년 MM월 dd일"/>
                                    (<fmt:formatDate value="${clubD}" pattern="E"/>)
                                    | ${ct.startTime} ~ ${ct.endTime}
	                			</li>
	                			<li></li>
	                	</c:forEach>
                	</ul>
                </p>
                <h5 class="detail_title2">장소</h5>
                <p><c:out value="${club.onoffLine}"/></p>
                <h5 class="detail_title2">모집 정원</h5>
                <p><c:out value="${club.clubCapacity}"/>명</p>

            </div>

            <div class="detail_book">
                <h4 class="detail_title1">함께 읽을 책 소개</h4>

                <div style="width: 100%; height: 270px; background-color: darksalmon;">
                    <div class="left_1">
                        <c:forEach var="ca" items="${club.clubAttachments}">
                        	<c:if test="${ca.fileType eq 3}">
                        		<img class="img-fluid" src="resources/upload_files/club_img/${ca.changeName}" style="height:200px;" alt="">
                        	</c:if>         		
                    	</c:forEach>
                    </div>

                    <div class="right_1">
                        <p><c:out value="${club.bkName}"/></p>
                        <p><c:out value="${club.bkWriter}"/></p>
                        <p><c:out value="${club.bkPublisher}"/></p>
                    </div>

                </div>

            </div>

            <div class="detail_host">
                <h4 class="detail_title1">Host 소개</h4>
                	<c:forEach var="ca" items="${club.clubAttachments}">
                        <c:if test="${ca.fileType eq 1}">
                        	<img class="img-fluid" src="resources/upload_files/club_img/${ca.changeName}" alt="">
                        </c:if>         		
                    </c:forEach>
                <h5><c:out value="${club.hostName}"/></h5>

                <h5 class="detail_title2">약력</h5>
                <P><c:out value="${club.clubCapacity}"/></P>
                <h5 class="detail_title2">Comment</h5>
                <p><c:out value="${club.hostComment}"/></p>

            </div>

            <div class="detail_notice">
                <h4 class="detail_title1">책구메이트 독서모임 안내</h4>

                <ol style="padding-left: 20px;">
                    <li>모임 신청 후 취소는 모임 전 이틀 전까지 가능합니다.</li>
                    <li>온라인 독서모임의 경우 모임시간 15분 전 호스트가 줌 주소를 전송할 것입니다.</li>
                    <li>독서모임을 통해 모두 즐거운 시간을 보낼 수 있도록 서로 배려 부탁드립니다.</li>
                </ol>

            </div>
        </div>
    </section>

    <!--================ Start footer Area  =================-->
    <footer>
        <div class="footer-area footer-only">
            <div class="container">
                <div class="row section_gap">
                    <div class="col-lg-3 col-md-6 col-sm-6">
                        <div class="single-footer-widget tp_widgets ">
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

        <div class="footer-bottom">
            <div class="container">
                <div class="row d-flex">
                    <p class="col-lg-12 footer-text text-center">
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                        Copyright &copy;
                        <script>
                            document.write(new Date().getFullYear());
                        </script> All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                    </p>
                </div>
            </div>
        </div>
    </footer>
    <!--================ End footer Area  =================-->



    <script src="resources/vendors/jquery/jquery-3.2.1.min.js"></script>
    <script src="resources/vendors/bootstrap/bootstrap.bundle.min.js"></script>
    <script src="resources/vendors/skrollr.min.js"></script>
    <script src="resources/vendors/owl-carousel/owl.carousel.min.js"></script>
    <script src="resources/vendors/nice-select/jquery.nice-select.min.js"></script>
    <script src="resources/vendors/jquery.ajaxchimp.min.js"></script>
    <script src="resources/vendors/mail-script.js"></script>
    <script src="resources/js/main.js"></script>
</body>

</html>