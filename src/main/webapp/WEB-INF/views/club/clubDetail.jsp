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
            width: 100%;
        }
        
        .left {
            flex: 0 0 auto;
            margin: 16px 28px;
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
        
        .titleDiv{
	        width: 100%;
		    height: 100%;
		   /*  background-color: #D5C4A2; */
	    }
	    
	    .titleBackImg{
	    	background-size: cover;
		    width: 100%;
		    height: 100%;
		    background-position: center center;
		    /* opacity:0.85; */
	    }
	    
	    .heartImg{
	    	position: absolute;
		    bottom: 4%;
		    right: 8%;
		    width: 10.5%;
		    cursor: pointer;
	    }
	    .m_contents{
	    	margin: 40px 0px 100px;
	    }
	    
		.reviewPhotos{
			width: 120px;
		    height: 120px;
		    background-size: cover;
		    background-position: center;
		}
		
		.reviewTable{
			display: table;
			width: 100%;
			border-bottom: 1px solid #dee2e6;
		}
						
		.reviewTableCell1{
			display: table-cell; 
			width: 75%;
		}
		.reviewTableCell2{
			display: table-cell; 
			width: 25%;
			padding-left: 4%
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
                    <div class="titleDiv">
                        <c:forEach var="ca" items="${club.clubAttachments}">
                        	<c:if test="${ca.fileType eq 2}">
                        		<div class="titleBackImg" style="background-image: url('${pageContext.servletContext.contextPath }/resources/upload_files/club_img/${ca.changeName}')">
                        			
                        			<c:choose>
                        				<c:when test="${befHeart eq 0}">
                        					<img  id="heartClub" class="heartImg" src="resources/img/club/hearts_empty.png">
                        				</c:when>
                        				<c:otherwise>
                        					<img  id="heartClub" class="heartImg" src="resources/img/club/hearts_full.png">
                        				</c:otherwise>
                        			</c:choose>
                        			
                        		</div>
                        		<!-- background-image 뒤에 넣기 : linear-gradient( rgba(0, 0, 0, 0.1), rgba(0, 0, 0, 0.1) ), -->
                        	</c:if>         		
                        </c:forEach> 
                    </div>
                </div>
                <div class="col-lg-6 offset-lg-1">
                    <div class="s_product_text total" style="margin-top:0px">
                    	<input type="hidden" id="clubNo" value="${club.clubNo}">
                        <h3 style="font-size: 37px;">${club.clubTitle}</h3>
                        <h2 style="font-size: 17px;">#${club.category} &nbsp; #${club.onoffLine} &nbsp; #${club.times} </h2>

						<div style="overflow:auto; width:80%; height:258px; margin:40px 0px 30px; border:3px solid #FFAE42">
							<c:forEach var="ct" items="${club.clubTimes}" varStatus="status">
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
	                                    <span style="margin-left: auto;">신청 <span id="applyCount${status.index}">${ct.apply_count}</span> / 정원 <span id="clubCapacity${status.index}">${club.clubCapacity}</span></span>
	                                </p>
	                            </div>
	                            <div class="right">
	                            	<c:if test="${club.times eq '한 번 만나요'}">
	                            		<!-- 오늘 날짜 이전은 신청되지 않게 한다. -->
	                            		<fmt:parseDate var="clubDate" value="${ct.clubDate}"  pattern="yyyy-MM-dd"/>
										<fmt:parseNumber value="${clubDate.time / (1000*60*60*24)}" integerOnly="true" var="clubDate1"></fmt:parseNumber>
	                            		
	                            		<jsp:useBean id="today" class="java.util.Date" />
			                            <fmt:formatDate var="today2" value="${today}" pattern="yyyy-MM-dd"/> 
			                            <fmt:parseDate var="now"  value="${today2}" pattern="yyyy-MM-dd"/>
										<fmt:parseNumber value="${now.time / (1000*60*60*24)}" integerOnly="true" var="now1"></fmt:parseNumber>

	                            		<c:if test="${ clubDate1 >= now1 }">
	                            			<input type="checkbox" class="applys" id="checkbox${status.index}" name="applys" value="${ct.timeNo}">
	                            		</c:if>	
	                            	</c:if>
	                            	<c:if test="${club.times eq '여러 번 만나요'}">
	                            		<input type="hidden" class="applys" name="applys" value="${ct.timeNo}">
	                            	</c:if>
	                            </div>
	                        </div>
							</c:forEach>
						</div>	
	                    <div class="">
	                        <!-- <button id="heartClub" class="button primary-btn">찜하기</button> -->
	                        <c:choose>
	                        	<c:when test="${club.condition eq 4 }">
	                        		<button id="applyClub" class="button primary-btn">신청하기</button>
	                        	</c:when>
	                        	<c:otherwise>
	                        		<button id="applyClub" class="button primary-btn" disabled>신청불가</button>
	                        	</c:otherwise>
	                        </c:choose>
	                    </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--================End Single Product Area =================-->

	<section class="club_detail" style="margin-top:30px;">
		<div class="container">
			<ul class="nav nav-tabs">
				<li class="nav-item"><a class="nav-link active"
					data-toggle="tab" href="#qwe">상세내용</a></li>
				<li class="nav-item"><a class="nav-link" data-toggle="tab"
					href="#asd">모임리뷰</a></li>
				<li class="nav-item"><a class="nav-link" data-toggle="tab"
					href="#zxc">문의하기</a></li>
			</ul>
			<div class="tab-content">
				<div class="tab-pane fade show active m_contents" id="qwe">
					<div class="detail_club">
						<h4 class="detail_title1">모임 소개</h4>
						<span><c:out value="${club.intro}" /></span> <br>
						<br>
						<h5 class="detail_title2">우리모임에서 할 활동들</h5>
						<p>
							<c:out value="${club.intro}" />
						</p>
						<h5 class="detail_title2">이런 멤버들을 만나고 싶어요</h5>
						<p>
							<c:out value="${club.want}" />
						</p>
						<h5 class="detail_title2">이런 분과는 맞지 않아요</h5>
						<p>
							<c:out value="${club.notwant}" />
						</p>
					</div>

					<div class="detail_onoff">
						<h4 class="detail_title1">참여 안내</h4>
						<p>이 모임은 [<c:out value="${club.times}" />]</p>

						<h5 class="detail_title2">모임 일정</h5>
						<p>
						<ul>
							<c:forEach var="ct" items="${club.clubTimes}">
								<li><fmt:parseDate var="clubD" value="${ct.clubDate}"
										pattern="yyyy-MM-dd" /> <!-- string -> Date로 --> <fmt:parseDate
										value="${ct.clubDate}" var="dateK" pattern="yyyy-MM-dd" /> <fmt:formatDate
										value="${dateK}" pattern="yyyy년 MM월 dd일" /> (<fmt:formatDate
										value="${clubD}" pattern="E" />) | ${ct.startTime} ~
									${ct.endTime}</li>
								<li></li>
							</c:forEach>
						</ul>
						</p>
						<h5 class="detail_title2">장소</h5>
						<p><c:out value="${club.onoffLine}" /></p>
						<h5 class="detail_title2">모집 정원</h5>
						<p><c:out value="${club.clubCapacity}" />명</p>
					</div>

					<div class="detail_book">
						<h4 class="detail_title1">함께 읽을 책 소개</h4>
						<div style="width: 100%; height: 270px; background-color: darksalmon;">
							<div class="left_1">
								<c:forEach var="ca" items="${club.clubAttachments}">
									<c:if test="${ca.fileType eq 3}">
										<img class="img-fluid" src="resources/upload_files/club_img/${ca.changeName}" style="height: 200px;" alt="">
									</c:if>
								</c:forEach>
							</div>

							<div class="right_1">
								<p><c:out value="${club.bkName}" /></p>
								<p><c:out value="${club.bkWriter}" /></p>
								<p><c:out value="${club.bkPublisher}" /></p>
							</div>
						</div>
					</div>

					<div class="detail_host">
						<h4 class="detail_title1">Host 소개</h4>
						<c:forEach var="ca" items="${club.clubAttachments}">
							<c:if test="${ca.fileType eq 1}">
								<img class="img-fluid" src="resources/upload_files/club_img/${ca.changeName}" style="width: 400px;"  alt="">
							</c:if>
						</c:forEach>
						<h5><c:out value="${club.hostName}" /></h5>
						<h5 class="detail_title2">약력</h5>
						<P><c:out value="${club.clubCapacity}" /></P>
						<h5 class="detail_title2">Comment</h5>
						<p><c:out value="${club.hostComment}" /></p>
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
				<div class="tab-pane fade m_contents" id="asd">
					<div style="border-bottom: 2px solid gray;">
						<button onclick="checkReview(${club.clubNo})">리뷰 남기기</button>
					</div>
					<ul class="reviewArea"></ul>					
				</div>
				
				<div class="tab-pane fade m_contents" id="zxc">
					<p>Curabitur dignissim quis nunc vitae laoreet. Etiam ut mattis
						leo, vel fermentum tellus. Sed sagittis rhoncus venenatis. Quisque
						commodo consectetur faucibus. Aenean eget ultricies justo.</p>
				</div>
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
    
    <!-- The Modal -->
	  <div class="modal" id="myModal">
	    <div class="modal-dialog modal-dialog-centered modal-lg">  <!-- modal-dialog-centered : 모달창 화면중앙 -->
	      <div class="modal-content">
	      
	        <!-- Modal Header -->
	        <div class="modal-header">
	          <h4 class="modal-title">리뷰 작성</h4>
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	        </div>
	        
	        <!-- Modal body -->
	      <form id="reviewEnrollForm" action="insertReview.cl" method="post" enctype="multipart/form-data">
	        <div class="modal-body">
	          <div class="content_scroll" style="overflow: auto; max-height:400px;">
	          	<input type="hidden" id="refClubNo" name="refClubNo" value="${club.clubNo }">
	          	<input type="hidden" id="reviewRate" name="reviewRate" value="10">

	          	<div style="margin-bottom:20px;">
                    <span style="font-weight: bold;">리뷰 평점</span> - 독서모임에 대해 평점을 선택해 주세요<br>
                    <img src="${pageContext.servletContext.contextPath }/resources/img/rateFull.png" style="width:35px;" alt="" id="scoreImg_1" onclick="reviewScore(1)" > 
                    <img src="${pageContext.servletContext.contextPath }/resources/img/rateFull.png" style="width:35px;" id="scoreImg_2" alt="" onclick="reviewScore(2)" > 
                    <img src="${pageContext.servletContext.contextPath }/resources/img/rateFull.png" style="width:35px;" id="scoreImg_3" alt="" onclick="reviewScore(3)" >
                    <img src="${pageContext.servletContext.contextPath }/resources/img/rateFull.png" style="width:35px;" alt=""  id="scoreImg_4" onclick="reviewScore(4)" > 
                    <img src="${pageContext.servletContext.contextPath }/resources/img/rateFull.png" style="width:35px;" id="scoreImg_5" alt="" onclick="reviewScore(5)" >
                </div>

	          	<textarea id="reviewContent" name="reviewContent" class="form-control" rows="10" style="resize: none;" placeholder="리뷰를 작성해주세요"></textarea>
	          	<input type="file" id="rPhoto" name="rPhoto" class="must" onchange="imgCheck(this,'reviewPhoto')"> <br>
	          	<img alt="" src="" id="prereviewPhoto">
	          </div>
	        </div>
		  </form>
	        <!-- Modal footer -->
	        <div class="modal-footer">
	          <a class="btn btn-primary" onclick="insertReview()">리뷰작성!</a>
	        </div>
	      </div>
	    </div>
	  </div>
    
    <script>
    	var userId = '<c:out value="${ loginUser.userId }"/>';
    	
    	$(function(){
    		selectReviewList();
    	}) 
    	
    	function selectReviewList(){
    		var clubNo = ${club.clubNo};
    		
    		$.ajax({
    			url:"selectReview.cl",
    			data:{
    				clubNo : clubNo
    			},
    			type : "get",
    			success:function(list){
    				console.log(list);
    				console.log(list.length);
    				
    				var result ="";
    				$.each(list, function(i){
    					result += '<li><div class="reviewTable" onclick="openReview('+i+')"> <div class="reviewTableCell1">'
						result += '<input type="hidden" id="reviewPhotoName'+i+'" value="'+list[i].reviewPhoto+'">'
    					for(var j=1; j<=list[i].reviewRate; j+=2){
    						result += '<img src="${pageContext.servletContext.contextPath }/resources/img/rateFull.png" style="width:20px; margin:10px 1px;">'
    					}   
    					result += '<br>'+list[i].reviewContent  
    					
    					var imgSrc = list[i].reviewPhoto
    					if(list[i].reviewPhoto != null){
    						result += '<div id="reviewPhotos1_'+i+'" class="reviewPhotos" style="background-image: url(\'${pageContext.servletContext.contextPath }/resources/upload_files/club_img/'+list[i].reviewPhoto+'\')"></div>'
    						result += '<img id="reviewPhotos2_'+i+'" style="width:500px; display:none;" src="${pageContext.servletContext.contextPath }/resources/upload_files/club_img/'+list[i].reviewPhoto+'">'
    					}
    					result += '</div><div class="reviewTableCell2">' + list[i].reviewWriter+'<br>'+ list[i].createDate
    					
    					if(userId == list[i].reviewWriter){
    						result += '<div onclick="delReview('+i+')">삭제하기</div>'
    					}
    					result += '</div></div></li>'
    				})
    	            $(".reviewArea").html(result);
    				
    			},error:function(){
    				console.log("ajax통신오류")
    			}
    		})
    	} 
    	
    	function openReview(i){
    		if($("#reviewPhotos2_"+i).css('display')=='none'){
    			$("#reviewPhotos1_"+i).css('display','none');
        		$("#reviewPhotos2_"+i).css('display','block');
    		}else{
    			$("#reviewPhotos1_"+i).css('display','block');
        		$("#reviewPhotos2_"+i).css('display','none');
    		}
    	}
    	
    	function reviewScore(num) {
            for(var i=1;i<=5;i++){
                $('#scoreImg_'+i).attr('src',"${pageContext.servletContext.contextPath }/resources/img/rateFull.png")
                if(i>num){
                    $('#scoreImg_'+i).attr('src',"${pageContext.servletContext.contextPath }/resources/img/rateEmpty.png")
                }
            }
            $('#reviewRate').val(num*2);
        }

    	function delReview(i){
    	   var clubNo = ${club.clubNo};
    	   console.log(i);
    	   var fileName = $('#reviewPhotoName'+i).val()
    	   
    	   if(confirm("리뷰를 삭제하시겠습니까?")){
    		   $.ajax({
        		   url: "deleteReview.cl",
        		   data:{
        			   clubNo : clubNo,
        			   userId : userId,
        			   fileName : fileName
        		   },
        		   type: "post",
        		   success:function(result){
        			   console.log("ajax 통신완료");
        			   alert("리뷰가 삭제되었습니다.")
        			   selectReviewList();
        		   },error:function(){
        			   console.log("ajax 통신실패");
        		   }
        	   })
    	   }
       }

	    function checkReview(clubNo){
			console.log("clubNo : " + clubNo);
			
			if(userId == ''){
				alert("로그인 후 이용 부탁드립니다");
				return;
			}
			
			//1.참여한 적 있는지 확인하기
			$.ajax({
				url:"checkReview.cl",
				data:{
					clubNo : clubNo,
					userId : userId
				},
				type : "get",
				success:function(result){
					if(result == 'fail'){
						alert("이 모임에 참여하신 적이 없습니다. 참여하신 후 리뷰 부탁드려요~");
						return;
					}else{
						if(result == '0'){
							if(confirm('참여하신 적이 있는 모임입니다! 리뷰를 쓰시겠습니까?')){
								$('#myModal').modal("show");							
							}
						}else{
							alert("이미 리뷰를 작성하셨습니다.")
						}
					}
				}, error:function(){
					
				}
			})
		}
	    
	    function insertReview() {
	        var form = $('#reviewEnrollForm')[0];
	        // FormData 객체 생성
	        var formData = new FormData(form);
	
	        $.ajax({
	            type: "POST",
	            enctype: 'multipart/form-data',
	            url: "insertReview.cl",
	            data: formData,
	            processData: false,
	            contentType: false,
	            cache: false,
	            timeout: 600000,
	            success: function (result) {
	                
	                $('#myModal').modal("hide"); //모달창 닫기
	                alert("리뷰가 등록되었습니다. 포인트 1000점 증정되었습니다!");
	                
	                selectReviewList();
	            },
	            error: function (e) {
	                console.log("ERROR : ", e);
	            }
	        });
	    }
	    
		function imgCheck(img,inputId) {
	    	
	    	if(img.files&&img.files[0]){
	    		var name= img.files[0].name
	    		var ext = name.substring(name.length-3,name.length)
	    		if(!(ext.toUpperCase()=='PNG'||ext.toUpperCase()=='JPG')){
	    			alert("이미지파일을 확인해주세요. png와 jpg만 가능합니다.")
	    			$('#'+inputId).val("")

	    			return;
	    		}
	    		const imgFile = new FileReader();
	    		imgFile.readAsDataURL(img.files[0])
	    		imgFile.onload = function(e) {
	    			const previewMainImage = document.getElementById("pre"+inputId);
	    			previewMainImage.src = e.target.result
	    			if(inputId=='reviewPhoto'){
	    				$('#pre'+inputId).css({"width":"200px","height":"200px"})
	    			}			
	    		}		   
	    	}
	    }
    
    	$("#heartClub").click(function() {
    		var clubNo = $("#clubNo").val();
			var c_host = '<c:out value="${club.userId}"/>';
    		var src = $('#heartClub').attr("src");
    		
    		if(userId == ''){
    			alert("독서모임 찜기능은 로그인 후 이용 부탁드립니다")
    			return;
    		}
    		
    		//1.5 로그인 유저 != 독서모임 작성자 유저
    		if(userId == c_host){
    			alert("독서모임 개설자는 찜할 수 없습니다.")
    			return;
    		}
    		
    		if(src == 'resources/img/club/hearts_empty.png'){
    			//1. 로그인 유저 확인

        		$.ajax({
        			url:"heart.cl",
    				data:{
    					clubNo : clubNo,
    					userId : userId
    				},
    				type : "post",
    				success:function(result){
    					console.log("ajax통신성공");
    					
    					if(result == 'fail'){
    						alert("이전에 찜하기 하신 적 있는 독서모임입니다.");
    					}else{
    						alert("찜목록에 추가되었습니다.");
    						$("#heartClub").attr("src","resources/img/club/hearts_full.png");
    					}
    					
    				},error:function(){
    					console.log("ajax통신실패");
    				}
        		})
        		
    		}else{
    			$.ajax({
        			url:"heartCancle.cl",
    				data:{
    					clubNo : clubNo,
    					userId : userId
    				},
    				type : "post",
    				success:function(result){
    					console.log("ajax통신성공");
    					
    					alert("찜목록에서 삭제되었습니다.");
						$("#heartClub").attr("src","resources/img/club/hearts_empty.png");
    					
    				},error:function(){
    					console.log("ajax통신실패");
    				}
        		})
    		}
    		
		})
    
    	$("#applyClub").click(function(){
    		var clubNo = $("#clubNo").val();
    		var chkApply = true;
    		var indexs = [];  //한번만나요: 사용자가 체크한 status.index / 여러번만나요: 모든status.index -> 이거로 신청인원+1 해줌
    		var times = [];   //한번만나요: 사용자가 체크한 timeNo / 여러번만나요: 모든 timeNo
    		var c_times = '<c:out value="${club.times}"/>'; 
    		var c_host = '<c:out value="${club.userId}"/>';
  
    		//1. 로그인 유저 확인
    		if(userId == ''){
    			alert("독서모임 신청은 로그인 후 이용 부탁드립니다")
    			return;
    		}
    		
    		//1.5 로그인 유저 != 독서모임 작성자 유저
    		if(userId == c_host){
    			alert("독서모임 개설자는 참여신청할 수 없습니다.")
    			return;
    		}
    		
    		//2.신청인원 < 정원 확인
    		//2-2.여러번 만나요일때 전체 체크
    		if(c_times == '여러 번 만나요'){
    			var apply = $('#applyCount0').text();
        		var capacity = $('#clubCapacity0').text();
        		
        		if(apply >= capacity){
    				chkApply = false;
    			}else{
    				var how = '<c:out value="${fn:length(club.clubTimes)}"/>'
    	            console.log("how : " + how);
    	        		
    	        	for(var i=0; i<how; i++){
    	        		indexs.push(i);
    	        	}
    	        		
    	        	console.log("여러번 만나요 index : " + indexs)
    			} 

    		}else{
    			//2-1.한번만나요 일때 사용자가 체크한 것만 정원 확인
        		$("input:checkBox[class='applys']:checked").each(function(){
        			var index = this.id.slice(-1);  //체크한 체크박스의 id에서 varStatus값만 추출
        			var apply = $('#applyCount'+index).text();
        			var capacity = $('#clubCapacity'+index).text();

        			if(apply >= capacity){
        				chkApply = false;
        				return false;
        			}else{
        				indexs.push(index);
            			console.log("한번만나요 index : " + indexs)
        			}    			
        		})
    		}

    		if(!chkApply){
    			alert("정원을 초과하여 신청이 불가능합니다.");
    			return;
    		}
    		
			//3.참여신청 확인 메세지 yes후 진행
    		if(confirm("해당 독서모임에 참여신청하시겠습니까?")){
    			if(c_times == '여러 번 만나요'){
        			$("input[class='applys']").each(function(){
        				var timeNo = $(this).val();
        				times.push(timeNo);
        			});
        		}else{
        			if($("input:checkBox[class='applys']:checked").length == 0){
                        alert("참여할 독서모임을 선택해주세요");
                    }else{
                    	$("input:checkbox[class='applys']:checked").each(function(){
            				var timeNo = $(this).val();
            				times.push(timeNo);
            			});
                    }
        		}
    			
    			if(times.length != 0){
					console.log(times)
    				$.ajax({
    					url:"apply.cl",
    					data:{
    						times : times,
    						userId : userId,
    						clubNo : clubNo,
    						c_times : c_times
    					},
    					type : "post",
    					success:function(result){
    						console.log(result)
    						if(result != "fail"){  //1.결과 fail아닐때
    							console.log("ajax 통신성공")
        						alert("감사합니다. 참여 신청완료되었습니다.")
        						
        						for(var i in indexs) {
    								var i = indexs[i];
    								var apply = $('#applyCount'+i).text();
    							    
    				    			$('#applyCount'+i).text(parseInt(apply)+1);
    							} 
    							
    						}else{  //2.결과 fail일때 - 이미 신청한 모임인 경우
    							alert("죄송합니다. 이미 신청하신 독서모임입니다.");
    							chkApply = false;
    						}

    					},error:function(){
    						console.log("ajax 통신실패")
    					}
    				
    				})
    			} 
    		}	
    	})

    </script>
    
    
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