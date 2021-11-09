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
<script>

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
					url : "index",
					
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
        
        function detailbook(bookISBN) {
			$('#inputISBN').val(bookISBN);
			$('#detailBookForm').submit();
		}
       
        function basketMove() {
        	var user_Id = "${sessionScope.loginUser.userId}";
        	var quantity = parseInt($('#orderQuantity').val())
        	if(user_Id == null||user_Id == ""){
        		alert("로그인이 필요한 기능입니다.")
        		return false;
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
					if(confirm("상품을 장바구니에 담았습니다. 장바구니로 이동하시겠습니까?")){
						alert("이동")
					}
					return false;
				}
        		
        		
        	})
        	
        	
			
		}

    </script>
</head>
<body style="width: 1000px; margin: 0 auto;">
	<jsp:include page="../common/menubar.jsp" />
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
		<br>
		<hr>
		<br>
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
										value="${list.bookPrice}"></fmt:formatNumber></span>
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
		<br>
		<br> asf
		<form action="selectBook.book" method="post" id="detailBookForm">
			<input type="hidden" name="bookISBN" id="inputISBN">
		</form>
	</main>
</html>