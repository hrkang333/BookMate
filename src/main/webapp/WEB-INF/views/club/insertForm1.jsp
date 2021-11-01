<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--1. 호스트 이력 : delete.png 추가 (10.25)-->
<!--2. 호스트 이력 : 추가하기 기능 & 
                    삭제하기 기능 (10.27)-->

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

    <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> -->

    <style>
        .applicate_guide {
            margin-bottom: 30px;
            font-size: 17px;
            color: black;
            font-weight: 900;
        }
        
        .check_button {
            font-size: 12px;
        }
        
        .history_total {
            display: flex;
        }
        
        .history_total li.w {
            width: 46%;
            position: relative;
            /* flex: 5; */
        }
        
        .history_total li.s {
            width: 22%;
            padding-right: 20px;
            /* flex: 2; */
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
            left: 25px;
        }
    </style>
</head>

<body>
    <!--================ Start Header Menu Area =================-->
    <header class="header_area">
        <div class="main_menu">
            <nav class="navbar navbar-expand-lg navbar-light">
                <div class="container">
                    <a class="navbar-brand logo_h" href="index.html"><img src="img/logo.png" alt=""></a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
                    <div class="collapse navbar-collapse offset" id="navbarSupportedContent">
                        <ul class="nav navbar-nav menu_nav ml-auto mr-auto">
                            <li class="nav-item"><a class="nav-link" href="index.html">Home</a></li>
                            <li class="nav-item active submenu dropdown">
                                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Shop</a>
                                <ul class="dropdown-menu">
                                    <li class="nav-item"><a class="nav-link" href="category.html">Shop Category</a></li>
                                    <li class="nav-item"><a class="nav-link" href="single-product.html">Product Details</a></li>
                                    <li class="nav-item"><a class="nav-link" href="checkout.html">Product Checkout</a></li>
                                    <li class="nav-item"><a class="nav-link" href="confirmation.html">Confirmation</a></li>
                                    <li class="nav-item"><a class="nav-link" href="cart.html">Shopping Cart</a></li>
                                </ul>
                            </li>
                            <li class="nav-item submenu dropdown">
                                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Blog</a>
                                <ul class="dropdown-menu">
                                    <li class="nav-item"><a class="nav-link" href="blog.html">Blog</a></li>
                                    <li class="nav-item"><a class="nav-link" href="single-blog.html">Blog Details</a></li>
                                </ul>
                            </li>
                            <li class="nav-item submenu dropdown">
                                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Pages</a>
                                <ul class="dropdown-menu">
                                    <li class="nav-item"><a class="nav-link" href="login.html">Login</a></li>
                                    <li class="nav-item"><a class="nav-link" href="register.html">Register</a></li>
                                    <li class="nav-item"><a class="nav-link" href="tracking-order.html">Tracking</a></li>
                                </ul>
                            </li>
                            <li class="nav-item"><a class="nav-link" href="contact.html">Contact</a></li>
                        </ul>

                        <ul class="nav-shop">
                            <li class="nav-item"><button><i class="ti-search"></i></button></li>
                            <li class="nav-item"><button><i class="ti-shopping-cart"></i><span class="nav-shop__circle">3</span></button> </li>
                            <li class="nav-item"><a class="button button-header" href="#">Buy Now</a></li>
                        </ul>
                    </div>
                </div>
            </nav>
        </div>
    </header>
    <!--================ End Header Menu Area =================-->

    <!--================ 호스트 정보 입력창 =================-->
    <section class="checkout_area section-margin--small">
        <div class="container">
            <div class="billing_details">
                <div class="row">
                    <div class="col-lg-12" style="margin-bottom: 50px;">
                        <h3 style="font-size: 30px; ">독서모임 개설 신청서</h3>
                    </div>
                    <div class="col-lg-12">

                        <form id="hostEnrollForm" class="row contact_form" action="saveStep1.cl" method="post" enctype="multipart/form-data">
                            <div class="col-md-3 applicate_guide">
                                호스트명*
                            </div>
                            <div class="col-md-5 form-group p_star">
                                <input type="text" class="form-control must" name="hostName" required>
                            </div>
                            <div class="col-md-4 form-group p_star">
                                <button type="button" class="button button-login check_button" onclick="checkHostName()">중복 확인</button>
                            </div>

                            <script>
                                //호스트명 중복 확인
                                function checkHostName() {
                                    var hostName = $("#hostEnrollForm input[name=hostName]");
                                    console.log(hostName.val());

                                    if (hostName.val() == "") {
                                        alert("이름을 입력해주세요!");
                                        return false;
                                    }

                                    $.ajax({
                                        url: "hostCheck.cl",
                                        type: "post",
                                        data: {
                                            hostName: hostName.val()
                                        },
                                        success: function(result) {
                                            if (result == "duplicate") {
                                                confirm("이미 존재하는 이름입니다.사용하실 수 없습니다.");
                                                hostName.focus();
                                            } else {
                                                if (confirm("사용가능한 이름입니다. 사용하시겠습니까?")) {
                                                    hostName.attr("readonly", "true");
                                                } else {
                                                    hostName.focus();
                                                }
                                            }
                                        },
                                        error: function() {
                                            console.log("서버통신실패");
                                        }
                                    })
                                }
                            </script>

                            <div class="col-md-3 applicate_guide">
                                프로필 사진*
                            </div>
                            <div class="col-md-9 form-group p_star">
                                <input type="file" name="hostPhoto" class="must">
                            </div>

                            <div class="col-md-3 applicate_guide ">
                                호스트 이력
                            </div>
                            <div class="col-md-9 form-group" id="history">
                                <div>
                                    <ul class="history_total">
                                        <!-- 그냥 <div>로 하면 추가했을 때 이전꺼랑 정렬이 안 맞아서 ul,li로 고쳐줬다. -->
                                        <li class="s">
                                            <input type="date" class="form-control dates" id="hstartDate" name="hstartDate">
                                        </li>
                                        <li class="s">
                                            <input type="date" class="form-control dates" id="hendDate" name="hendDate">
                                        </li>
                                        <li class="w">
                                            <input type="text" class="form-control" id="phwhatTodo" name="phwhatTodo">
                                        </li>
                                        <li class="d">
                                            <img src="img/delete.png " class="history" onclick="delHistory(this)">
                                        </li>
                                    </ul>
                                </div>

                            </div>
                            <div class="col-md-3 form-group p_star "></div>
                            <div class="col-md-9 form-group p_star ">

                                <!-- form 안에 있는 버튼은 submit 기능을 하기 때문에 type="button" 붙인다.-->
                                <button type="button" class="button button-login check_button" id="addHis" onclick="addHistory()">추가하기</button>
                            </div>

                            <script>
                                //datePicker
                                // $(function() {
                                //     $('#hendDate').datepicker({

                                //     });
                                // })

                                //호스트 이력 갯수 정하기 위해서 전역변수 cnt, maxField 선언
                                var cnt = 1;
                                var maxField = 15;
                                var add = '<div><ul class="history_total"><li class="s"><input type="date" class="form-control my-input history " id="hstartDate" name="hstartDate"></li><li class="s"><input type="date" class="form-control my-input history " id="hendDate " name="hendDate"></li><li class="w"><input type="text " class="form-control my-input1 history " id="phwhatTodo " name="phwhatTodo"></li><li class="d"><img src="img/delete.png " class="history my-input2 " onclick="delHistory(this)"></li></ul> </div>'

                                //호스트 이력 추가하기 버튼
                                function addHistory() {
                                    cnt++;

                                    if (cnt <= maxField) {
                                        $("#history").append(add)
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
                                
                                //저장후 2단계로 넘어가기
                                function goStep2(){
                                	var is_empty = false;

                                	//children -> 바로 아래 요소만
                                    //find -> 자식 및 하위태그모두
                                	$('#hostEnrollForm').find('.must').each(function(){
                                		if(!$(this).val()){
                                			is_empty = true;
                                		}
                                	})
                                	
                                	//javascript에서는 빈값 그리고 null값을 NOT 연산자로 처리한다.
                                	if(is_empty){
                                		alert("모든 필수 입력창을 입력해주세요");
                                		//submit 막기
                                		$('#hostEnrollForm').attr('action','javascript://')
                                		//$('#hostEnrollForm').attr("onsubmit", "event.preventDefault();")
                                	}else{
                                		$('#hostEnrollForm').attr('action','insertClub1.cl').submit();
                                	}
                                }
                                
                                //$('#hostEnrollForm').attr('action','javascript://') 막은 후 작동안함,,
                                function saveStep1(){
                                	if($('#hostEnrollForm').find('input[name="hostName"]').val()){
                                		$('#hostEnrollForm').submit();
                                	}else{
                                		alert("호스트명은 입력해주세요~")
                                	}
                                }
                            </script>

                            <div class="col-md-3 applicate_guide ">
                                호스트 Comment*
                            </div>
                            <div class="col-md-9 form-group ">
                                <textarea class="form-control must" name="hostComment" id="message " rows="1 " placeholder="독서모임에 참여할 멤버들에게 comment를 남겨주세요! " style="margin-top: 0px; "></textarea>
                            </div>

                            <div class="col-md-12 " style="text-align: center; ">
                            	<button class="button button-login" onclick="saveStep1()">저장하기</button> 
                                <button class="button button-login" onclick="goStep2()">저장 후 다음 단계로!</button> 
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--================End 호스트정보 입력창 =================-->



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