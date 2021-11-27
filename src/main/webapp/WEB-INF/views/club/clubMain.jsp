<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>책구메이트-독서모임</title>
    <link rel="icon" href="resources/img/logo1.png" type="image/png">
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
       .mainTitle{
       		padding:30px 0px;
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
        .titleBackImg{
        	width: 100%;
        	height: 100%;
		    background-size: cover;
		    background-position: center center;
        }
        
        .cardImg{
        	height: 275px;
        	background-color: #EED8AE;
        }
        
        #clubMenubar{
			position: fixed;
			right: 50%;
			transform: translate(-610px, 0);
			margin-top: 5px;
		}
		
		#nav-v2{
			/* width:150px
			;text-align:center; */
		} 
		.menu-v2{ 
			line-height:2; 
			/* border:1px solid #222;  */
			position:relative; 
			
		} 
		.menu-v2 .submenu{
			position:absolute; 
			width:150px; 
			left:120px; 
			/* border:1px solid #cfa175; */
			background-color:#adc09c; 
			color:white; 
			top:-1px; 
			display:none; 
			z-index:9999; /*이렇게 해도 카드에는 안됨*/
		} 
		.menu-v2 a{
			color:black;
		}
		.menu-v2:hover{ 
			background-color:#adc09c; 
			color:white; 
		} 
		.menu-v2 .submenu>li:hover{ 
			background-color:white; 
			color:#adc09c; 
		}
		
		.popTotal_2{
		     display: flex; 
		     flex-wrap: wrap;
		}
		.popOne{
		 	width: 327px;
		 	/* width: 31.78%; */
		    height: 470px;
		    margin: 8px;
		    border: 1px solid #dadada;
		    padding: 10px;
		    cursor: pointer;
		}

	    .clickCategory{
	    	cursor: pointer;
	    	font-weight: 700;
	    }
	    
	    [id^=endTotal_2]{
	    	justify-content: center;
	    }
	    
	    #endArrow_left {
			font-size: 50px;
			color: gray;
			position: absolute;
			top: 220px;
			left: 0px;
		}
		
		#endArrow_right {
			font-size: 50px;
			color: gray;
			position: absolute;
			top: 220px;
			right: 0px;
		}
    </style>
</head>

