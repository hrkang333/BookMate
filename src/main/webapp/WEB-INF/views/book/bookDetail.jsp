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
    
<style type="text/css">
#reviewHeader span{
margin-right: 30px;
}
#reviewInnerWrap{
margin-top: 30px; 
margin-bottom: 30px;
width: 700px;
}
.moving button{
    width: 200px;
    background-color: white;
    outline: none;
}
</style>    
<script>

$(function() {
	var pagePosition = "${requestScope.pagePosition}"
	if(pagePosition==1){
		$('#reviewPosition').get(0).click();
	}else if(pagePosition==2){
		
	}
})

    	var listIndex = 0;
        function modiQuntity(num) {
        	var quantity = parseInt($('#orderQuantity').val());
            if(num==1){
                $('#orderQuantity').val(quantity+1)
            }else if(quantity>1){
                $('#orderQuantity').val(quantity-1)
            }
        }
        
        function bestListMove(checkIndex,bookSubCategory) {
			if(checkIndex == 1){
				listIndex += 1;
			}else{
				listIndex -= 1;
			}
			
			if(listIndex < 0){
				listIndex = 10;
			}else if(listIndex > 10){
				listIndex = 1;
			}
			$.ajax({
					url : "bestListMove",
					
					data : {
						listIndex : listIndex,
						bookSubCategory : bookSubCategory
					},
					type : "post",
					success : function(list) {
							$.each(list,function(i){
								$('#bestBookImg'+i).attr("src","${pageContext.servletContext.contextPath }/resources/images/book_img/"+list[i].bookMainImg);
								$('#bestBookImg'+i).attr("onclick","detailbook('"+list[i].bookISBN+"')");	
								$('#bestBookTitle'+i).text(list[i].bookTitle);	
								$('#bestBookTitle'+i).attr("onclick","detailbook('"+list[i].bookISBN+"')");
								$('#bestBookPrice'+i).text(list[i].bookPrice.toLocaleString('ko-KR')+"원");
							})
					},
					error : function (request, status, error){
			               
					    var errorMsg = "요청 도중 오류가 발생하였습니다. \n";
					   
					    if(request.status == 0){ //offline
					        errorMsg += "네트워크 연결을 확인해주십시오.";
					    }else if(request.status==401){//Unauthorized
					        errorMsg += "권한이 없습니다. \n관리자에게 문의해주세요.";
					    }else if(request.status==403){//Forbidden
					        errorMsg += "접근이 거부되었습니다. \n관리자에게 문의해주세요.";
					    }else if(request.status==404){//Not Found
					        errorMsg += "요청한 페이지를 찾을 수 없습니다. \n관리자에게 문의해주세요.";
					    }else if(request.status==500){ //Internel Server Error
					        errorMsg += "서버 내 오류가 발생하였습니다. \n관리자에게 문의해주세요.";
					    }else if(status=='parsererror'){ //Error.nParsing JSON Request failed.
					        errorMsg += "응답 본문을 정상적으로 가져올 수 없습니다. \n관리자에게 문의해주세요.";
					    }else if(status=='timeout'){ //Request Time out.
					        errorMsg += "응답 제한 시간을 초과하였습니다. 다시 조회해주세요.";
					    }else { //Unknow Error
					        errorMsg += "\n관리자에게 문의해주세요.";
					    }
					   
					    alert(errorMsg);
					}

				
				})
		}
        
      
       
        function basketMove() {
        	var user_Id = "${sessionScope.loginUser.userId}";
        	var quantity = parseInt($('#orderQuantity').val())
        	if(!loginCheck()){
        		return false
        	}
        	
        	$.ajax({
        	
        		url : "insertBasket.ba",
        		data : {
        			user_Id : user_Id,
        			bookISBN : "${requestScope.book.bookISBN}",
        			quantity : quantity
        		},
        		
        		type : "post" ,
        		success : function(str) {
        			if(str == 'already'){
        				alert('이미 장바구니에 있는 상품입니다.')
        			}else{
						if(confirm("상품을 장바구니에 담았습니다. 장바구니로 이동하시겠습니까?")){
							$('#moveCartForm').submit();
						}
						return false;
        			}
				}
        		
        		
        	})
        	
        	
			
		}
        function reviewScore(num) {
            for(var i=1;i<=5;i++){
                $('#scoreImg_'+i).attr('src',"${pageContext.servletContext.contextPath }/resources/img/fHeart.jpg")
                if(i>num){
                    $('#scoreImg_'+i).attr('src',"${pageContext.servletContext.contextPath }/resources/img/eHeart.jpg")
                }
            }
            $('#bookRating').val(num*2);
        }
        
        function insertReview() {
        	if($('#bookRating').val()==0){
        		alert("평점을 입력하지 않으셨습니다.");
        		return false;
        	}
			if($('#reviewContent').val().length==0||!$('#reviewTitle').val()){
				alert("내용없음")
        		return false;
			}
			if(confirm("입력하신 내용으로 리뷰를 등록하시겠습니까?")){
				
				$.ajax({
				
					url : "insertReview.re",
					type : "post",
					data : {
						reviewWriter : $('#reviewWriter').val(),
						bookISBN : $('#reviewBookISBN').val(),
						bookRating : $('#bookRating').val(),
						reviewTitle : $('#reviewTitle').val(),
						reviewContent : $('#reviewContent').val().replace(/\n/g,"<br>")
					},
					success : function(str) {
						$('#reviewNowPage').val(1);
						$('#reviewKind').val(1);
						$('#pagePosition').val(1);
						$('#detailBookPageForm').submit();
					},
					error : function(e) {
						alert("ajax 리뷰등록 오류")
					}
					
				})
				
				
				
			}
		}
        function detailbook(bookISBN) {
			$('#inputISBN').val(bookISBN);
        	$('#detailBookForm').submit();
		}
        function movePage(kind,movePage) {
			if(kind==1){
				$('#reviewNowPage').val(movePage);
				$('#pagePosition').val(1);
				$('#detailBookPageForm').submit();
			}else{
				$('#questionNowPage').val(movePage);
				$('#detailBookPageForm').submit();
			} 
		}
        
        function reviewInsert() {
        	var user_Id = "${sessionScope.loginUser.userId}";
        	if(!loginCheck()){
        		return false
        	}
        	$.ajax({
        	
        		url : "reviewIdCheck.re",
        		type : "post",
        		data : {
        			user_Id : user_Id,
        			bookISBN : "${requestScope.book.bookISBN}"
        		},
        		success : function(str) {
					if(str == '2'){
						checkStatus = 0;
						alert('이미 리뷰를 등록하셨습니다');
					}else if(str == '0'){
						checkStatus = 0;
						alert('책을 구매하셔야 리뷰를 등록하실 수 있습니다');
					}else{

		            	$('#reviewModal').modal('show');
					}
				},
				error : function(e) {
					alert("리뷰 작성 체크 ajax 통신 오류")
				}
        		
        		
        	})
        	return false
        	
		}
        
        function reviewReply(num) {
        	if(!loginCheck()){
        		return false
        	}
        	$('#RInsertBtn_'+num).css("display","none")
        	$('#RCloseBtn_'+num).css("display","inline-block")
        	
        	$('#reviewReplyInsertDiv').clone().prependTo($('#reviewInnerContent_'+num))
        	$('#reviewReplyInsertBtn').attr("onclick","reviewReplyInsert("+num+")")
        	$('#reviewInnerContent_'+num+' #reviewReplyInsertDiv').css("display","flex")
		}
        function reviewReplyInsert(num) {
        	alert(num)
        	$('#reviewInnerContent_'+num+' #reviewReplyInsertDiv').remove()
			
		}
        function reviewReplyClose(num) {
        	$('#reviewInnerContent_'+num+' #reviewReplyInsertDiv').remove()
        	$('#RCloseBtn_'+num).css("display","none")
        	$('#RInsertBtn_'+num).css("display","inline-block")
			
		}
        
        function loginCheck() {
        	var user_Id = "${sessionScope.loginUser.userId}";
        	if(user_Id == null||user_Id == ""){
        		alert("로그인이 필요한 기능입니다.")
        		return false;
        	}
        	return true;
		}
        
       function pagePositionMove(str) {
		$('#'+str).get(0).click();
	}
    </script>

