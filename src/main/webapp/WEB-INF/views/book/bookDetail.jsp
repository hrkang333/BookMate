<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>

        function modiQuntity(num) {
            var quntity = parseInt($('#orderQuntity').val());
            if(num==1){
                $('#orderQuntity').val(quntity+1)
            }else if(quntity>1){
                $('#orderQuntity').val(quntity-1)
            }
        }

    </script>
</head>
<body style="width: 1000px; margin: 0 auto;"> 
    

        <div style="display: flex;">
        
        <div style="width: 400px;">
            <img src="${pageContext.servletContext.contextPath }/resources/images/book_img/${requestScope.book.bookMainImg}" alt="" style="width: 300px; height: auto;">
        </div>
        <div><br><c:set var="price" value="${requestScope.book.bookPrice}"/>
            <span style="font-size: 30px; font-weight: bold;"><c:out value="${requestScope.book.bookTitle}"/></span><br><br><br>
            <span>ISBN : <c:out value="${requestScope.book.bookISBN}"/></span><br><br>
            <span><c:out value="${requestScope.book.bookWriter}"/> 지음 | 역자 <c:out value="${requestScope.book.bookTranslator}"/>  | <c:out value="${requestScope.book.bookPublisher}"/> 출판 | <fmt:formatDate value="${requestScope.book.bookPublicheDate}" pattern="yyyy년 MM월 dd일"/> 출간</span><br><br>
            <span>평점 : <c:out value="${requestScope.book.bookRating}"/>/10 (<c:out value="${requestScope.book.bookRatingCount}"/>명 참여) | 리뷰 <c:out value="${requestScope.book.bookReviewCount}"/>개</span><br><br>
            <span>국내 베스트 xx위 | 소설 베스트 xx위</span><br><br>
            <hr><br><br>
            <span>정가 : <fmt:formatNumber type="number" value="${price}"/> 원</span><br><br>
            <span>판매가 : <a style="font-size: 25px; color:crimson"><fmt:formatNumber type="number" value="${price*0.9}" /></a>원 [10%↓ <fmt:formatNumber type="number" value="${price*0.1}"/>원 할인]</span><br><br>
            <span>배송비 : 0 원</span>&nbsp;&nbsp;&nbsp;<button id="" >배송비 안내</button><br><br>
            <span>혜택 : [기본혜택] <fmt:formatNumber type="number" value="${price*0.05}"/> pt(5% 기본적립)<br>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[리뷰작성] <fmt:formatNumber type="number" value="${price*0.02}"/> pt(2% 추가적립)</span><br><br>
            

        </div>
        
        </div>
        <hr><br><br>
        <div style="display: flex;">
            
        <div style="width: 400px; ">
        <form action="">
           주문수량 : <input type="text" style="width: 30px; text-align: right;" value="1" id="orderQuntity">권   <button type="button" onclick="modiQuntity(1)">+</button><button type="button" onclick="modiQuntity(0)">-</button>

        </form>
        
        </div>
            <div>
                <button>장바구니</button> <button>바로주문</button>

            </div>
        </div><br><br>
        <hr>
        <br>
        xxx 분야 주간 베스트 도서
        <br><br>
        <div style="height: 300px; background-color: darkgrey;"></div>
        <br><br>
        <hr>
        <br>
        <div style="display: flex;">
        <div style="width: 700px;"><br>
            <span style="font-size: 20px; font-weight: bold;">책 소개</span><br><br>
            <span><c:out value="${requestScope.book.bookIntro}" escapeXml="false"/>
            </span><br><br><br><br><br>
            <span style="font-size: 20px; font-weight: bold;">상세 이미지</span><br><br>
            <img src="${pageContext.servletContext.contextPath }/resources/images/book_img/${requestScope.book.bookDetailImg}" alt="" width="700px" height="auto"><br><br><br><br><br>
            <span style="font-size: 20px; font-weight: bold;">목차</span><br><br>
            <span>
                <c:out value="${requestScope.book.bookContents}" escapeXml="false"/>
            </span>    
        </div>
        <div style="width: 300px; border-left: solid 1px black;">
        <br><span style="font-weight: bold; margin-left: 15px;">xxx 분야 신간 도서</span><br><br>
        <div style="display: flex;">
            <div><img src="http://image.kyobobook.co.kr/images/book/large/504/l9791160406504.jpg" alt="" style="width: 100px; height: 150px;"></div>
            <div><br>
                <span style="font-weight: bold;">방금 떠나온 세계</span><br><br>
                <span>김초엽</span><br>
                <span style="color: red; font-weight: bold;">13500원</span></div>
        </div>

        
        </div>
        
        </div>
        <br><br><br>
        <hr>
        <br><br>
        asf
        </main>
        
        
</html>