<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 리뷰 리스트 </title>
</head>
<link rel="icon" href="img/Fevicon.png" type="image/png">
    <link rel="stylesheet" href="resources/vendors/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="resources/vendors/fontawesome/css/all.min.css">
    <link rel="stylesheet" href="resources/vendors/themify-icons/themify-icons.css">
    <link rel="stylesheet" href="resources/vendors/linericon/style.css">
    <link rel="stylesheet" href="resources/vendors/owl-carousel/owl.theme.default.min.css">
    <link rel="stylesheet" href="resources/vendors/owl-carousel/owl.carousel.min.css">
  
     <!-- 제이쿼리피커  -->
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/resources/demos/style.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    
    <link rel="stylesheet" href="resources/css/style.css">
    
    <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<body style="width: 1200px; margin: auto;">
 <jsp:include page="../common/menubar.jsp" />

<!-- 왼쪽 사이드바  -->
	<section style="padding-top: 180px;">
		<div class="container">
			<div class="row">
				<jsp:include page="../myPageSideBar/sideBar.jsp" />


              <div style="text-align: center; width: 900px; height: auto; margin-left: 40px">
              	<div class="order_details_table">
              		<h1>마이 리뷰 리스트 보기 </h1>
					<table class="table" style="text-align: center;">
                        <thead style="text-align: center;">
					<tr>
						<th scope="col">제목</th>
						<th scope="col">내용</th>
						<th scope="col">작성일</th>
						<th scope="col">내 리뷰 보러가기 </th>
						
					</tr>

					<c:if test="${empty myBrList}">
						<td colspan="5"><h2>교환/반품 상품이 없습니다.</h2></td>
					</c:if>

					<c:forEach var="item" items="${myBrList }" varStatus="status">
						<tr>
							<td><c:out value="${item.reviewTitle }" /></td>
							<td><c:out value="${item.reviewContent }" /></td>
							<td><fmt:formatDate value="${item.reviewDate}" pattern="yyyy-MM-dd" /></td>
							<td><button>버튼임 상세보기로 가게 할거임 </button></td>

							
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</section>

<jsp:include page="../common/footer.jsp" />

</body>
</html>