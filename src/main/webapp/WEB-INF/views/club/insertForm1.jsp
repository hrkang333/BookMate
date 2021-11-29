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

<body style="width:1200px; margin:auto; margin-top: 200px;">
    <jsp:include page="../common/menubar.jsp" />

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
                                <input type="text" class="form-control must" name="hostName" maxlength="10" required>
                            </div>
                            <div class="col-md-4 form-group p_star">
                                <button type="button" class="button button-login check_button" onclick="checkHostName()">중복 확인</button>
                            </div>

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
                                            <img src="resources/img/delete.png " class="history" onclick="delHistory(this)">
                                        </li>
                                    </ul>
                                </div>

                            </div>
                            <div class="col-md-3 form-group p_star "></div>
                            <div class="col-md-9 form-group p_star ">

                                <!-- form 안에 있는 버튼은 submit 기능을 하기 때문에 type="button" 붙인다.-->
                                <button type="button" class="button button-login check_button" id="addHis" onclick="addHistory()">추가하기</button>
                            </div>

   

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
    
    <script>
		//호스트 이력 갯수 정하기 위해서 전역변수 cnt, maxField 선언
        var cnt = 1;
        var maxField = 15;
        var add = '<div><ul class="history_total"><li class="s"><input type="date" class="form-control my-input history " id="hstartDate" name="hstartDate"></li><li class="s"><input type="date" class="form-control my-input history " id="hendDate " name="hendDate"></li><li class="w"><input type="text " class="form-control my-input1 history " id="phwhatTodo " name="phwhatTodo"></li><li class="d"><img src="resources/img/delete.png " class="history my-input2 " onclick="delHistory(this)"></li></ul> </div>'

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
                alert("호스트명은 입력해주세요~");
            }
         }
	</script>
    <!--================End 호스트정보 입력창 =================-->

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