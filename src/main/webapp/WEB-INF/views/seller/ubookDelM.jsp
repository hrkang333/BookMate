<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배송관리</title>
</head>
<body>
	<!-- 배송관리 -->
	<div class="tabContent2">
		<div class="container">
			<h2>배송관리</h2>
			<div class="table-wrapper2">
				<table class="table table-bordered tbtxtAlign">
					<colgroup>
						<col width="15%" />
						<col width="12%" />
						<col width="20%" />
						<col width="15%" />
						<col width="15%" />
						<col width="15%" />
						<col width="17%" />
					</colgroup>
					<thead>
						<tr>
							<th>주문번호</th>
							<th>주문자</th>
							<th style="text-align: center;">상품명</th>
							<th>주문수량</th>
							<th>주문금액</th>
							<th>주문상태</th>
							<th>수정/삭제</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>12313</td>
							<td>김유미</td>
							<td>워드프로세서 실기</td>
							<td>1</td>
							<td>9000</td>
							<td><select class="form-control select_v" id="test"
								name="test" onchange="">
									<option value="0"
										${test=='0'
                                                                            ? 'selected="selected"' : '' }>해지
									</option>
									<option value="1"
										${test=='1'
                                                                            ? 'selected="selected"' : '' }>진행
									</option>
									<option value="2"
										${test=='2'
                                                                            ? 'selected="selected"' : '' }>완료
									</option>
							</select></td>
							<td><a class="add" title="Add" data-toggle="tooltip"><i
									class="material-icons"></i></a> <a class="edit" title="Edit"
								data-toggle="tooltip"><i class="material-icons"></i></a> <a
								class="delete" title="Delete" data-toggle="tooltip"><i
									class="material-icons"></i></a></td>
						</tr>
						<tr>
							<td>12313</td>
							<td>김유미</td>
							<td>워드프로세서 실기</td>
							<td>1</td>
							<td>15000</td>
							<td>
								<form>
									<select class="form-control select_v" id="test" name="test"
										onchange="">
										<option value="0"
											${test=='0'
                                                                                ? 'selected="selected"' : '' }>해지
										</option>
										<option value="1"
											${test=='1'
                                                                                ? 'selected="selected"' : '' }>진행
										</option>
										<option value="2"
											${test=='2'
                                                                                ? 'selected="selected"' : '' }>완료
										</option>
									</select>
								</form>
							</td>
							<td><a class="add" title="Add" data-toggle="tooltip"><i
									class="material-icons"></i></a> <a class="edit" title="Edit"
								data-toggle="tooltip"><i class="material-icons"></i></a> <a
								class="delete" title="Delete" data-toggle="tooltip"><i
									class="material-icons"></i></a></td>
						</tr>
						<tr>
							<td>12313</td>
							<td>김유미</td>
							<td>워드프로세서 실기</td>
							<td>1</td>
							<td>9000</td>
							<td>
								<form>
									<select class="form-control select_v" id="test" name="test"
										onchange="">
										<option value="0"
											${test=='0'
                                                                                ? 'selected="selected"' : '' }>해지
										</option>
										<option value="1"
											${test=='1'
                                                                                ? 'selected="selected"' : '' }>진행
										</option>
										<option value="2"
											${test=='2'
                                                                                ? 'selected="selected"' : '' }>완료
										</option>
									</select>
								</form>
							</td>
							<td><a class="add" title="Add" data-toggle="tooltip"><i
									class="material-icons"></i></a> <a class="edit" title="Edit"
								data-toggle="tooltip"><i class="material-icons"></i></a> <a
								class="delete" title="Delete" data-toggle="tooltip"><i
									class="material-icons"></i></a></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>