<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<form action="selectBook.book" method="post">
도서 상세보기<br><br>

ISBN : <input type="text" name="bookISBN"><br>
9791164160969(1164160966)
<br>
<button type="submit">도서 상세 보기</button>
</form>
<br><br><br>
<form action="bookEnrollForm.book" method="post">
도서 입고<br><br>

<button type="submit">도서 등록</button>

</form>
</body>
</html>