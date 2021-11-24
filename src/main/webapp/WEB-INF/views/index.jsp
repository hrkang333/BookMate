<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ page session="false"%> --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>책구메이트</title>

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

<style>
	#recentViewDiv{
		position: fixed;
		left: 50%;
		transform: translate(630px, 0);
		margin-top: 5px;
		text-align: center;
	}
	
	#recentViewDiv_1{
		width: 100%;
	    height: 6%;
	    background-color: #505050;
	    color: white;
    	
    	line-height: 40px;
	}
	#recentViewDiv_3{
		position: absolute;
	    bottom: 10px;
	    left: 50%;
    	transform: translate(-50%);
	}
	.bestUl{
		display: flex;
    	flex-wrap: wrap; 
	}
	.bestImg{
		width: 125px;
	    height: 180px;
	    margin-bottom: 5px;
	    cursor: pointer;
	    border: 1px solid #a9a9a9;
	}
	.bestUl li{
		margin: 40px 8px;
		text-align: center;
		margin-bottom: 0px;
	}
	.bestTitle{
		width: 190px;
	    font-size: 19px;
	    font-weight: 900;
	}
	#bestDiv_2{
		position: absolute;
	    left: 50%;
    	transform: translate(-50%);
	}
</style>
</head>
<body>
	<jsp:include page="common/menubar.jsp" />
	
	<script>
		$(function(){
			var userId = '${sessionScope.loginUser.userId}'
			if(userId == ''){
				$('#recentViewDiv').css('display','none');
			}else{
				$('#recentViewDiv').css('display','block');
			}
		})
		
		function goReview(pg, length){
			for(var i=1; i<=length; i++){
				var index = (i-1)*4;
				if(i == pg){
					$('#recentDetail'+index).css('display','block');
				}else{
					$('#recentDetail'+index).css('display','none');
				}
			}
		}
		
		function goBest(pg, length){
			for(var i=1; i<=length; i++){
				var index = (i-1)*10;
				if(i == pg){
					$('#bestDetail'+index).css('display','flex');
				}else{
					$('#bestDetail'+index).css('display','none');
				}
			}
		}
		
		function moveDetail(bookISBN){
			$('#moveDetailInput').val(bookISBN)
			$('#moveDetailForm').submit();
		}
	</script>
	
	<form action="selectBook.book" method="post" id="moveDetailForm">
		<input type="hidden" id="moveDetailInput" name="bookISBN">
	</form>
	
	<main class="site-main" style="padding-top: 180px">
	
		<div id="recentViewDiv" style="width: 150px; height: 650px; background-color: #F5F5F5;">
			<div id="recentViewDiv_1">최근 본 상품 (<span style="color:red">${fn:length(viewList)}</span>)</div>
			
			<c:if test="${fn:length(viewList) != 0}">
			
				<div id="recentViewDiv_2">
					<c:set var="length" value="0"/>
					<c:forEach var="i" begin="0" end="${fn:length(isbnList)-1}" step="4">
						<ul id="recentDetail${i}" <c:if test="${i != 0}"> style="display:none" </c:if> >
							<c:forEach begin="${i}" end="${i+3}" items="${isbnList}" var="isbn">
								<li>
									<c:forEach var="book" items="${viewList}">
										<c:if test="${book.bookISBN eq isbn }">
											<img src="${pageContext.servletContext.contextPath }/resources/images/book_img/${book.bookMainImg}" class="media-photo"
											style="width: 90px; height: 140px; cursor: pointer; padding-top: 20px;" 
											onclick="moveDetail('${book.bookISBN}')" alt="">
										</c:if>
									</c:forEach>
								</li>
							</c:forEach>
						</ul>
						<c:set var="length" value="${length+1}"/>
					</c:forEach>
				</div>
				<div id="recentViewDiv_3" style="cursor: pointer">
					<c:forEach var="pg" begin="1" end="${length}"> 
						<a onclick="goReview(${pg}, ${length})">${pg}</a>
					</c:forEach>
				</div>
			</c:if>
		</div>
		

		<!--================ 이벤트 슬라이드 start =================-->
		<section class="hero-banner2">
			<div class="container2">
				<div id="myCarousel" class="carousel slide" data-ride="carousel">
					<!-- 하단 슬라이드 페이지 표시 -->
					<ol class="carousel-indicators">
						<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
						<li data-target="#myCarousel" data-slide-to="1"></li>
						<li data-target="#myCarousel" data-slide-to="2"></li>
						<li data-target="#myCarousel" data-slide-to="3"></li>
					</ol>
					<!-- 슬라이드 content -->
					<div class="carousel-inner">
						<c:forEach var="i" begin="0" end="1" step="2">
							<c:choose>
								<c:when test="${i eq 0}">
									<c:set var="activeD" value="carousel-item active" />
									<c:set var="activeA" value="carousel-item" />
									<c:set var="activeB" value="carousel-item" />
									<c:set var="activeC" value="carousel-item" />
								</c:when>
								<c:otherwise>
									<c:set var="activeD" value="carousel-item" />
									<c:set var="activeA" value="carousel-item active" />
									<c:set var="activeB" value="carousel-item" />
									<c:set var="activeC" value="carousel-item" />
								</c:otherwise>
							</c:choose>
							<div class="${activeD}">
								<img src="resources/img/main/001.png"
									style="width: 1200px; height: 400px;"
									onclick="location.href='register.me'">
							</div>
							<div class="${activeA}">
								<img src="resources/img/main/003.png"
									style="width: 1200px; height: 400px;">
							</div>
							<div class="${activeB}">
								<img src="resources/img/main/004.png"
									style="width: 1200px; height: 400px;">
							</div>
							<div class="${activeC}">
								<img src="resources/img/main/005.png"
									style="width: 1200px; height: 400px;">
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</section>
		<!--================ Hero banner start =================-->

		<a class="button button-hero" href="bookTemp.book">Browse Now</a>
		<!--================ Hero Carousel start =================-->
		<section class="section-margin mt-0">
			<div class="owl-carousel owl-theme hero-carousel">
				<div class="hero-carousel__slide">
					<img src="img/home/hero-slide1.png" alt="" class="img-fluid">
					<a href="#" class="hero-carousel__slideOverlay">
						<h3>Wireless Headphone</h3>
						<p>Accessories Item</p>
					</a>
				</div>
				<div class="hero-carousel__slide">
					<img src="img/home/hero-slide2.png" alt="" class="img-fluid">
					<a href="#" class="hero-carousel__slideOverlay">
						<h3>Wireless Headphone</h3>
						<p>Accessories Item</p>
					</a>
				</div>
				<div class="hero-carousel__slide">
					<img src="img/home/hero-slide3.png" alt="" class="img-fluid">
					<a href="#" class="hero-carousel__slideOverlay">
						<h3>Wireless Headphone</h3>
						<p>Accessories Item</p>
					</a>
				</div>
			</div>
		</section>
		<!--================ Hero Carousel end =================-->

		<!-- ================ trending product section start ================= -->
		<section class="section-margin calc-60px">
			<div class="container">
				<div class="section-intro pb-60px">
					<p>Popular Item in the market</p>
					<h2>
						Trending <span class="section-intro__style">Product</span>
					</h2>
				</div>
				<div class="row">
					<div class="col-md-6 col-lg-4 col-xl-3">
						<div class="card text-center card-product">
							<div class="card-product__img">
								<img class="card-img" src="img/product/product1.png" alt="">
								<ul class="card-product__imgOverlay">
									<li><button>
											<i class="ti-search"></i>
										</button></li>
									<li><button>
											<i class="ti-shopping-cart"></i>
										</button></li>
									<li><button>
											<i class="ti-heart"></i>
										</button></li>
								</ul>
							</div>
							<div class="card-body">
								<p>Accessories</p>
								<h4 class="card-product__title">
									<a href="single-product.html">Quartz Belt Watch</a>
								</h4>
								<p class="card-product__price">$150.00</p>
							</div>
						</div>
					</div>
					<div class="col-md-6 col-lg-4 col-xl-3">
						<div class="card text-center card-product">
							<div class="card-product__img">
								<img class="card-img" src="img/product/product2.png" alt="">
								<ul class="card-product__imgOverlay">
									<li><button>
											<i class="ti-search"></i>
										</button></li>
									<li><button>
											<i class="ti-shopping-cart"></i>
										</button></li>
									<li><button>
											<i class="ti-heart"></i>
										</button></li>
								</ul>
							</div>
							<div class="card-body">
								<p>Beauty</p>
								<h4 class="card-product__title">
									<a href="single-product.html">Women Freshwash</a>
								</h4>
								<p class="card-product__price">$150.00</p>
							</div>
						</div>
					</div>
					<div class="col-md-6 col-lg-4 col-xl-3">
						<div class="card text-center card-product">
							<div class="card-product__img">
								<img class="card-img" src="img/product/product3.png" alt="">
								<ul class="card-product__imgOverlay">
									<li><button>
											<i class="ti-search"></i>
										</button></li>
									<li><button>
											<i class="ti-shopping-cart"></i>
										</button></li>
									<li><button>
											<i class="ti-heart"></i>
										</button></li>
								</ul>
							</div>
							<div class="card-body">
								<p>Decor</p>
								<h4 class="card-product__title">
									<a href="single-product.html">Room Flash Light</a>
								</h4>
								<p class="card-product__price">$150.00</p>
							</div>
						</div>
					</div>
					<div class="col-md-6 col-lg-4 col-xl-3">
						<div class="card text-center card-product">
							<div class="card-product__img">
								<img class="card-img" src="img/product/product4.png" alt="">
								<ul class="card-product__imgOverlay">
									<li><button>
											<i class="ti-search"></i>
										</button></li>
									<li><button>
											<i class="ti-shopping-cart"></i>
										</button></li>
									<li><button>
											<i class="ti-heart"></i>
										</button></li>
								</ul>
							</div>
							<div class="card-body">
								<p>Decor</p>
								<h4 class="card-product__title">
									<a href="single-product.html">Room Flash Light</a>
								</h4>
								<p class="card-product__price">$150.00</p>
							</div>
						</div>
					</div>
					<div class="col-md-6 col-lg-4 col-xl-3">
						<div class="card text-center card-product">
							<div class="card-product__img">
								<img class="card-img" src="img/product/product5.png" alt="">
								<ul class="card-product__imgOverlay">
									<li><button>
											<i class="ti-search"></i>
										</button></li>
									<li><button>
											<i class="ti-shopping-cart"></i>
										</button></li>
									<li><button>
											<i class="ti-heart"></i>
										</button></li>
								</ul>
							</div>
							<div class="card-body">
								<p>Accessories</p>
								<h4 class="card-product__title">
									<a href="single-product.html">Man Office Bag</a>
								</h4>
								<p class="card-product__price">$150.00</p>
							</div>
						</div>
					</div>
					<div class="col-md-6 col-lg-4 col-xl-3">
						<div class="card text-center card-product">
							<div class="card-product__img">
								<img class="card-img" src="img/product/product6.png" alt="">
								<ul class="card-product__imgOverlay">
									<li><button>
											<i class="ti-search"></i>
										</button></li>
									<li><button>
											<i class="ti-shopping-cart"></i>
										</button></li>
									<li><button>
											<i class="ti-heart"></i>
										</button></li>
								</ul>
							</div>
							<div class="card-body">
								<p>Kids Toy</p>
								<h4 class="card-product__title">
									<a href="single-product.html">Charging Car</a>
								</h4>
								<p class="card-product__price">$150.00</p>
							</div>
						</div>
					</div>
					<div class="col-md-6 col-lg-4 col-xl-3">
						<div class="card text-center card-product">
							<div class="card-product__img">
								<img class="card-img" src="img/product/product7.png" alt="">
								<ul class="card-product__imgOverlay">
									<li><button>
											<i class="ti-search"></i>
										</button></li>
									<li><button>
											<i class="ti-shopping-cart"></i>
										</button></li>
									<li><button>
											<i class="ti-heart"></i>
										</button></li>
								</ul>
							</div>
							<div class="card-body">
								<p>Accessories</p>
								<h4 class="card-product__title">
									<a href="single-product.html">Blutooth Speaker</a>
								</h4>
								<p class="card-product__price">$150.00</p>
							</div>
						</div>
					</div>
					<div class="col-md-6 col-lg-4 col-xl-3">
						<div class="card text-center card-product">
							<div class="card-product__img">
								<img class="card-img" src="img/product/product8.png" alt="">
								<ul class="card-product__imgOverlay">
									<li><button>
											<i class="ti-search"></i>
										</button></li>
									<li><button>
											<i class="ti-shopping-cart"></i>
										</button></li>
									<li><button>
											<i class="ti-heart"></i>
										</button></li>
								</ul>
							</div>
							<div class="card-body">
								<p>Kids Toy</p>
								<h4 class="card-product__title">
									<a href="#">Charging Car</a>
								</h4>
								<p class="card-product__price">$150.00</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- ================ trending product section end ================= -->


		<!-- ================ offer section start ================= -->
		
		<!--================ 이벤트 슬라이드2 start =================-->
		<section class="hero-banner2">
			<div class="container2">
				<div id="myCarousel" class="carousel slide" data-ride="carousel">
					<!-- 하단 슬라이드 페이지 표시 -->
					<ol class="carousel-indicators">
						<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
						<li data-target="#myCarousel" data-slide-to="1"></li>
						<li data-target="#myCarousel" data-slide-to="2"></li>
					</ol>
					<!-- 슬라이드 content -->
					<div class="carousel-inner">
						<c:forEach var="i" begin="0" end="1" step="2">
							<c:choose>
								<c:when test="${i eq 0}">
									<c:set var="activeD" value="carousel-item active" />
									<c:set var="activeA" value="carousel-item" />
									<c:set var="activeB" value="carousel-item" />
								</c:when>
								<c:otherwise>
									<c:set var="activeD" value="carousel-item" />
									<c:set var="activeA" value="carousel-item active" />
									<c:set var="activeB" value="carousel-item" />
								</c:otherwise>
							</c:choose>
							<div class="${activeD}">
								<img src="resources/img/main/007.png"
									style="width: 1200px; height: 400px;">
							</div>
							<div class="${activeA}">
								<img src="resources/img/main/008.png"
									style="width: 1200px; height: 400px;">
							</div>
							<div class="${activeB}">
								<img src="resources/img/main/006.png"
									style="width: 1200px; height: 400px;">
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</section>
		<!-- ================ offer section end ================= -->

		<!-- ================ Best Selling item  carousel ================= -->
		<section class="section-margin calc-60px">
			<div class="container">
				<div class="section-intro pb-60px">
					<p>Popular Item in the market</p>
					<h2>
						Best <span class="section-intro__style">Sellers</span>
					</h2>
				</div>
				
				
				<div style="padding: 20px 20px 50px; background-color: #d9e7db;">

					<c:if test="${fn:length(bestBkList) != 0}">
					
						<div id="bestDiv_1" style="background-color: white; padding: 20px;">
							<c:set var="length" value="0"/>
							<c:forEach var="i" begin="0" end="${fn:length(bestBkList)-1}" step="10">
								<ul class="bestUl" id="bestDetail${i}" <c:if test="${i != 0}"> style="display:none" </c:if> >
									<c:forEach begin="${i}" end="${i+9}" items="${bestBkList}" var="book">
										<li>
											<img class="bestImg" src="${pageContext.servletContext.contextPath }/resources/images/book_img/${book.bookMainImg}" class="media-photo"
												onclick="moveDetail('${book.bookISBN}')" alt="">
											<div class="bestTitle">${book.bookTitle}</div>
											<div>${book.bookWriter}</div>
										</li>
									</c:forEach>
								</ul>
								<c:set var="length" value="${length+1}"/>
							</c:forEach>
						</div>
						<div id="bestDiv_2" style="cursor: pointer">
							<c:forEach var="pg" begin="1" end="${length}"> 
								<a onclick="goBest(${pg}, ${length})">${pg}</a>
							</c:forEach>
						</div>
					</c:if>
				</div>
				
				
				<%-- <div class="owl-carousel owl-theme" id="bestSellerCarousel">
					<div class="card text-center card-product">
						<div class="card-product__img">
							<img class="img-fluid" src="img/product/product1.png" alt="">
							<ul class="card-product__imgOverlay">
								<li><button>
										<i class="ti-search"></i>
									</button></li>
								<li><button>
										<i class="ti-shopping-cart"></i>
									</button></li>
								<li><button>
										<i class="ti-heart"></i>
									</button></li>
							</ul>
						</div>

						<div class="card-body">

							<span style="font-size: 20px; font-weight: bold; color: blue;">${categoryName}</span>
							분야 주간 베스트 도서 <br> <br>
							<div style="display: flex;">
								<div style="margin-top: 125px">
									<img alt=""
										src="${pageContext.servletContext.contextPath }/resources/img/btn_prev.gif"
										height="50px" style="margin-right: 15px; cursor: pointer;"
										onclick="bestListMove(0,${requestScope.book.bookSubCategory})">
								</div>
								<c:forEach items="${requestScope.bestList}" var="list"
									varStatus="status">
									<div style="width: 180px; text-align: center;">
										<img alt=""
											src="${pageContext.servletContext.contextPath }/resources/images/book_img/${list.bookMainImg}"
											width="170px" height="250px"
											style="margin: 5px; cursor: pointer;"
											onclick="detailbook('${list.bookISBN}')"
											id="bestBookImg${status.index}"><br> <span
											id="bestBookTitle${status.index}" style="cursor: pointer;"
											onclick="detailbook('${list.bookISBN}')"><c:out
												value="${list.bookTitle}"></c:out></span><br> <span
											style="color: red;" id="bestBookPrice${status.index}"><fmt:formatNumber
												value="${list.bookPrice}"></fmt:formatNumber>원</span>

									</div>

								</c:forEach>
								<div style="margin-top: 125px">
									<img alt=""
										src="${pageContext.servletContext.contextPath }/resources/img/btn_next.gif"
										height="50px" style="margin-left: 15px; cursor: pointer;"
										onclick="bestListMove(1,${requestScope.book.bookSubCategory})">
								</div>
							</div>
						</div>
					</div>

					<div class="card text-center card-product">
						<div class="card-product__img">
							<img class="img-fluid" src="img/product/product2.png" alt="">
							<ul class="card-product__imgOverlay">
								<li><button>
										<i class="ti-search"></i>
									</button></li>
								<li><button>
										<i class="ti-shopping-cart"></i>
									</button></li>
								<li><button>
										<i class="ti-heart"></i>
									</button></li>
							</ul>
						</div>
						<div class="card-body">
							<p>Beauty</p>
							<h4 class="card-product__title">
								<a href="single-product.html">Women Freshwash</a>
							</h4>
							<p class="card-product__price">$150.00</p>
						</div>
					</div>

					<div class="card text-center card-product">
						<div class="card-product__img">
							<img class="img-fluid" src="img/product/product3.png" alt="">
							<ul class="card-product__imgOverlay">
								<li><button>
										<i class="ti-search"></i>
									</button></li>
								<li><button>
										<i class="ti-shopping-cart"></i>
									</button></li>
								<li><button>
										<i class="ti-heart"></i>
									</button></li>
							</ul>
						</div>
						<div class="card-body">
							<p>Decor</p>
							<h4 class="card-product__title">
								<a href="single-product.html">Room Flash Light</a>
							</h4>
							<p class="card-product__price">$150.00</p>
						</div>
					</div>

					<div class="card text-center card-product">
						<div class="card-product__img">
							<img class="img-fluid" src="img/product/product4.png" alt="">
							<ul class="card-product__imgOverlay">
								<li><button>
										<i class="ti-search"></i>
									</button></li>
								<li><button>
										<i class="ti-shopping-cart"></i>
									</button></li>
								<li><button>
										<i class="ti-heart"></i>
									</button></li>
							</ul>
						</div>
						<div class="card-body">
							<p>Decor</p>
							<h4 class="card-product__title">
								<a href="single-product.html">Room Flash Light</a>
							</h4>
							<p class="card-product__price">$150.00</p>
						</div>
					</div>

					<div class="card text-center card-product">
						<div class="card-product__img">
							<img class="img-fluid" src="img/product/product1.png" alt="">
							<ul class="card-product__imgOverlay">
								<li><button>
										<i class="ti-search"></i>
									</button></li>
								<li><button>
										<i class="ti-shopping-cart"></i>
									</button></li>
								<li><button>
										<i class="ti-heart"></i>
									</button></li>
							</ul>
						</div>
						<div class="card-body">
							<p>Accessories</p>
							<h4 class="card-product__title">
								<a href="single-product.html">Quartz Belt Watch</a>
							</h4>
							<p class="card-product__price">$150.00</p>
						</div>
					</div>

					<div class="card text-center card-product">
						<div class="card-product__img">
							<img class="img-fluid" src="img/product/product2.png" alt="">
							<ul class="card-product__imgOverlay">
								<li><button>
										<i class="ti-search"></i>
									</button></li>
								<li><button>
										<i class="ti-shopping-cart"></i>
									</button></li>
								<li><button>
										<i class="ti-heart"></i>
									</button></li>
							</ul>
						</div>
						<div class="card-body">
							<p>Beauty</p>
							<h4 class="card-product__title">
								<a href="single-product.html">Women Freshwash</a>
							</h4>
							<p class="card-product__price">$150.00</p>
						</div>
					</div>

					<div class="card text-center card-product">
						<div class="card-product__img">
							<img class="img-fluid" src="img/product/product3.png" alt="">
							<ul class="card-product__imgOverlay">
								<li><button>
										<i class="ti-search"></i>
									</button></li>
								<li><button>
										<i class="ti-shopping-cart"></i>
									</button></li>
								<li><button>
										<i class="ti-heart"></i>
									</button></li>
							</ul>
						</div>
						<div class="card-body">
							<p>Decor</p>
							<h4 class="card-product__title">
								<a href="single-product.html">Room Flash Light</a>
							</h4>
							<p class="card-product__price">$150.00</p>
						</div>
					</div>

					<div class="card text-center card-product">
						<div class="card-product__img">
							<img class="img-fluid" src="img/product/product4.png" alt="">
							<ul class="card-product__imgOverlay">
								<li><button>
										<i class="ti-search"></i>
									</button></li>
								<li><button>
										<i class="ti-shopping-cart"></i>
									</button></li>
								<li><button>
										<i class="ti-heart"></i>
									</button></li>
							</ul>
						</div>
						<div class="card-body">
							<p>Decor</p>
							<h4 class="card-product__title">
								<a href="single-product.html">Room Flash Light</a>
							</h4>
							<p class="card-product__price">$150.00</p>
						</div>
					</div>
				</div> --%>
			</div>
		</section>
		<!-- ================ Best Selling item  carousel end ================= -->

		<!-- ================ Blog section start ================= -->
		<section class="blog" style="margin-bottom: 20px;">
			<div class="container">
			<div class="subscribe text-center"style="background-color: #eee; padding-left: 20px; padding-right: 20px; box-shadow: none;">
				<div class="section-intro pb-60px">
					<p>화제의 도서를 모아모아</p>
					<h2>
						화제의 <span class="section-intro__style">신간</span>
					</h2>
				</div>
				<div class="col-md-12"
					style="background-color: #fff; border-radius: 15px; padding-top: 20px">
					<c:if test="${fn:length(hotBook) > 8}">
						<div id="myCarousel" class="carousel slide" data-ride="carousel">
							<!-- 하단 슬라이드 페이지 표시 -->
							<ol class="carousel-indicators">
								<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
								<li data-target="#myCarousel" data-slide-to="1"></li>
								<!-- <li data-target="#myCarousel" data-slide-to="2"></li> -->
							</ol>
							<!-- 슬라이드 content -->
							<div class="carousel-inner">
								<c:forEach var="i" begin="0" end="${fn:length(hotBook)-1}"
									step="12">
									<c:choose>
										<c:when test="${i eq 0}">
											<c:set var="activeD" value="carousel-item active" />
										</c:when>
										<c:otherwise>
											<c:set var="activeD" value="carousel-item" />
										</c:otherwise>
									</c:choose>
									<div class="${activeD}">
										<div class="row">
											<c:forEach items="${hotBook}" var="list" begin="${i}"
												end="${i+11}">

												<div class="col-md-6 col-lg-4 col-xl-3">
													<div class="card text-center card-product"
														onclick="location.href='selectBook.book?bookISBN=${ list.bookISBN }'"
														style="height: 380px; background-color: #fbf5f5;">
														<div class="card-product__img">
															<img
																src="${pageContext.servletContext.contextPath }/resources/images/book_img/${list.bookMainImg}"
																class="media-photo"
																style="width: 145px; height: 215px; cursor: pointer; padding-top: 20px;"
																alt="">
														</div>
														<div class="card-body"
															style="word-break: break-all; padding-bottom: 20px;">
															<h4>${list.bookTitle }</h4>
															<h6 class="card-product__title">
																<span>저자 | ${list.bookWriter }</span>
															</h6>
															<span
																style="background-color: #b6e7c1; border: 1px solid #64d17c; color: #343a40;">${list.bookPrice }원</span>
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
		</section>
		<!-- ================ Blog section end ================= -->

	

	</main>


	<jsp:include page="common/footer.jsp" />

	<form action="/" method="post" id="detailBookForm">
		<input type="hidden" name="bookISBN" id="inputISBN">
	</form>
</body>
</html>
