<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> 
<style type="text/css">
.writer{
    border: 1px solid;
    width: 800px;
}
.writer td,.writer th{
border: 1px solid black;
height: 50px;
}
.writer th{
width: 15%;
background-color: rgb(238, 176, 156);
text-align: center;
}
.writer td{
width: 35%;
padding: 10px;
}
.writer input, .writer textarea{     
    outline: none;
    border: 1px;
    resize: none;
}
</style>
<script>
    function insertNoticeCheck() {
    	if(!$('input[name=noteceCategory]:checked').val()){
            alert('공지사항 구분을 선택하셔야 합니다.')
            $('input[name=noteceCategory]:checked').focus
            return false
        }
        if(!$('#noticeTitle').val()){
            alert('공지사항 제목을 입력하셔야 합니다.')
            $('#noticeTitle').focus()
            return false
        }
        if(!$('#noteceContent').val()){
            alert('공지사항 내용을 입력하셔야 합니다.')
            $('#noteceContent').focus()
            return false
        }
        if(confirm("입력하신 내용으로 글을 등록 하시겠습니까?")){
            $('#insertNoticeForm').submit();
        }
    }
</script>
</head>
<body>

<div style="display: flex;width: 1200px;">
			<div style="width: 200px;" id="adminMenuDiv">
				<br>
				<br>
				<br><span>공지사항 관리</span><br>
				<br> -공지사항 등록/수정/삭제<br>
				<br>
				<br><span>이벤트 관리</span><br>
				<br> -이벤트 등록<br> -이벤트 수정/삭제<br>
				<br>
				<br><span>회원 관리</span><br>
				<br> -일반등급회원<br> -판매등급회원<br>
				<br>
				<br><span>도서 관리</span><br>
				<br> -도서등록<br> -도서수정<br> -도서입고<br>
				<br>
				<br><span>문의 답변</span><br>
				<br> -문의 확인/답변<br>
				<br>
				<br><span>쿠폰 관리</span><br>
				<br> -쿠폰등록<br> -쿠폰수정/삭제<br>

			</div>
<div>

 <form action="" id="insertNoticeForm" method="post">

        <table class="writer">
            <tbody>
            <tr>
                <th>글제목</th>
                <td colspan="3"><input type="text" style="width: 600px;height: 50px;" name="noticeTitle" id="noticeTitle"></td>
            </tr>
            <tr>
                <th>구분</th>
                <td><input name="noteceCategory" type="radio" value="0"> 일반공지   <input type="radio" name="noteceCategory" value="1"> 이벤트   </td>
                <th>작성자</th>
                <td>관리자<input type="hidden" name="noticeWriter" value="관리자"></td>
            </tr>
            <tr>
                <td colspan="4">
                <textarea name="noteceContent" id="noteceContent" cols="30" rows="10" style="width: 800px; height: 800px;" ></textarea>
            </td>
            </tr>
        </tbody>
        <tfoot>
            <tr>
                <td colspan="4" style="padding-left: 20px; padding-right: 20px;">
                    <div style="display: flex;">
                        <div style="margin-left: auto;"><button type="button" onclick="insertNoticeCheck()">글등록</button></div>
                    
                </div>
                </td>

            </tr>
        </tfoot>
        </table>
<button type="button" onclick="insertNoticeCheck()">등록</button>
    </form>
        </div></div>
</body>
</html>