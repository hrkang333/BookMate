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
<title>Insert title here</title>
</head>
<style>
.detail{
    border: 1px solid;
    width: 1000px;
}
.detail td,.detail th{
border: 1px solid black;
height: 50px;
}
.detail th{
width: 15%;
background-color: rgb(238, 176, 156);
text-align: center;
}
.detail td{
width: 35%;
padding: 10px;
}
.detail input, .detail textarea{     
    outline: none;
    border: 1px;
    resize: none;
}
</style>
<script type="text/javascript">
function deleteNotice(noticeNo) {
	if(confirm("정말로 공지사항을 삭제 하시겠습니까?")){
	location.href='deleteNotice.no?noticeNo='+noticeNo
	}
}
</script>
<body>
	<jsp:include page="../common/menubar.jsp" />
		<main class="site-main" style="padding-top: 180px">
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
	<div style="margin-left: auto;margin-right: auto; width: 900px;">
	<br><br><br>
	<span style="font-size: 30px; font-weight: bold;">공지사항</span>
<hr>
	<table class="detail">
            <tbody>
            <tr>
                <th>글제목</th>
                <td colspan="3">${requestScope.notice.noticeTitle}</td>
            </tr>
            <tr>
                <th>구분</th>
                <td><c:if test="${requestScope.notice.noticeCategory==0}">일반공지</c:if> <c:if test="${requestScope.notice.noticeCategory==1}">이벤트</c:if></td>
                <th>작성자</th>
                <td>관리자</td>
            </tr>
            <tr>
                <th>등록일</th>
                <td><fmt:formatDate value="${requestScope.notice.noticeDate}" pattern="yyyy-MM-dd"/> </td>
                <th>조회수</th>
                <td>${requestScope.notice.noticeViews}</td>
            </tr>
            <tr>
                <td colspan="4">
                ${requestScope.notice.noticeContent}
            </td>
            </tr>
        </tbody>
        <tfoot>
            <tr>
                <td colspan="4" style="padding-left: 20px; padding-right: 20px;">
                
                    <div style="display: flex;">
                    <c:if test="${sessionScope.loginUser.userId=='admin'}">
                    <form action="updateNoticeForm.no" method="post"><input type="hidden" name="noticeNo" value="${requestScope.notice.noticeNo}">
                        <div style="margin-right: auto;"><button type="submit"  class="btn-secondary btn-sm" >수정</button></form><button type="button" onclick="deleteNotice(${requestScope.notice.noticeNo})"  class="btn-secondary btn-sm" >삭제</button></div></c:if>
                        <div style="margin-left: auto;"><button type="button" onclick="location.href='noticeList.no'"  class="btn-secondary btn-sm" >목록으로</button></div>
                    
                </div>
                </td>

            </tr>
        </tfoot>
        </table>
	
	</div></div>
	</main>
</body>
</html>