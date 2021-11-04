<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 등록</title>
</head>
<body>
	<!-- 도서 등록 -->
	<div class="tabContent3">
		<div class="container2" id="sell_book">
			<div class="row2">
				<h2>도서 등록</h2>
				<form action="ubookEnroll.ub" method="post">
					<table class="table table-bordered success">
						<colgroup>
							<col width="100px" />
							<col width="400px" />
						</colgroup>
						<thead>
							<tr>
								<th class="info">판매자 번호</th>
								<td><input class="usedBookInfo" name="bSellerNo"
									value="${ sb.sellerNo }"></td>
							</tr>
							<tr>
								<th class="info">도서명</th>
								<td><input class="usedBookInfo" name="ubookName"
									placeholder="도서명을 입력해주세요"></td>
							</tr>
							<tr>
								<th class="info">저자(지은이)</th>
								<td><input class="usedBookInfo" name="ubookWriter"
									placeholder="저자를 입력해주세요"></td>
							</tr>
							<tr>
								<th class="info">ISBN</th>
								<td><input class="usedBookInfo" name="ubookIsbn"
									placeholder="도서의 ISBN을 입력해주세요(- 없이)"></td>
							</tr>
							<tr>
								<th class="info">카테고리</th>
								<td><select id="bookCate" name="ubCategory"
									class="form-control">
										<option value="" selected>== 카테고리 선택 ==</option>
										<option value="1">소설/시/에세이</option>
										<option value="2">경제/경영</option>
										<option value="3">과학</option>
										<option value="4">인문</option>
										<option value="5">컴퓨터/IT</option>
										<option value="6">자기계발</option>
										<option value="7">정치/사회</option>
										<option value="8">역사/문화</option>
										<option value="9">취미</option>
										<option value="10">가정/육아</option>
								</select></td>
							</tr>

							<tr>
								<th class="info">역자</th>
								<td><input class="usedBookInfo" name="ubookTrans"
									placeholder="역자를 입력해주세요"></td>
							</tr>
							<tr>
								<th class="info">출판사</th>
								<td><input class="usedBookInfo" name="ubookPub"
									placeholder="출판사를 입력해주세요"></td>
							</tr>
							<tr>
								<th class="info">출판일</th>
								<td><input class="usedBookInfo" name="ubookPubDate"
									placeholder="출판일을 입력해주세요"></td>
							</tr>
							<tr>
								<th valign="top" class="info">정가</th>
								<td><input class="usedBookInfo" name="ubookOPrice"
									placeholder="정가를 입력해주세요"></td>
							</tr>
							<tr>
								<th class="info">판매가</th>
								<td><input class="usedBookInfo" name="ubookPrice"
									placeholder="판매가를 입력해주세요"></td>
							</tr>
							<tr>
								<th class="info">재고수량</th>
								<td><input class="usedBookInfo" name="ubookStock"
									placeholder="재고수량을 입력해주세요"></td>
							</tr>

							<tr>
								<th class="info">도서 품질</th>
								<td><select id="bookQual" name="ubookQual"
									class="form-control">
										<option value="" selected>== 도서 품질 선택 ==</option>
										<option value="S">S</option>
										<option value="A">A</option>
										<option value="B">B</option>
										<option value="C">C</option>
										<option value="D">D</option>
								</select></td>
							</tr>

							<tr>
								<th class="info">도서 상세</th>
								<td><textarea name="ubookDetail" id="bookdetail" cols="54"
										rows="10" placeholder="도서의 줄거리, 도서 품질 상세 정보 등을 입력해주세요"></textarea>
								</td>
							</tr>
							<tr>
								<th class="info">도서 이미지</th>
								<td><input name="ubookImg" type="file"
									class="text-center center-block file-upload"></td>
							</tr>
						</thead>
					</table>
					<center>
						<input type="submit" id="approve_btn" class="btn btn-info"
							name="approve_btn" value="등록하기"> <input type="button"
							id="approve_btn" class="btn btn-warning" name="approve_btn"
							value="취소하기">
					</center>
				</form>
				<br>
				<br>
			</div>
		</div>
	</div>
</body>
</html>