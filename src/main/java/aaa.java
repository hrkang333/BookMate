
public class aaa {

}
iv class="modal fade" id="qnaInsertModal">
<div class="modal-dialog modal-lg">
    <div class="modal-content">
    <!-- Modal Header -->
    <div class="modal-header">
        <h4 class="modal-title">도서 1:1 문의하기</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button> 
    </div>

        <!-- Modal Body -->
        <div class="modal-body" >
            <form action="bookQnaInsert.qa" method="post">
            <table id="qnaTable">
                <thead>
                    <tr>
                    <th colspan="2">상품명 : </th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        
                        <td class="tTd">문의 제목</td>
                        <td><input type="text" name="qnaTitle" id="qnaInsertTitle" style="width: 535px;" maxlength="30" placeholder="30자 내로 입력해주십시오.">
                        </td>
                    </tr>
                <tr>
                    
                    <td class="tTd">문의 유형</td>
                    <td><input type="radio" value="0" name="qnaCategory" id="qnaInsertRadio0" class="qnaCategory qnaInsertRadio">상품 <input type="radio" value="1" id="qnaInsertRadio3" name="qnaCategory" class="qnaCategory qnaInsertRadio">배송 
                        <input type="radio" value="2" name="qnaCategory" id="qnaInsertRadio1" class="qnaCategory qnaInsertRadio">교환 
                        <input type="radio" value="3" name="qnaCategory" id="qnaInsertRadio2" class="qnaCategory qnaInsertRadio">반품/환불 <input type="radio" value="4" id="qnaInsertRadio4" name="qnaCategory" class="qnaCategory qnaInsertRadio">기타
                    </td>
                </tr>
                <tr>
                    <td class="tTd">문의 내용</td>
                    <td><textarea name="qnaContent" id="qnaInsertContent" cols="70" rows="5" maxlength="200" 
                        style="resize: none;" placeholder="개인정보 유출에 주의하십시오 &#13;&#10;비방,광고,부적절한 글은 불이익이 따를 수 있습니다.&#13;&#10;200자 내로 입력해 주세요"></textarea></td>
                </tr>
            </tbody>
            <tfoot>
                <tr>
                    <td class="tTd">비밀 글로 문의하기</td>
                    <td><input type="checkbox" id="qnaInsertSecretCheck"> 비밀글로 설정 (질문자와 관리자만 볼 수 있습니다)</td>
                </tr>
            </tfoot>
            </table>
            </form>