</head>
<body style="width: 1000px; margin: 0 auto;">
	<hr>
	<main>

		<div style="display: flex;">

			<div style="width: 400px;">
				<img
					src="${pageContext.servletContext.contextPath }/resources/images/book_img/${requestScope.book.bookMainImg}"
					alt="" style="width: 300px; height: auto;">
			</div>
			<div>
				<br>
				<c:set var="price" value="${requestScope.book.bookPrice}" />
				<span style="font-size: 30px; font-weight: bold;"><c:out
						value="${requestScope.book.bookTitle}" /></span> &nbsp;
				<c:if test="${requestScope.book.bookCategory==2}">
					<span style="color: red;">[eBook]</span>
				</c:if>
				<br>
				<c:if test="${requestScope.book.bookSubTitle!='없음'}">
					<span><c:out value="${requestScope.book.bookSubTitle}" /></span>
					<br>
				</c:if>
				<br>
				<br> <span>ISBN : <c:out
						value="${requestScope.book.bookISBN}" /></span><br>
				<br> <span><c:out
						value="${requestScope.book.bookWriter}" /> 지음 | <c:if
						test="${requestScope.book.bookTranslator!='없음'}">역자 <c:out
							value="${requestScope.book.bookTranslator}" />  | </c:if>
					<c:out value="${requestScope.book.bookPublisher}" /> 출판 | <fmt:formatDate
						value="${requestScope.book.bookPublicheDate}"
						pattern="yyyy년 MM월 dd일" /> 출간</span><br>
				<br> <span>평점 : <c:out
						value="${requestScope.book.bookRating}" />/10 (<c:out
						value="${requestScope.book.bookRatingCount}" />명 참여) | 리뷰 <c:out
						value="${requestScope.book.bookReviewCount}" />개
				</span><br>
				<br> <span>국내 베스트 <span
					style="color: red; font-weight: bold;">${requestScope.book.allBestRank}</span>위
					| 소설 베스트 <span style="color: red; font-weight: bold;">${requestScope.book.categoryBestRank}</span>위
				</span><br>
				<br>
				<hr>
				<br>
				<br> <span>정가 : <fmt:formatNumber type="number"
						value="${price}" /> 원
				</span><br>
				<br> <span>판매가 : <a
					style="font-size: 25px; color: crimson"><fmt:formatNumber
							type="number" value="${price*0.9}" /></a>원 [10%↓ <fmt:formatNumber
						type="number" value="${price*0.1}" />원 할인]
				</span><br>
				<br> <span>배송비 : 0 원</span>&nbsp;&nbsp;&nbsp;
				<button id="">배송비 안내</button>
				<br>
				<br> <span>혜택 : [기본혜택] <fmt:formatNumber type="number"
						value="${price*0.05}" />pt (5% 기본적립)<br>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[리뷰작성] <fmt:formatNumber
						type="number" value="${price*0.02}" />pt (2% 추가적립)
				</span><br>
				<br>

			</div>

		</div>
		<hr>
		<br>
		<br>
		<div style="display: flex;">

			<div style="width: 400px;">

				주문수량 : <input type="text" style="width: 30px; text-align: right;"
					value="1" id="orderQuantity" name="QUANTITY">권
				<button type="button" onclick="modiQuntity(1)">+</button>
				<button type="button" onclick="modiQuntity(0)">-</button>





			</div>
			<div>
				<button onclick="basketMove()" type="button">장바구니</button>
				<button>바로주문</button>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a
					href="bookEnrollForm.book">도서 입고로 이동</a>
			</div>
		</div>
		<br>
		<br>
		<hr>
		<br> <span
			style="font-size: 20px; font-weight: bold; color: blue;">${categoryName}</span>
		분야 주간 베스트 도서 <br>
		<br>
		<div style="display: flex;">
			<div style="margin-top: 125px">
				<img alt=""
					src="${pageContext.servletContext.contextPath }/resources/img/btn_prev.gif"
					height="50px" style="margin-right: 15px; cursor: pointer;"
					onclick="bestListMove(0,${requestScope.book.bookSubCategory})">
			</div>
			<c:forEach items="${requestScope.bestList}" var="list"
				varStatus="status">
				<div style="width: 180px; text-align: center;">
					<img alt=""
						src="${pageContext.servletContext.contextPath }/resources/images/book_img/${list.bookMainImg}"
						width="170px" height="250px" style="margin: 5px; cursor: pointer;"
						onclick="detailbook('${list.bookISBN}')"
						id="bestBookImg${status.index}"><br> <span
						id="bestBookTitle${status.index}" style="cursor: pointer;"
						onclick="detailbook('${list.bookISBN}')"><c:out
							value="${list.bookTitle}"></c:out></span><br> <span
						style="color: red;" id="bestBookPrice${status.index}"><fmt:formatNumber
							value="${list.bookPrice}"></fmt:formatNumber>원</span>

				</div>

			</c:forEach>
			<div style="margin-top: 125px">
				<img alt=""
					src="${pageContext.servletContext.contextPath }/resources/img/btn_next.gif"
					height="50px" style="margin-left: 15px; cursor: pointer;"
					onclick="bestListMove(1,${requestScope.book.bookSubCategory})">
			</div>
		</div>
		<br>
		<br><hr>
		
		<br><br>
		<a id="bookInfoPosition" href="#bookInfoPosition"></a>
		<div class="moving">
		<button type="button" onclick="pagePositionMove('bookInfoPosition')" style="border-bottom: none;">도서정보
        </button><button type="button" onclick="pagePositionMove('reviewPosition')">도서리뷰
        </button><button type="button" onclick="pagePositionMove('qnaPosition')">도서1:1문의
        </button><button type="button" onclick="pagePositionMove('noticePosition')">교환/환불</button>
		</div><br><br>
		
		<div style="display: flex;">
			<div style="width: 700px;">
				<br> <span style="font-size: 20px; font-weight: bold;">책
					소개</span><br>
				<br> <span><c:out value="${requestScope.book.bookIntro}"
						escapeXml="false" /> </span><br>
				<br>
				<br>
				<br>
				<br> <span style="font-size: 20px; font-weight: bold;">상세
					이미지</span><br>
				<br> <img
					src="${pageContext.servletContext.contextPath }/resources/images/book_img/${requestScope.book.bookDetailImg}"
					alt="" width="700px" height="auto"><br>
				<br>
				<br>
				<br>
				<br> <span style="font-size: 20px; font-weight: bold;">목차</span><br>
				<br> <span> <c:out
						value="${requestScope.book.bookContents}" escapeXml="false" />
				</span>
			</div>
			<div style="width: 300px;">
				<div style="width: 280px; border: solid 1px black; margin: 10px">
					<br>
					<span
						style="font-size: 20px; font-weight: bold; color: blue; margin-left: 10px">${categoryName}</span>분야
					신간 도서<br>
					<br>
					<hr>
					<br>
					<c:forEach items="${requestScope.newBookList}" var="list"
						varStatus="status">
						<div style="display: flex;">

							<div>
								<img
									src="${pageContext.servletContext.contextPath }/resources/images/book_img/${list.bookMainImg}"
									alt=""
									style="width: 100px; height: 150px; margin: 10px; cursor: pointer;"
									onclick="detailbook('${list.bookISBN}')">
							</div>
							<div>
								<br> <span style="font-weight: bold; cursor: pointer;"
									onclick="detailbook('${list.bookISBN}')"><c:out
										value="${list.bookTitle}" /></span><br>
								<br> <span><c:out value="${list.bookWriter}" /></span><br>
								<span style="color: red; font-weight: bold;"><fmt:formatNumber
										value="${list.bookPrice}"></fmt:formatNumber>원</span>
							</div>
						</div>

					</c:forEach>

				</div>
			</div>
		</div>
		<br>
		<br>
		<br>
		<hr>
		
		<br><br>
		<a id="reviewPosition" href="#reviewPosition"></a>
		<div class="moving">
        <button type="button" onclick="pagePositionMove('bookInfoPosition')">도서정보
        </button><button type="button" onclick="pagePositionMove('reviewPosition')"  style="border-bottom: none;">도서리뷰
        </button><button type="button" onclick="pagePositionMove('qnaPosition')">도서1:1문의
        </button><button type="button" onclick="pagePositionMove('noticePosition')">교환/환불</button>
    	</div>
		<br><br>
		
		<div>
		도서 구입 후 간단한 리뷰를 작성하시면 도서 정가의 2%(<fmt:formatNumber value="${price*0.02}"/>pt)를 추가 적립해 드립니다. <button type="button" class="btn btn-primary" onclick="reviewInsert()">리뷰작성</button>
		
		
		</div>
		<div id="reviewWrap"><br>
		<hr>
		<%-- <input type="hidden" name="reviewKind" id="reviewKind" value="${request.reviewKind}"> --%>
		<c:forEach items="${requestScope.reviewList}" var="list" varStatus="status">
		<div id="reviewInnerWrap">
		<div id="reviewHeader">
		<span style="font-weight: bold; font-size: 18px">${list.reviewTitle} </span><span>|</span> <span>${list.reviewWriter}</span> <span>|</span> <span><fmt:formatDate value="${list.reviewDate}" pattern="yyyy-MM-dd"/></span> <span>|</span>   
		<span><c:forEach begin="1" end="${list.bookRating/2}">
		<img src="${pageContext.servletContext.contextPath }/resources/img/fHeart.jpg" style="width: 15px" > 
		</c:forEach></span>
		
		</div><br>
		<div id="reviewBody">
		${list.reviewContent}
		</div><br>
		<div id="reviewFooter" style="display: flex;">
		<button type="button" style="margin-right: auto;" id="RInsertBtn_${status.index}" class="btn btn-secondary btn-sm" onclick="reviewReply(${status.index})">댓글 쓰기</button>
		<button type="button" style="margin-right: auto;  display: none;" id="RCloseBtn_${status.index}" class="btn btn-secondary btn-sm" onclick="reviewReplyClose(${status.index})">작성 취소</button>
		<p>asdasd
		<c:if test="${list.reviewStatus > 0}">
		댓글수 ${list.reviewStatus}개 ___ 댓글 보기
		</c:if></p>
		</div>
		<div id="reviewInnerContent_${status.index}">
		<input type="hidden" id="innerReviewNo_${status.index}" value="${list.reviewNo}">
		</div>
		<p style="margin-top: 30px"><hr></p>
		</div>
		
		</c:forEach>
		
		<div id="footPageNumber">
		<c:if test="${requestScope.reviewPaging.prePage==1}">이전</c:if>
		<c:forEach begin="${requestScope.reviewPaging.startPage}" end="${requestScope.reviewPaging.endPage}" varStatus="status">
		<c:choose>
		<c:when test="${status.current==requestScope.reviewPaging.nowPage}">
		${status.current}
		</c:when>
		<c:otherwise>
		<span style="cursor: pointer; color: gray;" onclick="movePage(1,${status.current})">${status.current}</span>
	
		</c:otherwise>
		</c:choose>
		</c:forEach>
		<c:if test="${requestScope.reviewPaging.nextPage==1}">다음</c:if>
		</div>
		
		</div>
		<form action="selectBook.book" method="post" id="detailBookForm">
			<input type="hidden" name="bookISBN" id="inputISBN">
		
		</form>
		<form action="selectBook.book" method="post" id="detailBookPageForm">
		<input type="hidden" name="bookISBN" id="temp00" value="${requestScope.book.bookISBN}">
		<input type="hidden" name="reviewNowPage" id="reviewNowPage" value="${requestScope.reviewNowPage}">
		<input type="hidden" name="reviewKind" id="reviewKind" value="${requestScope.reviewKind}">
		<input type="hidden" name="questionNowPage" id="questionNowPage" value="${requestScope.questionNowPage}">
		<input type="hidden" name="pagePosition" id="pagePosition" value="0">
		
		</form>
		
		<form action="shoppingCart.sc" method="post" id="moveCartForm">
		
		<input type="hidden" value="${sessionScope.loginUser.userId}" name="user_Id">

	</form>
	
	<div class="modal fade" id="reviewModal">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
        <!-- Modal Header -->
        <div class="modal-header">
            <h4 class="modal-title">도서 리뷰<span style="font-size: 15px;">(리뷰 작성시 <fmt:formatNumber value="${price*0.02}"/>pt를 추가 지급해 드립니다)</span></h4><br>
            <button type="button" class="close" data-dismiss="modal">&times;</button> 
        </div>

            <!-- Modal Body -->
            <div class="modal-body" >
               
                <div>
                    <span style="font-weight: bold;">도서평점</span> - 책에 대한 점수를 표시해 주세요<br>
                    <br>
                    <img src="${pageContext.servletContext.contextPath }/resources/img/eHeart.jpg" alt="" id="scoreImg_1" onclick="reviewScore(1)" > 
                    <img src="${pageContext.servletContext.contextPath }/resources/img/eHeart.jpg"  id="scoreImg_2" alt="" onclick="reviewScore(2)" > 
                    <img src="${pageContext.servletContext.contextPath }/resources/img/eHeart.jpg"  id="scoreImg_3" alt="" onclick="reviewScore(3)" >
                    <img src="${pageContext.servletContext.contextPath }/resources/img/eHeart.jpg" alt=""  id="scoreImg_4" onclick="reviewScore(4)" > 
                    <img src="${pageContext.servletContext.contextPath }/resources/img/eHeart.jpg"  id="scoreImg_5" alt="" onclick="reviewScore(5)" >

                </div>

                <hr>

                <div>
                    <form action="insertReview.re" method="post" id="insertReviewForm">
                        <input type="hidden" name="reviewWriter" id="reviewWriter" value="${sessionScope.loginUser.userId})">
                        <input type="hidden" name="bookISBN" id="reviewBookISBN" value="${requestScope.book.bookISBN}">
                        <input type="hidden" name="bookRating" id="bookRating" value="0">
                    <span style="font-weight: bold;">도서리뷰</span> - 책에 대하여 사람들에게 말해주세요<br>
                    <br>
                    리뷰 제목 : <input type="text" name="reviewTitle" id="reviewTitle" style="width: 760px;"><br>
                    리뷰 내용 :<br>
                    <textarea name="reviewContent" id="reviewContent" cols="100" rows="10" maxlength="1000" placeholder="공백 포함 1000자 이내로 입력해 주세요&#13;&#10;댓글이 달린 후 수정과 삭제는 불가능 합니다.&#13;&#10;성의없는 포인트 수집용 리뷰는 불이익을 받으실 수 있습니다."></textarea>
                    </form>
                </div>
            </div>
            

            <!-- Modal footer -->
            <div class="modal-footer" >
                <button type="button" class="btn btn-primary mr-auto" onclick="insertReview()">리뷰 등록</button>
                
                <button type="button" class="btn btn-danger" id="closeModal"data-dismiss="modal">취소</button>
            </div>
        
        </div>
    </div>
