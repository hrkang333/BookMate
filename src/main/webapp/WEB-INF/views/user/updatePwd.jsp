<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>포인트 조회</title>

<link rel="icon" href="img/Fevicon.png" type="image/png">
<link rel="stylesheet"
	href="resources/vendors/bootstrap/bootstrap.min.css">
<link rel="stylesheet"
	href="resources/vendors/fontawesome/css/all.min.css">
<link rel="stylesheet"
	href="resources/vendors/themify-icons/themify-icons.css">
<link rel="stylesheet" href="resources/vendors/linericon/style.css">
<link rel="stylesheet"
	href="resources/vendors/owl-carousel/owl.theme.default.min.css">
<link rel="stylesheet"
	href="resources/vendors/owl-carousel/owl.carousel.min.css">

<link rel="stylesheet" href="resources/css/style.css">

<!-- 제이쿼리 추가...-->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>


</head>
		<body>
				<h3>비밀번호 변경</h3> <br>

				<form  action="updatePwd.me" method="post">
					<table>
						<tr>
							<td><label>현재 비밀번호</label>
							<td><input type="password" name="userPwd" id="userPwd" required="required"></td>
						</tr>
						<tr>
							<td><label>변경할 비밀번호</label></td>
							<td><input type="password" name="newPwd" required="required"></td>
						</tr>
						
					</table>

					<br> <br>

					<div>
						<button type="submit">변경하기</button>
					</div>
				</form>
</body>
</html>