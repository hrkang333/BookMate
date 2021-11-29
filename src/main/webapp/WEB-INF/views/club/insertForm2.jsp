<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>독서모임/개설신청step1</title>
    <link rel="icon" href="resources/img/logo1.png" type="image/png">

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
        .applicate_guide {
            margin-bottom: 30px;
            font-size: 17px;
            color: black;
            font-weight: 900;
        }
        
        .my-input {
            display: inline-block;
            width: 20%;
            margin-right: 20px;
        }
        
        .my-input1 {
            display: inline-block;
            width: 54%;
        }
    </style>
</head>

<body style="width:1200px; margin:auto; margin-top: 200px;">

	<jsp:include page="../common/menubar.jsp" />
   
    <!--================ step2 독서모임 정보 입력창 =================-->
    <section class="checkout_area section-margin--small">
        <div class="container">
            <div class="billing_details">
                <div class="row">
                    <div class="col-lg-12" style="margin-bottom: 50px;">
                        <h3 style="font-size: 30px; ">독서모임 개설 신청서</h3>
                    </div>
                    <div class="col-lg-12">
	
                        <form id="club2Form" class="row contact_form" action="saveStep2.cl" method="post" enctype="multipart/form-data">
                            <div class="col-md-3 applicate_guide">
                                독서모임 테마*
                            </div>
                            <div class="col-md-9 form-group p_star">
                                <select class="theme_select" name="category">
                                    <option value="인문/과학/심리">인문/과학/심리</option>
                                    <option value="문학/에세이">문학/에세이</option>
                                    <option value="예술/음악">예술/음악</option>
                                    <option value="경영/경제/마케팅">경영/경제/마케팅</option>
                                    <option value="글쓰기">글쓰기</option>
                                    <option value="강연">강연</option>
                                </select>
                            </div>

                            <div class="col-md-3 applicate_guide">
                                독서모임 제목*
                            </div>
                            <div class="col-md-6 form-group p_star">
                                <input type="text" class="form-control must" name="clubTitle" required>
                            </div>
                            <div class="col-md-3 form-group p_star"> </div>

                            <div class="col-md-3 applicate_guide">
                                모임 소개*
                            </div>
                            <div class="col-md-9 form-group">
                                <textarea class="form-control must" name="intro" rows="1" placeholder="독서모임에 참여할 멤버들에게 comment를 남겨주세요!" style="margin-top: 0px;"></textarea>
                            </div>

                            <div class="col-md-3 applicate_guide">
                                커버 사진*
                            </div>
                            <div class="col-md-9 form-group p_star">
                                <input type="file" name="coverPhoto" class="must" style="margin-bottom: 5px;"> <br>
                            </div>

                            <div class="col-md-3 applicate_guide">
                                우리 모임에서 할 활동들*
                            </div>
                            <div class="col-md-9 form-group">
                                <textarea class="form-control" name="activity" rows="1" placeholder="독서모임에 참여할 멤버들에게 comment를 남겨주세요!" style="margin-top: 0px;"></textarea>
                            </div>

                            <div class="col-md-3 applicate_guide">
                                이런 멤버들을 만나고 싶어요*
                            </div>
                            <div class="col-md-9 form-group">
                                <textarea class="form-control must" name="want" rows="1" placeholder="독서모임에 참여할 멤버들에게 comment를 남겨주세요!" style="margin-top: 0px;"></textarea>
                            </div>

                            <div class="col-md-3 applicate_guide">
                                이런 멤버는 만나고 싶지 않아요*
                            </div>
                            <div class="col-md-9 form-group">
                                <textarea class="form-control must" name="notwant" rows="1" placeholder="독서모임에 참여할 멤버들에게 comment를 남겨주세요!" style="margin-top: 0px;"></textarea>
                            </div>

                            <div class="col-md-3 applicate_guide">
                                독서모임 정원*
                            </div>
                            <div class="col-md-9 form-group p_star">
                                <input type="text" class="form-control must" name="capacity" style="width: 200px;" placeholder="3명 ~ 20명까지 가능합니다">
                            </div>

                            <div class="col-md-12 " style="text-align: center; ">
                                <button class="button button-login ">이전 단계로</button>
                                <button class="button button-login" onclick="saveStep2()">저장하기</button> 
                                <button class="button button-login" onclick="goStep3()">저장 후 다음 단계로!</button> 
                            </div>
                            
                            <script>
                            	//2. 저장하기
	                            function saveStep2(){
	                            	if($('#club2Form').find('input[name="clubTitle"]').val()){
	                            		$('#club2Form').submit();
	                            	}else{
	                            		alert("독서모임 제목은 입력해주세요~")
	                            	}
	                            }
	                            
	                            //저장후 3단계로 넘어가기
	                            function goStep3(){
	                            	var is_empty = false;
	
	                            	//console.log($('select[name="category"]').val());
	                            	
	                            	$('#club2Form').find('.must').each(function(){
	                            		if(!$(this).val()){
	                            			console.log($(this))
	                            			is_empty = true;
	                            		}
	                            	})

	                            	
	                            	//javascript에서는 빈값 그리고 null값을 NOT 연산자로 처리한다.
	                            	if(is_empty){
	                            		alert("모든 필수 입력창을 입력해주세요");
	                            		$('#club2Form').attr('action','javascript://')  //submit 막기
	                            	}else{
	                            		$('#club2Form').attr('action','insertClub2.cl').submit();
	                            	}
	                            }

                            </script>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--================End step2 독서모임 정보 입력창 =================-->

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