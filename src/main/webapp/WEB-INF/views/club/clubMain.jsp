<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        /* carousel 부트스트랩 슬라이드쇼 요소 -> 화살표(next) 색, 크기 바꾸기 */
        
        .nextIcon{
            width: 40px;
            height: 40px;
            background-size: cover;
            background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' fill='%23384aeb' width='8' height='8' viewBox='0 0 8 8'%3e%3cpath d='M2.75 0l-1.5 1.5L3.75 4l-2.5 2.5L2.75 8l4-4-4-4z'/%3e%3c/svg%3e");
        }
        /* carousel 부트스트랩 슬라이드쇼 요소 -> 화살표(prev) 색, 크기 바꾸기 */
        
        .prevIcon {
            width: 40px;
            height: 40px;
            background-size: cover;
            background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' fill='%23384aeb' width='8' height='8' viewBox='0 0 8 8'%3e%3cpath d='M5.25 0l-4 4 4 4 1.5-1.5L4.25 4l2.5-2.5L5.25 0z'/%3e%3c/svg%3e");
        }
        
        .reviewTable {
            display: table;
            width: 100%;
            padding: 15px;
        }
        
        .reviewTable .tableThumb {
            display: table-cell;
            width: 22%;
            padding-right: 15px;
        }
        
        .reviewTable .tableTitle {
            display: table-cell;
            width: 78%;
            vertical-align: top;
        }
        .pointer{
        	cursor: pointer;
        }
    </style>
</head>

