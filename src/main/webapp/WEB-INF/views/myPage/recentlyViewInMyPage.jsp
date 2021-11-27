<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"/>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 목록 상세보기</title>

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
    
</head>
<body>

<%-- 			<div id="recentViewDiv" style="width: 150px; height: 650px; background-color: #F5F5F5; z-index: 777;">
			<div id="recentViewDiv_1">
				최근 본 상품 (<span style="color: red">${fn:length(viewList)}</span>)
			</div>

			<c:if test="${fn:length(viewList) != 0}">

				<div id="recentViewDiv_2">
					<c:set var="length" value="0" />
					<c:forEach var="i" begin="0" end="${fn:length(isbnList)-1}"
						step="4">
						<ul id="recentDetail${i}"
							<c:if test="${i != 0}"> style="display:none" </c:if>>
							<c:forEach begin="${i}" end="${i+3}" items="${isbnList}"
								var="isbn">
								<li><c:forEach var="book" items="${viewList}">
										<c:if test="${book.bookISBN eq isbn }">
											<img
												src="${pageContext.servletContext.contextPath }/resources/images/book_img/${book.bookMainImg}"
												class="media-photo"
												style="width: 90px; height: 140px; cursor: pointer; padding-top: 20px;"
												onclick="moveDetail('${book.bookISBN}')" alt="">
										</c:if>
									</c:forEach></li>
							</c:forEach>
						</ul>
						<c:set var="length" value="${length+1}" />
					</c:forEach>
				</div>
				<div id="recentViewDiv_3" style="cursor: pointer">
					<c:forEach var="pg" begin="1" end="${length}">
						<a onclick="goReview(${pg}, ${length})">${pg}</a>
					</c:forEach>
				</div>
			</c:if>
		</div>
 --%>
</body>

<script type="text/javascript">

/* function goReview(pg, length){
	for(var i=1; i<=length; i++){
		var index = (i-1)*4;
		if(i == pg){
			$('#recentDetail'+index).css('display','block');
		}else{
			$('#recentDetail'+index).css('display','none');
		}
	}
} */
</script>
</html>