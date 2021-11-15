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
        
        .fontBold{
        	font-weight:900;
        }
        .fontBold:hover{
        	color: #EE7942;
        }
        
    </style>
</head>

<body style="width:1200px; margin:auto">
    
    <jsp:include page="../club/clubMenubar.jsp"/>

    <main class="site-main">
    
    	<!-- 카테고리별 헤더 만들기 -->
        <ul class="navbar" style="width: 100%; margin-top: 20px;">
            <li class="nav-item">
                <h5 class="clickCategory fontBold" style="color: orange;"><a style="cursor:pointer">인문/과학/심리</a></h5>
            </li>
            <li class="nav-item">
                <h5 class="clickCategory fontBold"><a style="cursor:pointer">문학/에세이</a></h5>
            </li>
            <li class="nav-item">
                <h5 class="clickCategory fontBold"><a style="cursor:pointer">예술/음악</a></h5>
            </li>
            <li class="nav-item">
                <h5 class="clickCategory fontBold"><a style="cursor:pointer">경영/경제/마케팅</a></h5>
            </li>
            <li class="nav-item">
                <h5 class="clickCategory fontBold"><a style="cursor:pointer">글쓰기</a></h5>
            </li>
            <li class="nav-item">
                <h5 class="clickCategory fontBold"><a style="cursor:pointer">강연</a></h5>
            </li>
        </ul>


        <!-- ================ 1.인기 독서모임 ================= -->
        <section class="section-margin calc-60px" style="margin-top:50px;">
            <div class="">  <!-- container -->
                <div class="section-intro pb-60px" style="text-align:center;">  <!-- pb-60px -->
                    <h2>모집<span class="section-intro__style">중</span></h2>
                </div>

            <div class="row" id="categoryList1_1" style="display:none;">
                                해당 카테고리에 독서모임은 없습니다.
            </div>
                    
            <c:if test="${fn:length(cateList_first) > 0}">           
                <div class="row" id="categoryList1_2">
                     <c:forEach begin="0" end="7" varStatus="s">
                        <div id="c_clubTotal${s.index}" class="col-md-6 col-lg-3 mb-3 mb-lg-0  pointer" style="display:flex;">
	                        <input id="c_clubNo${s.index}" type="hidden" value="${cateList_first[s.index].clubNo}">
	                        <div class="card card-blog">
	                             <div class="card-blog__img">
	                                 <img id="c_clubImg${s.index}" class="card-img rounded-0" src="${pageContext.servletContext.contextPath }/resources/upload_files/club_img/${cateList_first[s.index].clubAttachments[0].changeName}" alt="">
	                             </div>
	                             <div class="card-body">
	                                 <ul class="card-blog__info">
	                                     <li><span id="c_category${s.index}">${cateList_first[s.index].category}</span> &nbsp; [<span style="margin-right:0px;" id="c_onoffLine${s.index}">${cateList_first[s.index].onoffLine}</span>] </li>
	                                     <li><i class="ti-comments-smiley"></i> <span id="c_likes${s.index}">${cateList_first[s.index].heartCount }</span> Likes</li>
	                                 </ul>
	                                 <h4 id="c_title${s.index}" class="card-blog__title">${cateList_first[s.index].clubTitle}</h4>
	                                 <p>
	                                 	<c:forEach items="${cateList_first[s.index].clubTimes}" var="at" varStatus="s_at">
	                                 		
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
	                                   	     시작 : <span id="c_startDate${s.index}">${firstStart}</span> &nbsp; | <span id="c_manyTimes${s.index}">${fn:length(cateList_first[s.index].clubTimes)}</span>번
	                                 </p>
	                             </div>
	                        </div>
	                     </div> 
                      </c:forEach>
                 </div>
              </c:if> 
                 
                 <div style="display:block;">	
				
			          <ul id="pagingArea1" class="pagination">  	
			             
			             <c:choose>
			                	<c:when test="${ pi_first.currentPage ne 1 }">
			                		<li id="bb" class="page-item"><div class="page-link pagelink1">이전</div></li>
			                	</c:when>
			                	<c:otherwise>
			                		<li  id="bb" class="page-item disabled"><div class="page-link">이전</div></li>
			                	</c:otherwise>
			              </c:choose> 
			              
			             <c:forEach begin="1" end="${ pi_first.pageLimit}" var="p">
			             	<li id="cc${p}" class="page-item" style="display:none" value="0"><div id="ccc${p}" class="page-link"></div></li>
			             </c:forEach>
			             
			             <c:forEach begin="${ pi_first.startPage }" end="${ pi_first.endPage }" var="p">
			                    <c:choose>
				                	<c:when test="${ pi_first.currentPage ne p }">
			                    		<li class="page-item" value="${p}"><div class="page-link cc1" >${ p }</div></li>
				                	</c:when>
				                	<c:otherwise>
				                		<li class="page-item disabled"><a class="page-link cc1" href="">${ p }</a></li>
				                	</c:otherwise>
				                </c:choose>
			             </c:forEach>
			                    
			             <c:choose>
			                 <c:when test="${ pi_first.currentPage ne pi_first.maxPage }">
			                	 <li id="dd" class="page-item"><div class="page-link pagelink1">다음</div></li>
			                 </c:when>
			                 <c:otherwise>
			                	 <li id="dd" class="page-item disabled"><div class="page-link">다음</div></li>
			                 </c:otherwise>
			              </c:choose> 
			              
			          </ul>
			     </div>
			</div>
		</section>

				<script>
                	var category = "인문/과학/심리";
                	var origin = 0;
                	
                    $(function(){
                        $(".pointer").click(function(){
                            console.log($(this).children(":first").val());
                            location.href="detail.cl?clubNo=" + $(this).children(":first").val();
                        });
                    })
                    
                    $(".page-item").click(function(){
                    	var currentPage = $(this).val();
                    	var clubStatus = '';
                    	console.log("페이징-currentPage : " + currentPage);
                    	
                    	var parentId = $(this).parent().attr('id');
                    	if(parentrId = 'pagingArea1'){
                    		clubStatus='모집중'
                    	}else{
                    		clubStatus='모집완료'
                    	}
                    	
                    	$.ajax({
                    		url:"allCateListPart.cl",
                    		data:{
                    			category : category,
                    			clubStatus : clubStatus,
                    			currentPage : currentPage
                    		},
							type : "post",
							success:function(map){
								console.log("ajax 통신성공");
								
								console.log("페이징 리스트 길이-"+ map.cateList1.length);
								console.log("페이징-"+ map.pi1);
								
								list1(map);								
								
	                    	},error:function(){
	                    		console.log("ajax 통신실패")
	                    	}
                    	})
                    })
  
                    $(".clickCategory").click(function(){
						
	    	        	category = $(this).text();

						$.ajax({
							url:"allCateList.cl",
							data:{category:category},
							type : "post",
							success:function(map){
								console.log("ajax 통신성공")
								
								//1. 리스트 붙이기
								list1(map);
								list2(map);
								

							},error:function(){
								console.log("ajax 통신실패")
							}
						})
	                })
	                
	                 function list1(map){
                    	var cateList1 = map.cateList1;
                    	
                    	var listView1 = document.getElementById("categoryList1_1");
						var listView = document.getElementById("categoryList1_2");
						
						var intro;
						
						console.log("list길이 : " + cateList1.length)
						
						if(cateList1.length == 0){  //1.리스트 빈 경우
							listView.style.display = 'none';
							listView1.style.display = 'flex';
						}else{				  //2. 리스트 값 있는 경우
							$.each(cateList1,function(i){
								
								$('#c_clubImg'+i).attr("src","${pageContext.servletContext.contextPath }/resources/upload_files/club_img/"+cateList1[i].clubAttachments[0].changeName);
								$('#c_clubNo'+i).val(cateList1[i].clubNo);	
								$('#c_category'+i).text(cateList1[i].category);	
								$('#c_onoffLine'+i).text(cateList1[i].onoffLine);
								$('#c_title'+i).text(cateList1[i].clubTitle);
								$('#c_likes'+i).text(cateList1[i].heartCount);
								
								var dateCount = 0;
								var startD;
								
								for(var ct of cateList1[i].clubTimes){
									
									if(dateCount == 0){
										startD = ct.clubDate
									}else{
										if(startD > ct.clubDate){
											startD = ct.clubDate
										}
									}
									dateCount +=1;
								}
								
								$('#c_startDate'+i).text(startD);
								$('#c_manyTimes'+i).text(cateList1[i].clubTimes.length);
								$('#c_clubTotal'+i).css('display','flex');  //none풀어주기
								
							})
		
							listView1.style.display = 'none';
							
							if(listView.style.display == 'none'){  //리스트 없는 경우 none으로 되어있어서 clubTotal이 보이려면 풀어줘야 함
								listView.style.display = 'flex';
							}
							
							for(var i=cateList1.length; i<8; i++){
								$('#c_clubTotal'+i).css('display','none');
							}							
						}
						
						//2.페이징바 처리하기
						//list내용 없으면 페이징바 안보이게 하기
						if(cateList2.length == 0){
							$('#pagingArea1').css("display", "none");
						}else{
							$('#pagingArea1').css("display", "block");
						}
						
						//0) 맨 처음에 뜨는 페이징바-1,2,3... 안보이게 처리
						$(".cc1").css("display", "none");
			
						//1)이전으로
						var pi1 = map.pi1;
						if(pi1.currentPage != 1){
							$('#bb').removeClass("disabled");
						}else{
							$('#bb').addClass("disabled");
						}
						
						//2)1,2,3...
						//2-1) 페이지갯수만큼 보이게 하기
						var p_index = 0;
						for(var p=pi1.startPage; p<=pi1.endPage; p++){
							$("#cc" + p).removeClass("disabled");  //현재페이지 아닌곳은 다 갈 수 있어야 하므로
							$("#cc" + p).css("display", "block");
			                $("#cc" + p).val(p);
			                $("#ccc" + p).text(p);
			                
			                if(pi1.currentPage == p){
			                	$("#cc" + p).addClass("disabled");
			                }
			                p_index += 1;
						}
						
						//2-2) 페이지갯수 초과 -> 안보이게 하기
						for(var dp=p_index+1; dp<=pi1.pageLimit; dp++){
							$("#cc" + dp).css("display", "none");
						}
						
						//3)다음으로
						if(pi1.currentPage != pi1.maxPage){
							$('#dd').removeClass("disabled");
						}else{
							$('#dd').addClass("disabled");
						}
                    }
	                
	                 function list2(map){
                    	var cateList2 = map.cateList2;
                    	
                    	var listView1 = document.getElementById("categoryList2_1");
						var listView = document.getElementById("categoryList2_2");
						
						var intro;
						
						console.log("list길이2 : " + cateList2.length)
						
						if(cateList2.length == 0){  //1.리스트 빈 경우
							console.log("list길이2- 여기는돌아 : " + cateList2.length)
							listView.style.display = 'none';
							listView1.style.display = 'flex';
						}else{				  //2. 리스트 값 있는 경우
							$.each(cateList2,function(i){
								
								$('#c_clubImg2'+i).attr("src","${pageContext.servletContext.contextPath }/resources/upload_files/club_img/"+cateList2[i].clubAttachments[0].changeName);
								$('#c_clubNo2'+i).val(cateList2[i].clubNo);	
								$('#c_category2'+i).text(cateList2[i].category);	
								$('#c_onoffLine2'+i).text(cateList2[i].onoffLine);
								$('#c_title2'+i).text(cateList2[i].clubTitle);
								
								$('#c_likes2'+i).text(cateList2[i].heartCount);
								
								var dateCount = 0;
								var startD;
								
								for(var ct of cateList2[i].clubTimes){
									
									if(dateCount == 0){
										startD = ct.clubDate
									}else{
										if(startD > ct.clubDate){
											startD = ct.clubDate
										}
									}
									dateCount +=1;
								}
								
								$('#c_startDate2'+i).text(startD);
								$('#c_manyTimes2'+i).text(cateList2[i].clubTimes.length);
								$('#c_clubTotal2'+i).css('display','flex');  //none풀어주기
								
							})
							
							console.log("list길이2 : " + cateList2.length)
		
							listView1.style.display = 'none';
							
							if(listView.style.display == 'none'){  //리스트 없는 경우 none으로 되어있어서 clubTotal이 보이려면 풀어줘야 함
								listView.style.display = 'flex';
							}
							
							for(var i=cateList2.length; i<8; i++){
								$('#c_clubTotal'+i).css('display','none');
							}
						}
						
						//list내용 없으면 페이징바 안보이게 하기
						if(cateList2.length == 0){
							$('#pagingArea2').css("display", "none");
						}else{
							$('#pagingArea2').css("display", "block");
						}
						//2.페이징바 처리하기
						//0) 맨 처음에 뜨는 페이징바-1,2,3... 안보이게 처리
						$(".cc12").css("display", "none");
			
						//1)이전으로
						var pi2 = map.pi2;
						if(pi2.currentPage != 1){
							$('#bb2').removeClass("disabled");
						}else{
							$('#bb2').addClass("disabled");
						}
						
						//2)1,2,3...
						//2-1) 페이지갯수만큼 보이게 하기
						var p_index = 0;
						
						
						console.log("cateList2 - 길이 : " + cateList2.length)
						console.log("cateList2 - pi2.startPage : " + pi2.startPage)
						console.log("cateList2 - pi2.endPage : " + pi2.endPage)
						
						for(var p=pi2.startPage; p<=pi2.endPage; p++){
							$("#cc2" + p).removeClass("disabled");  //현재페이지 아닌곳은 다 갈 수 있어야 하므로
							$("#cc2" + p).css("display", "block");
			                $("#cc2" + p).val(p);
			                $("#ccc2" + p).text(p);
			                
			                if(pi2.currentPage == p){
			                	$("#cc2" + p).addClass("disabled");
			                }
			                p_index += 1;
						}
						
						//2-2) 페이지갯수 초과 -> 안보이게 하기
						for(var dp=p_index+1; dp<=pi2.pageLimit; dp++){
							$("#cc2" + dp).css("display", "none");
						}
						
						//3)다음으로
						if(pi2.currentPage != pi2.maxPage){
							$('#dd2').removeClass("disabled");
						}else{
							$('#dd2').addClass("disabled");
						}							
                    }
                </script>

                <!-- ================ 2. 모집완료  ================= -->
       <section class="section-margin calc-60px">
            <div class="">
                  <div class="section-intro pb-60px" style="text-align:center;">  <!-- pb-60px -->
                    <h2>모집<span class="section-intro__style">완료</span></h2>
                 </div>
                 
                 <div class="row" id="categoryList2_1" style="display:none;">
                                      해당 카테고리에 독서모임은 없습니다.
            	 </div>
                    
                 <c:if test="${fn:length(cateList_second) > 0}">           
                	<div class="row" id="categoryList2_2">
                     	<c:forEach begin="0" end="7" varStatus="s">
                        	<div id="c_clubTotal2${s.index}" class="col-md-6 col-lg-3 mb-3 mb-lg-0  pointer" style="display:flex;">
	                        	<input id="c_clubNo2${s.index}" type="hidden" value="${cateList_second[s.index].clubNo}">
	                        	<div class="card card-blog">
	                            	 <div class="card-blog__img">
	                          	       <img id="c_clubImg2${s.index}" class="card-img rounded-0" src="${pageContext.servletContext.contextPath }/resources/upload_files/club_img/${cateList_second[s.index].clubAttachments[0].changeName}" alt="">
	                            	</div>
	                             	<div class="card-body">
	                                    <ul class="card-blog__info">
	                                       <li><span id="c_category2${s.index}">${cateList_second[s.index].category}</span> &nbsp; [<span style="margin-right:0px;" id="c_onoffLine${s.index}">${cateList_second[s.index].onoffLine}</span>] </li>
	                                       <li><i class="ti-comments-smiley"></i> ${cateList_second[s.index].heartCount } Likes</li>
	                                    </ul>
	                                 <h4 id="c_title2${s.index}" class="card-blog__title">${cateList_second[s.index].clubTitle}</h4>
	                                 <p>
	                                 	<c:forEach items="${cateList_second[s.index].clubTimes}" var="at" varStatus="s_at">
	                                 		
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
	                                      	시작 : <span id="c_startDate2${s.index}">${firstStart}</span> &nbsp; | <span id="c_manyTimes2${s.index}">${fn:length(cateList_second[s.index].clubTimes)}</span>번
	                                 </p>
	                             </div>
	                        </div>
	                     </div> 
                      </c:forEach>
                 </div>
              </c:if> 
                 
                 <div style="display:block;">	
				
			          <ul id="pagingArea2" class="pagination">  	
			             
			             <c:choose>
			                	<c:when test="${ pi_second.currentPage ne 1 }">
			                		<li id="bb2" class="page-item"><div class="page-link pagelink1">이전</div></li>
			                	</c:when>
			                	<c:otherwise>
			                		<li  id="bb2" class="page-item disabled"><div class="page-link">이전</div></li>
			                	</c:otherwise>
			              </c:choose> 
			              
			             <c:forEach begin="1" end="${ pi_second.pageLimit}" var="p">
			             	<li id="cc2${p}" class="page-item" style="display:none" value="0"><div id="ccc2${p}" class="page-link"></div></li>
			             </c:forEach>
			             
			             <c:forEach begin="${ pi_second.startPage }" end="${ pi_second.endPage }" var="p">
			                    <c:choose>
				                	<c:when test="${ pi_second.currentPage ne p }">
			                    		<li class="page-item" value="${p}"><div class="page-link cc12" >${ p }</div></li>
				                	</c:when>
				                	<c:otherwise>
				                		<li class="page-item disabled"><a class="page-link cc12" href="">${ p }</a></li>
				                	</c:otherwise>
				                </c:choose>
			             </c:forEach>
			                    
			             <c:choose>
			                 <c:when test="${ pi_second.currentPage ne pi_second.maxPage }">
			                	 <li id="dd2" class="page-item"><div class="page-link pagelink1">다음</div></li>
			                 </c:when>
			                 <c:otherwise>
			                	 <li id="dd2" class="page-item disabled"><div class="page-link">다음</div></li>
			                 </c:otherwise>
			              </c:choose> 
			              
			          </ul>
			     </div>          
             </div>
          </section>                

                <!-- ================ 3. 마감임박 독서모임 ================= -->
                <section class="section-margin calc-60px">
                    <div class="">
                        <div class="section-intro pb-60px" style="text-align:center;">  <!-- pb-60px -->
                    		<h2>모집<span class="section-intro__style">종료</span></h2>
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