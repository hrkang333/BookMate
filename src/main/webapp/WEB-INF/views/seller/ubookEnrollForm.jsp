<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 등록</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
function imgCheck(img,inputId) {
	
	if(img.files&&img.files[0]){
		var name= img.files[0].name
		var ext = name.substring(name.length-3,name.length)
		if(!(ext.toUpperCase()=='PNG'||ext.toUpperCase()=='JPG')){
			alert("이미지파일을 확인해주세요. png와 jpg만 가능합니다.")
			$('#'+inputId).val("")


			return;
		}
		const imgFile = new FileReader();
		imgFile.readAsDataURL(img.files[0])
		imgFile.onload = function(e) {
			const previewUbookImage = document.getElementById("pre"+inputId);
			previewUbookImage.src = e.target.result
			if(inputId=='ubookImg'){
				$('#pre'+inputId).css({"width":"200px","height":"300px"})
			}			
		}		   
	}
}

function submitCheck(){
	var bookName = $("input[name='ubookName']").val();
	var ubookWriter = $("input[name='ubookWriter']").val();
	var ubookIsbn = $("input[name='ubookIsbn']").val();
	var ubCategory = $("select[name='ubCategory']").val();
	var ubookTrans = $("input[name='ubookTrans']").val();
	var ubookPub = $("input[name='ubookPub']").val();
	var ubookPubDate = $("input[name='ubookPubDate']").val();
	var ubookOPrice = $("input[name='ubookOPrice']").val();
	var ubookPrice = $("input[name='ubookPrice']").val();
	var ubookStock = $("input[name='ubookStock']").val();
	var ubookQual = $("select[name='ubookQual']").val();
	var ubookDetail = $("input[name='ubookDetail']").val();
	var ubookContent = $("input[name='ubookContent']").val();
	
	var reg = /^[0-9]+/g;
	
	if(bookName == ''){
		alert('도서명을 입력해주세요');
		bookName.focus();
		return false;
	}
	if(ubookWriter == ''){
		alert('저자를 입력해주세요');
		ubookWriter.focus();
		return false;
	}
	if(ubookIsbn == ''){
		alert('ISBN을 입력해주세요');
		ubookIsbn.focus();
		return false;
	}
	if(!reg.test(ubookIsbn)){
		alert('ISBN은 숫자만 입력해주세요');
		ubookIsbn.val('');
		ubookIsbn.focus();
		return false;
	}
	if(ubCategory == ''){
		alert('도서 카테고리를 선택해주세요');
		ubCategory.focus();
		return false;
	}
	if(ubookTrans == ''){
		alert('역자를 입력해주세요. 역자가 없으면 없음 으로 적어주세요.');
		ubookTrans.focus();
		return false;
	}
	if(ubookPub == ''){
		alert('출판사를 입력해주세요');
		ubookPub.focus();
		return false;
	}	
	if(ubookPubDate == ''){
		alert('출판일을 입력해주세요');
		ubookPubDate.focus();
		return false;
	}
	if(ubookOPrice == ''){
		alert('도서정가를 입력해주세요');
		ubookOPrice.focus();
		return false;
	}
	if(ubookPrice == ''){
		alert('도서 판매가를 입력해주세요');
		ubookPrice.focus();
		return false;
	}
	if(ubookStock == ''){
		alert('도서 재고를 입력해주세요');
		ubookStock.focus();
		return false;
	}
	if(!reg.test(ubookOPrice)){
		alert('정가는 숫자만 입력해주세요');
		ubookOPrice.val('');
		ubookOPrice.focus();
		return false;
	}
	if(!reg.test(ubookPrice)){
		alert('판매가는 숫자만 입력해주세요');
		ubookPrice.val('');
		ubookPrice.focus();
		return false;
	}
	if(!reg.test(ubookStock)){
		alert('재고는 숫자만 입력해주세요');
		ubookStock.val('');
		ubookStock.focus();
		return false;
	}
	if(ubookQual == ''){
		alert('도서 상태가 선택되지 않았습니다. 선택해주세요');
		ubookQual.focus();
		return false;
	}
	if(ubookDetail == ''){
		alert('도서 내용 및 줄거리를 입력해주세요');
		ubookDetail.focus();
		return false;
	}
	if(ubookContent == ''){
		alert('도서 목차를 입력해주세요');
		ubookContent.focus();
		return false;
	}
	
	/*
	var check = true;
	$('#ubookEnroll').find('input[type!=button]').each(function(){
	    if(!$(this).val()) {
	        alert($(this).data("name") +" 1항목을 작성하지 않으셨습니다.")
	        $(this).focus();
	        check = false;
	        return false;
	    }
	 });
	if(!check){
        return false;
	}
	if($('#ubCategory:selected').val() == ''){
    	alert($('#ubCategory').data("name") +"2도서 카테고리를 선택해주세요")
    	$('#ubCategory:selected').val('');
    	$('#ubCategory').focus();
        return;
    }
	if(!$('#ubookDetail').val()){
		alert($('#ubookDetail').data("name") +"3항목을 작성하지 않으셨습니다.")
    	$('#ubookDetail').val('');
    	$('#ubookDetail').focus();
        return;
	}
	if(!$('#ubookContent').val()){
		alert($('#ubookContent').data("name") +" 4항목을 작성하지 않으셨습니다.")
    	$('#ubookContent').focus();
        return;
	}	*/
	
	if(confirm("모든 정보가 올바르게 입력되었는지 확인해주세요. 도서를 등록하시겠습니까?")){
		alert("도서 등록 성공!");
		$('#ubookEnroll').submit();
	}
	
}

