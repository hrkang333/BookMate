<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <meta http-equiv="X-UA-Compatible" content="ie=edge">
            <title>[책장메이트] - 판매자 가입</title>
            <script type="text/javascript" src="resources/js/seller.js"></script>
            <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
            <script>
                function sample4_execDaumPostcode() {
                    new daum.Postcode({
                        oncomplete: function (data) {
                            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                            var roadAddr = data.roadAddress; // 도로명 주소 변수
                            var extraRoadAddr = ''; // 참고 항목 변수

                            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                            if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                                extraRoadAddr += data.bname;
                            }
                            // 건물명이 있고, 공동주택일 경우 추가한다.
                            if (data.buildingName !== '' && data.apartment === 'Y') {
                                extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                            }
                            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                            if (extraRoadAddr !== '') {
                                extraRoadAddr = ' (' + extraRoadAddr + ')';
                            }

                            // 우편번호와 주소 정보를 해당 필드에 넣는다.
                            document.getElementById('sample4_postcode').value = data.zonecode;
                            document.getElementById("sample4_roadAddress").value = roadAddr;
                            document.getElementById("sample4_jibunAddress").value = data.jibunAddress;

                            document.getElementById("sample4_engAddress").value = data.addressEnglish;

                            // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                            if (roadAddr !== '') {
                                document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                            } else {
                                document.getElementById("sample4_extraAddress").value = '';
                            }

                            var guideTextBox = document.getElementById("guide");
                            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                            if (data.autoRoadAddress) {
                                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                                guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                                guideTextBox.style.display = 'block';


                            } else {
                                guideTextBox.innerHTML = '';
                                guideTextBox.style.display = 'none';
                            }
                        }
                    }).open();
                }
            </script>
        </head>

        <body style="width: 1200px; margin: auto;">
            <jsp:include page="../ubook/ubookMenu.jsp" />



            <!--================ 바디 =================-->
            <div class="mycontainer"
                style="width: 100% !important; padding:0px 0px 0px 0px !important; margin:0px 0px 0px 0px !important;">
                <div class="row">

                    <!--================ 좌측 사이드바(도서 카테고리 선택) =================-->
 					<jsp:include page="../ubook/ubookCategory.jsp"/>
                    <!--================ End 좌측 사이드바(도서 카테고리 선택) =================-->

                    <!--================ 메인 Content =================-->
                    <div class="col-xl-9 col-lg-8 col-md-7 maincon" style="margin-left: 203px; padding-top: 93px;">
                        <!--================ 메인 Content 헤더 =================-->
                        <nav id="header" class="maintab">
                            <div id="header-container" class="container navbar-container">
                                <div class="navbar-header">
                                    <h2 class="signuptitle">책장메이트 판매자 가입</h2>
                                </div>
                            </div>
                        </nav>
                        <main class="site-main sellerCon">
                            <!--================ 판매자 가입 폼 =================-->
                            <div class="container mt-5">
                                <div class="row d-flex justify-content-center align-items-center">
                                    <div class="col-md-12 regForm">
                                        <!--================ 메인 Content 헤더 =================-->
                                        <div class="all-steps" id="all-steps">
                                            <span class="step"></span>
                                            <span class="step"></span>
                                        </div>

                                        <!--================ 판매자 이용약관 동의 =================-->
                                        <div class="tab">
                                            <h1 id="register">책장메이트 판매자 이용약관 동의</h1>
                                            <br><br>
                                            <div class="form-group">
                                                <label class="container-checkbox">
                                                    책장메이트 이용약관을 모두 읽었으며 이에 동의합니다.
                                                    <input class="chk" type="checkbox" checked="checked" required>
                                                    <span class="checkmark-box"></span>
                                                </label>
                                            </div>
                                            <textarea style="resize: none;" class="txtarea">
                    책장메이트 이용약관
                    1. 책구메이트 회원은 ~~~~~
                    ~~~~~~~~~~~
                    ~~~~~~~~~~
                    ㅇ
                    ㅇ
                    ㅇ
                    ㅇ
                    ㅇ
                    ㅇ
                    ㅇ
                    </textarea>
                                            <br>
                                            <br>
                                            <div class="form-group">
                                                <label class="container-checkbox">
                                                    책장메이트 판매자 가입 약관을 모두 읽었으며 이에 동의합니다.
                                                    <input class="chk" type="checkbox" checked="checked" required>
                                                    <span class="checkmark-box"></span>
                                                </label>
                                            </div>
                                            <textarea style="resize: none;" class="txtarea">
                      책장메이트 이용약관
                      1. 책구메이트 회원은 ~~~~~
                      ~~~~~~~~~~~
                      ~~~~~~~~~~
                      ㅇ
                      ㅇ
                      ㅇ
                      ㅇ
                      ㅇ
                      ㅇ
                      ㅇ
                  </textarea>
                                            <br>
                                            <br>
                                        </div>
                                        <!--================ 판매자 정보입력 =================-->
                                        <form id="sellerRegForm" action="insertSeller.se" method="post">
                                            <div class="tab">
                                                <h1 id="register">책장메이트 판매자 정보입력</h1>
                                                <br>
                                                <h3>판매자 정보 입력</h3><br>

                                                <label>판매자 아이디</label>
                                                <input id="datainput" value="${ loginUser.userId }" readonly required="required"
                                                    name="sellerId">
                                                <br><br>
                                                <label>판매자 닉네임</label>
                                                <input id="datainput" required="required"
                                                    oninput="this.className = ''" name="sellerNickN"><button class="postBtn" onclick="chkNickN()">중복확인</button>
                                                <br><br>
                                                
                                                 <script>
					                                //호스트명 중복 확인
					                                function chkNickN() {
					                                    var sellerNickN = $("#sellerRegForm input[name=sellerNickN]");
					                                    console.log(sellerNickN.val());
					
					                                    if (sellerNickN.val() == "") {
					                                        alert("닉네임을 입력해주세요");
					                                        return false;
					                                    }
					
					                                    $.ajax({
					                                        url: "chkNickN.se",
					                                        type: "post",
					                                        data: {
					                                        	sellerNickN: sellerNickN.val()
					                                        },
					                                        success: function(result) {
					                                            if (result == "no") {
					                                                confirm("이미 존재하는 닉네임입니다. 다른 닉네임을 입력해주세요.");
					                                                sellerNickN.val('');
					                                                sellerNickN.focus();
					                                            } else {
					                                                if (confirm("사용가능한 닉네임입니다. 사용하시겠습니까?")) {
					                                                	sellerNickN.attr("readonly", "true");
					                                                } else {
					                                                	sellerNickN.focus();
					                                                }
					                                            }
					                                        },
					                                        error: function() {
					                                            console.log("서버통신실패");
					                                        }
					                                    })
					                                }
					                            </script>
                                                
                                                <label>판매자 이메일</label>
                                                <input id="datainput" required="required"
                                                    oninput="this.className = ''" name="sellerEmail">
                                                <br><br>
                                                <label>판매자 핸드폰</label>
                                                <input id="datainput" required="required"
                                                    oninput="this.className = ''" name="sellerPhone">
                                                <br><br>
                                                <hr>
                                                <h3>판매자 배송정보 입력</h3><br>
                                                <label class="inputlabel">배송방법</label>
                                                <label class="container leftradio">&nbsp;&nbsp; 편의점 택배
                                                    <input type="radio" checked="checked" name="sellerDel"
                                                        value="conveni">
                                                    <span class="checkmark"></span>
                                                </label>
                                                <label class="container rightradio">&nbsp;&nbsp; 직접 택배 업체 지정
                                                    <input type="radio" name="sellerDel" value="self">
                                                    <span class="checkmark"></span>
                                                </label>
                                                <br><br>
                                                <label class="inputlabel">배송비</label>

                                                <label class="container leftradio2">&nbsp;&nbsp; 기본 : 2600원
                                                    <input class="deleveryChk" type="checkbox" checked="checked" hidden="hidden"
                                                        name="sellerDelP1" value="2600">
                                                    <span class="checkmark"></span>
                                                </label>
                                                <label class="container rightradio">&nbsp;&nbsp; 도서산간지역 : 4000원
                                                    <input class="deleveryChk" type="checkbox" checked="checked" hidden="hidden"
                                                        name="sellerDelP2" value="4000"> <span class="checkmark"></span>
                                                </label>
                                                <br><br>
                                                <label class="inputlabel">출고지</label>
												<br><br>
												<br><br>
                               
                                                <input type="text" id="sample4_postcode" name="post" placeholder="우편번호" required="required"
                                                    readonly>
                 								<button type="button" class="postBtn" onclick="sample4_execDaumPostcode()">우편번호 찾기</button>

                                                <input type="text" id="sample4_roadAddress" name="address1"
                                                    placeholder="도로명주소" size="60"  required="required" readonly>

                                                <textarea type="hidden" id="sample4_jibunAddress" placeholder="지번주소" style="display:none"
                                                    size="60" disabled></textarea>

                                                <textarea id="guide" style="color:#999;display:none"></textarea>

                                                <input type="text" id="sample4_detailAddress" name="address2" required="required"
                                                    placeholder="상세주소" size="60">

                                                <textarea type="hidden" id="sample4_extraAddress" placeholder="참고항목" style="display:none"
                                                    size="60"></textarea>

                                                <textarea type="hidden" id="sample4_engAddress" placeholder="영문주소" style="display:none"
                                                    size="60"></textarea>



                                                
                                            </div>
                                            <br><br>
                                            <div style="overflow:auto;" id="nextprevious">
                                                <center>
                                                    <button type="button" id="prevBtn"
                                                        onclick="nextPrev(-1)">Previous</button>
                                                    <button type="button" id="nextBtn"
                                                        onclick="nextPrev(1)">Previous</button>
                                                </center>
                                            </div>

                                        </form>
                                    </div>
                                </div>
                            </div>
                            <br>
                            <br>

                        </main>
                    </div>
                </div>
            </div>


            <jsp:include page="../common/footer.jsp" />
        </body>

        </html>