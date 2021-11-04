<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매내역</title>
</head>
<body>
	<!-- 판매내역 -->
	<div class="tabContent2">
		<div class="container">
			<h2>판매내역</h2>
			<!-- 판매내역 검색 -->
			<div class="col-md-3 tab_search">
				<form action="#" method="get">
					<div class="input-group">
						<input class="form-control" id="system-search" name="q"
							placeholder="Search for" required> <span
							class="input-group-btn">
							<button type="submit" class="btn btn-default"
								style="height: 50px;">
								<i class="glyphicon glyphicon-search"></i>
							</button>
						</span>
					</div>
				</form>
			</div>
			<br> <br>
			<!-- 판매내역 table -->
			<div class="col-md-9 sellTb">
				<table class="table table-list-search tbtxtAlign">
					<colgroup>
						<col width="15%" />
						<col width="20%" />
						<col width="30%" />
						<col width="15%" />
						<col width="20%" />
					</colgroup>
					<thead>
						<tr>
							<th>주문번호</th>
							<th>주문자</th>
							<th>도서명</th>
							<th>수량</th>
							<th>진행상황</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>Sample</td>
							<td>Filter</td>
							<td>12-11-2011 11:11</td>
							<td>OK</td>
							<td>123</td>
						</tr>
						<tr>
							<td>Try</td>
							<td>It</td>
							<td>11-20-2013 08:56</td>
							<td>It</td>
							<td>Works</td>
						</tr>
						<tr>
							<td>§</td>
							<td>$</td>
							<td>%</td>
							<td>&</td>
							<td>/</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>