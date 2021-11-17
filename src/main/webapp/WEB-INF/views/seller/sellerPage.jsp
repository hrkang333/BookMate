<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>[책장메이트] - 판매자 페이지</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script type="text/javascript"
	src="/sysaccount/js/jquery.dateFormat-1.0.js"></script>

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>

<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
</head>

<body>

	<div class="container bootstrap snippet">
		<div class="row">
                    <!--================ 좌측 사이드바(도서 카테고리 선택) =================-->
 					<jsp:include page="../ubook/ubookCategory.jsp"/>
                    <!--================ End 좌측 사이드바(도서 카테고리 선택) =================-->
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
			<div class="col-sm-9" style="margin-left: 190px; padding-top: 83px;">
				<div class="newsInner">
					<!--탭 시작-->
					<div id="tabs">
						<ul class="tab">
							<li class="active"><span style="height: 70px; padding-top: 22px;">판매자 정보관리</span></li>
							<li><span style="height: 70px; padding-top: 22px;">도서관리</span></li>
							<li><span style="height: 70px; padding-top: 22px;">판매관리</span></li>
							<li><span style="height: 70px; padding-top: 22px;">도서문의</span></li>
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
												</label> <input type="text" class="form-control" name="sellerId"
													id="sellerId" value="${ s.sellerId }" readonly>
											</div>
											<div class="col-xs-6">
												<label>
													<h4>닉네임</h4>
												</label> <input type="text" class="form-control" name="sellerNickN"
													id="sellerNickN" value="${ s.sellerNickN }" readonly>
											</div>
											<div class="col-xs-6">
												<br> <label>
													<h4>이메일</h4>
												</label> <input type="email" class="form-control" name="sellerEmail"
													id="selleremail" value="${ s.sellerEmail }">
											</div>
											<div class="col-xs-6">
												<br> <label>
													<h4>핸드폰 번호</h4>
												</label> <input type="text" class="form-control" name="sellerPhone"
													id="sellerphone" placeholder="010-0000-0000"
													value="${ s.sellerPhone }">
											</div>
											<div class="col-xs-6">
												<br> <label class="inputlabel">배송비</label> <br> <label
													class="container leftradio2">&nbsp;&nbsp; 기본 :
													2600원 <input class="deleveryChk" type="checkbox"
													checked="checked" name="sellerDelP1" value="2600"
													onclick="return false"> <span class="checkmark"></span>
												</label> <label class="container rightradio">&nbsp;&nbsp;
													도서산간지역 : 4000원 <input class="deleveryChk" type="checkbox"
													checked="checked" name="sellerDelP2" value="4000"
													onclick="return false"> <span class="checkmark"></span>
												</label>

											</div>
											<div class="col-xs-6">
												<br> <label class="inputlabel">배송방법</label> <br>
												<c:if test="${ s.sellerDel == 'conveni' }">
													<label class="container leftradio">&nbsp;&nbsp; 편의점
														택배 <input type="radio" checked="checked" name="sellerDel"
														value="conveni"> <span class="checkmark"></span>
													</label>
													<label class="container rightradio">&nbsp;&nbsp; 직접
														택배 업체 지정 <input type="radio" name="sellerDel" value="self">
														<span class="checkmark"></span>
													</label>
												</c:if>

												<c:if test="${ s.sellerDel == 'self' }">
													<label class="container leftradio">&nbsp;&nbsp; 편의점
														택배 <input type="radio" name="sellerDel" value="conveni">
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
												<br> <label class="inputlabel">출고지</label> <br> <br>
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


												<div class="col-md-12 form-group" style="width: 70%;">
													<input class="form-control" type="text"
														id="sample4_postcode" name="post" placeholder="우편번호"
														value="${ post }" readonly>
												</div>
												<div class="col-md-12 form-group" style="width: 30%; margin-top: 2px;">

													<button type="button" class="postBtn" style="border-radius: 5px;"
														onclick="sample4_execDaumPostcode()">우편번호 검색</button>
												</div>
												<div class="col-md-12 form-group">
													<input class="form-control" type="text"
														id="sample4_roadAddress" name="address1"
														placeholder="도로명주소" value="${ address1 }" size="30"
														readonly>
												</div>
												<div class="col-md-12 form-group">
													<input class="form-control" type="hidden"
														id="sample4_jibunAddress" placeholder="지번주소" size="30"
														disabled>
												</div>
												<div class="col-md-12 form-group">
													<input class="form-control" id="guide"
														style="color: #999; display: none">
												</div>
												<div class="col-md-12 form-group">
													<input class="form-control" type="text"
														id="sample4_detailAddress" name="address2"
														placeholder="상세주소" value="${ address2 }" size="30">
												</div>
												<div class="col-md-12 form-group">
													<input class="form-control" type="hidden"
														id="sample4_extraAddress" placeholder="참고항목" size="30">
												</div>
												<div class="col-md-12 form-group">
													<input class="form-control" type="hidden"
														id="sample4_engAddress" placeholder="영문주소" size="30">
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
							<div class="modal fade" id="dormancy" tabindex="-1" role="dialog"
								aria-labelledby="exampleModalLabel" aria-hidden="true">
								<div class="modal-dialog" role="document"
									style="margin-left: 16%;">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalLabel">판매자 휴면 신청</h5>
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">×</span>
											</button>
										</div>

										<form class="form" method="post" action="deleteSeller.se">
											<div class="modal-body">
												<label>
													<h4>비밀번호 입력</h4>
												</label> <input type="password" class="form-control" name="userPwd"
													id="userPwd" placeholder="현재 비밀번호를 입력해주세요"> <input
													type="text" id="userPwd2" name="userPwd2"
													value="${ loginUser.userPwd }"> <input type="text"
													id="sellerId" name="sellerId" value="${ s.sellerId }">
												<script>
													function PwdChk() {
														var inputPwd = document
																.getElementById("userPwd").value;
														var Pwd = document
																.getElementById("userPwd2").value;
														if (inputPwd == Pwd) {
															alert("판매자 휴면 처리가 완료되었습니다.");
															return true;
														} else {
															alert("비밀번호가 일치하지 않습니다. 다시 입력해주세요.");
															inputPwd.val = '';
															inputPwd.focus();
															return false;
														}
													}
												</script>

												<h6>
													※ 비밀번호를 입력하면 판매자 계정이 휴면 상태로 전환됩니다. <br> 판매자 계정 활성화를
													원하시면 문의를 해주세요.
												</h6>

											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary"
													data-dismiss="modal">취소</button>
												<button type="submit" class="btn btn-primary"
													onclick="PwdChk()">휴면 전환</button>
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
							<%-- <jsp:include page="ubookQue.jsp"></jsp:include> --%>
							<!-- 도서문의 -->
							<section class="content">
								<h2>도서 문의 내역</h2>
								<div class="col-md-offset-2 qnaTable">
									<div class="panel panel-default">
										<div class="panel-body">
											<div class="table-container">
												<table class="table table-filter" id="ubookListTb2">
													<thead>
					                                <tr>
					                                    <th style="width:60px; text-align: center;">도서 번호</th>
					                                    <th style="text-align: center;">도서 표지</th>
					                                    <th style="text-align: center;">도서명</th>
					                                    <th style="text-align: center;">저자</th>
					                                </tr>
					                            	</thead>
													<tbody>
													<tr>
														<td colspan="6" style="text-align: center;">문의가 등록된 도서가 없습니다.</td>
													</tr>
													<tr>
														<td colspan="6" style="text-align: center;"><input name="sellerNo" value="${s.sellerNo }"></td>
													</tr>
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</div>
							</section>
						</div>
					</div>
					<!--tabs end-->
				</div>
			</div>
			<!--탭 이동-->
			<script>
				// tab menu
				$(".tab li").click(function() {
					var num = $(".tab li").index(this);
					$(".tabContent").removeClass('active');
					$(".tabContent").eq(num).addClass('active');
					$(".tab li").removeClass('active');
					$(this).addClass('active')
				});
				$(".tab1 li")
						.click(
								function() {
									var num = $(".tab1 li").index(this);
									$(".tabContent3").removeClass('active');
									if (num == 0) {
										//alert("등록 도서 조회");
										$(".tabContent3").eq(num).addClass(
												'active');

										var table = document
												.getElementById('ubookListTb');
										$
												.ajax({
													type : "POST",
													url : "ubookList.ub",
													dataType : 'json',
													//data : 도서리스트,
													success : function(data) {
														console.log(data);

														//안내 tr 지우기
														var trlength = $('#ubookListTb tr').length;
														for (var t = trlength - 1; t > 0; t--) {
															table.deleteRow(t);
														}
														if(data.length < 1){
															$('#ubookListTb')
															.append(
															"<tr> <td colspan='6' style='text-align: center;'>아직 등록된 도서가 없습니다.</td></tr>");
														
														}
														//데이터 뿌리기 
														for (var i = 0; i < data.length; i++) {
															console.log("야ㅑㅑㅑㅑ호오오오오" + data[i].bSellerNo);
															console.log(data[i].ubookName);
															$('#ubookListTb')
																	.append(
																			"<tr>"
																					+"<td align='center'>"
																					+ (i + 1)
																					+ "</td>"
																					+ "<td hidden='hidden' name='ubookNo'>"
																					+ data[i].ubookNo
																					+ "</td>"
																					+ "<td align='center'><img src='${pageContext.servletContext.contextPath }/resources/images/Ubookimg/" + data[i].ubookImg + "' style='width: 145px; height: auto;'></td>"
																					+ "<td align='center'><a href='ubookDetailTest.ub?ubookNo="
																					+ data[i].ubookNo
																					+"&bSellerNo="
																					+ data[i].bsellerNo
																					+ "'>"
																					+ data[i].ubookName
																					+ "</a></td>"
																					+ "<td align='center'>"
																					+ data[i].ubookWriter
																					+ "</td>"
																					+ "<td align='center'>"
																					+ data[i].ubookStock
																					+ "</td>"
																					+ "<td align='center'>"
																					+ "<button type='button' style='background-color: #5cb85c; color:#ffffff; border:none; width: 100%; margin-bottom:10px; border-radius: 0.3rem;' onclick='showModal("
																					+ data[i].ubookNo
																					+ ")'>수정</button>"
																					+ "<button class='btn-danger' type='button' style='border:none;width: 100%; border-radius: 0.3rem;' onclick='deleteUbook("
																					+ data[i].ubookNo
																					+ ")'>삭제</button></td></tr>");
														}

													},
													error : function() {
														alert("너는 뭔가 잘못하고 있어ㅓㅓㅓㅓㅓ...");
													}
												});
									} else {
										//alert("도서 등록");
										$(".tabContent3").eq(num).addClass(
												'active');
									}
									$(".tab1 li").removeClass('active');
									$(this).addClass('active')
								});
				$(".tab2 li").click(function() {
					var num = $(".tab2 li").index(this);
					$(".tabContent2").removeClass('active');
					$(".tabContent2").eq(num).addClass('active');
					$(".tab2 li").removeClass('active');
					$(this).addClass('active')
				});
			</script>
			<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document"
					style="max-width: none; width: 1000px; margin-top: 100px;">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">도서 수정</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">×</span>
							</button>
						</div>

						<form class="form updateUbook1" enctype='multipart/form-data'
							method="post" action="">
							<div class="modal-body">
								<input type="text" name="ubookNo">
								<table class="table table-bordered success">
									<colgroup>
										<col width="100px" />
										<col width="400px" />
									</colgroup>
									<thead>
										<tr>
											<th class="info">판매자 번호</th>
											<td><input class="usedBookInfo" name="bSellerNo"
												value="${ s.sellerNo }" readonly="readonly"></td>
										</tr>
										<tr>
											<th class="info">도서명</th>
											<td><input class="usedBookInfo" name="ubookName"
												required="required" placeholder="도서명을 입력해주세요"
												data-name="도서명"></td>
										</tr>
										<tr>
											<th class="info">저자(지은이)</th>
											<td><input class="usedBookInfo" name="ubookWriter"
												required="required" placeholder="저자를 입력해주세요"
												data-name="도서 지은이"></td>
										</tr>
										<tr>
											<th class="info">ISBN-13</th>
											<td><input class="usedBookInfo" name="ubookIsbn"
												required="required" maxlength="13" type="number"
												placeholder="도서의 ISBN을 입력해주세요(- 없이)" data-name="도서 ISBN"></td>
										</tr>
										<tr>
											<th class="info">카테고리</th>
											<td><select id="ubCategory" name="ubCategory"
												data-name="도서 카테고리">
													<option value="">== 카테고리 선택 ==</option>
													<option value="1">소설/시/에세이</option>
													<option value="2">경제/경영</option>
													<option value="3">과학</option>
													<option value="4">인문</option>
													<option value="5">컴퓨터/IT</option>
													<option value="6">자기계발</option>
													<option value="7">정치/사회</option>
													<option value="8">역사/문화</option>
													<option value="9">취미</option>
													<option value="10">가정/육아</option>
											</select></td>
										</tr>

										<tr>
											<th class="info">역자</th>
											<td><input class="usedBookInfo" name="ubookTrans"
												required="required" placeholder="역자를 입력해주세요" value="없음"
												data-name="도서 역자"></td>
										</tr>
										<tr>
											<th class="info">출판사</th>
											<td><input class="usedBookInfo" name="ubookPub"
												required="required" placeholder="출판사를 입력해주세요"
												data-name="도서 출판사"></td>
										</tr>
										<tr>
											<th class="info">출판일</th>
											<td><input class="usedBookInfo" name="ubookPubDate"
												required="required" type="date" placeholder="출판일을 입력해주세요"
												data-name="도서 출판일"></td>
										</tr>
										<tr>
											<th valign="top" class="info">정가</th>
											<td><input class="usedBookInfo" name="ubookOPrice"
												required="required" type="number" placeholder="정가를 입력해주세요"
												data-name="도서 정가"></td>
										</tr>
										<tr>
											<th class="info">판매가</th>
											<td><input class="usedBookInfo" name="ubookPrice"
												required="required" type="number" placeholder="판매가를 입력해주세요"
												data-name="도서 판매가"></td>
										</tr>
										<tr>
											<th class="info">재고수량</th>
											<td><input class="usedBookInfo" name="ubookStock"
												required="required" type="number" min="1"
												placeholder="재고수량을 입력해주세요" data-name="재고 수량"></td>
										</tr>

										<tr>
											<th class="info">도서 품질<br> 기준표
											</th>
											<td>S : 최상. 낙서/얼룩/접힙/찢김/변색/제본불량 해당 없음<br> A : 상.
												낙서/얼룩/접힙/찢김/변색/제본불량 일부 있음<br> B : 보통.
												낙서/얼룩/접힙/찢김/변색/제본불량 2가지 이상 있음<br> C : 하.
												낙서/얼룩/접힙/찢김/변색/제본불량 3가지 이상 있음<br> D : 최하.
												낙서/얼룩/접힙/찢김/변색/제본불량 다수 있음<br>

											</td>
										</tr>
										<tr>
											<th class="info">도서 품질</th>
											<td><select id="ubookQual" name="ubookQual">
													<option value="">== 도서 품질 선택 ==</option>
													<option value="S">S</option>
													<option value="A">A</option>
													<option value="B">B</option>
													<option value="C">C</option>
													<option value="D">D</option>
											</select></td>
										</tr>

										<tr>
											<th class="info">도서 상세</th>
											<td><textarea name="ubookDetail" id="ubookDetail"
													cols="54" required="required" rows="10" maxlength="3600"
													placeholder="도서의 줄거리, 도서 품질 상세 정보 등을 입력해주세요"
													data-name="도서 상세"></textarea>
										<div id="test_cnt_2">(0 / 3600)</div></td>
										</tr>
										<tr>
											<th class="info">도서 목차</th>
											<td><textarea name="ubookContent" id="ubookContent"
													cols="54" required="required" rows="10" maxlength="3600"
													placeholder="도서의 목차를 입력해주세요" data-name="도서 목차"></textarea>
													<div id="test_cnt1_2">(0 / 3600)</div>
											</td>
										</tr>
										<tr>
											<th class="info">도서 이미지</th>
											<td><input name="UbookImgFile" type="file" id="ubookImg2"
												onchange="imgCheck(this,'ubookImg2')"
												class="text-center center-block file-upload"
												data-name="도서 이미지"></td>
										</tr>
										<tr>
											<th class="info">도서 이미지 미리보기</th>
											<td><img alt="" src="" id="preubookImg2"></td>
										</tr>
									</thead>
								</table>
							</div>
							<div class="modal-footer" style="justify-content: center;">
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">취소</button>
								<button type="button" class="btn btn-primary"
									onclick="updateUbook();">수정</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!--/col-9-->
	</div>
	<!--/row-->

	<!-- 다음 우편번호 api  -->
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script>

	$(document).ready(function() {
		 
		$("textarea[name='ubookDetail']").eq(1).on('keyup', function() {
	        $('#test_cnt_2').html("("+$(this).val().length+" / 3600)");
	 
	        if($(this).val().length > 3600) {
	        	alert("최대 3600자까지 입력 가능합니다.");
	            $(this).val($(this).val().substring(0, 3600));
	            $('#test_cnt_2').html("(3600 / 3600)");
	        }
	    });
	});


	$(document).ready(function() {
		$("textarea[name='ubookContent']").eq(1).on('keyup', function() {
	        $('#test_cnt1_2').html("("+$(this).val().length+" / 3600)");
	 
	        if($(this).val().length > 3600) {
	        	alert("최대 3600자까지 입력 가능합니다.");
	            $(this).val($(this).val().substring(0, 3600));
	            $('#test_cnt1_2').html("(3600 / 3600)");
	        }
	    });
	});
	
	
		function updateUbook() {
			var form = $(".updateUbook1")[0];
			var formData = new FormData(form);
			formData.append("ubookImg",
					$("input[name=UbookImgFile]")[0].files[0]);
			//var form = $('.updateUbook').serialize();
			//form += ("&UbookImgFile=" + $("input[name=UbookImgFile]").val());
			if (confirm("해당 도서를 수정하시겠습니까?")) {
				$
						.ajax({
							type : "POST",
							enctype : 'multipart/form-data',
							url : "ubookUpdate.ub",
							processData : false,
							contentType : false,
							dataType : 'json',
							data : formData,
							success : function(data) {
								console.log(data);
								if (data > 0) {
									alert("성공적으로 수정되었습니다.");
									$('#exampleModal').modal("hide");
									var table = document.getElementById('ubookListTb');
									
									$.ajax({
		                                type : "POST",
		                                url : "ubookList.ub",
		                                dataType : 'json',
		                                //data : 도서리스트,
		                                success : function(data) {
		                                	
		                                	//기존 tr 지우기
											var trlength = $('#ubookListTb tr').length;
											for (var t = trlength - 1; t > 0; t--) {
												table.deleteRow(t);
											}

											//데이터 뿌리기 
											for (var i = 0; i < data.length; i++) {
												$('#ubookListTb')
														.append(
																"<tr><td align='center'>"
																		+ (i + 1)
																		+ "</td>"
																		+ "<td hidden='hidden' name='ubookNo'>"
																		+ data[i].ubookNo
																		+ "</td>"
																		+ "<td align='center'><img src='${pageContext.servletContext.contextPath }/resources/images/Ubookimg/" + data[i].ubookImg + "' style='width: 145px; height: auto;'></td>"
																		+ "<td align='center'><a href='ubookDetailTest.ub?ubookNo="
																		+ data[i].ubookNo
																		+"&bSellerNo="
																		+ data[i].bsellerNo
																		+ "'>"
																		+ data[i].ubookName
																		+ "</a></td>"
																		+ "<td align='center'>"
																		+ data[i].ubookWriter
																		+ "</td>"
																		+ "<td align='center'>"
																		+ data[i].ubookStock
																		+ "</td>"
																		+ "<td align='center'>"
																		+ "<button type='button' style='background-color: #5cb85c; color:#ffffff; border:none; width: 100%; margin-bottom:10px; border-radius: 0.3rem;' onclick='showModal("
																		+ data[i].ubookNo
																		+ ")'>수정</button>"
																		+ "<button class='btn-danger' type='button' style='border:none;width: 100%; border-radius: 0.3rem;' onclick='deleteUbook("
																		+ data[i].ubookNo
																		+ ")'>삭제</button></td></tr>");
											}

		                                },
		                                error : function() {
		                                	alert("너는 뭔가 잘못하고 있따...?");
		                                }
		                            });
									
								}
							},
							error : function() {
								alert("모든 사항에 선택 및 입력을 했는지 확인해주세요.");
							}
						});
			}
		}

		function sample4_execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
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
<script type="text/javascript" src="resources/js/seller_page.js"></script>
<script type="text/javascript" src="resources/js/seller.js"></script>
</html>