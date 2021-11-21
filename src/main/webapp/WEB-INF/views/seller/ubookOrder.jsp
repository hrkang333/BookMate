<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문현황</title>
</head>
<body>
	<!-- 주문현황 -->
	<div class="tabContent2 active">
		<div class="container">
			<h2>주문현황</h2>
			<div class="table-wrapper2" style="margin-left: 10px !important; width: 800px;">
				<table class="table table-bordered tbtxtAlign" id="orderBookList">
					
					<thead>
						<tr>
							<th style="width:70px; text-align: center;">No</th>
							<th style="width:150px; text-align: center;">도서</th>
							<th style="width:170px; text-align: center;">도서명</th>
							<th style="width:120px; text-align: center;">주문수량<br>&금액</th>
							<th style="width:150px; text-align: center;">주문상태</th>
							<th style="width:150px; text-align: center;">주문상태<br>수정하기</th>
						</tr>
					</thead>
					<tbody>
					
								<tr>
									<td colspan="6" style="text-align: center;">도서 주문현황 조회를 원하신다면 [주문현황] 탭을 클릭해주세요</td>
								</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript" src="resources/js/seller_page.js"></script>
<script type="text/javascript" src="resources/js/seller.js"></script>
</html>