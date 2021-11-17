<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[책장메이트]</title>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <link rel="icon" href="resources/img/Fevicon.png" type="image/png">
  <link rel="stylesheet" href="resources/vendors/bootstrap/bootstrap.min.css">
  <link rel="stylesheet" href="resources/vendors/fontawesome/css/all.min.css">
  <link rel="stylesheet" href="resources/vendors/themify-icons/themify-icons.css">
  <link rel="stylesheet" href="resources/vendors/owl-carousel/owl.theme.default.min.css">
  <link rel="stylesheet" href="resources/vendors/owl-carousel/owl.carousel.min.css">

  <link rel="stylesheet" href="resources/css/style.css">
  <link rel="stylesheet" href="resources/css/used.css">
  <script type="text/javascript" src="resources/js/seller.js"></script>
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet"
    id="bootstrap-css">
</head>
<body style="width: 1200px; margin: auto;">
 	<jsp:include page="../ubook/ubookMenu.jsp"/>
      
  <!--================ 바디 =================-->
  <div class="f" style="width: 1200px;">
    <div>

      <!--================ 좌측 사이드바(도서 카테고리 선택) =================-->
      <div class="col-xl-2" style="text-align: center; position: fixed; z-index: 888; margin-top: 93px;">
        <div class="sidebar-categories">
          <div class="head category" style="width: 175px;"><a href="ubookMain.ub">중고도서</a></div>
		  <div class="categorybody"><a href="ubookCategory.ub?ubCategory=1">소설/시/에세이</a></div>
		      	<div class="categorybody"><a href="ubookCategory.ub?ubCategory=2">경제/경영</a></div>
		          <div class="categorybody"><a href="ubookCategory.ub?ubCategory=3">과학</a></div>
		      <div class="categorybody"><a href="ubookCategory.ub?ubCategory=4">인문</a></div>
		        <div class="categorybody"><a href="ubookCategory.ub?ubCategory=5">컴퓨터/IT</a></div>
		        <div class="categorybody"><a href="ubookCategory.ub?ubCategory=6">자기계발</a></div>
		        <div class="categorybody"><a href="ubookCategory.ub?ubCategory=7">정치/사회</a></div>
		      <div class="categorybody"><a href="ubookCategory.ub?ubCategory=8">역사/문화</a></div>
		       <div class="categorybody"><a href="ubookCategory.ub?ubCategory=9">취미</a></div>
		       <div class="categorybody"><a href="ubookCategory.ub?ubCategory=10">가정/육아</a></div>
		      
          <!--background-color: #c9ae9c;-->
        </div>
      </div>
      <!--================ End 좌측 사이드바(도서 카테고리 선택) =================-->

<c:if test="${ !empty list }">
      <!--================ 메인 Content =================-->
      <div class="col-xl-9 col-lg-8 col-md-7 maincon" style="position: absolute;
    z-index: 7777;
    width: 943px;
    margin-left: 205px;">
        <section class="content" style="margin-top: 100px;float: right;">
                    <!-- <select onchange="sortChange(this.value)">
                    	<option value="가격낮은순">가격 낮은 순</option>
                        <option value="가격높은순">가격 높은 순</option>
                        <option value="상태좋은순">상태 좋은 순</option>
                	</select> -->
			
			<div class="col-md-offset-2 qnaTable">
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="table-container bookListF">
						<c:if test="${ list[0].ubCategory eq 1 }">
							<h1 style="float: left;">소설/시/에세이</h1>
						</c:if>
						<c:if test="${ list[0].ubCategory eq 2 }">
							<h1 style="float: left;">경제/경영</h1>
						</c:if>
						<c:if test="${ list[0].ubCategory eq 3 }">
							<h1 style="float: left;">과학</h1>
						</c:if>
						<c:if test="${ list[0].ubCategory eq 4 }">
							<h1 style="float: left;">인문</h1>
						</c:if>
						<c:if test="${ list[0].ubCategory eq 5 }">
							<h1 style="float: left;">컴퓨터/IT</h1>
						</c:if>
						<c:if test="${ list[0].ubCategory eq 6 }">
							<h1 style="float: left;">자기계발</h1>
						</c:if>
						<c:if test="${ list[0].ubCategory eq 7 }">
							<h1 style="float: left;">정치/사회</h1>
						</c:if>
						<c:if test="${ list[0].ubCategory eq 8 }">
							<h1 style="float: left;">역사/문화</h1>
						</c:if>
						<c:if test="${ list[0].ubCategory eq 9 }">
							<h1 style="float: left;">취미</h1>
						</c:if>
						<c:if test="${ list[0].ubCategory eq 10 }">
							<h1 style="float: left;">가정/육아</h1>
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
									<!-- <col width="130px" style="text-align: center;"> -->
								</colgroup>
								<thead>
									<tr>
										<th class="tbNo1">No</th>
										<th class="tbNo1">표지</th>
										<th class="tbNo1">제목</th>
										<th class="tbNo1">저자</th>
										<th class="tbNo1">가격</th>
										<th class="tbNo1">재고</th>
										<th class="tbNo1">상태</th>
										<!-- <th class="tbNo1">구매</th> -->
									</tr>
								</thead>
								<tbody>
								<c:forEach var="u" items="${ list }" varStatus="status">
									<tr data-status="pagado" onclick="location.href='ubookDetailTest.ub?ubookNo=${ u.ubookNo }&bSellerNo=${u.BSellerNo}'">
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
													<input name="ubookNo" hidden="hidden" value="${ u.ubookNo }"/>${u.ubookName }
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
													<div style="background-color: red; color: white;">최상</div>
												</c:if>
												<c:if test="${u.ubookQual eq 'A' }">
													<div style="background-color: orange;">상</div>
												</c:if>
												<c:if test="${u.ubookQual eq 'B' }">
													<div style="background-color: yellow;">보통</div>
												</c:if>
												<c:if test="${u.ubookQual eq 'C' }">
													<div style="background-color: green; color: white;">하</div>
												</c:if>
												<c:if test="${u.ubookQual eq 'D' }">
													<div style="background-color: blue; color: white;">최하</div>
												</c:if>
												
												</div>
											</td>
											<!-- <td>
												<c:if test="${ s.sellerNo eq u.BSellerNo }">
													<div class="tbNo1">
														<button type="button" style="background-color: #BB937E;color:#ffffff; border:none; width: 100%; margin-bottom:10px; border-radius: 0.3rem;">나의 등록 도서</button>	
													</div>
												</c:if>
												<c:if test="${ empty s.sellerNo || s.sellerNo ne u.BSellerNo }">
													<div class="tbNo1">
														<button style="background-color: #5cb85c; color:#ffffff; border:none; width: 100%; margin-bottom:10px; border-radius: 0.3rem;" onclick="updateUbook()">장바구니</button>
	                                        			<button style="background-color: #5b8a5b; color:#ffffff; border:none;width: 100%; border-radius: 0.3rem;" onclick="deleteUbook()">바로구매</button>
													</div>
												</c:if>
											</td> -->
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</section>
      </div>
    </div>
  </div>
</c:if>
</body>
</html>