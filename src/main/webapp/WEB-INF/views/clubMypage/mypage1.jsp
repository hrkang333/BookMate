<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>독서모임 - 마이페이지</title>
    <link rel="icon" href="img/Fevicon.png" type="image/png">
    <link rel="stylesheet" href="resources/vendors/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="resources/vendors/fontawesome/css/all.min.css">
    <link rel="stylesheet" href="resources/vendors/themify-icons/themify-icons.css">
    <link rel="stylesheet" href="resources/vendors/linericon/style.css">
    <link rel="stylesheet" href="resources/vendors/owl-carousel/owl.theme.default.min.css">
    <link rel="stylesheet" href="resources/vendors/owl-carousel/owl.carousel.min.css">
    <link rel="stylesheet" href="resources/vendors/nice-select/nice-select.css">
    <link rel="stylesheet" href="resources/vendors/nouislider/nouislider.min.css">

    <link rel="stylesheet" href="resources/css/style.css">

    <style>
        .menus {
            color: black;
        }
        
        .box1 {
            width: 100%;
            float: left;
            /* display: inherit; */
        }
        
        .box2 {
            float: right;
        }
        
        .all {
            display: flex;
            margin-bottom: 50px;
        }
        
        .bottom1 {
            width: 70%;
        }
        
        .bottom2 {
            width: 30%;
            text-align: right;
        }
        
        .titleImg{
        	width: 120px;
    		height: 100px;
    		background-size: cover;
        }
    </style>
</head>

