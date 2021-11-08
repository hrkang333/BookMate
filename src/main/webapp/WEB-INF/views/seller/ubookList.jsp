<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>등록 도서 조회</title>
</head>
<body>
	<!-- 등록 도서 조회 -->
	<div class="tabContent3 active">
		<section class="content">
			<h2>등록 도서 조회</h2>
			<div class="col-md-offset-2 qnaTable">
				<div class="panel panel-default">
					<div class="panel-body">
<!-- 						<div class="pull-right">
							<div class="btn-group">
								<button type="button" class="btn btn-success btn-filter"
									data-target="pagado">Pagado</button>
								<button type="button" class="btn btn-warning btn-filter"
									data-target="pendiente">Pendiente</button>
								<button type="button" class="btn btn-danger btn-filter"
									data-target="cancelado">Cancelado</button>
								<button type="button" class="btn btn-default btn-filter"
									data-target="all">Todos</button>
							</div> 
						</div>-->
						<div class="table-container">
							<table class="table table-filter">
								<colgroup>
									<col width="40px" />
									<col width="40px" />
									<col width="80px" />
									<col width="40px" />
									<col width="20px" />
								</colgroup>
								<thead>
                                <tr>
                                    <th>도서 번호</th>
                                    <th>도서 표지</th>
                                    <th>도서명</th>
                                    <th>저자</th>
                                    <th>도서 재고</th>
                                </tr>
                            </thead>
								<tbody>
									<c:forEach var="u" items="${ list }">
										<tr data-status="pagado">
											<td>
												<div class="ubookNo">${u.ubookNo }</div>
											</td>
											<td>
												<div class="ubookImg">
													<img src="${u.ubookImg }" class="media-photo">
												</div>
											</td>
											<td>
												<div class="tbNo">${u.ubookName }</div>
											</td>
											<td>
												<div class="tbNo">${u.ubookWriter }</div>
											</td>
											<td>
												<div class="tbNo">${u.ubookStock }</div>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
</body>
</html>