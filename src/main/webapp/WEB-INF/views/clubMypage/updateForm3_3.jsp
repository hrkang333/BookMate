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
    <title>독서모임/개설수정step3</title>
    <link rel="icon" href="resources/img/logo1.png" type="image/png">

    <link rel="stylesheet" href="resources/vendors/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="resources/vendors/fontawesome/css/all.min.css">
    <link rel="stylesheet" href="resources/vendors/themify-icons/themify-icons.css">
    <link rel="stylesheet" href="resources/vendors/linericon/style.css">
    <link rel="stylesheet" href="resources/vendors/owl-carousel/owl.theme.default.min.css">
    <link rel="stylesheet" href="resources/vendors/owl-carousel/owl.carousel.min.css">
    <!-- <link rel="stylesheet" href="resources/vendors/nice-select/nice-select.css"> -->
    <link rel="stylesheet" href="resources/vendors/nouislider/nouislider.min.css">

    <link rel="stylesheet" href="resources/css/style.css">

    <style>
        .applicate_guide {
            margin-bottom: 30px;
            font-size: 17px;
            color: black;
            font-weight: 900;
        }
        
        .my-input {
            display: inline-block !important;
            width: 27.5% !important;
            margin-right: 15px;
        }
        
        .history_total {
            display: flex;
        }
        
        .history_total li.s {
            width: 30%;
            padding-right: 20px;
            /* flex: 2; */
        }
        
        .history_total li.w {
            width: 20%;
            padding-right: 20px;
            position: relative;
            /* flex: 5; */
        }
        
        .history_total li.d {
            width: 10%;
            text-align: center;
            position: relative;
            /* flex: 1; */
        }
        
        .history_total li img {
            width: 40%;
            position: absolute;
            top: 4px;
            left: 5px;
        }
        
        .check_button {
            font-size: 14px !important;
		    background-color: #503535 !important;
		    border: 0 !important;
		    border-radius: 5% !important;
		    color: white;
		    padding: 5px 25px;
        }
        
        .club_contents{
	        font-size: 18px;
        }

        .answer_contents{
	        border-color: lightgray !important;
		    font-size: 17px !important;
		    color: black !important;
        }
        
        .example{
	        background-color: #ecf4f1;
		    padding: 20px 40px;
		    margin: 0px 0px 20px;
        }
        
        .list{
            height: 200px;
		    width: 130px;
		    overflow-x: hidden !important;
		    overflow-y: scroll !important;
        }
    </style>
</head>

