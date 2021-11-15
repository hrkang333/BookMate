<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>[책장메이트] - 도서 리스트</title>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  
  <style type="text/css">
	.fixedHeader {
		position: sticky;
		top: 0;
		font-size: 25px;
    	text-align: center;
	}
  </style>
</head>

<body style="width: 1200px; margin: auto;">
 	<jsp:include page="../ubook/ubookMenu.jsp"/>

  <!--================ 바디 =================-->
  <div class="mycontainer" style="width: 100% !important; padding:0px 0px 0px 0px !important; margin:0px 0px 0px 0px !important;">
    <div class="row">
 	<jsp:include page="../ubook/ubookCategory.jsp"/>


      <!--================ 메인 Content =================-->
      <div class="col-xl-9 col-lg-8 col-md-7 maincon">
        <section class="content">
			<input value="${ s.sellerNo }" name="sellerNo">
            <div>
				<div class="sorting" style="float: right;">
                    <select>
                    	<option value="1">가격 낮asdfasfasfasd은 순</option>
                        <option value="2">가격 높은 순</option>
                        <option value="3">상태 좋은 순</option>
                	</select>
                </div>
			</div>
			<div class="col-md-offset-2 qnaTable">
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="table-container bookListF">
						<form id="myUbookListForm" action="" method="post">
						<c:if test="${ list[0].ubCategory eq 1 }">
							<h1 style="float: left;">소설/시/에세이</h1>
						</c:if>
							<table class="table table-filter" id="ubookListTb">
								<colgroup>
									<col width="45px" style="text-align: center;">
									<col width="150px" style="text-align: center;">
									<col width="150px" style="text-align: center;">
									<col width="90px" style="text-align: center;">
									<col width="110px" style="text-align: center;">
									<col width="60px" style="text-align: center;">
									<col width="60px" style="text-align: center;">
									<col width="130px" style="text-align: center;">
								</colgroup>
								<thead>
									<tr>
										<th class="fixedHeader">No</th>
										<th class="fixedHeader">표지</th>
										<th class="fixedHeader">제목</th>
										<th class="fixedHeader">저자</th>
										<th class="fixedHeader">가격</th>
										<th class="fixedHeader">재고</th>
										<th class="fixedHeader">상태</th>
										<th class="fixedHeader">구매</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach var="u" items="${ list }" varStatus="status">
									<tr data-status="pagado">
											<td>
												<div class="tbNo1">${status.index + 1 }</div>
											</td>
											<td>
												<div class="ubookImg">
													<img src="${pageContext.servletContext.contextPath }/resources/images/Ubookimg/${u.ubookImg }" class="media-photo" style="width: 145px; height: auto;">
												</div>
											</td>
											<td>
												<div class="tbNo1">
													<input name="ubookNo" hidden="hidden" value="${ u.ubookNo }"/>
													<a href="ubookDetailTest.ub?ubookNo=${ u.ubookNo }&bSellerNo=${u.BSellerNo}">${u.ubookName }</a>
												</div>
											</td>
											<td>
												<div class="tbNo1">${u.ubookWriter }</div>
											</td>
											<td>
												<div class="tbNo1">
													<del>${u.ubookOPrice }원</del>
													<br>
													<strong>${u.ubookPrice }원</strong>
												</div>
											</td>
											<td>
												<div class="tbNo1">${u.ubookStock }</div>
											</td>
											<td>
												<div class="tbNo1">
												<c:if test="${u.ubookQual eq 'S' }">
													<div style="background-color: red; color: white;">${u.ubookQual}</div>
												</c:if>
												<c:if test="${u.ubookQual eq 'A' }">
													<div style="background-color: orange;">${u.ubookQual}</div>
												</c:if>
												<c:if test="${u.ubookQual eq 'B' }">
													<div style="background-color: yellow;">${u.ubookQual}</div>
												</c:if>
												<c:if test="${u.ubookQual eq 'C' }">
													<div style="background-color: green; color: white;">${u.ubookQual}</div>
												</c:if>
												<c:if test="${u.ubookQual eq 'D' }">
													<div style="background-color: blue; color: white;">${u.ubookQual}</div>
												</c:if>
												
												</div>
											</td>
											<td>
												<c:if test="${ s.sellerNo eq u.BSellerNo }">
													<div class="tbNo1">
														<button style="background-color: #5cb85c; color:#ffffff; border:none; width: 100%; margin-bottom:10px; border-radius: 0.3rem;" onclick="updateUbook()">수정</button>
	                                        			<button class="btn-danger" style="border:none;width: 100%; border-radius: 0.3rem;" onclick="deleteUbook()">삭제</button>
                                        			</div>
												</c:if>
												<c:if test="${ empty s.sellerNo || s.sellerNo ne u.BSellerNo }">
													<div class="tbNo1">
														<button style="background-color: #5cb85c; color:#ffffff; border:none; width: 100%; margin-bottom:10px; border-radius: 0.3rem;" onclick="updateUbook()">장바구니</button>
	                                        			<button style="background-color: #5b8a5b; color:#ffffff; border:none;width: 100%; border-radius: 0.3rem;" onclick="deleteUbook()">바로구매</button>
													</div>
												</c:if>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</form>
						</div>
					</div>
				</div>
			</div>
		</section>
      </div>
    </div>
  </div>
 	<jsp:include page="../common/footer.jsp"/>
</body>

</html> --%>