<body style="width:1200px; margin:auto; padding-top: 140px;">
    <jsp:include page="../common/menubar.jsp" />

    <main class="site-main">
	
		<div id="clubMenubar" style="width: 220px; height: 650px; background-color: #f1e5d9;">  <!-- #f1e5d9 #faf1e6   #fcf3e0-->
			<hr style="margin-top: 0px; height: 4px; background-color: #503535;">
			<div style="font-size: 23px; font-weight: 800; margin-top: 35px;">
				함께 읽고 얘기하는 <br>
				독서메이트
			</div>
			<hr style="margin: 35px 0px;">
			<nav>
				<ul id="nav-v2">
					<li class="menu-v2"><a href="clubMain.cl">독서모임 홈</a></li>
					<li class="menu-v2"><a href="clubAll.cl">모든 독서모임</a></li>
					<li class="menu-v2"><a href="searchPage.cl">나에게 맞는 독서모임</a></li>
					<li onclick="checkUser();" class="menu-v2"><a <c:if test="${!empty sessionScope.loginUser}">href="mypage1.cl"</c:if> >마이페이지</a>
						<ul class="submenu">
							<li><a <c:if test="${!empty sessionScope.loginUser}">href="mypage1.cl"</c:if>>신청 목록</a></li>
							<li><a <c:if test="${!empty sessionScope.loginUser}">href="mypage2.cl"</c:if>>찜 목록</a></li>
							<li><a <c:if test="${!empty sessionScope.loginUser}">href="mypage3.cl"</c:if>>내 독서모임</a></li>
						</ul>
					</li>
				</ul>
			</nav>
			<hr style="margin: 35px 0px;">
			<div></div>
			<div></div>
		</div>

        <!-- ================ 1.인기 독서모임 ================= -->
		<section class="section-margin calc-60px" style="margin-top: 50px;">
			<div class="container">
				<div class="section-intro mainTitle">
					<p>책구메이트에서 가장 인기있는 독서모임들</p>
					<h2>
						<span class="section-intro__style">인기</span> 독서모임
					</h2>
				</div>
				
				<div style="padding: 20px 20px 50px; background-color: #d9e7db;">
					<c:if test="${fn:length(popList) > 0}">
					
						<div class="popTotal_1" style="background-color: white; padding: 20px; height: 1010px;">
							<c:forEach var="i" begin="0" end="${fn:length(popList)-1}" step="6">
							
								<div id="popTotal_2${i}" class="popTotal_2" <c:if test="${i != 0}">style="display: none;"</c:if> > 
									<c:forEach var="list" items="${popList}" begin="${i}" end="${i+5}">
									
									<div class="popOne" onclick="goDetail(${list.clubNo})" >
										<input type="hidden" value="${list.clubNo}">
										<div class="image" style="height:280px;">
											<c:forEach items="${list.clubAttachments}" var="ca">
												<div class="titleBackImg" style="background-image: url('${pageContext.servletContext.contextPath }/resources/upload_files/club_img/${ca.changeName}')"></div>
											</c:forEach>
										</div>
										<div class="">  
											<ul class="card-blog__info"> 
												<li>${list.category}&nbsp; [ ${list.onoffLine} ]</li>
												<li><i class="ti-comments-smiley"></i> ${list.heartCount} Likes</li>
											</ul>
											<h4 class="">${list.clubTitle}</h4> 
											<p>
												<c:forEach items="${list.clubTimes}" var="at" varStatus="s_at">
	                                 		
		                                 		<c:choose>
		                                 			<c:when test="${s_at.index eq 0}">
		                                 				<c:set var="firstStart" value="${at.clubDate}"/>
		                                 			</c:when>
		                                 			<c:otherwise>
		                                 				<c:if test="${firstStart > at.clubDate }">
		                                 					<c:set var="firstStart" value="${at.clubDate}"/>
		                                 				</c:if>
		                                 			</c:otherwise>
		                                 		</c:choose>
		            
		                                 	</c:forEach>	
		                                   	     시작 : ${firstStart} &nbsp; | <span>${fn:length(list.clubTimes)}</span>번
											</p>
										</div>
									</div>
									
									</c:forEach>
									
								</div>
							</c:forEach>
						</div>
					</c:if>
				</div>
			</div>
		</section>


		<!-- ================ 2. 분야별 독서모임 확인  ================= -->
		<section class="section-margin calc-60px">
			<div class="container">
				<div class="section-intro mainTitle">
					<p>분야별 독서모임을 확인해보세요</p>
					<h2>
						<span class="section-intro__style">분야별</span> 독서모임
					</h2>
				</div>

				<!-- 카테고리별 헤더 만들기 -->
				<ul class="navbar" style="width: 100%; background-color: #d9e7db;">
					<li class="nav-item">
						<h5 class="clickCategory"><a>인문/과학/심리</a></h5>
					</li>
					<li class="nav-item">
						<h5 class="clickCategory"><a>문학/에세이</a></h5>
					</li>
					<li class="nav-item">
						<h5 class="clickCategory"><a>예술/음악</a></h5>
					</li>
					<li class="nav-item">
						<h5 class="clickCategory"><a>경영/경제/마케팅</a></h5>
					</li>
					<li class="nav-item">
						<h5 class="clickCategory"><a>글쓰기</a></h5>
					</li>
					<li class="nav-item">
						<h5 class="clickCategory"><a>강연</a></h5>
					</li>
				</ul>

				<div class="row" id="categoryList1" style="display: none; padding: 70px;">
					<p style="text-align: center; font-size:20px; font-weight: 550;">해당 카테고리에 독서모임은 없습니다.</p>
				</div>

				<div class="row popTotal_2" id="categoryList">
					<c:forEach begin="0" end="5" varStatus="s">
						<div id="c_clubTotal${s.index}" class="col-md-6 col-lg-4 mb-4 pointer" style="display: none;">
							<input id="c_clubNo${s.index}" type="hidden" value="22">
								<div class="image" style="height:250px;">
									<div id="c_clubImg${s.index}" class="titleBackImg"></div> 
								</div>
								<div class="">
									<ul class="card-blog__info">
										<li><span id="c_category${s.index}">22</span> &nbsp; <span id="c_onoffLine${s.index}">[22]</span></li>
										<li><i class="ti-comments-smiley"></i> 2 Comments</li>
									</ul>
									<h4 id="c_title${s.index}" class="card-blog__title">독서모임 제목</h4>
									<p>
										<span id="c_intro${s.index}"> 독서모임 소개 독서모임 소개 독서모임 소개 독서모임 소개 독서모임 소개 독서모임 소개</span>
									</p>
								</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</section>

		<!-- ================ 3. 마감임박 독서모임 ================= -->
		<section class="section-margin calc-60px">
			<div class="container">
				<div class="section-intro mainTitle">
					<p>마감이 임박한 독서모임</p>
					<h2>
						<span class="section-intro__style">마감 임박</span> 독서모임
					</h2>
				</div>
				
				<c:if test="${fn:length(endList) > 0}">
					<div class="popTotal_1" style="background-color: white; padding: 20px; height: 550px; position:relative;">
						
						<c:set var="length" value="0" />
						<c:forEach var="i" begin="0" end="${fn:length(endList)-1}" step="3">
							<div id="endTotal_2${i}" class="popTotal_2" <c:if test="${i != 0}">style="display: none;"</c:if> > 
								
								<c:forEach var="list" items="${endList}" begin="${i}" end="${i+2}">	
								<div class="popOne" onclick="goDetail(${list.clubNo})" >
									<div class="image" style="height:280px;">
										<c:forEach items="${list.clubAttachments}" var="ca">
											<div class="titleBackImg" style="background-image: url('${pageContext.servletContext.contextPath }/resources/upload_files/club_img/${ca.changeName}')"></div>
										</c:forEach>
									</div>
									<div class="">  
										<ul class="card-blog__info"> 
											<li>${list.category}&nbsp; [ ${list.onoffLine} ]</li>
											<li><i class="ti-comments-smiley"></i> ${list.heartCount} Likes</li>
										</ul>
										<h4 class="">${list.clubTitle}</h4> 
										<p>
											<c:forEach items="${list.clubTimes}" var="at" varStatus="s_at">
	                                		
		                                		<c:choose>
		                                			<c:when test="${s_at.index eq 0}">
		                                				<c:set var="firstStart" value="${at.clubDate}"/>
		                                 			</c:when>
		                                 			<c:otherwise>
		                                 				<c:if test="${firstStart > at.clubDate }">
		                                 					<c:set var="firstStart" value="${at.clubDate}"/>
		                                 				</c:if>
		                                 			</c:otherwise>
		                                 		</c:choose>
		                                 	</c:forEach>	
		                                   	 시작 : ${firstStart} &nbsp; | <span>${fn:length(list.clubTimes)}</span>번
										</p>
									</div>
								</div>
							  </c:forEach>	
							</div>
							<c:set var="length" value="${length+1}" />
						</c:forEach>
						<i onclick="goEnd(1,  ${length})" id="endArrow_left" class="fas fa-chevron-left"></i>
						<i onclick="goEnd(2, ${length})" id="endArrow_right" class="fas fa-chevron-right"></i>
					</div>
				</c:if>
			</div>
		</section>

		<script>
			var endPg = 1; //마감임박 독서모임 움직이기
			
			var origin = 0;
			
			$(document).ready(function(){ 
				 //menu v2 
				 $(".menu-v2").mouseover(function(){ $(this).children(".submenu").show(200); }); 
				 $(".menu-v2").mouseleave(function(){ $(this).children(".submenu").hide(200); }); 
				 
				 //출처: https://contentstoaster.tistory.com/6 [Contents Toaster]
			});

				
			$(function() {
				$(".pointer").click(function() {
					console.log($(this).children(":first").val());
					location.href = "detail.cl?clubNo="+ $(this).children(":first").val();
				});
			})
			
			function goDetail(clubNo){
				console.log("번호 안들어와? " + clubNo)
				location.href = "detail.cl?clubNo="+ clubNo;
			}

			$(".clickCategory").click(function() {
				var category = $(this).text();

				$.ajax({
					url : "categoryList.cl",
					data : {
						category : category
					},
					type : "get",
					success : function(list) {
						console.log("ajax 통신성공");

						var listView = document.getElementById("categoryList");   //리스트 뿌리는 곳
						var listView1 = document.getElementById("categoryList1"); //없습니다.
						var intro;
						
						if (list.length == 0) { 			//1.리스트 빈 경우
							console.log("리스트 빈 값");
							listView.style.display = 'none';
							listView1.style.display = 'block';
						} else { 							//2. 리스트 값 있는 경우
							$.each(list,function(i) {
								/* $('#c_clubImg'+ i).attr("src","${pageContext.servletContext.contextPath }/resources/upload_files/club_img/"+ list[i].clubAttachments[0].changeName); */
								
								$('#c_clubImg'+i).css("background-image","url(${pageContext.servletContext.contextPath }/resources/upload_files/club_img/"+list[i].clubAttachments[0].changeName+")");
								$('#c_clubNo'+ i).val(list[i].clubNo);
								$('#c_category'+ i).text(list[i].category);
								$('#c_onoffLine'+ i).text(list[i].onoffLine);
								$('#c_title'+ i).text(list[i].clubTitle);

								if (list[i].intro.length > 61) {
									intro = (list[i].intro).substring(0,60)+ '...';
								} else {
									intro = list[i].intro;
								}

								$('#c_intro'+ i).text(intro);
								$('#c_clubTotal'+ i).css('display','block'); //none풀어주기

							})
							listView1.style.display = 'none';
							listView.style.display = 'flex';

							for (var i = list.length; i < 6; i++) {
								$('#c_clubTotal' + i).css('display','none');  //6개 모두 보이면 안되고 길이만큼 보여야 하기때문
							}
						}
					},error : function() {
						console.log("ajax 통신실패")
					}
				})
			})
			
			function checkUser(){
				var userId = '${sessionScope.loginUser.userId}';
				if(userId == ''){
					alert('로그인 후 이용해주세요');
					return;
				}
			}
			
			//마감임박 독서모임 움직이기
			function goEnd(type, length){
				if(type == 1){ //이전으로
					if(endPg == 1){
						endPg = length;
					}else{
						endPg--;
					}
				}else{//앞으로
					if(endPg == length){
						console.log("ddddd")
						endPg = 1;
					}else{
						endPg++;
					}
				}

				for(var i=1; i<=length; i++){
					var index = (i-1)*3;
					if(i == endPg){
						$('#endTotal_2'+index).css('display','flex');
					}else{
						$('#endTotal_2'+index).css('display','none');
					}
				}
			}

		</script>

		<!-- ================ Best Selling item  carousel end ================= -->


                <!-- ================ trending product section 삭제 ================= -->
                <section class="section-margin calc-60px">
                    <div class="">
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
    </main>


    <jsp:include page="../common/footer.jsp" />

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