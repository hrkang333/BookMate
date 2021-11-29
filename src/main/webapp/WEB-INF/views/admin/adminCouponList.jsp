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
.coupon{
width: 900px;
}
.coupon th{
    background-color:  rgba(166, 219, 240, 0.233);
}
.coupon td , .coupon th{
text-align: center;
}
a:link { 
color: black; 
text-decoration: none;
}
a:visited { 
color: black; 
text-decoration: none;
}
a:hover { 
color: blue; 
text-decoration: none;
}
.leftTitle{
font-size: 20px;
font-weight: bold;
}
</style> 

<script type="text/javascript">

var lastPage = parseInt("${requestScope.A_BUserListPaging.lastPage}")

function movePage(nowPage) {
	$('#nowPage').val(nowPage);
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
	
	$('#searchKeyword').val($('#keywordInput').val());
	movePage(1);
}

function userRestore(user_Id){
	if(confirm("주의! 회원 자격을 변동하는 중입니다!")){
		if(confirm("정말 "+user_Id+" 회원의 자격정지를 해제 하시겠습니까?")){
			$('#user_Id').val(user_Id);
			$('#updateUserRestoreForm').submit();
		}
	}
}
function updateCouponForm(index) {
	$('#updateTr'+index).css('display','');
}

</script>
</head>

<body>
<jsp:include page="../common/menubar.jsp" />
		<main class="site-main" style="padding-top: 180px">
<div style="display: flex;width: 1200px; ">
			<jsp:include page="../admin/adminLeftMenu.jsp" />
<div style="margin-left: auto;margin-right: auto; width: 900px;">
	<br><br><br>

<form action="selectCouponList.cu" method="post" id="pageMoveForm">
<input type="hidden" id="searchKeyword" name="searchKeyword" value="${requestScope.searchKeyword}">
<input type="hidden" id="nowPage" name="nowPage" value="${requestScope.nowPage}">
</form>
<form action="updateCoupon.cu" method="post" id="updateCouponForm">
<input type="hidden" name="user_Id" id="user_Id">
</form>
<span style="font-size: 30px; font-weight: bold;">정지 회원 리스트</span>
<hr>
<div style="display: flex;">
<div style="margin-left: auto;"> 쿠폰 코드로 검색
<input type="text" id="keywordInput"><button type="button" onclick="changeSearch()"  class="btn-secondary btn-sm" >검색</button>
</div>
</div>

 <table class="table table-hover coupon">
            <thead>
            <tr>           
                 <th style="width: 150px">쿠폰코드</th>
                <th style="width: 150px">지급 포인트</th>
                <th style="width: 220px">쿠폰 시작일</th>
                <th style="width: 220px">쿠폰 마감일</th>
                <th style="width: 160px">수정/삭제</th>
                </tr>
            </thead>
            <tbody>
            
	
            
            	<c:forEach items="${requestScope.couponList}" var="list" varStatus="status">
                <tr>
                    <td>${list.couponCode}</td>
                    <td>${list.couponPoint}</td>
                    <td><fmt:formatDate value="${list.couponStartDate}" pattern="yyyy-MM-dd"/></td>
                    <td><fmt:formatDate value="${list.couponEndDate}" pattern="yyyy-MM-dd"/></td>
                    
                    <td>
                    <button type="button" class="btn btn-secondary btn-sm" onclick="updateCouponForm(${status.index})">수정</button><button type="button" class="btn btn-secondary btn-sm" onclick="">삭제</button>
                    </td>
                </tr>
                
                <tr id="updateTr${status.index}" style="display:none; background-color: appworkspace;;;">
                
                 <form action="updateCoupon" id="updateForm${status.index}" method="post">
                	<td><input type="hidden" name="couponCode" value="${list.couponCode}">${list.couponCode}</td>
                    <td><input type="number" name="couponPoint" value="${list.couponPoint}" style="width: 100px"></td>
                    <td><input type="date" name="couponStartDate" id="couponStartDate" value="<fmt:formatDate value='${list.couponStartDate}' pattern='yyyy-MM-dd'/>"></td>
                  	<td><input type="date" name="couponEndDate" id="couponEndDate" value="<fmt:formatDate value='${list.couponEndDate}' pattern='yyyy-MM-dd'/>"></td>
                  </form>
                  <td><button type="button" onclick="updateCoupon(${status.index})">수정 등록</button></td>
                </tr>
                
               </c:forEach> 	
              
            </tbody>
            <tfoot>
           
                <tr>

		        <td colspan="6" style="text-align: center;" id="pageNumber">
		        <div style="margin : 10px">
			        <c:if test="${requestScope.couponPaging.prePage==1}">
			        <span class="sizeUpBtn"  onclick="movePage(1)"><<</span>&nbsp;&nbsp;
			        <span class="sizeUpBtn"  onclick="movePage(${requestScope.couponPaging.startPage-10})"><</span></c:if>&nbsp;&nbsp;
					<c:forEach begin="${requestScope.couponPaging.startPage}" end="${requestScope.couponPaging.endPage}" varStatus="status">
					<c:choose>
					<c:when test="${status.current==requestScope.couponPaging.nowPage}">
					&nbsp;${status.current}&nbsp;
					</c:when>
					<c:otherwise>
					&nbsp;<span style="cursor: pointer; color: blue;" onclick="movePage(${status.current})">${status.current}</span>&nbsp;
				
					</c:otherwise>
					</c:choose>
					</c:forEach>
					&nbsp;&nbsp;<c:if test="${requestScope.couponPaging.nextPage==1}"><span class="sizeUpBtn" onclick="movePage(${requestScope.couponPaging.startPage+10})">></span>
					&nbsp;&nbsp;<span class="sizeUpBtn"  onclick="movePage(${requestScope.couponPaging.lastPage})">>></span>
					</c:if><br></div>
					<div>
					<input type="number" id="movingPageNum" style="width: 30px"> 페이지로 
					<button type="button" onclick="movingPageNum()" class="btn-secondary btn-sm" style="width: 50px">이동</button> / 총 ${requestScope.couponPaging.lastPage} 페이지
					</div>
		        </td>
       		 </tr>

                
            </tfoot>
        </table>
        </div></div>
        </main>
        <jsp:include page="../common/footer.jsp" />
</body>
</html>