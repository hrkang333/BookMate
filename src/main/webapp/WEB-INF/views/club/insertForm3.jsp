<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>독서모임/개설신청step1</title>
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
        .applicate_guide {
            margin-bottom: 30px;
            font-size: 17px;
            color: black;
            font-weight: 900;
        }
        
        .my-input {
            display: inline-block;
            width: 20%;
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
    </style>
</head>

<body style="width:1200px; margin:auto">
    <jsp:include page="../club/clubMenubar.jsp"/>

    <!--================ step3 독서모임 정보 입력창 =================-->
    <section class="checkout_area section-margin--small">
        <div class="container">
            <div class="billing_details">
                <div class="row">
                    <div class="col-lg-12" style="margin-bottom: 50px;">
                        <h3 style="font-size: 30px; ">독서모임 개설 신청서</h3>
                    </div>
                    <div class="col-lg-12">

                        <form id="club3Form" class="row contact_form" action="saveStep3.cl" method="post" enctype="multipart/form-data">
                            <div class="col-md-3 applicate_guide">
                                온라인/오프라인*
                            </div>
                            <div class="col-md-9 form-group p_star">
                                <label style="margin-right: 110px;">
                                    <input class="must" type="radio" name="onoffLine" value="온라인">온라인
                                </label>
                                <label>
                                    <input class="must" type="radio" name="onoffLine" value="오프라인">오프라인
                                </label>
                            </div>

                            <div class="col-md-3 applicate_guide">
                                모임 횟수*
                            </div>
                            <div class="col-md-9 form-group p_star">
                                <label style="margin-right: 80px;">
                                    <input type="radio" class="must" name="times" value="한 번 만나요">한 번 만나요
                                </label>
                                <label>
                                    <input type="radio" class="must" name="times" value="여러 번 만나요">여러 번 만나요
                                </label>
                            </div>

                            <div class="col-md-3 applicate_guide ">
                                모임 날짜*
                            </div>
                            <div class="col-md-9 form-group" id="dates">
                                <ul class="history_total">
                                    <li class="s">
                                        <input type="date" class="form-control must" id="date" name="clubDate">
                                    </li>
                                    <li class="w">
                                        <input type="text" class="form-control must" id="startTime" name="startTime">
                                    </li>
                                    <li class="w">
                                        <input type="text" class="form-control must" id="endTime" name="endTime">
                                    </li>
                                    <li class="d">
                                        <img src="resources/img/delete.png" onclick="delHistory(this)">
                                    </li>
                                </ul>
                            </div>
                            <div class="col-md-3 form-group p_star "></div>
                            <div class="col-md-9 form-group p_star ">
                                <button type="button" class="button button-login check_button" onclick="addHistory()">추가하기</button>
                            </div>

                            <script>
                                //호스트 이력 갯수 정하기 위해서 전역변수 cnt, maxField 선언
                                var cnt = 1;
                                var maxField = 15;
                                var add = '<ul class="history_total"><li class="s"><input type="date" class="form-control must" id="date" name="clubDate"></li><li class="w"><input type="text " class="form-control must" id="startTime" name="startTime"></li><li class="w"><input type="text " class="form-control must" id="endTime" name="endTime"></li><li class="d"><img src="img/delete.png " onclick="delHistory(this)"></li></ul>'

                                //호스트 이력 추가하기 버튼
                                function addHistory() {
                                    cnt++;

                                    if (cnt <= maxField) {
                                        $("#dates").append(add)
                                        console.log(cnt + "개")

                                    } else {
                                        alert("호스트 이력은 최대 15개까지 입력가능합니다.")
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
                            </script>

                            <div class="col-md-3 applicate_guide ">
                                모임 기간*
                            </div>
                            <div class="col-md-9 form-group ">
                                <label class="my-input">모집 시작</label>
                                <label class="my-input">모집 종료</label> <br>
                                <input type="date" class="form-control my-input must" id="startDate" name="clubStartDate">
                                <input type="date" class="form-control my-input must" id="endDate " name="clubEndDate">
                            </div>



                            <div class="col-md-3 applicate_guide">
                                모임 책 제목*
                            </div>
                            <div class="col-md-6 form-group p_star">
                                <input type="text" class="form-control must" name="bkName">
                            </div>
                            <div class="col-md-3 form-group p_star"> </div>

                            <div class="col-md-3 applicate_guide">
                                모임 책 저자*
                            </div>
                            <div class="col-md-6 form-group p_star">
                                <input type="text" class="form-control must" name="bkWriter">
                            </div>
                            <div class="col-md-3 form-group p_star"> </div>

                            <div class="col-md-3 applicate_guide">
                                모임 책 출판사*
                            </div>
                            <div class="col-md-6 form-group p_star">
                                <input type="text" class="form-control must" name="bkPublisher">
                            </div>
                            <div class="col-md-3 form-group p_star"> </div>

                            <div class="col-md-3 applicate_guide">
                                모임 책 사진*
                            </div>
                            <div class="col-md-9 form-group p_star">
                                <input type="file" class="must" name="bookPhoto">
                            </div>

                            <div class="col-md-12 " style="text-align: center; ">
                                <button class="button button-login">이전 단계로</button>
                                <button class="button button-login" onclick="saveStep3()">저장하기</button> 
                                <button class="button button-login" onclick="goStepFinal()">개설신청하기</button>
                            </div>
                            
							<script>
                            	//2. 저장하기
	                            function saveStep3(){
	                            	if($('#club3Form').find('input[name="onoffLine"]').val()){
	                            		$('#club3Form').submit();
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
	                            		$('#club3Form').attr('action','insertClub3.cl').submit();
	                            	}
	                            }

                            </script>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--================End step3 독서모임 정보 입력창 =================-->



    <!--================ Start footer Area  =================-->
    <footer>
        <div class="footer-area footer-only ">
            <div class="container ">
                <div class="row section_gap ">
                    <div class="col-lg-3 col-md-6 col-sm-6 ">
                        <div class="single-footer-widget tp_widgets ">
                            <h4 class="footer_title large_title ">Our Mission</h4>
                            <p>
                                So seed seed green that winged cattle in. Gathering thing made fly you're no divided deep moved us lan Gathering thing us land years living.
                            </p>
                            <p>
                                So seed seed green that winged cattle in. Gathering thing made fly you're no divided deep moved
                            </p>
                        </div>
                    </div>
                    <div class="offset-lg-1 col-lg-2 col-md-6 col-sm-6 ">
                        <div class="single-footer-widget tp_widgets ">
                            <h4 class="footer_title ">Quick Links</h4>
                            <ul class="list ">
                                <li><a href="# ">Home</a></li>
                                <li><a href="# ">Shop</a></li>
                                <li><a href="# ">Blog</a></li>
                                <li><a href="# ">Product</a></li>
                                <li><a href="# ">Brand</a></li>
                                <li><a href="# ">Contact</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-6 col-sm-6 ">
                        <div class="single-footer-widget instafeed ">
                            <h4 class="footer_title ">Gallery</h4>
                            <ul class="list instafeed d-flex flex-wrap ">
                                <li><img src="img/gallery/r1.jpg " alt=" "></li>
                                <li><img src="img/gallery/r2.jpg " alt=" "></li>
                                <li><img src="img/gallery/r3.jpg " alt=" "></li>
                                <li><img src="img/gallery/r5.jpg " alt=" "></li>
                                <li><img src="img/gallery/r7.jpg " alt=" "></li>
                                <li><img src="img/gallery/r8.jpg " alt=" "></li>
                            </ul>
                        </div>
                    </div>
                    <div class="offset-lg-1 col-lg-3 col-md-6 col-sm-6 ">
                        <div class="single-footer-widget tp_widgets ">
                            <h4 class="footer_title ">Contact Us</h4>
                            <div class="ml-40 ">
                                <p class="sm-head ">
                                    <span class="fa fa-location-arrow "></span> Head Office
                                </p>
                                <p>123, Main Street, Your City</p>

                                <p class="sm-head ">
                                    <span class="fa fa-phone "></span> Phone Number
                                </p>
                                <p>
                                    +123 456 7890 <br> +123 456 7890
                                </p>

                                <p class="sm-head ">
                                    <span class="fa fa-envelope "></span> Email
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