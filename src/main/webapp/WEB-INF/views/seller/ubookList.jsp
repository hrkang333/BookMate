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
        <script>
            //선택한 독서모임 multiple 삭제하기
            function deleteUbook(ubookNo){
              var deleteUb = confirm("등록하신 도서를 삭제하시겠습니까?");
              console.log(ubookNo);
               if(deleteUb){
               	$.ajax({
                    type : "POST",
                    url : "ubookList.ub",
                    dataType : 'json',
                    data : {ubookNo : ubookNo},
                    success : function(data) {
						if(data > 0){
							alert("성공적으로 삭제되었습니다.");
							
							location.href=location.href;
						}else{
							console.log(data);
							alert("실패");
						}
						
                    },
                    error : function() {
                    	alert("통신실패");
                    }
                });
               }
                
            }      	
            //독서모임 수정하기
            function updateUbook(){
                $("#myUbookListForm").attr("action", "updateMyUbook.ub");
            }
       </script>
</head>
<body>
	<!-- 등록 도서 조회 -->
	<div class="tabContent3 active">
		<section class="content">
			<h2>등록 도서 조회</h2>
			<input hidden="hidden" value="${ s.sellerNo }" name="sellerNo">
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
						<form id="myUbookListForm" action="" method="post">
							<table class="table table-filter" id="ubookListTb">
								<thead>
                                <tr>
                                    <th style="width:60px; text-align: center;">도서 번호</th>
                                    <th style="text-align: center;">도서 표지</th>
                                    <th style="text-align: center;">도서명</th>
                                    <th style="text-align: center;">저자</th>
                                    <th style="width:70px; text-align: center;">도서 재고</th>
                                    <th style="width:120px; text-align: center;">수정/삭제</th>
                                </tr>
                            	</thead>
								<tbody>
								<tr>
									<td colspan="6" style="text-align: center;">도서 조회를 원하신다면 [등록 도서 조회] 탭을 클릭해주세요</td>
								</tr>
								</tbody>
							</table>
						</form>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
</body>
</html>