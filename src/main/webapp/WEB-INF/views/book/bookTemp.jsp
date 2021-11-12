<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	function moveCart() {
		var logginUser = "${sessionScope.loginUser.userId}"
		if (logginUser == "") {
			alert("로그인이 필요한 기능입니다.");
			return false;
		} else {
			$('#moveCartForm').submit()
		}

	}
</script>
</head>
<body style="width: 1000px; margin: 0 auto;">
	<jsp:include page="../common/menubar.jsp" />
	<hr>


	<form action="selectBook.book" method="post">
		도서 상세보기<br>
		<br> ISBN : <input type="text" name="bookISBN"><br>

		<br>
		<button type="submit">도서 상세 보기</button>
	</form>
	<br>
	<br>
	<br>
	<form action="selectBook.book" method="post">
		도서 확인용<br> ISBN : 9788964943786(8964943783)<br>
		<br> <input type="hidden" name="bookISBN"
			value="9788964943786(8964943783)"><br>
		<button type="submit">도서 상세보기</button>

	</form>
	<br>
	<br>
	<br>
	<form action="bookEnrollForm.book" method="post">
		도서 입고<br>
		<br>

		<button type="submit">도서 등록</button>

	</form>
	<br>
	<br>
	<br>
	<form action="shoppingCart.sc" method="post" id="moveCartForm">
		장바구니<br>
		<br>
		<input type="hidden" value="${sessionScope.loginUser.userId}" name="user_Id">
		<button type="button" onclick="moveCart()">장바구니 이동</button>

	</form>
	<br>
	<br>
	<br>
	<form action="adminPageOpen.ad" method="post">
		관리자 페이지 이동<br> <br>
		<br> <br>
		<button type="submit">관리자 페이지 이동</button>

	</form>
	<!-- <br>
	<br>
	<br>
	<form action="tempBook.book" method="post">
		베스트 도서 작업용 도서 판매부수 조절(일주일에 한번)<br>
		<br>

		<button type="submit">도서 판매작업</button>

	</form> -->

</body>
</html>