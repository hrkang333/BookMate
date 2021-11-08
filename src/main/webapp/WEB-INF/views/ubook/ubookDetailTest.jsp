<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- s:html -->
	<div id="wrap">
		<div id="body">
			<div class="global_top">
				<h2><a href="">중고장터</a></h2>
				<ul class="menu_1 menu_1_new">
					<li><a href="">판매자 페이지</a>
					</li>
				</ul>
			</div>
			<!-- product_detail -->
			<div id="contents" class="product_detail">
				<!-- page-location -->
				<div class="page-location">
					<ul class="page-location">
						<li><a href="#" class="home">홈</a></li>
						<li><a href="#">중고장터</a></li>
						<li>
							<a href="#">중고도서</a>
							<div class="sub-layer">
								<table summary="요약">
									<tr>
										<td>
											<ul class="sub-cate">
												<li>
													<a href="#">
														소설/시/에세이
													</a>
												</li>
												<li>
													<a href="#">
														인문
													</a>
												</li>
												<li>
													<a href="#">
														역사/문화
													</a>
												</li>
												<li class="selected">
													<a href="#">
														정치/사회
													</a>
												</li>
												<li class="selected">
													<a href="#">
														자기계발
													</a>
												</li>
											</ul>
										</td>
										<td>
											<ul class="sub-cate">
												<li>
													<a href="#">
														과학
													</a>
												</li>
												<li>
													<a href="#">
														컴퓨터/IT
													</a>
												</li>
												<li>
													<a href="#">
														경제/경영
													</a>
												</li>
												<li>
													<a href="#">
														취미
													</a>
												</li>
												<li>
													<a href="#">
														가정/육아
													</a>
												</li>
											</ul>
										</td>
									</tr>
								</table>
							</div>
						</li>
						<li>
							<strong>아동</strong>
						</li>
					</ul> <!-- Data Allocation (Product_Detail) -->
					<script type="text/javascript">
						/* 도서상세페이지 
						_ct = _RP("중고도서/아동");
						_pd = _RP("자신만만 기초 수학");
						_pd_barcode = _RP("7222444988871", 1);
						_amt = _RP("3,200", 1);

						_A_amt[_ace_countvar] = "3,200";
						_A_nl[_ace_countvar] = "1";
						_A_pl[_ace_countvar] = "7222444988871";
						_A_pn[_ace_countvar] = "자신만만 기초 수학";
						_A_ct[_ace_countvar] = "중고도서/아동";
						_ace_countvar++;*/
					</script>
					<!-- //AceCounter eCommerce (Product_detail) v6.4 Start -->
				</div>
				<!--// page-location -->

				<!-- detail_product  -->
				<div class="detail_product">
					<div class="detail_content type_2">
						<div class="inner">

							<!-- product_image -->
							<div class="product_image">
								<div class="photo">
									<div>
										<img src="${ubook.ubookImg}" class="photo"/>
									</div>
								</div>

								<!--<div class="seller_info">* 중고장터 판매상품은 판매자가 직접 등록/판매하는 상품으로 판매자가 해당상품과 내용에 모든 책임을 집니다. 우측의 제품상태와 하단의 상품상세를 꼭 확인하신 후 구입해주시기 바랍니다.</div>-->
								<div class="summary_info">
									ISBN-13 : ${ ubook.ubookIsbn }
								</div>
							</div>
							<!--// product_image -->

							<!-- product_detail_info -->
							<div class="product_detail_info">
								<div class="subject">
									<span class="title"><c:out value="${ ubook.ubookName }"/></span>
									<span class="info">
										[중고]
									</span>
								</div>
								<div class="issue">
									저자 ${ ubook.ubookWriter }
									|
									출판사 ${ ubook.ubookPub }
								</div>

								<dl class="basic">
									<dt class="fixed_price">정가</dt>
									<dd class="fixed_price">
										<del>${ ubook.ubookOPrice }원</del>
									</dd>
									<dt class="sales_price">판매가</dt>
									<dd class="sales_price">
										<strong class="price">${ ubook.ubookPrice }원</strong>
										<span>[<strong>${ ubook.ubookOPrice - ubook.ubookPrice }</strong>원 할인]</span>
									</dd>
								</dl>

								<dl class="delivery_gift">
									<dt class="delivery-price">배송비</dt>
									<dd class="delivery-price">
										<strong>2,600</strong>원
										<br />
										<span class="delivery">
											도서산간지역 추가배송비 : 4,000원
										</span>
									</dd>
								</dl>
								<dl class="delivery_gift">
									<dt class="delivery-price">배송일정</dt>
									<dd class="delivery-price">
										<span class="delivery">
											지금 주문하면
											<span class="delivery-day">
												3일 이내
											</span> 출고 예정
											<br />
											토/일, 공휴일을 제외한 영업일 기준으로 배송이 진행됩니다.
											단순변심으로 인한 구매취소 및 환불에 대한 배송비는 구매자 부담입니다.
											<br />
										</span>
									</dd>
								</dl>

								<div class="release">
									<span class="release" style="color:#000;">
										<fmt:formatDate value="${ubook.ubookPubDate}" pattern="yyyy년 MM월 dd일" />
									</span>
									<br />


								</div>

								<div class="state_lowest_new">
									<dl class="product_state">
										<dt>제품상태</dt>
										<dd>
											상태 :
											<c:if test="${ ubook.ubookQual == 'S' }">
												<c:out value="최상">최상</c:out>
											</c:if>
											<c:if test="${ ubook.ubookQual == 'A' }">
												<c:out value="상급">상급</c:out>
											</c:if>
											<c:if test="${ ubook.ubookQual == 'B' }">
												<c:out value="보통">보통</c:out>
											</c:if>
											<c:if test="${ ubook.ubookQual == 'C' }">
												<c:out value="하급">하급</c:out>
											</c:if>
											<c:if test="${ ubook.ubookQual == 'D' }">
												<c:out value="최하">최하</c:out>
											</c:if>
										</dd>
									</dl>
									<div id="lowest-price-detail" class="lowest_price_detail">
										<ul>
											<li>
												<span class="price">
													<a href="#">${ ubook.ubookPrice }원</a>
												</span>
												<span class="quality">
													상태
													<c:if test="${ ubook.ubookQual == 'S' }">
														<c:out value="최상">최상</c:out>
													</c:if>
													<c:if test="${ ubook.ubookQual == 'A' }">
														<c:out value="상급">상급</c:out>
													</c:if>
													<c:if test="${ ubook.ubookQual == 'B' }">
														<c:out value="보통">보통</c:out>
													</c:if>
													<c:if test="${ ubook.ubookQual == 'C' }">
														<c:out value="하급">하급</c:out>
													</c:if>
													<c:if test="${ ubook.ubookQual == 'D' }">
														<c:out value="최하">최하</c:out>
													</c:if>
												</span>
											</li>
										</ul>
									</div>
								</div><!-- end state-lowest-new -->

								<div class="order_quantity">
									<label for="order-quantity">주문가능수량</label>
									<input type="text" id="order-quantity" value="${ ubook.ubookStock }" maxlength="3"
										onkeydown="onlyNum(event, this)" title="주문수량입력" />
									<span class="count-up-down">
										<a href="#count-up"><img alt="수량추가"
												src="http://image.kyobobook.co.kr/new_ink/used/web/images/common/btn_count_up.gif"
												class="count-up" /></a>
										<a href="#count-down"><img alt="수량빼기"
												src="http://image.kyobobook.co.kr/new_ink/used/web/images/common/btn_count_down.gif"
												class="count-down" /></a>
									</span>
								</div>
							</div>
							<!--// product_detail_info  -->
							<div class="product_detail_bottom">
								<div class="button_buy">
									<a href="#" class="btn_large btn_blue">장바구니에 담기</a>
									<a href="#" class="btn_large btn_blue2">바로 구매하기</a>
								</div>
								<!-- s: 2020-08-26 -->
								<div class="detail_information">
									<p>책장메이트에 등록된 판매상품과 제품의 상태는 개별 판매자들이 등록, 판매하는 것으로 중개시스템만을 제공하는 책구메이트는 해당 상품과 내용에 대해 일체
										책임을 지지 않습니다. 상단 제품상태와 하단 상품 상세를 꼭 확인하신 후 구입해주시기 바랍니다. </p>
									<p>책구메이트 결제 시스템을 이용하지 않은 직거래로 인한 피해 발생 시 책구메이트는 일체 책임을 지지 않습니다. </p>

									<p>책장메이트에 등록된 판매 상품과 제품의 상태는 개별 오픈마켓 판매자들이 등록, 판매하는 것으로 중개 시스템만을 제공하는<br /> 인터넷
										책구메이트에서는 해당 상품과 내용에 대해 일체 책임을 지지 않습니다.</p>
									<p>책구메이트 결제시스템을 이용하지 않은 직거래로 인한 피해 발생시, 책구메이트는 일체의 책임을 지지 않습니다.</p>
								</div>
								<!-- e: 2020-08-26 -->
							</div>
						</div>
					</div>

					<!-- 판매자 다른 상품 -->
					<div class="seller_another_product">
						<h2>중고책 추천 (판매자 <span>다른</span> 상품)</h2>
						<ul>
							<li class="first-child">
								<p class="photo">
									<a href="">
										<img src=""
											alt="초등학생이 되었다: 바른마음"
											onerror="this.src='http://image.kyobobook.co.kr/new_ink/used/web/images/common/noimage_150_215.gif'" />
									</a>
								</p>
								<div class="info">
									<p class="subject">
										<a href="">
											초등학생이 되었다: 바른마음
										</a>
									</p>
									<p class="price">6800원</p>
									<p class="quality">
										<span class="grade_s">상태 : 최상</span>
									</p>
								</div>
							</li>
							<li>
								<p class="photo">
									<a href="">
										<img src=""
											alt="동북공정의 선행 작업들과 중국의 국가 전략"
											onerror="this.src='http://image.kyobobook.co.kr/new_ink/used/web/images/common/noimage_150_215.gif'" />
									</a>
								</p>
								<div class="info">
									<p class="subject">
										<a href="/">
											동북공정의 선행 작업들과 중국의 국가...
										</a>
									</p>
									<p class="price">3800원</p>
									<p class="quality">
										<span class="grade_a">상태 : 상급</span>
									</p>
								</div>
							</li>
							<li>
								<p class="photo">
									<a href="">
										<img src=""
											alt="life is"
											onerror="this.src='http://image.kyobobook.co.kr/new_ink/used/web/images/common/noimage_150_215.gif'" />
									</a>
								</p>
								<div class="info">
									<p class="subject">
										<a href="">
											life is
										</a>
									</p>
									<p class="price">3200원</p>
									<p class="quality">
										<span class="grade_a">상태 : 상급</span>
									</p>
								</div>
							</li>
							<li>
								<p class="photo">
									<a href="">
										<img src=""
											alt="시간의 뒤뜰을 거닐다"
											onerror="this.src='http://image.kyobobook.co.kr/new_ink/used/web/images/common/noimage_150_215.gif'" />
									</a>
								</p>
								<div class="info">
									<p class="subject">
										<a href="/product/viewBookDetail.ink?cmdtBrcd=7227983652313">
											시간의 뒤뜰을 거닐다
										</a>
									</p>
									<p class="price">2800원</p>
									<p class="quality">
										<span class="grade_a">상태 : 상급</span>
									</p>
								</div>
							</li>
						</ul>
					</div>
					<!--// 판매자 다른 상품 -->

					<!-- detail_menu_content -->
					<div class="detail_menu_content">

						<!-- 탭메뉴 -->
						<div id="used_info_content" class="detail_menu">
							<ul class="main">
								<li class="on"><a href="#used_info_content">중고 도서 정보</a>
									<ul class="sub m01">
										<li class="first"><a href="#seller_product_info">판매자 상품 소개</a></li>
										<li><a href="#seller_delivery">배송정책</a></li>
									</ul>
								</li>
								<li><a href="#seller_postscript_content">판매자 전체 후기 <span>[119건]</span></a></li>
								<li><a href="#info_content">도서 정보 </a></li>
							</ul>
						</div>
						<!--// 탭메뉴 -->

						<!-- 중고 도서 정보 -->
						<div class="used_info_content">
							<div id="seller_product_info" class="seller_product_info">
								<h3>판매자 상품 소개</h3>
								<div>
									※ 해당 상품은 교보문고에서 제공하는 정보를 활용하여 안내하는 상품으로제품 상태를 반드시 확인하신 후 구입하여주시기 바랍니다.
								</div>
							</div>

							<div id="seller_delivery" class="seller_delivery">
								<h3>판매자 배송 정책</h3>
								<ul>
									<li>토/일, 공휴일을 제외한 영업일 기준으로 배송이 진행됩니다.
										판매자가 주문을 수락하기 전까지만 주문 취소가 가능하며 이후에는 취소가 불가능합니다.
									</li>
								</ul>
							</div>
						</div>
						<!--// 중고 도서 정보 -->

						<!-- 탭메뉴 -->
						<div id="seller_postscript_content" class="detail_menu mgb">
							<ul class="main">
								<li><a href="#used_info_content">중고 도서 정보</a></li>
								<li class="on"><a href="#seller_postscript_content">판매자 전체 후기 <span>[119건]</span></a>
								</li>
								<li><a href="#info_content">도서 정보 </a></li>
							</ul>
						</div>
						<!--// 탭메뉴 -->

						<!-- 판매자 후기 -->
						<div class="seller_postscript_content">
							<p class="more"><a href="/seller/listBuyVltn.ink?mmbrNmbr=62011163462">더보기</a></p>
							<table summary="구매후기 목록을 번호, 구매후기, 구매만족도, ID, 등록일로 보실수 있습니다.">
								<caption>구매후기 목록</caption>
								<colgroup>
									<col width="40px" />
									<col width="*" />
									<col width="100px" />
									<col width="100px" />
									<col width="90px" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col">NO</th>
										<th scope="col">구매후기</th>
										<th scope="col">구매만족도</th>
										<th scope="col">ID</th>
										<th scope="col">등록일</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>119</td>
										<td class="subject">받았습니다 받았습니다</td>
										<td>
											<img src="http://image.kyobobook.co.kr/new_ink/used/web/images/main/v3/star_rating_04.gif"
												alt="5점 만점에 4점" />
										</td>
										<td><a href="http://booklog.kyobobook.co.kr/ssk7596/">ssk7***</a></td>
										<td>2021.11.05</td>


									</tr>
									<tr>
										<td>118</td>
										<td class="subject">…..!!!!!!!</td>
										<td>
											<img src="http://image.kyobobook.co.kr/new_ink/used/web/images/main/v3/star_rating_05.gif"
												alt="5점 만점에 5점" />
										</td>
										<td><a href="http://booklog.kyobobook.co.kr/fl723/">fl***</a></td>
										<td>2021.11.05</td>


									</tr>
									<tr>
										<td>117</td>
										<td class="subject">배송이 일주일 밖에(?) 안 걸렸지만 책의 상태가 좋아서 별점 5개로 결정 합니다`^^</td>
										<td>
											<img src="http://image.kyobobook.co.kr/new_ink/used/web/images/main/v3/star_rating_05.gif"
												alt="5점 만점에 5점" />
										</td>
										<td><a href="http://booklog.kyobobook.co.kr/nurine99/">nurin***</a></td>
										<td>2021.11.01</td>


									</tr>

								</tbody>
							</table>
						</div>
						<!--// 판매자 후기 -->

						<!-- 탭메뉴 -->
						<div id="info_content" class="detail_menu">
							<ul class="main">
								<li><a href="#used_info_content">중고 도서 정보</a></li>
								<li><a href="#seller_postscript_content">판매자 전체 후기 <span>[119건]</span></a></li>
								<li class="on"><a href="#info_content">도서 정보</a>
									<ul class="sub m01">
										<li><a href="#info_content02">책소개</a></li>
										<li><a href="#info_content04">목차</a></li>
									</ul>
								</li>
							</ul>
						</div>
						<!--// 탭메뉴 -->

						<!-- 도서 정보 -->
						<div class="info_content">
							<div id="info_content02">
								<h3>책 소개</h3>
								<div class="book_info_content dot_line">
									<table summary="도서 줄거리 및 내용" style="width: 100%">
										<caption>
											도서 줄거리 및 내용
										</caption>
										<thead>
											<tr>
												<th scope="col">도서 줄거리 및 내용</th>
											</tr>
										</thead>
										<tbody>
										</tbody>
									</table>
									<p class="txt">
										${ ubook.ubookDetail }
									</p>
								</div>
							</div>
							<div id="info_content04">
								<h3>목차</h3>
								<div class="table_contents dot_line">
										${ ubook.ubookContent }
								</div>
							</div>
						</div>
						<!-- 도서 정보 -->

						<!-- 교환/반품안내 -->
						<div class="member_refund">
							<h3>교환/반품안내</h3>
							<p class="info">※ 상품 설명에 반품/교환 관련한 안내가 있는 경우 그 내용을 우선으로 합니다. (업체 사정에 따라 달라질 수 있습니다.)</p>
							<table
								summary="교환/반품안내">
								<caption>반품/교환 안내</caption>
								<colgroup>
									<col width="130px" />
									<col width="*" />
								</colgroup>
								<tbody>
									<tr>
										<th scope="row"><span>반품/교환 안내</span></th>
										<td>
											<p><strong>[중고도서 반품 및 교환 안내]</strong></p>
											<p>
												※ 중고도서의 경우 중고 상품 특성상 반품 및 교환이 불가능합니다.<br>
												구매 시 주의하여 구매하시기 바랍니다.
											</p>
										</td>
									</tr>
									<tr>
										<th scope="row"><span>소비자 피해보상</span></th>
										<td>
											<p>- 상품의 불량에 의한 교환, A/S, 환불, 품질보증 및 피해보상 등에 관한 사항은 소비자분쟁해결 기준 (공정거래위원회 고시)에
												준하여 처리됨</p>
											<p>- 대금 환불 및 환불지연에 따른 배상금 지급 조건, 절차 등은 전자상거래 등에서의 소비자 보호에 관한 법률에 따라 처리함</p>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<!--// 교환/반품안내 -->

					</div>
					<!--// detail_menu_content  -->

				</div>
				<!--// detail_product -->

				<!-- detail_side  -->
				<div class="detail_side">
					<!-- 판매자 정보 -->
					<!-- <div class="seller_info"> -->
					<div class="seller_info type_2">
						<dl>
							<dt class="seller">판매자</dt>
							<dd class="seller"><!-- 여기에 이 도서의 판매자 번호와 일치하는 닉네임 값을 보여줄거임 --></dd>
							<dt class="delivery_rank"><a
									onclick="javascript:window.open('/popup/product/viewInformationOfSellerGrade.ink', '', 'width=630,height=599');"
									href="#" title="새창열림">구매만족도</a></dt>
							<dd class="delivery_rank"><img
									src="http://image.kyobobook.co.kr/new_ink/used/web/images/main/v3/star_rating_05.gif"
									alt="5점 만점에 5점" /></dd>
							<!-- !구매 만족도 -->
						</dl>

							<div class="button">
								<a href="/sellerPage/product/viewSellerProductList.ink?mmbrNmbr=62011163462"
									class="btn_small registry">판매자 전체 후기</a>
								<a href="javascript:popupSllrInqr('false', '62011163462', '7222444988871', '');"
									class="btn_small question">문의하기</a>
							</div>
					</div>
					<!--// 판매자 정보 -->


					<div class="new_used_product">
						<h2><span>중고 신간</span></h2>
						<ul>
							<li>
								<span class="select">
									<input type="checkbox" title="선택" />
									<input type="hidden" name="cmdtBrcd" value="7265340059542" />
								</span>
								<span class="product">
									<span class="photo">
										<a href="">
											<img src=""
												alt="호랑이를 덫에 가두면"
												onerror="this.src='http://image.kyobobook.co.kr/new_ink/used/web/images/common/noimage_150_215.gif'" />
										</a>
									</span>
									<span class="subject">
										<a href="">
											호랑이를 덫에 가두면
										</a>
									</span>
								</span>
							</li>
							<li>
								<span class="select">
									<input type="checkbox" title="선택" />
									<input type="hidden" name="cmdtBrcd" value="7265340059542" />
								</span>
								<span class="product">
									<span class="photo">
										<a href="">
											<img src=""
												alt="호랑이를 덫에 가두면"
												onerror="this.src='http://image.kyobobook.co.kr/new_ink/used/web/images/common/noimage_150_215.gif'" />
										</a>
									</span>
									<span class="subject">
										<a href="">
											호랑이를 덫에 가두면
										</a>
									</span>
								</span>
							</li>
							<li>
								<span class="select">
									<input type="checkbox" title="선택" />
									<input type="hidden" name="cmdtBrcd" value="7265340059542" />
								</span>
								<span class="product">
									<span class="photo">
										<a href="">
											<img src=""
												alt="호랑이를 덫에 가두면"
												onerror="this.src='http://image.kyobobook.co.kr/new_ink/used/web/images/common/noimage_150_215.gif'" />
										</a>
									</span>
									<span class="subject">
										<a href="">
											호랑이를 덫에 가두면
										</a>
									</span>
								</span>
							</li>
							<li>
								<span class="select">
									<input type="checkbox" title="선택" />
									<input type="hidden" name="cmdtBrcd" value="7265340059542" />
								</span>
								<span class="product">
									<span class="photo">
										<a href="">
											<img src=""
												alt="호랑이를 덫에 가두면"
												onerror="this.src='http://image.kyobobook.co.kr/new_ink/used/web/images/common/noimage_150_215.gif'" />
										</a>
									</span>
									<span class="subject">
										<a href="">
											호랑이를 덫에 가두면
										</a>
									</span>
								</span>
							</li>
							<li>
								<span class="select">
									<input type="checkbox" title="선택" />
									<input type="hidden" name="cmdtBrcd" value="7265340059542" />
								</span>
								<span class="product">
									<span class="photo">
										<a href="">
											<img src=""
												alt="호랑이를 덫에 가두면"
												onerror="this.src='http://image.kyobobook.co.kr/new_ink/used/web/images/common/noimage_150_215.gif'" />
										</a>
									</span>
									<span class="subject">
										<a href="">
											호랑이를 덫에 가두면
										</a>
									</span>
								</span>
							</li>
						</ul>
					</div><!-- end secondhand-newbook -->
				</div>
				<!--// detail_side -->
			</div>
			<!--// product_detail -->
		</div><!-- end body -->
	</div><!-- end wrap -->
</body>
</html>