<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[책장메이트] - 도서 상세</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

</head>
<body style="width: 1200px; margin: auto;">

	<div class="mycontainer"
		style="width: 100% !important; padding: 0px 0px 0px 0px !important; margin: 0px 0px 0px 0px !important;">
		<div class="row">
			<jsp:include page="../ubook/ubookCategory.jsp" />
			<!-- s:html -->
			<!--================ 메인 Content =================-->
			<div class="col-xl-9 col-lg-8 col-md-7 maincon">
				<section class="content">
					<div class="col-md-offset-2 qnaTable">
						<div class="panel panel-default">
							<div class="panel-body">
								<div id="wrap">
									<div id="body">

										<!-- detail_product  -->
										<div class="detail_product"
											style="float: left; margin: 13px 0 0; width: 670px; padding: 0; display: block;">
											<div class="detail_content type_2"
												style="width: 649px; padding: 0; background: none; border: 2px solid #979cb9; margin-left: 10px;">
												<div class="inner" style="padding: 43px 0 0 0;">
													<!-- product_image -->
													<div class="product_image"
														style="position: relative; float: left; width: 245px; padding: 0 36px 0 43px; padding: 0 36px 0 43 px; margin-bottom: 140px;">
														<div class="photo"
															style="width: 162px; margin: 0; padding: 0;">
															<div
																style="padding: 5px 7px 7px 6px; line-height: 0; font-size: 0; margin: 0;">
																<img
			                                                      src="${pageContext.servletContext.contextPath }/resources/images/Ubookimg/${ubook.ubookImg}"
			                                                      class="photo" />

															</div>
														</div>

														<!--<div class="seller_info">* 중고장터 판매상품은 판매자가 직접 등록/판매하는 상품으로 판매자가 해당상품과 내용에 모든 책임을 집니다. 우측의 제품상태와 하단의 상품상세를 꼭 확인하신 후 구입해주시기 바랍니다.</div>-->
														<div class="summary_info"
															style="width: 159px; margin: 0px 0px 0px -0px; padding: 10px 0 0 23px; color: #000;">
															ISBN-13 : ${ ubook.ubookIsbn }</div>
													</div>
													<!--// product_image -->

													<!-- product_detail_info -->
													<div class="product_detail_info"
														style="width: 399px; float: right; padding: 0 40px 11px 0; margin: 0 0 0 0px; margin-right: none; margin-right: none !important;">
														<div class="subject" style="padding: 0px 20px 10px 30px;">
															<span class="title"
																style="font-size: 19px; font-weight: bold;"><c:out
                                                      value="${ ubook.ubookName }" /></span> <span class="info"
																style="font-weight: normal; font-size: 11px; color: #5A6AA1; vertical-align: middle;">
																[중고] </span>
														</div>
														<div class="issue"
															style="padding: 0 70px 14px 30px; font-size: 11px; color: #8e8e8e;">
															저자  ${ ubook.ubookWriter } | 출판사 ${ ubook.ubookPub }</div>

														<dl class="basic"
															style="margin: 5px 0 0 0; padding: 0 0 10px 30px; width: 361px; display: block; margin-block-start: 1em; margin-block-end: 1em; margin-inline-start: 0px; margin-inline-end: 0px; font-size: 15px;">
															<dt class="fixed_price"
																style="float: left; margin: 5px 0 0 0; padding: 0 0 0 7px; width: 70px; font-weight: bold;">정가</dt>
															<dd class="fixed_price"
																style="float: left; margin: 5px 0 0 0; width: 253px;">
																<del
																	style="margin: 0; padding: 0; text-decoration: line-through;">${ ubook.ubookPrice }원</del>
															</dd>
															<dt class="sales_price"
																style="float: left; margin: 5px 0 0 0; padding: 0 0 0 7px; width: 70px; font-weight: bold;">판매가</dt>
															<dd class="sales_price"
																style="float: left; margin: 5px 0 0 0; width: 255px;">
																<strong class="price" style="color: #fe6000;">${ ubook.ubookPrice }원</strong>
																<span style="color: #5E6B9F;">[<strong>${ ubook.ubookOPrice - ubook.ubookPrice }</strong>원
																	할인]
																</span>
															</dd>
														</dl>

														<dl class="delivery_gift"
															style="padding: 10px 0 0px 30px; width: 340px; margin: 0; padding: 0;">
															<dt class="delivery-price"
																style="float: left; padding: 2px 0 0 35px; width: 70px;">배송비</dt>
															<dd class="delivery-price"
																style="float: left; padding: 0 0 10px; width: 240px; font-size: 11px; line-height: 1.3em; margin-left: 30px;">
																<strong>2,600</strong>원 <br> <span class="delivery">
																	도서산간지역 추가배송비 : 4,000원 </span>
															</dd>
														</dl>
														<dl class="delivery_gift"
															style="padding: 10px 0 0px 30px; width: 340px;">
															<dt class="delivery-price"
																style="float: left; padding: 2px 0 0 7px; width: 70px;">배송일정</dt>
															<dd class="delivery-price"
																style="float: left; padding: 0 0 10px; width: 240px; font-size: 11px; line-height: 1.3em;">
																<span class="delivery" style="color: #8e8e8e;">
																	지금 주문하면 <span class="delivery-day"> 3일 이내 </span> 출고 예정
																	<br> 토/일, 공휴일을 제외한 영업일 기준으로 배송이 진행됩니다. 단순변심으로 인한
																	구매취소 및 환불에 대한 배송비는 구매자 부담입니다. <br>
																</span>
															</dd>
														</dl>

														<div class="release"
															style="padding: 10px 0 0 30px; width: 350px; font-size: 11px; line-height: 1.3em; color: #000000;">
															<span class="release" style="color: #000;"> <fmt:formatDate
                                                      value="${ubook.ubookPubDate}" pattern="yyyy년 MM월 dd일" />
