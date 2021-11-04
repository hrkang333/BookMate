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

<br>
<button type="submit">도서 상세 보기</button>
</form>
<br><br><br>
<form action="selectBook.book" method="post">
도서 확인용<br>
ISBN : 9788964943786(8964943783)<br><br>
<input type="hidden" name="bookISBN" value="9788964943786(8964943783)"><br>
<button type="submit">도서 상세보기</button>

</form>
<br><br><br>
<form action="bookEnrollForm.book" method="post">
도서 입고<br><br>

<button type="submit">도서 등록</button>

</form>


<br><br><br>
<form action="tempBook.book" method="post">
asfsf<br><br>

<!-- <button type="submit">asfasfasfa</button> -->

</form>

</body>
</html>