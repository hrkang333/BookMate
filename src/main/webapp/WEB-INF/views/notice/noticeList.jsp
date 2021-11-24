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
    <title>Document</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> 
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style>
input::-webkit-outer-spin-button,
input::-webkit-inner-spin-button {
    -webkit-appearance: none;
}
.notice{
width: 1000px;
}
.notice th{
    background-color:  rgba(166, 219, 240, 0.233);
}
</style> 

<script type="text/javascript">

var lastPage = parseInt("${requestScope.noticePaging.lastPage}")

function movePage(noticeNowPage) {
	$('#noticeNowPage').val(noticeNowPage);
	$('#pageMoveForm').submit();
}

function movingPageNum() {
	var movingPageNum = parseInt($('#movingPageNum').val())
	if(movingPageNum >= 1 & movingPageNum <= lastPage){
		movePage(movingPageNum);
	}else{
		alert('이동 페이지는 1과 '+lastPage+'페이지 사이로 입력해 주세요')
	}
	
}

function changeSearch() {
	$('#noticeKeyword').val($('#keywordInput').val());
	movePage(1);
}


function noteceDetail(noticeNo) {
	$('#noticeNoInput').val(noticeNo)
	$('#moveNoticeDetailForm').submit();
}
</script>
</head>

<body>
<jsp:include page="../common/menubar.jsp" />
		<main class="site-main" style="padding-top: 180px">
<div style="display: flex;width: 1200px; ">
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
<form action="noticeList.no" method="post" id="pageMoveForm">
<input type="hidden" id="noticeKeyword" name="keyword" value="${requestScope.keyword}">
<input type="hidden" id="noticeNowPage" name="nowPage" value="${requestScope.noticePaging.nowPage}">
</form>
<form action="selectNoticeDetail.no" id="moveNoticeDetailForm" method="post">
<input type="hidden" id="noticeNoInput" name="noticeNo" value="">
</form>
<span style="font-size: 30px; font-weight: bold;">공지사항</span>
<hr>
<div style="display: flex;">
<div style="margin-left: auto;">제목으로 검색 : 
<input type="text" id="keywordInput"><button type="button" onclick="changeSearch()"  class="btn-secondary btn-sm" >검색</button>
</div>
</div>

 <table class="table table-hover notice">
            <thead>
            <tr>
                <th>번호</th>
                <th>종류</th>
                <th>제목</th>
                <th>글쓴이</th>
                <th>등록일</th>
                <th>조회수</th>
                </tr>
            </thead>
            <tbody>
            	<c:forEach items="${requestScope.noticeList}" var="list" varStatus="status">
                <tr>
                    <td>${list.noticeNo}</td>
                    <td><c:if test="${list.noticeCategory==0}">일반공지</c:if><c:if test="${list.noticeCategory==1}">이벤트</c:if></td>
                    <td><span style="font-weight: bold; cursor: pointer;" onclick="noteceDetail(${list.noticeNo})">${list.noticeTitle}</span></td>
                    <td>${list.noticeWriter}</td>
                    <td><fmt:formatDate value="${list.noticeDate}" pattern="yyyy-MM-dd"/></td>
                    <td>${list.noticeViews}</td>
                </tr>
               </c:forEach> 	
            </tbody>
            <tfoot>
            <tr>
                	<td colspan="6">
                	<div style="display: flex;">
                	<div style="margin-left: auto; padding-right: 10px"> <button type="button" onclick="location.href='noticeEnrollForm.no'"  class="btn-secondary btn-sm" >글 작성</button> </div>
                	</div>
                	</td>
                </tr>
                <tr>

		        <td colspan="6" style="text-align: center;" id="pageNumber">
		        <div style="margin : 10px">
			        <c:if test="${requestScope.noticePaging.prePage==1}">
			        <span class="sizeUpBtn"  onclick="movePage(1)"><<</span>&nbsp;&nbsp;
			        <span class="sizeUpBtn"  onclick="movePage(${requestScope.noticePaging.startPage-10})"><</span></c:if>&nbsp;&nbsp;
					<c:forEach begin="${requestScope.noticePaging.startPage}" end="${requestScope.noticePaging.endPage}" varStatus="status">
					<c:choose>
					<c:when test="${status.current==requestScope.noticePaging.nowPage}">
					&nbsp;${status.current}&nbsp;
					</c:when>
					<c:otherwise>
					&nbsp;<span style="cursor: pointer; color: blue;" onclick="movePage(${status.current})">${status.current}</span>&nbsp;
				
					</c:otherwise>
					</c:choose>
					</c:forEach>
					&nbsp;&nbsp;<c:if test="${requestScope.noticePaging.nextPage==1}"><span class="sizeUpBtn" onclick="movePage(${requestScope.noticePaging.startPage+10})">></span>
					&nbsp;&nbsp;<span class="sizeUpBtn"  onclick="movePage(${requestScope.noticePaging.lastPage})">>></span>
					</c:if><br></div>
					<div>
					<input type="number" id="movingPageNum" style="width: 30px"> 페이지로 
					<button type="button" onclick="movingPageNum()" class="btn-secondary btn-sm" style="width: 50px">이동</button> / 총 ${requestScope.noticePaging.lastPage} 페이지
					</div>
		        </td>
       		 </tr>

                
            </tfoot>
        </table>
        </div></div>
        </main>
</body>
</html>