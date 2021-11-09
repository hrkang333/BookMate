<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <title>[책장메이트] - 판매자 페이지</title>
                <meta charset="utf-8">
                <meta name="viewport" content="width=device-width, initial-scale=1">

                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>

                <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
                <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
                <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
                <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>

                <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet"
                    id="bootstrap-css">
                <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

                <script type="text/javascript" src="resources/js/seller_page.js"></script>
                <script type="text/javascript" src="resources/js/seller.js"></script>

                <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
            </head>

            <body>
                <jsp:include page="../ubook/ubookMenu.jsp" />

                <div class="container bootstrap snippet">
                    <div class="row">
                        <!--좌측 info
      		<div class="col-xl-2">
				<div class="panel panel-default">

					<div class="panel-body">
						<center>
							<img src="http://ssl.gstatic.com/accounts/ui/avatar_2x.png"
								class="avatar img-circle img-thumbnail" alt="avatar">
						</center>
						<h3>${ s.sellerNickN }</h3>
						<center>
							<input style="font-size: 17px; text-align: center;" type="file"
								class="text-center center-block file-upload">
						</center>
					</div>
					<div class="panel-heading">
						<h4>구매 만족도 65%</h4>
					</div>

				</div>
			</div>-->
                        <!--판매자 페이지-->
                        <div class="col-sm-9" style="margin:auto;">
                            <div class="newsInner">
                                <!--탭 시작-->
                                <div id="tabs">
                                    <ul class="tab">
                                        <li class="active"><span>판매자 정보관리</span></li>
                                        <li><span>도서관리</span></li>
                                        <li><span>판매관리</span></li>
                                        <li><span>도서문의</span></li>
                                    </ul>
                                    <!-- 판매자 정보관리 -->
                                    <div class="tabContent active">
                                        <div class="tabContentInner">
                                            <div id="sellerInfo">
                                                <form class="form" action="sellerUpdate.se" method="post"
                                                    id="registrationForm">
                                                    <div class="form-group sellerForm">
                                                        <div class="col-xs-6">
                                                            <label>
                                                                <h4>아이디</h4>
                                                            </label> <input type="text" class="form-control"
                                                                name="sellerId" id="sellerId" value="${ s.sellerId }"
                                                                readonly>
                                                        </div>
                                                        <div class="col-xs-6">
                                                            <label>
                                                                <h4>닉네임</h4>
                                                            </label> <input type="text" class="form-control"
                                                                name="sellerNickN" id="sellerNickN"
                                                                value="${ s.sellerNickN }" readonly>
                                                        </div>
                                                        <div class="col-xs-6">
                                                            <br> <label>
                                                                <h4>이메일</h4>
                                                            </label> <input type="email" class="form-control"
                                                                name="sellerEmail" id="selleremail"
                                                                value="${ s.sellerEmail }">
                                                        </div>
                                                        <div class="col-xs-6">
                                                            <br> <label>
                                                                <h4>핸드폰 번호</h4>
                                                            </label> <input type="text" class="form-control"
                                                                name="sellerPhone" id="sellerphone"
                                                                placeholder="010-0000-0000" value="${ s.sellerPhone }">
                                                        </div>
                                                        <div class="col-xs-6">
                                                            <br> <label class="inputlabel">배송비</label> <br> <label
                                                                class="container leftradio2">&nbsp;&nbsp; 기본 :
                                                                2600원 <input class="deleveryChk" type="checkbox"
                                                                    checked="checked" name="sellerDelP1" value="2600"
                                                                    onclick="return false"> <span
                                                                    class="checkmark"></span>
                                                            </label> <label class="container rightradio">&nbsp;&nbsp;
                                                                도서산간지역 : 4000원 <input class="deleveryChk"
                                                                    type="checkbox" checked="checked" name="sellerDelP2"
                                                                    value="4000" onclick="return false"> <span
                                                                    class="checkmark"></span>
                                                            </label>

                                                        </div>
                                                        <div class="col-xs-6">
                                                            <br> <label class="inputlabel">배송방법</label> <br>
                                                            <c:if test="${ s.sellerDel == 'conveni' }">
                                                                <label class="container leftradio">&nbsp;&nbsp; 편의점
                                                                    택배 <input type="radio" checked="checked"
                                                                        name="sellerDel" value="conveni"> <span
                                                                        class="checkmark"></span>
                                                                </label>
                                                                <label class="container rightradio">&nbsp;&nbsp; 직접
                                                                    택배 업체 지정 <input type="radio" name="sellerDel"
                                                                        value="self">
                                                                    <span class="checkmark"></span>
                                                                </label>
                                                            </c:if>

                                                            <c:if test="${ s.sellerDel == 'self' }">
                                                                <label class="container leftradio">&nbsp;&nbsp; 편의점
                                                                    택배 <input type="radio" name="sellerDel"
                                                                        value="conveni">
                                                                    <span class="checkmark"></span>
                                                                </label>
                                                                <label class="container rightradio">&nbsp;&nbsp; 직접
                                                                    택배 업체 지정 <input type="radio" checked="checked"
                                                                        name="sellerDel" value="self"> <span
                                                                        class="checkmark"></span>
                                                                </label>
                                                            </c:if>
                                                        </div>
                                                        <div class="col-xs-12">
                                                            <br>

                                                            <label class="inputlabel">출고지</label> <br> <br>

                                                            <!-- 												<c:forTokens var="addr" items="${ s.sellerAddress }" delims="/" varStatus="status">
													<c:if test="${ status.index eq 0 && addr >= '0' && addr <= '99999' }">
						<c:set var="post" value="${ addr }"/>
					</c:if>
					<c:if test="${ status.index eq 0 && !(addr >= '0' && addr <= '99999') }">
						<c:set var="address1" value="${ addr }"/>
					</c:if>
					<c:if test="${ status.index eq 1 }">
						<c:set var="address1" value="${ addr }"/>
					</c:if>
					<c:if test="${ status.index eq 2 }">
						<c:set var="address2" value="${ addr }"/>
					</c:if>
				</c:forTokens>
												
													<button class="postBtn" onclick="sample4_execDaumPostcode()">우편번호 검색</button>
													<input type="text" id="sample4_postcode" name="post" placeholder="우편번호" value=${ post } readonly>
							
								<input type="text" id="sample4_roadAddress" name="address1" value="${ address1 }" size="60" readonly>
							
								<input type="hidden" id="sample4_jibunAddress" placeholder="지번주소" size="60" disabled>
					
								<input id="guide" style="color:#999;display:none">
						
								<input type="text" id="sample4_detailAddress" name="address2"  value="${ address2 }" size="60">

										<input type="hidden" id="sample4_extraAddress" placeholder="참고항목"  size="60">
								
								<input type="hidden" id="sample4_engAddress" placeholder="영문주소"  size="60">
								 -->

                                                            <c:forTokens var="addr" items="${ s.sellerAddress }"
                                                                delims="/" varStatus="status">
                                                                <c:if
                                                                    test="${ status.index eq 0 && addr >= '0' && addr <= '99999' }">
                                                                    <c:set var="post" value="${ addr }" />
                                                                </c:if>
                                                                <c:if
                                                                    test="${ status.index eq 0 && !(addr >= '0' && addr <= '99999') }">
                                                                    <c:set var="address1" value="${ addr }" />
                                                                </c:if>
                                                                <c:if test="${ status.index eq 1 }">
                                                                    <c:set var="address1" value="${ addr }" />
                                                                </c:if>
                                                                <c:if test="${ status.index eq 2 }">
                                                                    <c:set var="address2" value="${ addr }" />
                                                                </c:if>
                                                            </c:forTokens>


                                                            <div class="col-md-12 form-group">
                                                                <input class="form-control" type="text"
                                                                    id="sample4_postcode" name="post" placeholder="우편번호"
                                                                    value="${ post }" readonly>
                                                            </div>
                                                            <div class="col-md-12 form-group">

                                                                <button type="button" class="postBtn"
                                                                    onclick="sample4_execDaumPostcode()">우편번호
                                                                    검색</button>
                                                            </div>
                                                            <div class="col-md-12 form-group">
                                                                <input class="form-control" type="text"
                                                                    id="sample4_roadAddress" name="address1"
                                                                    placeholder="도로명주소" value="${ address1 }" size="30"
                                                                    readonly>
                                                            </div>
                                                            <div class="col-md-12 form-group">
                                                                <input class="form-control" type="hidden"
                                                                    id="sample4_jibunAddress" placeholder="지번주소"
                                                                    size="30" disabled>
                                                            </div>
                                                            <div class="col-md-12 form-group">
                                                                <input class="form-control" id="guide"
                                                                    style="color:#999;display:none">
                                                            </div>
                                                            <div class="col-md-12 form-group">
                                                                <input class="form-control" type="text"
                                                                    id="sample4_detailAddress" name="address2"
                                                                    placeholder="상세주소" value="${ address2 }" size="30">
                                                            </div>
                                                            <div class="col-md-12 form-group">
                                                                <input class="form-control" type="hidden"
                                                                    id="sample4_extraAddress" placeholder="참고항목"
                                                                    size="30">
                                                            </div>
                                                            <div class="col-md-12 form-group">
                                                                <input class="form-control" type="hidden"
                                                                    id="sample4_engAddress" placeholder="영문주소"
                                                                    size="30">
                                                            </div>

                                                        </div>

                                                        <div class="col-xs-12">
                                                            <br>
                                                            <center>
                                                                <button class="btn btn-lg btn-success" type="submit">
                                                                    <i class="glyphicon glyphicon-ok-sign"></i>저장
                                                                </button>
                                                                <button class="btn btn-lg" type="button"
                                                                    data-toggle="modal" id="dormancyBtn"
                                                                    data-target="#dormancy">
                                                                    <i class="glyphicon glyphicon-remove"></i> 판매자 휴면 신청
                                                                </button>
                                                            </center>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                        <!-- 판매자 Modal -->
                                                            <div class="modal fade" id="dormancy" tabindex="-1"
                                                                role="dialog" aria-labelledby="exampleModalLabel"
                                                                aria-hidden="true">
                                                                <div class="modal-dialog" role="document"
                                                                    style="margin-left: 16%;">
                                                                    <div class="modal-content">
                                                                        <div class="modal-header">
                                                                            <h5 class="modal-title"
                                                                                id="exampleModalLabel">판매자
                                                                                휴면 신청</h5>
                                                                            <button type="button" class="close"
                                                                                data-dismiss="modal" aria-label="Close">
                                                                                <span aria-hidden="true">×</span>
                                                                            </button>
                                                                        </div>
                                                                        
                                                                            <form class="form" method="post" action="deleteSeller.se">
                                                                            <div class="modal-body">
                                                                            <label>
                                                                                <h4>비밀번호 입력</h4>
                                                                            </label> 
                                                                            <input type="password"
                                                                                class="form-control" name="userPwd"
                                                                                id="userPwd"
                                                                                placeholder="현재 비밀번호를 입력해주세요">
                                                                                
                                                                                <input type="text" id="userPwd2" name="userPwd2" value="${ loginUser.userPwd }">
                                                                                <input type="text" id="sellerId" name="sellerId" value="${ s.sellerId }">
                                                                            <script>
                                                                            	function PwdChk(){
                                                                            		var inputPwd = document.getElementById("userPwd").value;
                                                                            		var Pwd = document.getElementById("userPwd2").value;
                                                                            		if(inputPwd == Pwd){
                                                                            			alert("판매자 휴면 처리가 완료되었습니다.");
                                                                            			return true;
                                                                            		}else{
                                                                            			alert("비밀번호가 일치하지 않습니다. 다시 입력해주세요.");
                                                                            			inputPwd.val='';
                                                                            			inputPwd.focus();
                                                                            			return false;
                                                                            		}
                                                                            	}
                                                                            </script>
                                                                            
                                                                            <h6>
														                                                                                ※ 비밀번호를 입력하면 판매자 계정이 휴면 상태로 전환됩니다. <br>
														                                            판매자 계정 활성화를 원하시면 문의를 해주세요.
                                                                            </h6>

                                                                        </div>
                                                                        <div class="modal-footer">
                                                                            <button type="button"
                                                                                class="btn btn-secondary"
                                                                                data-dismiss="modal">취소</button>
                                                                            <button type="submit"
                                                                                class="btn btn-primary" onclick="PwdChk()">휴면 전환</button>
                                                                        </div>
                                                                        </form>
                                                                    </div>
                                                                </div>
                                                            </div>
                                    </div>
                                    <!-- 도서관리 -->
                                    <div class="tabContent">
                                        <ul class="tab1">
                                            <li><span>등록 도서 조회</span></li>
                                            <li><span>도서 등록</span></li>
                                        </ul>
                                        <div class="tabContentInner">
                                            <br>
                                            <div class="tabContentInner">
                                                <div>
                                                    <!-- 등록도서 조회 -->
                                                    <jsp:include page="ubookList.jsp"></jsp:include>
                                                    <!-- 도서 등록 -->
                                                    <jsp:include page="ubookEnrollForm.jsp"></jsp:include>
													<!-- <jsp:include page="ubookEnroll.ub"></jsp:include> -->
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- 판매관리 -->
                                    <div class="tabContent">
                                        <ul class="tab2">
                                            <li><span>주문현황</span></li>
                                            <li><span>배송관리</span></li>
                                            <li><span>판매내역</span></li>
                                        </ul>
                                        <div class="tabContentInner">
                                            <br>
                                            <div class="tabContentInner">
                                                <div class="miniTab">

                                                    <!-- 주문현황 -->
                                                    <jsp:include page="ubookOrder.jsp"></jsp:include>
                                                    <!-- 배송관리 -->
                                                    <jsp:include page="ubookDelM.jsp"></jsp:include>
                                                    <!-- 판매내역 -->
                                                    <jsp:include page="ubookSalesHistory.jsp"></jsp:include>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- 도서문의 -->
                                    <div class="tabContent">
                                        <jsp:include page="ubookQue.jsp"></jsp:include>
                                    </div>
                                </div>
                                <!--tabs end-->
                            </div>
                        </div>
                        <!--탭 이동-->
                        <script>
                            // tab menu
                            $(".tab li").click(function () {
                                var num = $(".tab li").index(this);
                                $(".tabContent").removeClass('active');
                                $(".tabContent").eq(num).addClass('active');
                                $(".tab li").removeClass('active');
                                $(this).addClass('active')
                            });
                            $(".tab1 li").click(function () {
                                var num = $(".tab1 li").index(this);
                                $(".tabContent3").removeClass('active');
                               	if(num == 0){
                                	//alert("등록 도서 조회");
                                	$(".tabContent3").eq(num).addClass('active');

                                	var table = document.getElementById('ubookListTb');
                                	$.ajax({
                                        type : "POST",
                                        url : "ubookList.ub",
                                        dataType : 'json',
                                        //data : 도서리스트,
                                        success : function(data) {
                                        	//console.log(data);
                                        	
                                        	//안내 tr 지우기
                                        	var trlength = $('#ubookListTb tr').length;
                                	    	for(var t=trlength-1; t>0; t--){
                                	    		table.deleteRow(t);
                                	    	}
                                        	
                                          //데이터 뿌리기 
                                        	for(var i=0; i < data.length; i++){
                                        		$('#ubookListTb').append("<tr><td align='center'>" + (i+1) + "</td>" + "<td hidden='hidden'>"+data[i].ubookNo+"</td>" +
                            										"<td align='center'><img src='${pageContext.servletContext.contextPath }/resources/images/Ubookimg/" + data[i].ubookImg + "' style='width: 145px; height: auto;'></td>" +
                                        							"<td align='center'>" + data[i].ubookName + "</td>" +
                                        							"<td align='center'>" + data[i].ubookWriter + "</td>" +
                                        							"<td align='center'>" + data[i].ubookStock + "</td>" +
                                        							"<td align='center'>"+
                                        							"<button style='background-color: #5cb85c; color:#ffffff; border:none; width: 100%; margin-bottom:10px; border-radius: 0.3rem;' onclick='updateUbook()'>수정</button>"+
                                        							"<button class='btn-danger' style='border:none;width: 100%; border-radius: 0.3rem;' onclick='deleteUbook()'>삭제</button></td></tr>");
                                         	}

                                        },
                                        error : function() {
                                        	alert("너는 뭔가 잘못하고 있따...");
                                        }
                                    });
                               	}else{
                                	//alert("도서 등록");
                                	$(".tabContent3").eq(num).addClass('active');
                               	}
                                $(".tab1 li").removeClass('active');
                                $(this).addClass('active')
                            });
                            $(".tab2 li").click(function () {
                                var num = $(".tab2 li").index(this);
                                $(".tabContent2").removeClass('active');
                                $(".tabContent2").eq(num).addClass('active');
                                $(".tab2 li").removeClass('active');
                                $(this).addClass('active')
                            });
                        </script>

                    </div>
                    <!--/col-9-->
                </div>
                <!--/row-->

                <!-- 다음 우편번호 api  -->
                <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
                <script>
                    function sample4_execDaumPostcode() {
                        new daum.Postcode(
                            {
                                oncomplete: function (data) {
                                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                                    // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                                    var roadAddr = data.roadAddress; // 도로명 주소 변수
                                    var extraRoadAddr = ''; // 참고 항목 변수

                                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                                    if (data.bname !== ''
                                        && /[동|로|가]$/g.test(data.bname)) {
                                        extraRoadAddr += data.bname;
                                    }
                                    // 건물명이 있고, 공동주택일 경우 추가한다.
                                    if (data.buildingName !== ''
                                        && data.apartment === 'Y') {
                                        extraRoadAddr += (extraRoadAddr !== '' ? ', '
                                            + data.buildingName : data.buildingName);
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
                                        var expRoadAddr = data.autoRoadAddress
                                            + extraRoadAddr;
                                        guideTextBox.innerHTML = '(예상 도로명 주소 : '
                                            + expRoadAddr + ')';
                                        guideTextBox.style.display = 'block';

                                    } else {
                                        guideTextBox.innerHTML = '';
                                        guideTextBox.style.display = 'none';
                                    }
                                }
                            }).open();
                    }
                </script>



                <jsp:include page="../common/footer.jsp" />
            </body>

            </html>