<body style="width:1200px; margin:auto; margin-top: 200px;">
    <jsp:include page="../common/menubar.jsp" />
	<jsp:include page="../club/clubMenubar.jsp"/>
    <!--================ step3 독서모임 정보 입력창 =================-->
    <section class="checkout_area section-margin--small">
        <div class="container">
            <div class="billing_details">
                <div class="row">
                    <div class="col-lg-12" style="margin-bottom: 40px;">
                        <h3 style="font-size: 30px; padding: 10px 0px 20px; border-bottom: 2px solid gray;">독서모임 개설 신청서  
                        	<span style="float:right; font-size: 15px; font-weight: 550;"><img alt="1" style="width: 20px;" src="resources/img/club/one_b.png"> 기본정보&nbsp;&nbsp;···&nbsp;&nbsp;<img alt="2" style="width: 20px;" src="resources/img/club/two_b.png"> 모임테마&nbsp;&nbsp;···&nbsp;&nbsp;<img alt="3" style="width: 20px;" src="resources/img/club/three_blue.png"> 책/일정</span> 
                        </h3>
                    </div>
                    <div class="col-lg-12">

                        <form id="club3Form" class="row contact_form" action="updateClub3.cl" method="post" enctype="multipart/form-data">
                            <input type="hidden" name="clubNo" value="${club.clubNo}">
                            <div class="col-md-3 applicate_guide club_contents">
                                온라인/오프라인*
                            </div>
                            <div class="col-md-9 form-group p_star">
                                <label style="margin-right: 110px;" class="answer_contents">
                                    <input class="answer_contents must" type="radio" name="onoffLine" value="온라인"  <c:if test="${club.onoffLine eq '온라인'}">checked</c:if>  >온라인
                                </label>
                                <label class="answer_contents">
                                    <input class="answer_contents must" type="radio" name="onoffLine" value="오프라인"  <c:if test="${club.onoffLine eq '오프라인'}">checked</c:if>  >오프라인
                                </label>
                            </div>

                            <div class="col-md-3 applicate_guide club_contents">
                                모임 횟수*
                            </div>
                            <div class="col-md-9 form-group p_star">
                                <label style="margin-right: 80px;" class="answer_contents">
                                    <input type="radio" class="answer_contents must" name="times" value="한 번 만나요" <c:if test="${club.times eq '한 번 만나요'}">checked</c:if>>한 번 만나요
                                </label>
                                <label class="answer_contents">
                                    <input type="radio" class="answer_contents must" name="times" value="여러 번 만나요" <c:if test="${club.times eq '여러 번 만나요'}">checked</c:if>>여러 번 만나요
                                </label>
                            </div>

                            <div class="col-md-3 applicate_guide club_contents">
                                모임 날짜*
                            </div>
                            <div class="col-md-9 form-group" id="dates">
                            	<div class="example">
                            		<span style="font-weight: 550; font-size: 17px; margin-bottom: 10px;">많이 참여할 수 있는 시간 꿀팁!</span>
                            		<ul style="list-style : disc">
										<li>멤버들의 라이프스타일에 따라서 선호하는 시간대가 다를 수 있습니다!</li>
                            			<li>직장인 : 월요일과 금요일은 되도록 모임을 피해주세요! 화요일, 수요일, 목요일 저녁 7시 이후가 모임 시간으로 적당합니다. 주말은 오전 11시 이후가 좋습니다😊</li>
                            			<li>홈워커 : 평일 오전 11시나 오후 2시 이후가 적당합니다.</li>
                            			<li>모임개설이 완료된 상태에서는 모임날짜를 변경 할 수 없습니다.</li>
                            		</ul>
                            	</div>
                            
                            	<c:set var="leng" value="${fn:length(club.clubTimes)}"/>
                            	<c:choose>
                            		<c:when test="${leng eq 0}">
	                            		<ul class="history_total">
		                                    <li class="s">
		                                        <input type="date" class="form-control answer_contents must" id="date" name="newClubDate">
		                                    </li>
		                                    <li class="w">
		                                        <select class="answer_contents must" name="startTime" style="width:135px; height:38px;">
				                                    <c:forEach var="i"  begin="5" end="23">
												        <option value="${i}">${i<10? ('0'+= '' += i +=':00') : (i +=':00')}</option>
												    </c:forEach>
				                                </select>
		                                    </li>
		                                    <li class="w">
		                                        <!-- <input type="text" class="form-control must" id="endTime" name="endTime"> -->
		                                        <select class="answer_contents must" name="endTime" style="width:135px; height:38px;">
				                                    <c:forEach var="i"  begin="5" end="23">
												        <option value="${i}">${i<10? ('0'+= '' += i +=':00') : (i +=':00')}</option>
												    </c:forEach>
				                                </select>
		                                    </li>
		                                    <li class="d">
		                                        <img src="resources/img/delete.png" onclick="delHistory(this)">
		                                    </li>
		                                </ul>
                            		</c:when>
                            		<c:otherwise>
                            			<c:forEach items="${club.clubTimes}" var="ct">
                            				<ul class="history_total">
			                                    <li class="s">
			                                        <input type="date" class="form-control answer_contents must" id="date" name="newClubDate" value="${ct.clubDate}">
			                                    </li>
			                                    <li class="w">
			                                        <select class="answer_contents must" id="startTime" name="startTime" style="width:135px; height:38px;">
					                                    <c:forEach var="i"  begin="5" end="23">
													        <option value="${i}" <c:if test="${ct.startTime eq i}">selected</c:if> >${i<10? ('0'+= '' += i +=':00') : (i +=':00')}</option>
													    </c:forEach>
					                                </select>
			                                    </li>
			                                    <li class="w">
			                                        <!-- <input type="text" class="form-control must" id="endTime" name="endTime"> -->
			                                        <select class="answer_contents must" id="endTime" name="endTime" style="width:135px; height:38px;">
					                                    <c:forEach var="i"  begin="5" end="23">
													        <option value="${i}" <c:if test="${ct.endTime eq i}">selected</c:if> >${i<10? ('0'+= '' += i +=':00') : (i +=':00')}</option>
													    </c:forEach>
					                                </select>
			                                    </li>
			                                    <li class="d">
			                                        <img src="resources/img/delete.png" onclick="delHistory(this)">
			                                    </li>
			                                </ul>
                            			</c:forEach>
                            			
                            		</c:otherwise>
                            	</c:choose>

                            </div>
                            <div class="col-md-3 form-group p_star "></div>
                            <div class="col-md-9 form-group p_star ">
                                <button type="button" class="check_button" onclick="addHistory()">추가하기</button>
                            </div>
                            
                            <div class="col-md-3 applicate_guide club_contents">
                                모임 기간*
                            </div>
                            <div class="col-md-9 form-group ">
                            	<div class="example">
                            		<span style="font-weight: 550; font-size: 17px; margin-bottom: 10px;">모임 기간은 어떻게 설정하는 게 좋을까요?</span>
                            		<ul style="list-style : disc">
										<li>모임시작 일자는 첫 모임 시작 전 최소 7일 전으로 해주세요 멤버들이 책읽을 시간이 필요해요:)</li>
                            			<li>모임마감 일자는 마지막 모임 하루 이틀 전이 좋습니다.</li>
                            			<li>모임일자에 비해 마감일자가 더 많이 긴 경우 반려될 수 있으니 주의해주세요!</li>
                            		</ul>
                            	</div>
                            
                                <label class="my-input">모집 시작</label>
                                <label class="my-input">모집 종료</label> <br>
                                <input type="date" class="form-control answer_contents my-input must" id="startDate" name="clubStartDate" value="${club.clubStartDate}">
                                <input type="date" class="form-control answer_contents my-input must" id="endDate " name="clubEndDate" value="${club.clubEndDate}">
                            </div>



                            <div class="col-md-3 applicate_guide club_contents">
                                모임 책 제목*
                            </div>
                            <div class="col-md-9 form-group p_star">
                                <input type="text" class="form-control answer_contents must" id="bkName" name="bkName" value="${club.bkName}">
                            </div>

                            <div class="col-md-3 applicate_guide club_contents">
                                모임 책 저자*
                            </div>
                            <div class="col-md-9 form-group p_star">
                                <input type="text" class="form-control answer_contents must" id="bkWriter" name="bkWriter" value="${club.bkWriter}">
                            </div>

                            <div class="col-md-3 applicate_guide club_contents">
                                모임 책 출판사*
                            </div>
                            <div class="col-md-9 form-group p_star">
                                <input type="text" class="form-control answer_contents must" id="bkPublisher" name="bkPublisher" value="${club.bkPublisher}">
                            </div>

                            <div class="col-md-3 applicate_guide club_contents">
                                모임 책 사진*
                            </div>
                            <div class="col-md-9 form-group p_star">
                                <input type="file" class="must" name="bookPhoto" onchange="imgCheck(this,'bookPhoto')">
                            </div>
                            
                            
                            <div class="col-md-3 applicate_guide club_contents">
                 				<label for="coverPhoto">책 사진 미리보기</label>
                            </div>
                            
                            <div class="col-md-9 form-group p_star">
                            
                            	<c:set var="s" value="0"/>

                                <c:forEach items="${club.clubAttachments}" var="at">
                                	<c:if test="${at.fileType eq 3}">
                                		현재 업로드된 파일 : ${at.originalName}
	                                	<input type="hidden" name="old_changeName" id="old_changeName" value="${ at.changeName }">
		                            	<br>
	                            		<img alt="" src="${pageContext.servletContext.contextPath }/resources/upload_files/club_img/${at.changeName}" id="prebookPhoto" style="width:250px; height:300px;" >
                                	
                                		<c:set var="s" value="${s+1}"/>
                                	</c:if>
                                </c:forEach>

                                <c:if test="${s == 0}">
                                	<img alt="" src="" id="prebookPhoto">
                                </c:if>                               
                            </div>
                            

                            <div class="col-md-12 " style="text-align: center; ">
                                <button class="check_button" onclick="saveStep3()">저장하기</button> 
                                <button class="check_button" onclick="goStepFinal()">개설신청하기</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
     <script>
     	//호스트 이력 갯수 정하기 위해서 전역변수 cnt, maxField 선언
        var cnt = '${fn:length(club.clubTimes)}';
        var maxField = 10;
  
        $(function(){
	    	if(document.getElementById("old_changeName")){
	        	var old = document.getElementById("old_changeName").value;
		                        		
		        if(old != ""){
		             $("#bookPhoto").attr('class','notMust');
		        }
	        }                		
	    });
        
        var add= '<ul class="history_total"><li class="s"><input type="date" class="form-control answer_contents must" id="date" name="newClubDate"></li>'
    	add += '<li class="w"><select class="answer_contents must" name="startTime" style="width:135px; height:38px;"><c:forEach var="i"  begin="5" end="23"><option value="${i}">${i<10? ("0"+= "" += i +=":00") : (i +=":00")}</option></c:forEach></select></li>'
    	add += '<li class="w"><select class="answer_contents must" name="endTime" style="width:135px; height:38px;"><c:forEach var="i"  begin="5" end="23"><option value="${i}">${i<10? ("0"+= '' += i +=":00") : (i +=":00")}</option> </c:forEach> </select> </li>'
    	add += '<li class="d"><img src="resources/img/delete.png" onclick="delHistory(this)"></li></ul>';
    	
    	$("#bkName").keyup(function(e){
	        var content = $(this).val();
	         	
	        if(content.length>21){
	        	alert("최대 20자까지 입력 가능합니다.");
	        	$(this).val(content.substring(0,20));
	        }
	    })
	    
	    $("#bkWriter").keyup(function(e){
	        var content = $(this).val();
	         	
	        if(content.length>21){
	        	alert("최대 20자까지 입력 가능합니다.");
	        	$(this).val(content.substring(0,20));
	        }
	    })
	    
	    $("#bkPublisher").keyup(function(e){
	        var content = $(this).val();
	         	
	        if(content.length>21){
	        	alert("최대 20자까지 입력 가능합니다.");
	        	$(this).val(content.substring(0,20));
	        }
	    })
    	
        //호스트 이력 추가하기 버튼
        function addHistory() {
        	cnt++;

            if (cnt <= maxField) {
            	$("#dates").append(add)
                console.log(cnt + "개")
            } else {
                alert("모임은 최대 10개까지 입력가능합니다.")
            }
        }

        //호스트 이력 삭제하기 버튼 
        //$(this).parent().remove() 는 안된다.
        function delHistory(obj) {
        	if (cnt > 1) {
            	cnt--;
                $(obj).parent().parent().remove();
            } else {
                //전체 input 창 값 비게해주기
            }
        }
        
      //2. 저장하기
        function saveStep3(){
        	if($('#club3Form').find('input[name="onoffLine"]').val()){
        		$('#club3Form').attr('action','updateClub3.cl').submit();
        	}else{
        		alert("온라인/오프라인 여부는 체크해주세요~")
        	}
        }
        
      	//저장후 3단계로 넘어가기
        function goStepFinal(){
        	var is_empty = false;
        	
        	$('#club3Form').find('.must').each(function(){
        		if(!$(this).val()){
        			console.log($(this))
        			is_empty = true;
        		}
        	})

        	//javascript에서는 빈값 그리고 null값을 NOT 연산자로 처리한다.
        	if(is_empty){
        		alert("모든 필수 입력창을 입력해주세요");
        		$('#club3Form').attr('action','javascript://')  //submit 막기
        	}else{
        		if(confirm("개설 신청하시겠습니까?")){
        			$('#club3Form').attr('action','updateClubNext3.cl').submit();
        		}else{
        			$('#club3Form').attr('action','javascript://')  //submit 막기
        		}
        	}
        }
      	
      	//이미지 체크, 미리보기
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
        			if(inputId=='bookPhoto'){
        				$('#pre'+inputId).css({"width":"250px","height":"300px"})
        			}			
        		}		   
        	}
        };
    </script>
    <!--================End step3 독서모임 정보 입력창 =================-->

	<jsp:include page="../common/footer.jsp" />

    <script src="resources/vendors/jquery/jquery-3.2.1.min.js "></script>
    <script src="resources/vendors/bootstrap/bootstrap.bundle.min.js "></script>
    <script src="resources/vendors/skrollr.min.js "></script>
    <script src="resources/vendors/owl-carousel/owl.carousel.min.js "></script>
	<!-- <script src="resources/vendors/nice-select/jquery.nice-select.min.js "></script> -->
    <script src="resources/vendors/jquery.ajaxchimp.min.js "></script>
    <script src="resources/vendors/mail-script.js "></script>
    <script src="resources/js/main.js "></script>
</body>

</html>