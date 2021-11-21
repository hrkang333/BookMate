<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>[책장메이트] - 결제완료</title>

</head>
<body style="width: 1000px; margin: 0 auto;">
 	<jsp:include page="../ubook/ubookMenu.jsp"/>
	<hr>
	<main style="margin-top: 100px; margin-bottom: 100px;">
	<br><br><br><br><br><br><br><br><br><br>
	<h1 style="font-size: 40px;">결제가 완료되었습니다.<br>더 많은 중고도서를 찾아보세요!</h1>
	<br><br><br><br><br><br>
	<center><button onclick="location.href='ubookMain.ub'" style="background-color: #5cb85c; border: none; font-size: 20px; width: 600px; height: 50px; color: #fff;">책장메이트 홈으로 이동하기</button></center>
	
	</main>

	<jsp:include page="../common/footer.jsp" />
</body>
</html>