</div>

<div style="display: none; align-items: center;margin-top: 20px" id="reviewReplyInsertDiv"> 
  	<img src="${pageContext.servletContext.contextPath }/resources/img/replyArrow.png">
    <textarea rows="4" cols="80" style="resize: none;" maxlength="150" placeholder="150자 이내로 입력해 주세요&#13;&#10;댓글이 달린 후 수정과 삭제는 불가능 합니다.&#13;&#10;서로간의 예의를 지켜주십시오."></textarea><button style="height: 100px; width: 250px;" onclick="reviewReplyInsert(0)" id="reviewReplyInsertBtn">등록</button>
    </div>
    <br><br><hr>
    
    <br><br>
		<a id="qnaPosition" href="#qnaPosition"></a>
		<div class="moving">
		<button type="button" onclick="pagePositionMove('bookInfoPosition')">도서정보
        </button><button type="button" onclick="pagePositionMove('reviewPosition')">도서리뷰
        </button><button type="button" onclick="pagePositionMove('qnaPosition')" style="border-bottom: none;">도서1:1문의
        </button><button type="button" onclick="pagePositionMove('noticePosition')">교환/환불</button>
		</div><br><br>
    
    <br><br><br><br><br><br><hr>
    
    <br><br>
		<a id="noticePosition" href="#noticePosition"></a>
		<div class="moving">
		<button type="button" onclick="pagePositionMove('bookInfoPosition')">도서정보
        </button><button type="button" onclick="pagePositionMove('reviewPosition')">도서리뷰
        </button><button type="button" onclick="pagePositionMove('qnaPosition')">도서1:1문의
        </button><button type="button" onclick="pagePositionMove('noticePosition')" style="border-bottom: none;">교환/환불</button>
		</div><br><br>
    
    
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	</main>
	
</html>