</span> <br>


														</div>

														<div class="state_lowest_new"
															style="padding: 10px 0 10px 0; margin: 0 0 0 30px; width: 350px;">
															<dl class="product_state"
																style="padding: 8px 0 0 0; width: 350px; color: #8e8e8e; border-top: 1px solid #dcddd7;">
																<dt
																	style="float: left; padding: 2px 0 0 24px; width: 83px; font-size: 11px;">제품상태</dt>
																<dd
																	style="float: left; padding: 2px 0 8px; width: 246px; font-size: 11px; line-height: 1.3em;">
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

														</div>
														<!-- end state-lowest-new -->

														<div class="order_quantity"
															style="margin: 0 0 0 30px; padding: 10px 0 10px 0; width: 350px;">
															<label for="order-quantity"
																style="display: inline-block; padding: 2px 0 0 8px; font-weight: bold;">주문가능수량</label>
															<input type="text" id="order-quantity" value="${ ubook.ubookStock }"
																maxlength="3" onkeydown="onlyNum(event, this)"
																title="주문수량입력"
																style="margin: 0 0 0 10px; padding: 2px 2px 0 0; width: 30px; height: 15px; text-align: right; border: 1px solid #ddd;">
															<span class="count-up-down"> <a href="#count-up"
																style="color: #4d4d4d; text-decoration: none;"><img
																	alt="수량추가"
																	src="http://image.kyobobook.co.kr/new_ink/used/web/images/common/btn_count_up.gif"
																	class="count-up"></a> <a href="#count-down"><img
																	alt="수량빼기"
																	src="http://image.kyobobook.co.kr/new_ink/used/web/images/common/btn_count_down.gif"
																	class="count-down"></a>
															</span>
														</div>
													</div>
													<!--// product_detail_info  -->
													<div class="product_detail_bottom">
														<div class="button_buy"
															style="margin: 0 0 18px 43px; padding: 33px 0 0 0; clear: both;">
															<a href="#" class="btn_large btn_blue"
																style="width: 124px; font-size: 12px !important; margin-right: 10px; background-image: none; background-color: #5e6b9f !important; border: 1px solid #5e6b9f; color: #fff !important; padding: 7px 12px 1px; box-shadow: none; height: 33px; text-align: center;">장바구니에
																담기</a> <a href="#" class="btn_large btn_blue2"
																style="width: 124px; font-size: 12px !important; margin-right: 10px; background-image: none; background-color: #7b8ed1 !important; border: 1px solid #7b8ed1; color: #fff !important; padding: 7px 12px 1px; box-shadow: none; height: 33px; text-align: center;">바로
																구매하기</a>
														</div>
														<!-- s: 2020-08-26 -->
														<div class="detail_information"
															style="margin: 0; padding: 20px 43px 25px; font-size: 12px; letter-spacing: -1px; line-height: 1.4em; border: 1px solid #EDEDED; background: #fafafa;">
															<p style="padding: 10px 0 0 5px;">책장메이트에 등록된 판매상품과
																제품의 상태는 개별 판매자들이 등록, 판매하는 것으로 중개시스템만을 제공하는 책구메이트는 해당 상품과
																내용에 대해 일체 책임을 지지 않습니다. 상단 제품상태와 하단 상품 상세를 꼭 확인하신 후
																구입해주시기 바랍니다.</p>
															<p style="padding: 10px 0 0 5px;">책구메이트 결제 시스템을 이용하지
																않은 직거래로 인한 피해 발생 시 책구메이트는 일체 책임을 지지 않습니다.</p>

															<p style="padding: 10px 0 0 5px;">
																책장메이트에 등록된 판매 상품과 제품의 상태는 개별 오픈마켓 판매자들이 등록, 판매하는 것으로 중개
																시스템만을 제공하는<br> 인터넷 책구메이트에서는 해당 상품과 내용에 대해 일체 책임을 지지
																않습니다.
															</p>
															<p style="padding: 10px 0 0 5px;">책구메이트 결제시스템을 이용하지
																않은 직거래로 인한 피해 발생시, 책구메이트는 일체의 책임을 지지 않습니다.</p>
														</div>
														<!-- e: 2020-08-26 -->
													</div>
												</div>
											</div>

											<!-- 판매자 다른 상품 -->
											<div class="seller_another_product"
												style="position: relative; margin: 10px 0 30px 10px; border: 1px solid #979cb9; width: 650px;">
												<h2
													style="color: #333; font-size: 13px; letter-spacing: -0.05em; padding: 8px 15px; background-color: #f6f4f7;">
													중고책 추천 (판매자 <span>다른</span> 상품)
												</h2>
												<ul style="padding: 15px; height: 230px;">
													<li class="first-child"
														style="float: left; width: 20%; text-align: center;">
														<p class="photo">
															<a href="" style="color: #4d4d4d; text-decoration: none;">
																<img
																src="http://image.kyobobook.co.kr/new_ink/used/web/images/common/noimage_150_215.gif"
																alt="초등학생이 되었다: 바른마음"
																onerror="this.src='http://image.kyobobook.co.kr/new_ink/used/web/images/common/noimage_150_215.gif'"
																style="width: 68px; height: 94px; border: 1px solid #ccc; transition: all .3s;">
															</a>
														</p>
														<div class="info" style="margin: 10px 5px 0; padding: 0;">
															<p class="subject"
																style="font-weight: bold; display: block; margin-block-start: 1em; margin-block-end: 1em; margin-inline-start: 0px; margin-inline-end: 0px;">
																<a href=""
																	style="color: #4d4d4d; text-decoration: none;">
																	초등학생이 되었다: 바른마음 </a>
															</p>
															<p class="price"
																style="padding: 5px 0 5px 0; color: #fe6000;">6800원</p>
															<p class="quality">
																<span class="grade_s"
																	style="font-size: 11px; line-height: 15px; display: inline-block; padding: 0px 2px 0px; background-color: #d4ddf8; border: 1px solid #00006d; color: #00006d;">상태
																	: 최상</span>
															</p>
														</div>
													</li>
													
													<li
														style="float: left; width: 20%; text-align: center;">
														<p class="photo">
															<a href="" style="color: #4d4d4d; text-decoration: none;">
																<img
																src="http://image.kyobobook.co.kr/new_ink/used/web/images/common/noimage_150_215.gif"
																alt="초등학생이 되었다: 바른마음"
																onerror="this.src='http://image.kyobobook.co.kr/new_ink/used/web/images/common/noimage_150_215.gif'"
																style="width: 68px; height: 94px; border: 1px solid #ccc; transition: all .3s;">
															</a>
														</p>
														<div class="info" style="margin: 10px 5px 0; padding: 0;">
															<p class="subject"
																style="font-weight: bold; display: block; margin-block-start: 1em; margin-block-end: 1em; margin-inline-start: 0px; margin-inline-end: 0px;">
																<a href=""
																	style="color: #4d4d4d; text-decoration: none;">
																	초등학생이 되었다: 바른마음 </a>
															</p>
															<p class="price"
																style="padding: 5px 0 5px 0; color: #fe6000;">6800원</p>
															<p class="quality">
																<span class="grade_s"
																	style="font-size: 11px; line-height: 15px; display: inline-block; padding: 0px 2px 0px; background-color: #d4ddf8; border: 1px solid #00006d; color: #00006d;">상태
																	: 최상</span>
															</p>
														</div>
													</li>
													
													<li
														style="float: left; width: 20%; text-align: center;">
														<p class="photo">
															<a href="" style="color: #4d4d4d; text-decoration: none;">
																<img
																src="http://image.kyobobook.co.kr/new_ink/used/web/images/common/noimage_150_215.gif"
																alt="초등학생이 되었다: 바른마음"
																onerror="this.src='http://image.kyobobook.co.kr/new_ink/used/web/images/common/noimage_150_215.gif'"
																style="width: 68px; height: 94px; border: 1px solid #ccc; transition: all .3s;">
															</a>
														</p>
														<div class="info" style="margin: 10px 5px 0; padding: 0;">
															<p class="subject"
																style="font-weight: bold; display: block; margin-block-start: 1em; margin-block-end: 1em; margin-inline-start: 0px; margin-inline-end: 0px;">
																<a href=""
																	style="color: #4d4d4d; text-decoration: none;">
																	초등학생이 되었다: 바른마음 </a>
															</p>
															<p class="price"
																style="padding: 5px 0 5px 0; color: #fe6000;">6800원</p>
															<p class="quality">
																<span class="grade_s"
																	style="font-size: 11px; line-height: 15px; display: inline-block; padding: 0px 2px 0px; background-color: #d4ddf8; border: 1px solid #00006d; color: #00006d;">상태
																	: 최상</span>
															</p>
														</div>
													</li>
													
													<li
														style="float: left; width: 20%; text-align: center;">
														<p class="photo">
															<a href="" style="color: #4d4d4d; text-decoration: none;">
																<img
																src="http://image.kyobobook.co.kr/new_ink/used/web/images/common/noimage_150_215.gif"
																alt="초등학생이 되었다: 바른마음"
																onerror="this.src='http://image.kyobobook.co.kr/new_ink/used/web/images/common/noimage_150_215.gif'"
																style="width: 68px; height: 94px; border: 1px solid #ccc; transition: all .3s;">
															</a>
														</p>
														<div class="info" style="margin: 10px 5px 0; padding: 0;">
															<p class="subject"
																style="font-weight: bold; display: block; margin-block-start: 1em; margin-block-end: 1em; margin-inline-start: 0px; margin-inline-end: 0px;">
																<a href=""
																	style="color: #4d4d4d; text-decoration: none;">
																	초등학생이 되었다: 바른마음 </a>
															</p>
															<p class="price"
																style="padding: 5px 0 5px 0; color: #fe6000;">6800원</p>
															<p class="quality">
																<span class="grade_s"
																	style="font-size: 11px; line-height: 15px; display: inline-block; padding: 0px 2px 0px; background-color: #d4ddf8; border: 1px solid #00006d; color: #00006d;">상태
																	: 최상</span>
															</p>
														</div>
													</li>
												</ul>
											</div>
											<!--// 판매자 다른 상품 -->

											<!-- detail_menu_content -->
											<div class="detail_menu_content"
												style="margin: 25px 0 0 10px; width: 650px; line-height: 1.3em;">

												<!-- 탭메뉴 -->										
												
												
												<div id="used_info_content" class="detail_menu"
													style="width: 100%; height: 60px; letter-spacing: -0.03em; margin: 0 0 10px 0;">
													<ul class="main"
														style="width: 100%; padding: 1px 0 0 0; border-bottom: 2px solid #3378b3;">
														<li class="on"
															style="position: relative; float: left; text-align: center; margin: 0 1px 0 0;"><a
															href="#used_info_content"
															style="color: #3378b3; height: 22px; border: 2px solid #3378b3; border-bottom: none; margin: 0 0 -2px 0; background: #fff; height: 20 px; min-width: 75px; padding: 8px 10px 0 10px; display: block; border: 1px solid #dadada; border-bottom: none; background: #f5f5f5; font-size: 12px; line-height: 16px; font-weight: bold; color: #666;">중고
																도서 정보</a>
															<ul class="sub m01"
																style="position: absolute; top: 42px; left: 0px; width: 400px;">
																<li class="first" style="float: left; padding: 0 7px;"><a
																	href="#seller_product_info"
																	style="line-height: 12px; color: #666;">판매자 상품 소개</a></li>
																<li style="float: left; padding: 0 7px;"><a
																	href="#seller_delivery"
																	style="line-height: 12px; color: #666;">배송정책</a></li>
															</ul></li>
														<li
															style="position: relative; float: left; text-align: center; margin: 0 1px 0 0; padding: 1px 0 0 0;"><a
															href="#seller_postscript_content"
															style="height: 20px; min-width: 75px; padding: 8px 10px 0 10px; display: block; border: 1px solid #dadada; border-bottom: none; background: #f5f5f5; font-size: 12px; line-height: 16px; font-weight: bold; color: #666;">판매자
																전체 후기 <span
																style="font-size: 11px; font-weight: normal; text-decoration: none;">[119건]</span>
														</a></li>
														<li
															style="position: relative; float: left; text-align: center; margin: 0 1px 0 0; padding: 1px 0 0 0;"><a
															href="#info_content"
															style="height: 20px; min-width: 75px; padding: 8px 10px 0 10px; display: block; border: 1px solid #DADADA; border-bottom: none; background: #f5f5f5; font-size: 12px; line-height: 16px; font-weight: bold; color: #666;">도서
																정보 </a></li>
													</ul>
												</div>
												<!--// 탭메뉴 -->

												<!-- 중고 도서 정보 -->
												<div class="used_info_content"
													style="padding: 20px 20px 20px 20px; margin: 0 0 20px 0; border: 1px solid #e3e3e3; background: #fafafa;">
													<div id="seller_product_info" class="seller_product_info">
														<h3
															style="font-size: 13px; padding: 0px 0px 0px 8px; margin: 0 0 10px 0px; color: #333;">판매자
															상품 소개</h3>
														<div>※ 해당 상품은 교보문고에서 제공하는 정보를 활용하여 안내하는 상품으로제품 상태를
															반드시 확인하신 후 구입하여주시기 바랍니다.</div>
													</div>

													<div id="seller_delivery" class="seller_delivery"
														style="margin: 15px 0 0 0; padding: 15px 0 0 0;">
														<h3
															style="font-size: 13px; padding: 0px 0px 0px 8px; margin: 0 0 10px 0; color: #333;">판매자
															배송 정책</h3>
														<ul style="padding: 0px 0 25px 0px;">
															<li style="padding: 0 0 0 6px;">토/일, 공휴일을 제외한 영업일
																기준으로 배송이 진행됩니다. 판매자가 주문을 수락하기 전까지만 주문 취소가 가능하며 이후에는 취소가
																불가능합니다.</li>
														</ul>
													</div>
												</div>
												<!--// 중고 도서 정보 -->

												<!-- 탭메뉴 -->
												<div id="used_info_content" class="detail_menu"
													style="width: 100%; height: 60px; letter-spacing: -0.03em; margin: 0 0 10px 0;">
													<ul class="main"
														style="width: 100%; padding: 1px 0 0 0; border-bottom: 2px solid #3378b3;">
														<li 
															style="position: relative; float: left; text-align: center; margin: 0 1px 0 0;"><a
															href="#used_info_content"
															style="color: #3378b3; height: 22px; border: 2px solid #3378b3; border-bottom: none; margin: 0 0 -2px 0; background: #fff; height: 20 px; min-width: 75px; padding: 8px 10px 0 10px; display: block; border: 1px solid #dadada; border-bottom: none; background: #f5f5f5; font-size: 12px; line-height: 16px; font-weight: bold; color: #666;">중고
																도서 정보</a>
															<ul class="sub m01"
																style="position: absolute; top: 42px; left: 0px; width: 400px;">
																<li class="first" style="float: left; padding: 0 7px;"><a
																	href="#seller_product_info"
																	style="line-height: 12px; color: #666;">판매자 상품 소개</a></li>
																<li style="float: left; padding: 0 7px;"><a
																	href="#seller_delivery"
																	style="line-height: 12px; color: #666;">배송정책</a></li>
															</ul></li>
														<li class="on"
															style="position: relative; float: left; text-align: center; margin: 0 1px 0 0; padding: 1px 0 0 0;"><a
															href="#seller_postscript_content"
															style="height: 20px; min-width: 75px; padding: 8px 10px 0 10px; display: block; border: 1px solid #dadada; border-bottom: none; background: #f5f5f5; font-size: 12px; line-height: 16px; font-weight: bold; color: #666;">판매자
																전체 후기 <span
																style="font-size: 11px; font-weight: normal; text-decoration: none;">[119건]</span>
														</a></li>
														<li
															style="position: relative; float: left; text-align: center; margin: 0 1px 0 0; padding: 1px 0 0 0;"><a
															href="#info_content"
															style="height: 20px; min-width: 75px; padding: 8px 10px 0 10px; display: block; border: 1px solid #DADADA; border-bottom: none; background: #f5f5f5; font-size: 12px; line-height: 16px; font-weight: bold; color: #666;">도서
																정보 </a></li>
													</ul>
												</div>
												<!--// 탭메뉴 -->

												<!-- 판매자 후기 -->
												<div class="seller_postscript_content"
													style="margin: 0 0 20px 0; padding: 0;">
													<p class="more"
														style="padding: 0 0 5px; text-align: right;">
														<a href="/seller/listBuyVltn.ink?mmbrNmbr=62011163462">더보기</a>
													</p>
													<table
														summary="구매후기 목록을 번호, 구매후기, 구매만족도, ID, 등록일로 보실수 있습니다."
														style="border-collapse: collapse; border-spacing: 0; table-layout: fixed; border-top: 1px solid #899bdb; width: 100%; border-bottom: 1px solid #bebebe; text-align: center;">
														<caption
															style="height: 0; font-size: 0; line-height: 0; visibility: hidden;">구매후기
															목록</caption>
														<colgroup>
															<col width="40px">
															<col width="*">
															<col width="100px">
															<col width="100px">
															<col width="90px">
														</colgroup>
														<thead
															style="display: table-header-group; vertical-align: middle; border-color: inherit;">
															<tr
																style="display: table-row; vertical-align: inherit; border-color: inherit;">
																<th scope="col"
																	style="padding: 8px 0 7px 0; border-bottom: 1px solid #e1e2dc; background: #e8eff6; color: #666; font-size: 11px; letter-spacing: -0.03em;">NO</th>
																<th scope="col">구매후기</th>
																<th scope="col">구매만족도</th>
																<th scope="col">ID</th>
																<th scope="col">등록일</th>
															</tr>
														</thead>
														<tbody
															style="display: table-row-group; vertical-align: middle; border-color: inherit;">
															<tr
																style="display: table-row; vertical-align: inherit; border-color: inherit;">
																<td
																	style="padding: 8px 0 7px 0; border-bottom: 1px solid #e1e1e1; text-align: center; letter-spacing: -0.03em;">119</td>
																<td class="subject">받았습니다 받았습니다</td>
																<td><img
																	src="http://image.kyobobook.co.kr/new_ink/used/web/images/main/v3/star_rating_04.gif"
																	alt="5점 만점에 4점"></td>
																<td><a
																	href="http://booklog.kyobobook.co.kr/ssk7596/">ssk7***</a></td>
																<td>2021.11.05</td>


															</tr>
															<tr>
																<td>118</td>
																<td class="subject">…..!!!!!!!</td>
																<td><img
																	src="http://image.kyobobook.co.kr/new_ink/used/web/images/main/v3/star_rating_05.gif"
																	alt="5점 만점에 5점"></td>
																<td><a href="http://booklog.kyobobook.co.kr/fl723/">fl***</a></td>
																<td>2021.11.05</td>


															</tr>
															<tr>
																<td>117</td>
																<td class="subject">배송이 일주일 밖에(?) 안 걸렸지만 책의 상태가 좋아서
																	별점 5개로 결정 합니다`^^</td>
																<td><img
																	src="http://image.kyobobook.co.kr/new_ink/used/web/images/main/v3/star_rating_05.gif"
																	alt="5점 만점에 5점"></td>
																<td><a
																	href="http://booklog.kyobobook.co.kr/nurine99/">nurin***</a></td>
																<td>2021.11.01</td>


															</tr>

														</tbody>
													</table>
												</div>
												<!--// 판매자 후기 -->

												<!-- 탭메뉴 -->
												<div id="used_info_content" class="detail_menu"
													style="width: 100%; height: 60px; letter-spacing: -0.03em; margin: 0 0 10px 0;">
													<ul class="main"
														style="width: 100%; padding: 1px 0 0 0; border-bottom: 2px solid #3378b3;">
														<li 
															style="position: relative; float: left; text-align: center; margin: 0 1px 0 0;"><a
															href="#used_info_content"
															style="color: #3378b3; height: 22px; border: 2px solid #3378b3; border-bottom: none; margin: 0 0 -2px 0; background: #fff; height: 20 px; min-width: 75px; padding: 8px 10px 0 10px; display: block; border: 1px solid #dadada; border-bottom: none; background: #f5f5f5; font-size: 12px; line-height: 16px; font-weight: bold; color: #666;">중고
																도서 정보</a>
															<ul class="sub m01"
																style="position: absolute; top: 42px; left: 0px; width: 400px;">
																<li class="first" style="float: left; padding: 0 7px;"><a
																	href="#seller_product_info"
																	style="line-height: 12px; color: #666;">판매자 상품 소개</a></li>
																<li style="float: left; padding: 0 7px;"><a
																	href="#seller_delivery"
																	style="line-height: 12px; color: #666;">배송정책</a></li>
															</ul></li>
														<li
															style="position: relative; float: left; text-align: center; margin: 0 1px 0 0; padding: 1px 0 0 0;"><a
															href="#seller_postscript_content"
															style="height: 20px; min-width: 75px; padding: 8px 10px 0 10px; display: block; border: 1px solid #dadada; border-bottom: none; background: #f5f5f5; font-size: 12px; line-height: 16px; font-weight: bold; color: #666;">판매자
																전체 후기 <span
																style="font-size: 11px; font-weight: normal; text-decoration: none;">[119건]</span>
														</a></li>
														<li class="on"
															style="position: relative; float: left; text-align: center; margin: 0 1px 0 0; padding: 1px 0 0 0;"><a
															href="#info_content"
															style="height: 20px; min-width: 75px; padding: 8px 10px 0 10px; display: block; border: 1px solid #DADADA; border-bottom: none; background: #f5f5f5; font-size: 12px; line-height: 16px; font-weight: bold; color: #666;">도서
																정보 </a></li>
													</ul>
												</div>
												<!--// 탭메뉴 -->

												<!-- 도서 정보 -->
												<div class="info_content">
													<div id="info_content02"
														style="margin: 25px 0 0 0; width: 717px; line-height: 1.3em;">
														<h3
															style="font-size: 13px; padding: 0px 0px 0px 8px; margin: 0 0 10px 0; color: #333;">책
															소개</h3>
														<div class="book_info_content dot_line"
															style="margin: 0 0 20px 0; border-bottom: 1px dotted #e2e2e2; padding-bottom: 20px; width: 650px;">
															<table summary="도서 줄거리 및 내용"
																style="width: 100%; border-collapse: collapse; border-spacing: 0; table-layout: fixed; border-top: 1px solid #e2e2e2; width: 100%; border-bottom: 1px solid #e2e2e2; border-right: 1px solid #e2e2e2; text-align: center; font-size: 11px;">
																<caption
																	style="height: 0; font-size: 0; line-height: 0; visibility: hidden;">
																	도서 줄거리 및 내용</caption>
																<thead
																	style="display: table-header-group; vertical-align: middle; border-color: inherit;">
																	<tr
																		style="display: table-row; vertical-align: inherit; border-color: inherit;">
																		<th scope="col"
																			style="padding: 6px 0 5px 0; border-bottom: 1px solid #e2e2e2; border-left: 1px solid #e2e2e2; color: #666; font-size: 11px; letter-spacing: -0.03em;">도서
																			줄거리 및 내용</th>
																	</tr>
																</thead>
																<tbody>
																</tbody>
															</table>
															<p class="txt" style="margin: 15px 0 0 0; padding: 0;">
																${ ubook.ubookDetail }
															</p>
														</div>
													</div>
													<div id="info_content04">
														<h3
															style="font-size: 13px; padding: 0px 0px 0px 8px; margin: 0 0 10px 0; color: #333;">목차</h3>
														<div class="table_contents dot_line"
															style="margin: 0 0 20px 0; padding-right: 8px; border-bottom: 1px dotted #e2e2e2; padding-bottom: 20px;">
															${ ubook.ubookContent }
														</div>
													</div>
												</div>
												<!-- 도서 정보 -->

												<!-- 교환/반품안내 -->
												<div class="member_refund">
													<h3
														style="font-size: 13px; padding: 0px 0px 0px 8px; margin: 0 0 10px 0px; color: #333;">교환/반품안내</h3>
													<p class="info" style="margin: 0 0 5px 0;">※ 상품 설명에
														반품/교환 관련한 안내가 있는 경우 그 내용을 우선으로 합니다. (업체 사정에 따라 달라질 수
														있습니다.)</p>
													<table summary="교환/반품안내"
														style="border-collapse: collapse; border-spacing: 0; table-layout: fixed; border-top: 1px solid #8293cf; border-right: 1px solid #e1e1e1; border-bottom: 1px solid #e1e1e1; width: 100%; text-align: left; font-size: 11px; margin-bottom: 20px;">

														<colgroup>
															<col width="130px">
															<col width="*">
														</colgroup>
														<tbody
															style="display: table-row-group; vertical-align: middle;  border-color: inherit;">
															<tr
																style="display: table-row; vertical-align: inherit; border-color: inherit;">
																<th scope="row"
																	style="padding: 8px 0 7px 0; border-bottom: 1px solid #e1e1e1; border-left: 1px solid #e1e1e1; background: #e8eff6; color: #62655c; letter-spacing: -0.03em; font-weight: normal;"><span>반품/교환
																		안내</span></th>
																<td
																	style="padding: 8px 10px 2px 10px; border-bottom: 1px solid #e1e1e1; border-left: 1px solid #e1e1e1; letter-spacing: -0.03em; line-height: 16px;">
																	<p style="margin: 0 0 5px 0;">
																		<strong>[중고도서 반품 및 교환 안내]</strong>
																	</p>
																	<p>
																		※ 중고도서의 경우 중고 상품 특성상 반품 및 교환이 불가능합니다.<br> 구매 시
																		주의하여 구매하시기 바랍니다.
																	</p>
																</td>
															</tr>
															<tr>
																<th scope="row"><span>소비자 피해보상</span></th>
																<td>
																	<p>- 상품의 불량에 의한 교환, A/S, 환불, 품질보증 및 피해보상 등에 관한 사항은
																		소비자분쟁해결 기준 (공정거래위원회 고시)에 준하여 처리됨</p>
																	<p>- 대금 환불 및 환불지연에 따른 배상금 지급 조건, 절차 등은 전자상거래 등에서의
																		소비자 보호에 관한 법률에 따라 처리함</p>
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
										<div class="detail_side"
											style="float: right; margin: 13px 0 0; width: 220px; height: 500px;">
											<!-- 판매자 정보 -->
											<!-- <div class="seller_info"> -->
											<div class="seller_info type_2"
												style="position: relative; width: 198px; border: 1px solid #8a9cdb; padding: 10px 10px 10px 10px;">
												<dl
													style="width: 100%; margin: 0; padding: 0; list-style: none; display: block; margin-block-start: 1em; margin-block-end: 1em; margin-inline-start: 0px; margin-inline-end: 0px;">
													<dt class="seller">판매자</dt>
													<dd class="seller"
														style="width: 100%; font-size: 14px; color: #5f699c; font-weight: bold; padding: 0 0 5px 0; float: left;">
														<!-- 여기에 이 도서의 판매자 번호와 일치하는 닉네임 값을 보여줄거임 -->
													</dd>
													<dt class="delivery_rank"
														style="width: 104px; min-height: 14px; float: left; height: 12px; line-height: 12px; padding: 7px 0 0 0;">
														<a
															onclick="javascript:window.open('/popup/product/viewInformationOfSellerGrade.ink', '', 'width=630,height=599');"
															href="#" title="새창열림">구매만족도</a>
													</dt>
													<dd class="delivery_rank">
														<img
															src="http://image.kyobobook.co.kr/new_ink/used/web/images/main/v3/star_rating_05.gif"
															alt="5점 만점에 5점">
													</dd>
													<!-- !구매 만족도 -->
												</dl>

												<div class="button"
													style="border-top: none; padding: 8px 0 0 0; margin: 8px 0 0 0; padding-top: 0;">
													<a
														href="/sellerPage/product/viewSellerProductList.ink?mmbrNmbr=62011163462"
														class="btn_small registry"
														style="width: 104px; font-weight: bold; padding: 3px 4px 2px; display: inline-block; white-space: nowrap; vertical-align: baseline; * vertical-align: -2px; border: 1 px solid #d0d0d0; padding: 5 px 4 px 0 px; height: 13 px; font-size: 11px !important; line-height: 13px; font-weight: normal; font-family: 'dotum'; color: #666 !important; text-decoration: none !important; background-color: #fff; text-align: center; transition: all .2s;">판매자
														전체 후기</a> <a
														href="javascript:popupSllrInqr('false', '62011163462', '7222444988871', '');"
														class="btn_small question">문의하기</a>
												</div>
											</div>
											<!--// 판매자 정보 -->


											<div class="new_used_product"
												style="margin: 10px 0 0; width: 200px; border: 1px solid #e0e0e0;">
												<h2
													style="color: #333; font-size: 13px; letter-spacing: -0.05em; padding: 8px 0 5px 10px; background: #f5f5f5;">
													<span>중고 신간</span>
												</h2>
												<ul
													style="height:260px; padding: 0 9px; width: 200px; border-bottom: 1px solid #e0e0e0; margin-block-start: 1em; margin-block-end: 1em; margin-inline-start: 0px; margin-inline-end: 0px; padding-inline-start: 22px;">
													<li
														style="padding: 10px 0; width: 165px; display: list-item; height: 88px; text-align: -webkit-match-parent;">

														<span class="product" style=""> <span class="photo"
															style="float: left; margin: 0 10px 0 0; width: 48px;">
																<a href=""> <img
																	src="http://image.kyobobook.co.kr/new_ink/used/web/images/common/noimage_150_215.gif"
																	alt="호랑이를 덫에 가두면"
																	onerror="this.src='http://image.kyobobook.co.kr/new_ink/used/web/images/common/noimage_150_215.gif'"
																	style="width: 46px; border: 1px solid #ccc; transition: all .3s;">
															</a>
														</span> <span class="subject" style="font-weight: bold;">
																<a href=""> 호랑이를 덫에 가두면 </a>
														</span>
													</span>
													</li>
													<li
														style="padding: 10px 0; width: 165px; border-top: 1px dotted #dadada; display: list-item; height: 88px; text-align: -webkit-match-parent;">

														<span class="product" style=""> <span class="photo"
															style="float: left; margin: 0 10px 0 0; width: 48px;">
																<a href=""> <img
																	src="http://image.kyobobook.co.kr/new_ink/used/web/images/common/noimage_150_215.gif"
																	alt="호랑이를 덫에 가두면"
																	onerror="this.src='http://image.kyobobook.co.kr/new_ink/used/web/images/common/noimage_150_215.gif'"
																	style="width: 46px; border: 1px solid #ccc; transition: all .3s;">
															</a>
														</span> <span class="subject" style="font-weight: bold;">
																<a href=""> 호랑이를 덫에 가두면 </a>
														</span>
													</span>
													</li>
													<li
														style="padding: 10px 0; width: 165px; border-top: 1px dotted #dadada; display: list-item; height: 88px; text-align: -webkit-match-parent;">

														<span class="product" style=""> <span class="photo"
															style="float: left; margin: 0 10px 0 0; width: 48px;">
																<a href=""> <img
																	src="http://image.kyobobook.co.kr/new_ink/used/web/images/common/noimage_150_215.gif"
																	alt="호랑이를 덫에 가두면"
																	onerror="this.src='http://image.kyobobook.co.kr/new_ink/used/web/images/common/noimage_150_215.gif'"
																	style="width: 46px; border: 1px solid #ccc; transition: all .3s;">
															</a>
														</span> <span class="subject" style="font-weight: bold;">
																<a href=""> 호랑이를 덫에 가두면 </a>
														</span>
													</span>
													</li>
													
												</ul>
											</div>
											<!-- end secondhand-newbook -->
										</div>
										<!--// detail_side -->
									</div>
									<!-- end body -->
								</div>
								<!-- end wrap -->
							</div>
						</div>
					</div>
				</section>
			</div>
		</div>
	</div>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>