<body style="width:1200px; margin:auto">

    <jsp:include page="../club/clubMenubar.jsp"/>
    
    <script>
		    	
	    //선택한 독서모임 multiple 삭제하기
	    /* function deleteClub(){
	        var deleteC = confirm("찜목록에서 삭제하시겠습니까?");
	        if(deleteC){
	            if($("input:checkBox[name=clubNo]:checked").length == 0){
	                alert("삭제할 독서모임을 선택해주세요!!");
	            }else{
	                $("#mypageForm2").attr("action", "deleteClub2.cl");
	            }
	        }
	    } */
	    
	    function cancleClub(e){
	    	var userId = "${sessionScope.loginUser.userId}";
	    	var btnId = $(e).attr('id');
	    	var index = btnId.slice(-1);
	    	var timeNo = $('#timeNo'+index).val();
	    	var times = $('#times'+index).text();
	    	
	    	console.log("btnId : " + btnId);
	    	console.log("timeNO : " + timeNo);
	    	console.log("times : " + times);

	    	$.ajax({
	        	
        		url : "updateCancel.cl",
        		data : {
        			userId : userId,
        			timeNo : timeNo,
        			times : times
        		},
        		
        		type : "post" ,
        		success : function(str) {
					//취소완료로 바꾸기
					//$(this) 로는 안된다...
					alert("취소되었습니다.");
					$(e).attr('value','취소완료');
					$(e).attr('disabled', true);

        			
				},error:function(){
					console.log("ajax 통신실패")
					alert("오류")
				}
        	}) 
	    }
    </script>

    
    <!-- ================ category section start ================= -->
    <section class="section-margin--small mb-5" style="margin-top: 50px;">
        <div class="container">
            <div class="row">
                <h3 id="test" style="font-size: 30px; ">독서모임 신청내역</h3>
            </div>

            <div class="row">  
                <div class="col-xl-12 col-lg-12 col-md-12">
                    <!-- Start Best Seller -->
                    <section>
						<form id="mypageForm2" action="" method="post">
                        <div style="float: right;">
                            <button class="button button-login" style="margin-bottom: 20px;" onclick="deleteClub()">삭제하기</button>
                        </div>

                        <table id="applyList" class="table table-hover" align="center">
                            <thead>
                                <tr>
                                    <th style="width:5%;">선택</th>
                                    <th style="width:10%;">카테고리</th>
                                    <th style="width:29%;">독서모임명</th>
                                    <th style="width:9%;">온/오프라인</th>
                                    <th style="width:12%;">만남 횟수</th>
                                    <th style="width:17%;">날짜</th>
                                    <!-- <th>신청인원/정원</th> -->
                                    <th style="width:9%;">취소</th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:forEach items="${capList}" var="ap" varStatus="status">
	                                
	                                <c:forEach items="${list}" var="club"> 
	                                	<c:if test="${club.clubNo eq ap.clubNo}">
	                                		<c:set var="c" value="${club}"/>
	                                	</c:if>
	                                </c:forEach>
	
	                                <tr>
	                                    <td><input name="timeNo" type="checkBox" id="timeNo${status.index}" value="${ap.timeNo}"></td>
	                                    <td><c:out value="${c.category}"/></td>
	                                    
	                                    <td>
	                                    <div>
	                                    	<c:forEach items="${c.clubAttachments}" var="ca">
	                                    		<c:if test="${ca.fileType eq 2}">
	                                    			<div class="titleImg" style="background-image: url('${pageContext.servletContext.contextPath }/resources/upload_files/club_img/${ca.changeName}')"> </div>
	                                    		</c:if>
	                                    	</c:forEach>
	                                    	<div><c:out value="${c.clubTitle}"/></div>
	                                    </div>
	                                    </td>

	                                    <td><c:out value="${c.onoffLine}"/></td>
	                                    <td><span id="times${status.index}"><c:out value="${c.times}"/></span></td>
	                                    
	                                    <td>
		                                    <c:forEach items="${c.clubTimes}" var="ct" varStatus="i">
		                                    	<c:if test="${c.times eq '한 번 만나요'}">
		                                    		<c:if test="${ct.timeNo eq ap.timeNo}">
		                                    			${fn:substring(ct.clubDate,0,11)} | ${ct.startTime} ~ ${ct.endTime}<br>
		                                    			<c:set var="cd" value="${ct.clubDate}"></c:set>
		                                    		</c:if>
		                                    	</c:if>
		                                    	<c:if test="${c.times eq '여러 번 만나요'}">
		                                    		${fn:substring(ct.clubDate,0,11)} | ${ct.startTime} ~ ${ct.endTime}<br>
		                                    		<c:if test="${i.first}">
		                                    			<c:set var="cd" value="${ct.clubDate}"></c:set>
		                                    		</c:if>
		                                    	</c:if>
		                                    	
		                                    	<fmt:parseDate var="clubDate" value="${cd}"  pattern="yyyy-MM-dd"/>
												<fmt:parseNumber value="${clubDate.time / (1000*60*60*24)}" integerOnly="true" var="clubDate1"></fmt:parseNumber>
			                                </c:forEach>
		                                </td>
		                                
		                                <jsp:useBean id="today" class="java.util.Date" />
		                                <fmt:formatDate var="today2" value="${today}" pattern="yyyy-MM-dd"/>
		                                <fmt:parseDate var="now"  value="${today2}" pattern="yyyy-MM-dd"/>
										<fmt:parseNumber value="${now.time / (1000*60*60*24)}" integerOnly="true" var="now1"></fmt:parseNumber>

									    <td>
									    	<c:choose>
									    		<c:when test="${ap.applyCancle eq 'N'}">
									    			<c:choose>
									    				<c:when test="${c.condition eq 4 || c.condition eq 5}">
										    				<c:choose>
										    					<c:when test="${clubDate1- now1 >= 3}">  <!-- 모임일자 3일 이전은 취소 못함 -->
											    					<input type="button" id="cancleBtn${status.index}" value="취소하기" onclick="cancleClub(this);">
											    				</c:when>
											    				<c:otherwise>
											    					<button disabled>취소 불가</button>
											    					<label>모임일자 3일 이전에는 취소가 불가능합니다.</label>
											    				</c:otherwise>
										    				</c:choose>
										    			</c:when>
											    		<c:otherwise>
											    			<button disabled>취소 불가</button>
											    			<label>현재 모집중인 독서모임이 아닙니다.</label>
											    		</c:otherwise>
									    			</c:choose>
									    		</c:when>
									    		
									    		<c:otherwise>
									    			<button disabled>취소완료</button>
									    		</c:otherwise>
									    	</c:choose>
									    </td>
	                                </tr>  
                                </c:forEach>  
                            </tbody>
                        </table>

                        <!-- 종류별 독서모임 보기 & 페이징바 -->

                        <div class="all" style="width: 100%;">
                            <div class="all  bottom1" style="width: 70%;">
                                <div class="sorting">
                                    <select>
                                          <option value="1">독서모임명</option>
                                          <option value="1">상태</option>
                                        </select>
                                </div>
                                <div>
                                    <div class="input-group filter-bar-search">
                                        <input type="text" placeholder="Search">
                                        <div class="input-group-append">
                                            <button type="button"><i class="ti-search"></i></button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

						</form>
						
						<div id="pagingArea">						
			                <ul class="pagination">
			                	<c:choose>
			                		<c:when test="${ pi.currentPage ne 1 }">
			                			<li class="page-item"><a class="page-link" href="mypage1.cl?currentPage=${ pi.currentPage-1 }">이전</a></li>
			                		</c:when>
			                		<c:otherwise>
			                			<li class="page-item disabled"><a class="page-link" href="">이전</a></li>
			                		</c:otherwise>
			                	</c:choose>
			                	
			                    <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
			                    	<c:choose>
				                		<c:when test="${ pi.currentPage ne p }">
			                    			<li class="page-item"><a class="page-link" href="mypage1.cl?currentPage=${ p }">${ p }</a></li>
				                		</c:when>
				                		<c:otherwise>
				                			<li class="page-item disabled"><a class="page-link" href="">${ p }</a></li>
				                		</c:otherwise>
				                	</c:choose>
			                    </c:forEach>
			                    
			                    <c:choose>
			                		<c:when test="${ pi.currentPage ne pi.maxPage }">
			                			<li class="page-item"><a class="page-link" href="mypage1.cl?currentPage=${ pi.currentPage+1 }">다음</a></li>
			                		</c:when>
			                		<c:otherwise>
			                			<li class="page-item disabled"><a class="page-link" href="mypage1.cl?currentPage=${ pi.currentPage+1 }">다음</a></li>
			                		</c:otherwise>
			                	</c:choose>
			                </ul>
			            </div>
                    </section>
                    <!-- End Best Seller -->
                </div>
            </div>
        </div>
    </section>
    <!-- ================ category section end ================= -->


    <!--================ Start footer Area  =================-->
    <footer>
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
    <script src="resources/vendors/nouislider/nouislider.min.js"></script>
    <script src="resources/vendors/jquery.ajaxchimp.min.js"></script>
    <script src="resources/vendors/mail-script.js"></script>
    <script src="resources/js/main.js"></script>
</body>

</html>