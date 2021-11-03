<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width,initial-scale=1" charset="UTF-8">
<title>Insert title here</title>
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
			const previewMainImage = document.getElementById("pre"+inputId);
			previewMainImage.src = e.target.result
			if(inputId=='bookMainImg'){
				$('#pre'+inputId).css({"width":"200px","height":"300px"})
			}			
		}		   
	}
}

function submitCheck(){
	
	var check = true;
	$('#bookEnroll').find('input[type!=button]').each(function(){
	    if(!$(this).val()) {
	        alert($(this).data("name") +" 항목을 작성하지 않으셨습니다.")
	        $(this).focus();
	        check = false;
	        return false;
	    }
	 });
	if(!check){
		return;
	}
	if(!$('#bookCategory:checked').val()){
    	alert($('#bookCategory').data("name") +" 항목을 작성하지 않으셨습니다.")
    	$('#bookCategory').focus();
    	return;
    }
	if(!$('#bookSubCategory:checked').val()){
    	alert($('#bookSubCategory').data("name") +" 항목을 작성하지 않으셨습니다.")
    	$('#bookSubCategory').focus();
    	return;
    }
	if(!$('#bookContents').val()){
		alert($('#bookContents').data("name") +" 항목을 작성하지 않으셨습니다.")
    	$('#bookContents').focus();
    	return;
	}
	if(!$('#bookIntro').val()){
		alert($('#bookIntro').data("name") +" 항목을 작성하지 않으셨습니다.")
    	$('#bookIntro').focus();
    	return;
	}
	
	
	if(confirm("도서 부제목과 역자를 다시 한번 확인해주세요. 도서를 입고 하시겠습니까?")){
		
		$('#bookEnroll').submit();
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
<body style="width: 1200px; margin: 0 auto;">
  

<br><br><br>
<form action="bookEnroll.book" id="bookEnroll" class="bookEnroll" method="post" enctype="multipart/form-data">
도서 ISBN : <input type="text" name="bookISBN" data-name = "도서 ISBN" ><br><br>
도서 메인이미지(png와 jpg만 가능) : <input type="file" name="bookMainImgFile" id="bookMainImg" onchange="imgCheck(this,'bookMainImg')" data-name = "도서 메인이미지"><br>
메인이미지 미리보기 :<br>
<img alt="" src="" id="prebookMainImg" ><br><br>
도서 제목 : <input type="text" name="bookTitle" data-name = "도서 제목"><br><br>
도서 부제목 : <input type="text" name="bookSubTitle" value="없음" ><br><br>
도서 저자 : <input type="text" name="bookWriter" data-name = "도서 저자"><br><br>
도서 역자 : <input type="text" name="bookTranslator" value="없음"><br><br>
도서 메인 카테고리 : <input type="radio" id="bookCategory"  name="bookCategory" value="0" data-name = "도서 메인 카테고리"> 국내도서 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
<!-- <input type="radio" name="bookCategory" id="bookCategory"  value="1"> 외국도서 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  -->
<input type="radio" name="bookCategory" id="bookCategory" value="2"> ebook <br><br>
도서 서브 카테고리 : <br>
<c:set var="array">소설/시/에세이, 경제/경영, 과학, 인문, 컴퓨터/IT, 자기계발, 정치/사회, 역사/문화, 취미, 가정/육아 </c:set>
<c:forEach items="${array}" var="list" varStatus="status">
<input type="radio" name="bookSubCategory" value="${status.index}" data-name = "도서 서브 카테고리" id="bookSubCategory"> <c:out value="${list}"/> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<c:if test="${status.index==4}"><br></c:if>
</c:forEach><br><br>
도서 출판사 : <input type="text" name="bookPublisher" data-name = "도서 출판사"><br><br>
도서 출간일 : <input type="date" name="publicheDate" data-name = "도서 출간일"><br><br>
도서 정가 : <input type="number" name="bookPrice" data-name = "도서 정가"><br><br>
도서 목차 : <br>
<textarea rows="30" cols="100" name="bookContents" id="bookContents" placeholder="한글 1200자(공백포함), 영어 3600자(공백포함) 내로 작성해 주세요" onkeyup="checkText('bookContents')" data-name = "도서 목차"></textarea><br><br>
도서 소개 : <br>
<textarea rows="30" cols="100" name="bookIntro" id="bookIntro"  placeholder="한글 1200자(공백포함), 영어 3600자(공백포함) 내로 작성해 주세요" onkeyup="checkText('bookIntro')" data-name = "도서 소개"></textarea><br><br>
도서 상세소개이미지(png와 jpg만 가능) : <input type="file" name="bookDetailImgFile" onchange="imgCheck(this,'bookDetailImg')" id="bookDetailImg" data-name = "도서 입고수"><br><br>
도서 입고 수 : <input type="number" name="bookStock"><br><br>
<input type="button" onclick="submitCheck()" value="도서 입고"> 
<br><br>
<hr><br>
도서 평점 : <input type="number" name="bookRating" data-name = "도서 평점"><br><br>
도서 평점준 인원수 : <input type="number" name="bookRatingCount" data-name = "도서 평점 준 인원 수"><br><br>
<hr><br>
상세소개 이미지 미리보기<br>
<img alt="" src="" id="prebookDetailImg">


</form>
<br><br><br><br><br><br><br><br>
<form>
<table>

<tr><td><input type="hidden"></td></tr>
</table>
</form>
</body>
</html>