function checkText(obj) {
	var checkText = $('#'+obj).val();
	var tempText = "";
	var limitByte = 3600;
	var checkByte = 0;
	
	for(var i = 0 ; i < checkText.length ; i++){
		var charOne = checkText.charAt(i);
		if(escape(charOne).length > 4){
			checkByte += 3;
			console.log(checkByte)
		}else{
			checkByte += 1;
			console.log(checkByte)
		}
		if(checkByte < limitByte){
		tempText += charOne;
		}else{
			alert("한글 1200자(공백포함), 영어 3600자(공백포함) 으로 입력 해주세요");
			$('#'+obj).val(tempText);
			return false;
		}
	}
}
</script>
</head>
<body>
	<!-- 도서 등록 -->
	<div class="tabContent3">
		<div class="container2" id="sell_book">
			<div class="row2">
				<h2>도서 등록</h2>
				<form action="ubookEnroll.ub" method="post" id="ubookEnroll" enctype="multipart/form-data" >
					<table class="table table-bordered success">
						<colgroup>
							<col width="100px" />
							<col width="400px" />
						</colgroup>
						<thead>
							<tr>
								<th class="info">판매자 번호</th>
								<td><input class="usedBookInfo" name="bSellerNo"
									value="${ s.sellerNo }" readonly="readonly"></td>
							</tr>
							<tr>
								<th class="info">도서명</th>
								<td><input class="usedBookInfo" name="ubookName" required="required"
									placeholder="도서명을 입력해주세요" data-name = "도서명"></td>
							</tr>
							<tr>
								<th class="info">저자(지은이)</th>
								<td><input class="usedBookInfo" name="ubookWriter" required="required"
									placeholder="저자를 입력해주세요" data-name = "도서 지은이"></td>
							</tr>
							<tr>
								<th class="info">ISBN-13</th>
								<td><input class="usedBookInfo" name="ubookIsbn" required="required"
									placeholder="도서의 ISBN을 입력해주세요(- 없이)" data-name = "도서 ISBN"></td>
							</tr>
							<tr>
								<th class="info">카테고리</th>
								<td><select id="ubCategory" name="ubCategory" required="required"
									class="form-control" data-name = "도서 카테고리">
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
								<td><input class="usedBookInfo" name="ubookTrans" required="required"
									placeholder="역자를 입력해주세요" value="없음" data-name = "도서 역자"></td>
							</tr>
							<tr>
								<th class="info">출판사</th>
								<td><input class="usedBookInfo" name="ubookPub" required="required"
									placeholder="출판사를 입력해주세요" data-name = "도서 출판사"></td>
							</tr>
							<tr>
								<th class="info">출판일</th>
								<td><input class="usedBookInfo" name="ubookPubDate" required="required"
									placeholder="출판일을 입력해주세요" data-name = "도서 출판일"></td>
							</tr>
							<tr>
								<th valign="top" class="info">정가</th>
								<td><input class="usedBookInfo" name="ubookOPrice" required="required"
									placeholder="정가를 입력해주세요" data-name = "도서 정가"></td>
							</tr>
							<tr>
								<th class="info">판매가</th>
								<td><input class="usedBookInfo" name="ubookPrice" required="required"
									placeholder="판매가를 입력해주세요" data-name = "도서 판매가"></td>
							</tr>
							<tr>
								<th class="info">재고수량</th>
								<td><input class="usedBookInfo" name="ubookStock" required="required"
									placeholder="재고수량을 입력해주세요" data-name = "재고 수량"></td>
							</tr>

							<tr>
								<th class="info">도서 품질<br> 기준표</th>
								<td>
									S : 최상. 낙서/얼룩/접힙/찢김/변색/제본불량 해당 없음<br> 
									A : 상. 낙서/얼룩/접힙/찢김/변색/제본불량 일부 있음<br>
									B : 보통. 낙서/얼룩/접힙/찢김/변색/제본불량 2가지 이상 있음<br>
									C : 하. 낙서/얼룩/접힙/찢김/변색/제본불량 3가지 이상 있음<br>
									D : 최하. 낙서/얼룩/접힙/찢김/변색/제본불량 다수 있음<br>
								
								</td>
							</tr>
							<tr>
								<th class="info">도서 품질</th>
								<td><select id="bookQual" name="ubookQual" required="required"
									class="form-control" data-name = "도서 품질">
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
								<td><textarea name="ubookDetail" id="ubookDetail" cols="54" required="required"
										rows="10" placeholder="도서의 줄거리, 도서 품질 상세 정보 등을 입력해주세요" data-name = "도서 상세"></textarea>
								</td>
							</tr>
							<tr>
								<th class="info">도서 목차</th>
								<td><textarea name="ubookContent" id="ubookContent" cols="54" required="required"
										rows="10" placeholder="도서의 목차를 입력해주세요" data-name = "도서 목차"></textarea>
								</td>
							</tr>
							<tr>
								<th class="info">도서 이미지</th>
								<td><input name="UbookImgFile" type="file" id="ubookImg"
									onchange="imgCheck(this,'ubookImg')"
									class="text-center center-block file-upload" data-name = "도서 이미지"></td>
							</tr>
							<tr>
									<th class="info">도서 이미지 미리보기</th>
								<td>
									<img alt="" src="" id="preubookImg" >
								</td>
							</tr>
						</thead>
					</table>
					<center>
						<input type="submit" id="approve_btn" class="btn btn-info"
							name="approve_btn" onclick="submitCheck()" value="등록하기"> 
							
							<input type="button"
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