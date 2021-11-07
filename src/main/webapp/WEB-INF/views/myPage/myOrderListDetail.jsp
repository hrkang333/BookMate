<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


 <div id="main_content">
                <div id="head-of-main-content">
                    주문내역 조회
                </div>
                
                <hr style="text-align: center; width: 95%; margin: auto; color:black;">
                <ul id="state-of-order">
                    <li>결제완료</li>
                    <li>주문취소</li>
                    <li>상품준비중</li>
                    <li>배송준비중</li>
                    <li>배송중</li>
                    <li>배송완료</li>
                    <li>반품</li>
                </ul>
                <hr style="text-align: center; width: 95%; margin: auto; color:black;">
                <form action="my-order-list.mp" method="get" name="order-list-form" id="order-list-form">
                <div id="date-box">
                    <div class="btn-group btn-group-sm" id="date-button-box" role="group"
                        aria-label="Basic radio toggle button group">
                        <button type="button" id="btnWeek" class="btn btn-outline-secondary">1주일</button>
                        <button type="button" id="btnMonth" class="btn btn-outline-secondary">1개월</button>
                        <button type="button" id="btn3Month" class="btn btn-outline-secondary">3개월</button>
                    </div>
					<input type="hidden" id="tempBeginDate" name="tempBeginDate" value="${beginDate }"/>
					<input type="hidden" id="tempEndDate" name="tempEndDate" value="${endDate }"/>
                    <div id="date-input-box">
                        <input type="text" id="beginDate" class="form-control" name="beginDate"/>
                    </div>
                    <div id="date-input-box">
                        <input type="text" id="endDate" class="form-control" name="endDate"/>
                    </div>
                    <select class="form-select form-select-sm" id="state-select-box"
                        aria-label=".form-select-sm example" style="margin-right: 10px;" name="orderStatus">
                        <option value="전체" <c:if test="${orderStatus == '전체'}">selected</c:if>>전체</option>
                        <option value="주문확인" <c:if test="${orderStatus == '주문확인'}">selected</c:if>>결제완료</option>
                        <option value="주문취소" <c:if test="${orderStatus == '주문취소'}">selected</c:if>>주문취소</option>
                        <option value="상품준비중" <c:if test="${orderStatus == '상품준비중'}">selected</c:if>>상품준비중</option>
                        <option value="배송준비중" <c:if test="${orderStatus == '배송준비중'}">selected</c:if>>배송준비중</option>
                        <option value="배송중" <c:if test="${orderStatus == '배송중'}">selected</c:if>>배송중</option>
                        <option value="배송완료" <c:if test="${orderStatus == '배송완료'}">selected</c:if>>배송완료</option>
                        <option value="반품" <c:if test="${orderStatus == '반품'}">selected</c:if>>반품</option>
                    </select>
                    <button type="button" class="btn btn-dark btn-sm" style="width:50px" onclick="selectMyOrderList();">조회</button>
                    <script>
						function selectMyOrderList(){
							$("#order-list-form").submit();
						}
                        // 시작 일자 달력 이미지 클릭시 달력 표기 
                        $('#beginDate').datepicker({
                            showOn: "button",
                            buttonImage: "resources/mypage/images/calendar1.png",
                            buttonImageOnly: true,
                            buttonText: "Select date"
                        });
                        $('#beginDate').datepicker('option', 'dateFormat', 'yy-mm-dd'); // 기존 dd/mm/yy에서 yy-mm-dd로 format 변경    

                        // 종료 일자 달력 이미지 클릭시 달력 표기    
                        $('#endDate').datepicker({
                            showOn: "button",
                            buttonImage: "resources/mypage/images/calendar1.png",
                            buttonImageOnly: true,
                            buttonText: "Select date"
                        });
                        $('#endDate').datepicker('option', 'dateFormat', 'yy-mm-dd');
                        
                       	var tempBegin = $("#tempBeginDate").val();
                        var tempEnd = $("#tempEndDate").val();
                        
                        let d = new Date(tempEnd);
                        let year = d.getFullYear();
                        let month = d.getMonth() + 1; // 월은 0에서 시작하기 때문에 +1
                        let day = d.getDate();
                        
                        let startDate = new Date(tempBegin);
                        let startYear = startDate.getFullYear();
                        let startMonth = startDate.getMonth() + 1;
                        let startDay = startDate.getDate();
                        
                        let beginDate = d;
							
                        $("#beginDate").val(startYear + "-" + startMonth + "-" + startDay);
                        $('#endDate').val(year+"-"+month+"-" + day);
                        
                        // 버튼 클릭시 현재 날짜에서 1주일, 1개월, 3개월 더하기
                        $('#btnWeek').click(function () {
                            $('#endDate').val(year+"-"+month+"-" + day);
                            beginDate.setDate(beginDate.getDate() - 7);
                            $('#beginDate').val(beginDate.getFullYear() +  "-" + (beginDate.getMonth() + 1) + "-" + beginDate.getDate());
                            beginDate.setDate(beginDate.getDate() + 7); // 버튼 클릭 시 계속 더해지기 때문에 초기화
                        });

                        $('#btnMonth').click(function () {
                            $('#endDate').val(year+"-"+month+"-" + day);
                            beginDate.setMonth(beginDate.getMonth() - 1);
                            $('#beginDate').val(beginDate.getFullYear() +  "-" + (beginDate.getMonth() + 1) + "-" + beginDate.getDate());
                            beginDate.setMonth(beginDate.getMonth() + 1);
                        });

                        $('#btn3Month').click(function () {
                            $('#endDate').val(year+"-"+month+"-" + day);
                            beginDate.setMonth(beginDate.getMonth() - 3);
                            $('#beginDate').val(beginDate.getFullYear() +  "-" + (beginDate.getMonth() + 1) + "-" + beginDate.getDate());
                            beginDate.setMonth(beginDate.getMonth() + 3);
                        });
                    </script>
                </div>
                </form>
                <div id="order-list-box">
                    <table class="table table-hover" style="table-layout:fixed">
                        <thead class="table-light">
                            <tr>
                                <th scope="col" style="width: 10%;">주문번호</th>
                                <th scope="col">주문일자</th>
                                <th scope="col" id="book-title">상품이름</th>
                                <th scope="col">결제금액</th>
                                <th scope="col">주문상태</th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:if test="${ empty list }">
                        	  <td colspan="5" style="text-align:center; cursor: default" onclick="event.cancelBubble=true">해당하는 주문내역이 없습니다.</td>
                        </c:if>
                        <c:forEach var="order" items="${list }">
                            <tr>
                                <th scope="row" class="ono">${order.orderNo }</th>
                                <td>${order.orderDate }</td>
                                <td id="book-title">${order.bkTitle }</td>
                                <td>${order.orderPriceComma }</td>
                                <td>${order.orderStatus }</td>
                            </tr>
                       </c:forEach>  
                        </tbody>
                    </table>
                    <script type="text/javascript">
            		$(function(){
            			$("#order-list-box>table>tbody>tr").click(function(){
            			location.href = "my-order-detail.mp?orderNo=" + $(this).children(".ono").text();
            		})
            		})
            	</script>
                </div>
                <c:choose>
                <c:when test="${ !empty list }">
                <div id="paging-wrap">
                    <ul class="pagination">
                	<c:choose>
                    	<c:when test="${ pi.currentPage eq 1 }">
                    		<li class="page-item disabled"><a class="page-link" href="#">Prev</a></li>
                    	</c:when>
                    	<c:otherwise>
                    		<li class="page-item"><a class="page-link" href="my-order-list.mp?currentPage=${ pi.currentPage - 1 }&&beginDate=${beginDate}&&endDate=${endDate}&&orderStatus=${orderStatus}">Previous</a></li>
                    	</c:otherwise>
                    </c:choose>
                    
                    <c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
                    	<li class="page-item"><a class="page-link" href="my-order-list.mp?currentPage=${ p }&&beginDate=${beginDate}&&endDate=${endDate}&&orderStatus=${orderStatus}">${p }</a></li>
                    </c:forEach>
                    
                    <c:choose>
                    	<c:when test="${pi.currentPage eq pi.maxPage}">
                    		<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
                    	</c:when>
                    	<c:otherwise>
                   			<li class="page-item"><a class="page-link" href="my-order-list.mp?currentPage=${ pi.currentPage + 1 }&&beginDate=${beginDate}&&endDate=${endDate}&&orderStatus=${orderStatus}">Next</a></li>
                		</c:otherwise>
                	</c:choose>
                	</ul>
                </div>
                </c:when>
                </c:choose>
            </div>

        </div>
</body>
</html>