<body style="width:1200px; margin:auto">
    
    <jsp:include page="../club/clubMenubar.jsp"/>

    <main class="site-main">


        <!-- ================ 1.인기 독서모임 ================= -->
        <section class="section-margin calc-60px" style="margin-top:50px;">
            <div class="container">
                <div class="section-intro pb-60px">
                    <p>책구메이트에서 가장 인기있는 독서모임들</p>
                    <h2><span class="section-intro__style">인기</span> 독서모임</h2>
                </div>

                <!--
                  1. carousel : carousel 컨베이어 벨트처럼 현재 사진에서 다른 사진으로 넘어갈 수 있게 해준다.
                  2. slide : 다른 사진으로 넘어갈 때 슬라이딩되는 효과를 제공한다.
                  3. data-ride="carousel" : 
                   attribute is used to mark a carousel as animating starting at page load. It cannot be used in combination with (redundant and unnecessary) explicit JavaScript initialization of the same carousel.
                  4. carousel - id는 꼭 유일하게 해줘야함
                -->

                <script>
                    // $(function() {
                    //     $(".placeImg").click(function() {
                    //         var planNo = $(this).siblings("#planNo").val();
                    //         location.href = "contextPath/detailP.ps?planNo=" + planNo;
                    //     })
                    // })
                </script>

                <div id="carouselExampleIndicators1" class="carousel slide" data-ride="carousel">
                    <ol class="carousel-indicators">
                        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                    </ol>
                    <div class="carousel-inner">
                        <div class="carousel-item active" style="width: 100%;">

                            <div class="row">
                                <div class="col-md-6 col-lg-4 mb-4 mb-lg-0">
                                    <div class="card card-blog">
                                        <div class="card-blog__img">
                                            <!--사진 이미지 클릭했을 때 detail view로-->
                                            <a href="single-blog.html">
                                                <img class="card-img rounded-0" src="img/blog/blog1.png" alt="">
                                            </a>
                                        </div>
                                        <div class="card-body">
                                            <ul class="card-blog__info">
                                                <!--제목 클릭했을 때 detail view로-->
                                                <a href="single-blog.html">
                                                    <li>By Admin</li>
                                                    <li><i class="ti-comments-smiley"></i> 2 Comments</li>
                                                </a>
                                            </ul>
                                            <h4 class="card-blog__title"><a href="single-blog.html">The Richland Center Shooping News and weekly shooper</a></h4>
                                            <p>Let one fifth i bring fly to divided face for bearing divide unto seed. Winged divided light Forth.</p>
                                            <!-- <a class="card-blog__link" href="#">Read More <i class="ti-arrow-right"></i></a> -->
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-6 col-lg-4 mb-4 mb-lg-0">
                                    <div class="card card-blog">
                                        <div class="card-blog__img">
                                            <a href="single-blog.html">
                                                <img class="card-img rounded-0" src="img/blog/blog2.png" alt="">
                                            </a>
                                        </div>
                                        <div class="card-body">
                                            <ul class="card-blog__info">
                                                <li>By Admin</li>
                                                <li><i class="ti-comments-smiley"></i> 2 Comments</li>
                                            </ul>
                                            <h4 class="card-blog__title"><a href="single-blog.html">The Shopping News also offers top-quality printing services</a></h4>
                                            <p>Let one fifth i bring fly to divided face for bearing divide unto seed. Winged divided light Forth.</p>
                                            <!-- <a class="card-blog__link" href="#">Read More <i class="ti-arrow-right"></i></a> -->
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-6 col-lg-4 mb-4 mb-lg-0">
                                    <div class="card card-blog">
                                        <div class="card-blog__img">
                                            <img class="card-img rounded-0" src="img/blog/blog3.png" alt="">
                                        </div>
                                        <div class="card-body">
                                            <ul class="card-blog__info">
                                                <li><a href="#">By Admin</a></li>
                                                <li><a href="#"><i class="ti-comments-smiley"></i> 2 Comments</a></li>
                                            </ul>
                                            <h4 class="card-blog__title"><a href="single-blog.html">Professional design staff and efficient equipment you’ll find we offer</a></h4>
                                            <p>Let one fifth i bring fly to divided face for bearing divide unto seed. Winged divided light Forth.</p>
                                            <!-- <a class="card-blog__link" href="#">Read More <i class="ti-arrow-right"></i></a> -->
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="carousel-item">
                            <div class="row">
                                <div class="col-md-6 col-lg-4 mb-4 mb-lg-0">
                                    <div class="card card-blog">
                                        <div class="card-blog__img">
                                            <img class="card-img rounded-0" src="img/category/c1.jpg" alt="">
                                        </div>
                                        <div class="card-body">
                                            <ul class="card-blog__info">
                                                <li><a href="#">By Admin</a></li>
                                                <li><a href="#"><i class="ti-comments-smiley"></i> 2 Comments</a></li>
                                            </ul>
                                            <h4 class="card-blog__title"><a href="single-blog.html">The Richland Center Shooping News and weekly shooper</a></h4>
                                            <p>Let one fifth i bring fly to divided face for bearing divide unto seed. Winged divided light Forth.</p>
                                            <a class="card-blog__link" href="#">Read More <i class="ti-arrow-right"></i></a>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-6 col-lg-4 mb-4 mb-lg-0">
                                    <div class="card card-blog">
                                        <div class="card-blog__img">
                                            <img class="card-img rounded-0" src="img/category/c2.jpg" alt="">
                                        </div>
                                        <div class="card-body">
                                            <ul class="card-blog__info">
                                                <li><a href="#">By Admin</a></li>
                                                <li><a href="#"><i class="ti-comments-smiley"></i> 2 Comments</a></li>
                                            </ul>
                                            <h4 class="card-blog__title"><a href="single-blog.html">The Shopping News also offers top-quality printing services</a></h4>
                                            <p>Let one fifth i bring fly to divided face for bearing divide unto seed. Winged divided light Forth.</p>
                                            <a class="card-blog__link" href="#">Read More <i class="ti-arrow-right"></i></a>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-6 col-lg-4 mb-4 mb-lg-0">
                                    <div class="card card-blog">
                                        <div class="card-blog__img">
                                            <img class="card-img rounded-0" src="img/category/c3.jpg" alt="">
                                        </div>
                                        <div class="card-body">
                                            <ul class="card-blog__info">
                                                <li><a href="#">By Admin</a></li>
                                                <li><a href="#"><i class="ti-comments-smiley"></i> 2 Comments</a></li>
                                            </ul>
                                            <h4 class="card-blog__title"><a href="single-blog.html">Professional design staff and efficient equipment you’ll find we offer</a></h4>
                                            <p>Let one fifth i bring fly to divided face for bearing divide unto seed. Winged divided light Forth.</p>
                                            <a class="card-blog__link" href="#">Read More <i class="ti-arrow-right"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <div class="row">
                                <div class="col-md-6 col-lg-4 mb-4 mb-lg-0">
                                    <div class="card card-blog">
                                        <div class="card-blog__img">
                                            <img class="card-img rounded-0" src="img/category/c4.jpg" alt="">
                                        </div>
                                        <div class="card-body">
                                            <ul class="card-blog__info">
                                                <li><a href="#">By Admin</a></li>
                                                <li><a href="#"><i class="ti-comments-smiley"></i> 2 Comments</a></li>
                                            </ul>
                                            <h4 class="card-blog__title"><a href="single-blog.html">The Richland Center Shooping News and weekly shooper</a></h4>
                                            <p>Let one fifth i bring fly to divided face for bearing divide unto seed. Winged divided light Forth.</p>
                                            <a class="card-blog__link" href="#">Read More <i class="ti-arrow-right"></i></a>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-6 col-lg-4 mb-4 mb-lg-0">
                                    <div class="card card-blog">
                                        <div class="card-blog__img">
                                            <img class="card-img rounded-0" src="img/category/c5.jpg" alt="">
                                        </div>
                                        <div class="card-body">
                                            <ul class="card-blog__info">
                                                <li><a href="#">By Admin</a></li>
                                                <li><a href="#"><i class="ti-comments-smiley"></i> 2 Comments</a></li>
                                            </ul>
                                            <h4 class="card-blog__title"><a href="single-blog.html">The Shopping News also offers top-quality printing services</a></h4>
                                            <p>Let one fifth i bring fly to divided face for bearing divide unto seed. Winged divided light Forth.</p>
                                            <a class="card-blog__link" href="#">Read More <i class="ti-arrow-right"></i></a>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-6 col-lg-4 mb-4 mb-lg-0">
                                    <div class="card card-blog">
                                        <div class="card-blog__img">
                                            <img class="card-img rounded-0" src="img/category/c2.jpg" alt="">
                                        </div>
                                        <div class="card-body">
                                            <ul class="card-blog__info">
                                                <li><a href="#">By Admin</a></li>
                                                <li><a href="#"><i class="ti-comments-smiley"></i> 2 Comments</a></li>
                                            </ul>
                                            <h4 class="card-blog__title"><a href="single-blog.html">Professional design staff and efficient equipment you’ll find we offer</a></h4>
                                            <p>Let one fifth i bring fly to divided face for bearing divide unto seed. Winged divided light Forth.</p>
                                            <a class="card-blog__link" href="#">Read More <i class="ti-arrow-right"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <a class="carousel-control-prev" href="#carouselExampleIndicators1" role="button" data-slide="prev" style="justify-content: left; left: 20px;">
                        <span class="prevIcon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#carouselExampleIndicators1" role="button" data-slide="next" style="justify-content: right; right: 20px;">
                        <span class="nextIcon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>



                <!-- ================ trending product section 삭제 ================= -->
                <section class="section-margin calc-60px">
                    <div class="container">
                        <div class="section-intro pb-60px">
                            <p>분야별 독서모임을 확인해보세요</p>
                            <h2><span class="section-intro__style">분야별</span> 독서모임</h2>
                        </div>

                        <!-- 카테고리별 헤더 만들기 -->
                        <ul class="navbar" style="width: 80%;">
                            <li class="nav-item">
                                <h5 class="clickCategory"><a style="cursor:pointer">인문/과학/심리</a></h5>
                            </li>
                            <li class="nav-item">
                                <h5 class="clickCategory"><a style="cursor:pointer">문학/에세이</a></h5>
                            </li>
                            <li class="nav-item">
                                <h5 class="clickCategory"><a style="cursor:pointer">예술/음악</a></h5>
                            </li>
                            <li class="nav-item">
                                <h5 class="clickCategory"><a style="cursor:pointer">경영/경제/마케팅</a></h5>
                            </li>
                            <li class="nav-item">
                                <h5 class="clickCategory"><a style="cursor:pointer">글쓰기</a></h5>
                            </li>
                            <li class="nav-item">
                                <h5 class="clickCategory"><a style="cursor:pointer">강연</a></h5>
                            </li>
                        </ul>
                        
                        <div class="row" id="categoryList" style="display:none;">
                        	<c:forEach items="${catelist}" var="list" varStatus="status">
                        		<div class="col-md-6 col-lg-4 mb-4 mb-lg-0">
	                            	<input type="hidden" value="${list.clubNo}">
	                                <div class="card card-blog">
	                                    <div class="card-blog__img">
	                                         <img class="card-img rounded-0" src="resources/img/blog/blog1.png" alt="">
	                                    </div>
	                                    <div class="card-body">
	                                        <ul class="card-blog__info">
	                                            <li>${list.category} &nbsp; [ ${list.onoffLine} ]</li>
	                                            <li><i class="ti-comments-smiley"></i> 2 Comments</li>
	                                        </ul>
	                                        <h4 class="card-blog__title">${list.clubTitle}</h4>
	                                        <p>
	                                        	<c:set var="temp" value="모집기간모집기간모집기간모집기간모집기간모집기간모집기간모집기간모집기간모집기간모집기간"/>
	                                        	<c:choose>
		                                        	<c:when test="${fn:length(temp) gt 41}">
		                                        		<c:out value="${fn:substring(temp,0,40)}"></c:out> ...
		                                        	</c:when>
		                                        	<c:otherwise>
		                                        		<c:out value="${temp}"/>
		                                        	</c:otherwise>
	                                        	</c:choose>
	                                        
	                                        </p>
	                                    </div>
	                                </div>
	                            </div> 
                        	</c:forEach> 
                        </div>
                        
                    </div>
                </section>
                
                <script>
	                $(".clickCategory").click(function(){

	    	        	var category = $(this).text();
						$.ajax({
							url:"categoryList.cl",
							data:{category:category},
							type : "get",
							success:function(list){
								console.log("ajax 통신성공")
								//putClubList(list);
								var listView = document.getElementById("categoryList");
								if(listView.style.display=='none'){
									listView.style.display = 'block';
								}
								
							},error:function(){
								console.log("ajax 통신실패")
							}
						})
	                })
  	
                </script>
                
                
                <!-- ================ trending product section end ================= -->

                <!-- ================ 3. 마감임박 독서모임 ================= -->
                <section class="section-margin calc-60px">
                    <div class="container">
                        <div class="section-intro pb-60px">
                            <p>마감이 임박한 독서모임</p>
                            <h2><span class="section-intro__style">마감 임박</span> 독서모임</h2>
                        </div>

                        <!--
                  1. carousel : carousel 컨베이어 벨트처럼 현재 사진에서 다른 사진으로 넘어갈 수 있게 해준다.
                  2. slide : 다른 사진으로 넘어갈 때 슬라이딩되는 효과를 제공한다.
                  3. data-ride="carousel" : 
                   attribute is used to mark a carousel as animating starting at page load. It cannot be used in combination with (redundant and unnecessary) explicit JavaScript initialization of the same carousel.
                  4. carousel - id는 꼭 유일하게 해줘야함
                -->
                	
                <!-- 마감임박 독서모임 리스트 갯수가 3개 이하인 경우에는 carousel로 슬라이딩되지 않도록 설정했다.
                                       ㅅ슬라이딩되도록 하면 다음 페이지로 넘어간 후 다시 앞 페이지로 돌아오지 않기 때문이다. -->
                	<c:if test="${fn:length(endList) <= 3}">
	                	<div style="display:flex;">
	                		<c:forEach items="${endList}" var="list" begin="0" end="2">
	                             <div class="col-md-6 col-lg-4 mb-4 mb-lg-0 pointer">
					                  <input type="hidden" value="${list.clubNo}">
					                  <div class="card card-blog">
					                        <div class="card-blog__img">
					                             <c:forEach items="${list.clubAttachments}" var="ca">
					                                 <img class="card-img rounded-0" src="${pageContext.servletContext.contextPath}/resources/upload_files/club_img/${ca.changeName}" alt="">
					                             </c:forEach>
					                        </div>
					                        <div class="card-body">
					                             <ul class="card-blog__info">
					                                  <li>${list.category} &nbsp; [ ${list.onoffLine} ]</li>
					                                  <li><i class="ti-comments-smiley"></i> 2 Comments</li>
					                             </ul>
					                             <h4 class="card-blog__title">${list.clubTitle}</h4>
					                             <p>
					                                 <c:set var="temp" value="${list.intro}"/>
					                                 <c:choose>
						                                  <c:when test="${fn:length(temp) gt 41}">
						                                       <c:out value="${fn:substring(temp,0,40)}"></c:out> ...
						                                  </c:when>
						                                  <c:otherwise>
						                                       <c:out value="${temp}"/>
						                                  </c:otherwise>
					                                 </c:choose>        
					                             </p>
					                       </div>
					                  </div>
					              </div> 
	                         </c:forEach>
	                    </div>
                   </c:if>
	
				<!-- 3개 초과인 경우에는 슬라이딩 된다.
					 클래스명이 carousel-item인 div에 <row>는 한개, 독서모임은 3개를 넣어줘야 하므로 아래와 같이 변수를 지정하여 했다.
					 이렇게 하면 select 시 조회해오는 독서모임의 갯수에 상관없이 슬라이딩을 적용할 수 있다.-->
				   <c:if test="${fn:length(endList) > 3}">
                        <div id="carouselExampleIndicators2" class="carousel slide" data-ride="carousel">
                            <ol class="carousel-indicators">
                                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                                <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                            </ol>
                            <div class="carousel-inner">
                            
                            	<c:forEach var="i" begin="0" end="${fn:length(endList)}" step="3">
                            	
                            		<c:choose>
                            			<c:when test="${i eq 0}">
                            				<c:set var="activeD" value="carousel-item active"/>
                            			</c:when>
                            			<c:otherwise>
                            				<c:set var="activeD" value="carousel-item"/>
                            			</c:otherwise>
                            		</c:choose>

                                	<div id="activeOrNot" class="${activeD}" style="width: 100%;">
	                                    <div class="row">
	                                    
	                                        <c:forEach items="${endList}" var="club" begin="${i}" end="${i+2}">
	                                        	<div class="col-md-6 col-lg-4 mb-4 mb-lg-0 pointer">
					                            	<input type="hidden" value="${club.clubNo}">
					                                <div class="card card-blog">
					                                    <div class="card-blog__img">
					                                   		 <c:forEach items="${club.clubAttachments}" var="ca">
					                                   		 	<img class="card-img rounded-0" src="${pageContext.servletContext.contextPath}/resources/upload_files/club_img/${ca.changeName}" alt="">
					                                   		 </c:forEach>
					                                         
					                                    </div>
					                                    <div class="card-body">
					                                        <ul class="card-blog__info">
					                                            <li>${club.category} &nbsp; [ ${club.onoffLine} ]</li>
					                                            <li><i class="ti-comments-smiley"></i> 2 Comments</li>
					                                        </ul>
					                                        <h4 class="card-blog__title">${club.clubTitle}</h4>
					                                        <p>
					                                        	<c:set var="temp" value="${club.intro}"/>
					                                        	<c:choose>
						                                        	<c:when test="${fn:length(temp) gt 41}">
						                                        		<c:out value="${fn:substring(temp,0,40)}"></c:out> ...
						                                        	</c:when>
						                                        	<c:otherwise>
						                                        		<c:out value="${temp}"/>
						                                        	</c:otherwise>
					                                        	</c:choose>
					                                        
					                                        </p>
					                                    </div>
					                                </div>
					                            </div> 
	                                        </c:forEach>
	                            		</div>
	                            	</div>
                                </c:forEach>   
                            </div>  
                            	
		                    <a class="carousel-control-prev" href="#carouselExampleIndicators2" role="button" data-slide="prev" style="justify-content: left; left: 20px;">
		                        <span class="prevIcon" aria-hidden="true"></span>
		                        <span class="sr-only">Previous</span>
		                    </a>
		                    <a class="carousel-control-next" href="#carouselExampleIndicators2" role="button" data-slide="next" style="justify-content: right; right: 20px;">
		                        <span class="nextIcon" aria-hidden="true"></span>
		                        <span class="sr-only">Next</span>
		                    </a>
                  	    </div>
                    </c:if>
                  </div>
                </section>
                
                <script>
                    $(function(){
                        $(".pointer").click(function(){
                            console.log($(this).children(":first").val());
                            location.href="detail.cl?cno=" + $(this).children(":first").val();
                        });
                    })
                </script>

                <!-- ================ Best Selling item  carousel end ================= -->


                <!-- ================ trending product section 삭제 ================= -->
                <section class="section-margin calc-60px">
                    <div class="container">
                        <div class="section-intro pb-60px">
                            <p>책구메이트 회원들이 남긴 베스트 독서후기를 확인해보세요</p>
                            <h2><span class="section-intro__style">베스트</span> 독서모임 후기</h2>
                        </div>


                        <div class="row reviewTable">
                            <div class="tableThumb">
                                <img class="card-img" src="img/product/product1.png" alt="">
                            </div>
                            <div class="tableTitle">
                                <a>
                                    <div>나는 독서모임 베스트 리뷰 제목!</div>
                                    <div>나는 독서모임 베스트 리뷰 내용!!나는 독서모임 베스트 리뷰 내용!!나는 독서모임 베스트 리뷰 내용!!나는 독서모임 베스트 리뷰 내용!!</div>
                                </a>
                                <div>
                                    <span>작성자***</span>
                                    <span>2021-10-21</span>
                                </div>
                            </div>
                        </div>

                    </div>
                </section>
                <!-- ================ trending product section end ================= -->
			</div>
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