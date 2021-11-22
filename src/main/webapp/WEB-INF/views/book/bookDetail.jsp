<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> 
    
<style type="text/css">
#reviewHeader span, #reviewReplyHeader span{
margin-right: 30px;
}
.reviewInnerWrap{
margin-top: 30px; 
margin-bottom: 30px;
width: 800px;
}
.moving button{
    width: 200px;
    background-color: white;
    outline: none;
}
.reviewReplyInnerWrap{
margin-top: 30px;
margin-bottom: 30px;
width: 600px;
margin-left: 100px;
}
.tTd{
    background-color: burlywood;
    width: 25%;
    text-align: center;
    font-size: 18px;
    font-weight: bold;
}
#qnaTable{
    width: 766px;
    height: 300px;
    border: 1px solid;
}
#qnaTable td{
    border: 1px solid;
    padding: 10px;
}
#qnaTable th{
    font-size: 20px;
    font-weight: bold;
    padding: 10px;
}
.qnaCategory{
    margin: 10px;
}
#qnaViewTable th{
    background-color: rgba(166, 219, 240, 0.233);
}
</style>    
<script>
var listIndex = 0;
var updateQnaIndex = 0;
$(function() {
	var pagePosition = "${requestScope.pagePosition}"
	if(pagePosition==2){
		$('#reviewPosition').get(0).click();
	}else if(pagePosition==3){
		$('#qnaPosition').get(0).click();		
	}
})

    	
        function modiQuntity(num) {
        	var quantity = parseInt($('#orderQuantity').val());
            if(num==1){
                $('#orderQuantity').val(quantity+1)
            }else if(quantity>1){
                $('#orderQuantity').val(quantity-1)
            }
        }
        
        function bestListMove(checkIndex,bookSubCategory) {
			if(checkIndex == 1){
				listIndex += 1;
			}else{
				listIndex -= 1;
			}
			
			if(listIndex < 0){
				listIndex = 10;
			}else if(listIndex > 10){
				listIndex = 1;
			}
			$.ajax({
					url : "bestListMove",
					
					data : {
						listIndex : listIndex,
						bookSubCategory : bookSubCategory
					},
					type : "post",
					success : function(list) {
							$.each(list,function(i){
								$('#bestBookImg'+i).attr("src","${pageContext.servletContext.contextPath }/resources/images/book_img/"+list[i].bookMainImg);
								$('#bestBookImg'+i).attr("onclick","detailbook('"+list[i].bookISBN+"')");	
								$('#bestBookTitle'+i).text(list[i].bookTitle);	
								$('#bestBookTitle'+i).attr("onclick","detailbook('"+list[i].bookISBN+"')");
								$('#bestBookPrice'+i).text(list[i].bookPrice.toLocaleString('ko-KR')+"원");
							})
					},
					error : function (request, status, error){
			               
					    var errorMsg = "요청 도중 오류가 발생하였습니다. \n";
					   
					    if(request.status == 0){ //offline
					        errorMsg += "네트워크 연결을 확인해주십시오.";
					    }else if(request.status==401){//Unauthorized
					        errorMsg += "권한이 없습니다. \n관리자에게 문의해주세요.";
					    }else if(request.status==403){//Forbidden
					        errorMsg += "접근이 거부되었습니다. \n관리자에게 문의해주세요.";
					    }else if(request.status==404){//Not Found
					        errorMsg += "요청한 페이지를 찾을 수 없습니다. \n관리자에게 문의해주세요.";
					    }else if(request.status==500){ //Internel Server Error
					        errorMsg += "서버 내 오류가 발생하였습니다. \n관리자에게 문의해주세요.";
					    }else if(status=='parsererror'){ //Error.nParsing JSON Request failed.
					        errorMsg += "응답 본문을 정상적으로 가져올 수 없습니다. \n관리자에게 문의해주세요.";
					    }else if(status=='timeout'){ //Request Time out.
					        errorMsg += "응답 제한 시간을 초과하였습니다. 다시 조회해주세요.";
					    }else { //Unknow Error
					        errorMsg += "\n관리자에게 문의해주세요.";
					    }
					   
					    alert(errorMsg);
					}

				
				})
		}
        
      
       
        function basketMove() {
        	var user_Id = "${sessionScope.loginUser.userId}";
        	var quantity = parseInt($('#orderQuantity').val())
        	if(!loginCheck()){
        		return false
        	}
        	
        	$.ajax({
        	
        		url : "insertBasket.ba",
        		data : {
        			user_Id : user_Id,
        			bookISBN : "${requestScope.book.bookISBN}",
        			quantity : quantity
        		},
        		
        		type : "post" ,
        		success : function(str) {
        			if(str == 'already'){
        				alert('이미 장바구니에 있는 상품입니다.')
        			}else{
						if(confirm("상품을 장바구니에 담았습니다. 장바구니로 이동하시겠습니까?")){
							$('#moveCartForm').submit();
						}
						return false;
        			}
				}
        		
        		
        	})
        	
        	
			
		}
        function reviewScore(num) {
            for(var i=1;i<=5;i++){
                $('#scoreImg_'+i).attr('src',"${pageContext.servletContext.contextPath }/resources/img/fHeart.jpg")
                if(i>num){
                    $('#scoreImg_'+i).attr('src',"${pageContext.servletContext.contextPath }/resources/img/eHeart.jpg")
                }
            }
            $('#bookRating').val(num*2);
        }
        
      
        function detailbook(bookISBN) {
			$('#inputISBN').val(bookISBN);
        	$('#detailBookForm').submit();
		}
        function movePage(kind,movePage) {
			if(kind==1){
				$('#reviewNowPage').val(movePage);
				$('#pagePosition').val(2);
				$('#detailBookPageForm').submit();
			}else{
				$('#questionNowPage').val(movePage);
				$('#pagePosition').val(3);
				$('#detailBookPageForm').submit();
			} 
		}
        
        //리뷰 등록시 id 체크
        function reviewInsert() {
        	var user_Id = "${sessionScope.loginUser.userId}";
        	if(!loginCheck()){
        		return false
        	}
        	$.ajax({
        	
        		url : "reviewIdCheck.re",
        		type : "post",
        		data : {
        			user_Id : user_Id,
        			bookISBN : "${requestScope.book.bookISBN}"
        		},
        		success : function(str) {
					if(str == '2'){
						checkStatus = 0;
						alert('이미 리뷰를 등록하셨습니다');
					}else if(str == '0'){
						checkStatus = 0;
						alert('책을 구매하셔야 리뷰를 등록하실 수 있습니다');
					}else{

		            	$('#reviewModal').modal('show');
					}
				},
				error : function(e) {
					alert("리뷰 작성 체크 ajax 통신 오류")
				}
        		
        		
        	})
        	return false
        	
		}
        
     
        
     
       
    
        
        //로그인 체크
        function loginCheck() {
        	var user_Id = "${sessionScope.loginUser.userId}";
        	if(user_Id == null||user_Id == ""){
        		alert("로그인이 필요한 기능입니다.")
        		return false;
        	}
        	return true;
		}
        
        //페이지 내 이동
       function pagePositionMove(str) {
		$('#'+str).get(0).click();
		
		
	}
       //리뷰 댓글 리스트 보기
       function selectReviewReply(reviewNo,reviewIndex) {
    	   
    	   $('#tempDiv .reviewReplyInnerWrap').remove();
		   $('#reviewReplyInnerWrap').clone().appendTo($('#tempDiv'))
    	   $('.reviewInnerWrap .reviewReplyInnerWrap').not($('#reviewInnerContent_'+reviewIndex+' .reviewReplyInnerWrap')).remove()
    	   $('.replyShowSpan').css('display','inline')
           $('.replyCloseSpan').css('display','none')
           var reviewWriter = $('#reviewWriterSpan_'+reviewIndex).text();
    	   var user_Id = "${sessionScope.loginUser.userId}";
		$.ajax({
		
			url : "selectReviewReply.re",
			type : "post",
			data : {
				reviewNo : reviewNo
			},
			success : function(list) {
				 
				$.each(list,function(i) {

					replyAnswerForm(i,reviewNo,reviewIndex,reviewWriter,list[i].reviewReplyIndex)
					
					$('#tempDiv #reviewReplyWriter').html(list[i].reviewReplyWriter);
					$('#tempDiv #reviewReplyDate').html(new Date(list[i].reviewReplyDate).toLocaleString());
					$('#tempDiv #reviewReplyBody').html(list[i].reviewReplyContent);
					$('#tempDiv #reviewReplyIndex').val(list[i].reviewReplyIndex);
					$('#tempDiv #reviewReplyNo').val(list[i].reviewReplyNo);
					$('#tempDiv #replyUpdateFormBtn').attr("onclick","replyUpdateForm("+i+","+reviewNo+","+reviewIndex+","+list[i].reviewReplyNo+")")
					$('#tempDiv #replyUpdateCloseBtn').attr("onclick","closeComponent("+i+",'replyUpdate')")
					$('#tempDiv #replyDeleteBtn').attr("onclick","replyDelete("+i+","+reviewNo+","+reviewIndex+","+list[i].reviewReplyNo+")")
					$('#tempDiv #replyAnswerBtn').attr("onclick","replyAnswerForm("+i+","+reviewNo+","+reviewIndex+",'"+reviewWriter+"',"+list[i].reviewReplyIndex+")")
					$('#tempDiv #replyAnswerCloseBtn').attr("onclick","closeComponent("+i+",'replyAnswer')")

					if(list[i].reviewReplyLevel==1){
						$('#tempDiv .reviewReplyInnerWrap').css('margin-left','200px')
						$('#tempDiv #replyDeleteBtn').attr("onclick","answerDelete("+i+","+reviewNo+","+reviewIndex+","+list[i].reviewReplyNo+","+list[i].reviewReplyIndex+")")
					}else{
						$('#tempDiv .reviewReplyInnerWrap').css('margin-left','100px')
					}
					
					
					if(user_Id == list[i].reviewReplyWriter && list[i].reviewReplyStatus == 0){
						$('#tempDiv #replyModifyDiv').css('display','inline-block');
					}else{
						$('#tempDiv #replyModifyDiv').css('display','none');
					}
					if(reviewWriter==user_Id && list[i].reviewReplyLevel==0 && list[i].reviewReplyStatus == 0 ){
						$('#tempDiv #replyAnswerBtn').css('display','inline-block');
					}else{
						$('#tempDiv #replyAnswerBtn').css('display','none');
					}
					
					$('#tempDiv .reviewReplyInnerWrap').attr("id","reviewReplyInnerWrap_"+i)
					$('#tempDiv .reviewReplyInnerWrap').clone().appendTo($('#reviewInnerContent_'+reviewIndex))
					 $('#replyCloseSpan_'+reviewIndex).css('display','inline');
    	   			$('#replyShowSpan_'+reviewIndex).css('display','none');
    	   			$('#reviewInnerContent_'+reviewIndex+' .reviewReplyInnerWrap').css('display','inline-block')
					
				})
				
			},
			error : function() {
				alert("리뷰 댓글 로딩중 ajax 오류")
			}
			
		})
		
	}
       
       
      
       
       
       

      
       //열려있는 요소들 닫기
       function closeComponent(num,str) {
    	   
    	   if(str == 'replyShow'){
    		   
             $('#reviewInnerContent_'+num+' .reviewReplyInnerWrap').remove()
        	   $('#replyShowSpan_'+num).css('display','inline')
        	   $('#replyCloseSpan_'+num).css('display','none')
        	   
    	   }else if(str == 'replyWrite'){
    		   
    		   $('#reviewInnerContent_'+num+' #reviewReplyInsertDiv').remove()
            	$('#RCloseBtn_'+num).css("display","none")
            	$('#RInsertBtn_'+num).css("display","inline-block")
              	
             
    	   }else if(str == 'reviewUpdate'){
    		   
    		   $('#reviewInnerContent_'+num+' #reviewUpdateDiv').remove()
           	$('#RUCloseBtn_'+num).css("display","none")
           	$('#reviewUpdateBtn_'+num).css("display","inline-block")
    	   }else if(str == 'replyUpdate'){
    		   
    		   $('.replyUpdateDiv').not($('#tempDiv .replyUpdateDiv')).remove()
           	$('#reviewReplyInnerWrap_'+num+' #replyUpdateFormBtn').css("display","inline-block");
           	$('#reviewReplyInnerWrap_'+num+' #replyUpdateCloseBtn').css("display","none");
    	   }else if(str == 'replyAnswer'){
    		   var temp = '#reviewReplyInnerWrap_'+num;
    		   
    		   $(temp+' #answerInsertDiv').remove()
    		   $(temp+' #replyAnswerBtn').css("display","inline-block");
    		   $(temp+' #replyAnswerCloseBtn').css("display","none");
    	   }else if(str == 'qnaDetail'){
    		$('.qnaSpan').html('');
   			$('.qnaImg').css('display','none')
   			$('.qnaDetailTr').css('display','none')
    	   }
    	   
    			   
	}
       //리뷰등록
       function insertReview() {
       	if($('#bookRating').val()==0){
       		alert("평점을 입력하지 않으셨습니다.");
       		return false;
       	}
			if($('#reviewContent').val().length==0||!$('#reviewTitle').val()){
				alert("내용없음")
       		return false;
			}
			if(confirm("입력하신 내용으로 리뷰를 등록하시겠습니까?")){
				
				$.ajax({
				
					url : "insertReview.re",
					type : "post",
					data : {
						reviewWriter : $('#reviewWriter').val(),
						bookISBN : $('#reviewBookISBN').val(),
						bookRating : $('#bookRating').val(),
						reviewTitle : $('#reviewTitle').val(),
						reviewContent : $('#reviewContent').val().replaceAll(/\n/g,"<br>")
					},
					success : function(str) {
						$('#reviewNowPage').val(1);
						$('#reviewKind').val(1);
						$('#pagePosition').val(1);
						$('#detailBookPageForm').submit();
					},
					error : function(e) {
						alert("ajax 리뷰등록 오류")
					}
					
				})
				
				
				
			}
		}
       //리뷰 수정창 열기
       function reviewUpdateForm(num){
    	  if($('#reviewReplyCount_'+num).val() != 0){
    		  alert("댓글이 등록되어있는 리뷰는 수정하실수 없습니다.")
    		  return false;
    	  }
    	   
    	$('#reviewUpdateBtn_'+num).css("display","none")
       	$('#RUCloseBtn_'+num).css("display","inline-block")
       	
       	$('#reviewUpdateDiv').clone().prependTo($('#reviewInnerContent_'+num))
       	$('#reviewUpdateBtn').attr("onclick","reviewUpdate("+num+")")
       	
       	$('#reviewInnerContent_'+num+' #reviewUpdateTitle').val($('#reviewTitleSpan_'+num).text())
       	$('#reviewInnerContent_'+num+' #reviewUpdateContent').text($('#reviewContentSpan_'+num).html().replaceAll("<br>","\r\n"))
       	$('#reviewInnerContent_'+num+' #reviewUpdateDiv').css("display","block")
       	
       }
       
       //리뷰 수정 실행
       function reviewUpdate(num) {
    	  
    	   var updateTitle = $('#reviewInnerContent_'+num+' #reviewUpdateTitle').val();
    	   var updateContent = $('#reviewInnerContent_'+num+' #reviewUpdateContent').val().replaceAll(/\n/g,"<br>")
    	   var updateReviewNo = $('#innerReviewNo_'+num).val()
    	   
    	   
    	   $.ajax({
    			url : "updateReview.re",
    			type : "post",
    			data : {
    				reviewNo : updateReviewNo,
    				reviewTitle : updateTitle,
    				reviewContent : updateContent
    				
    			},
    			success : function(str) {
    				 $('#reviewTitleSpan_'+num).text(updateTitle); 
    		    	 $('#reviewContentSpan_'+num).html(updateContent);
    		         closeComponent(num,'reviewUpdate');
				},
				error : function(e) {
					alert("리뷰 수정중 ajax 통신 오류")
				}
    	   
    	   
    	   })
    	 
	}
       //리뷰 댓글 작성창 열기
       function reviewReply(num) {
       	if(!loginCheck()){
       		return false
       	}
       	$('#RInsertBtn_'+num).css("display","none")
       	$('#RCloseBtn_'+num).css("display","inline-block")
       	
       	$('#reviewReplyInsertDiv').clone().prependTo($('#reviewInnerContent_'+num))
       	$('#reviewReplyInsertBtn').attr("onclick","reviewReplyInsert("+num+")")
       	$('#reviewInnerContent_'+num+' #reviewReplyInsertDiv').css("display","flex")
       	
		}
   
       //리뷰 댓글 등록
        function reviewReplyInsert(num) {
    	   
    	   var reviewReplyContent = $('#reviewInnerContent_'+num+' #reviewReplyContent').val().replaceAll(/\n/g,"<br>")
        	var reviewReplyWriter = "${sessionScope.loginUser.userId}";
        	var reviewNo = $('#innerReviewNo_'+num).val()
        	var reviewReplyCount = $('#reviewReplyCount_'+num).val()
    	  
        	if(reviewReplyWriter == null || reviewReplyWriter == ""){
    		   alert("내용을 입력하셔야 합니다.")
    		   return false;
    	   }
    	   
    	   $.ajax({
    		 url : "insertReviewReply.re",
    		 type : "post",
    		 data : {
    			
    			 reviewReplyContent : reviewReplyContent,
    			 reviewReplyWriter : reviewReplyWriter,
    			 reviewNo : reviewNo
    			 
    		 },
    		 success : function(str) {
    			 $('#reviewInnerContent_'+num+' .reviewReplyInnerWrap').remove()
    			 
    			$('#reviewInnerContent_'+num+' #reviewReplyInsertDiv').remove();
        	$('#RCloseBtn_'+num).css("display","none");
        	$('#RInsertBtn_'+num).css("display","inline-block");
        	$('#reviewReplyCount_'+num).val(parseInt($('#reviewReplyCount_'+num).val())+1)
        	$('#replyCloseSpan_'+num).css('display','inline');
        	selectReviewReply(reviewNo,num);
				
			},
			error : function(e) {
				alert("댓글 등록 ajax 통신 오류")
			}
    		   
    	   })
        	
    	   
        	
			
		}

        //리뷰 댓글 답글 수정창 열림
        function replyUpdateForm(num,reviewNo,reviewIndex,reviewReplyNo) {
     	   var temp = '#reviewReplyInnerWrap_'+num;
     	   $(temp+' #replyUpdateFormBtn').css("display","none")
           	$(temp+' #replyUpdateCloseBtn').css("display","inline-block")
           	
           	$('#replyUpdateDiv').clone().appendTo($(temp))
           	
           	$(temp+' #replyUpdateBtn').attr("onclick","replyUpdate("+num+","+reviewNo+","+reviewIndex+","+reviewReplyNo+")")
           	
           	$(temp+' #replyUpdateContent').text($(temp+' #reviewReplyBody').html().replaceAll("<br>","\r\n"))
           	$(temp+' #replyUpdateDiv').css("display","block")
 	}
        
        //리뷰 댓글 답글 수정 업데이트
        function replyUpdate(num,reviewNo,reviewIndex,reviewReplyNo) {
     	   var temp = '#reviewReplyInnerWrap_'+num;		
     	   var updateContent = $(temp+' #replyUpdateContent').val().replaceAll(/\n/g,"<br>")
     	   
     	   
     	   $.ajax({
     			url : "updateReply.re",
     			type : "post",
     			data : {
     				reviewNo : reviewNo,
     				reviewReplyNo : reviewReplyNo,
     				reviewReplyContent : updateContent
     				
     			},
     			success : function(str) {
     				 $(temp+' #reviewReplyBody').html(updateContent);
     		         closeComponent(num,'replyUpdate');
 				},
 				error : function(e) {
 					alert("리뷰 댓글 수정중 ajax 통신 오류")
 				}
     	   
     	   
     	   })
 	}
        
        
        
        //리뷰 댓글 삭제
        function replyDelete(num,reviewNo,reviewIndex,reviewReplyNo) {
     	  
     	   if(!confirm("정말 댓글을 삭제 하시겠습니까?")){
     		   return false
     	   }
     	   
     	   $.ajax({
     		 
     		   url : "deleteReply.re",
     		   type : "post",
     		   data : {
     			   reviewReplyNo : reviewReplyNo,
     			   reviewNo : reviewNo
     		   },
     		   success : function(str) {
     			   if($('#reviewReplyCount_'+reviewIndex).val()==1){
     	    		   $('#reviewReplyCount_'+reviewIndex).val(0);
     	      			$('#reviewInnerContent_'+reviewIndex+' .reviewReplyInnerWrap').remove();
     	         	   $('#replyCloseSpan_'+reviewIndex).css('display','none');
     	    	   }else{
     	    		   $('#reviewReplyCount_'+reviewIndex).val(parseInt($('#reviewReplyCount_'+reviewIndex).val())-1);
     	    		   $('#reviewReplyInnerWrap_'+num).remove();
     	    	   }
 			},
 			error : function(e) {
 				alert("리뷰 댓글 삭제중 ajax 통신 오류")
 			}
     		   
     	   })
     	   
     	  
     	   
    	}
        
        //리뷰 답글 입력창 열림
        function replyAnswerForm(num,reviewNo,reviewIndex,reviewWriter,reviewReplyIndex) {
     	var temp = '#reviewReplyInnerWrap_'+num; 
        	$('#reviewReplyInnerWrap_'+num+' #replyAnswerBtn').css("display","none")
        	$('#reviewReplyInnerWrap_'+num+' #replyAnswerCloseBtn').css("display","inline-block")
        	 
        	$('#answerInsertDiv').clone().appendTo($(temp))
        	$(temp+' #answerInsertBtn').attr("onclick","answerInsert("+num+","+reviewNo+","+reviewIndex+",'"+reviewWriter+"',"+reviewReplyIndex+")")
           	
           	$(temp+' #answerInsertDiv').css("display","block")
 		}
        
      //리류 답글 등록
        function answerInsert(num,reviewNo,reviewIndex,reviewWriter,reviewReplyIndex) {
     	   var temp = '#reviewReplyInnerWrap_'+num; 
     	   var updateContent = $(temp+' #answerInsertContent').val().replaceAll(/\n/g,"<br>")
     	   $.ajax({
     		   url : "insertAnswer.re",
    				type : "post",
    				data : {
 	   				reviewNo : reviewNo,
 	   				reviewReplyIndex : reviewReplyIndex,
 	   				reviewReplyContent : updateContent,
 	   				reviewReplyWriter : reviewWriter
 	   				
 	   			},
 	   			success : function(str) {
 	   				
 	   				
 	   				
 	   				closeComponent(reviewIndex,'replyShow');
 	   				selectReviewReply(reviewNo,reviewIndex);
 				},
 				error : function(e) {
 					alert("리뷰 답글 등록중 ajax 통신 오류")
 				}
     		   
 				
     		   
     	   })
     	   
     	   
 	}
		//리뷰 답글삭제
        function answerDelete(num,reviewNo,reviewIndex,reviewReplyNo,reviewReplyIndex) {
           	   if(!confirm("정말 답글을 삭제 하시겠습니까?")){
           		   return false
           	   }

           	   
           	   $.ajax({
     		 
     		   url : "deleteAnswer.re",
     		   type : "post",
     		   data : {
     			   
     			  reviewReplyNo : reviewReplyNo,
     			   reviewReplyIndex : reviewReplyIndex,
     			   reviewNo : reviewNo
     		   },
     		   success : function(str) {
     			   
     			   closeComponent(reviewIndex,'replyShow');
	   				selectReviewReply(reviewNo,reviewIndex); 
 			},
 			error : function(e) {
 				alert("리뷰 답글 삭제중 ajax 통신 오류")
 			}
     		   
     	   })
       	}
		
		
		function selectQnaDetail(index,qnaNo) {
			var user_Id = "${sessionScope.loginUser.userId}";
			var qnaWriter = $('#qnaListTr_'+index+' #qnaWriter').val();
			var qnaSecret = $('#qnaListTr_'+index+' #secretCheck').val();
			
			if(qnaSecret==1){
				if(!(user_Id==qnaWriter)){
					alert("비밀글은 작성자와 관리자만 열람할 수 있습니다.")
					return false
				}
			}
			
			$('.qnaSpan').html('');
			$('.qnaImg').css('display','none')
			$('.qnaDetailTr').css('display','none')
			$('#qnaDetailTr_'+index).css('display','')
			
			$.ajax({
				url : "selectQnaDetail.qa",
				type : "post",
				data : {
					qnaNo : qnaNo
				},
				success : function(list) {
					
					$.each(list,function(i){
						$('#qnaDetailTr_'+index).css('display','');
						if(i==0){
							$('#qnaDetailTr_'+index+' #qnaQImg').css('display','');
							$('#qnaDetailTr_'+index+' #qnaQSpan').html(list[i]);
							
						}else if(i==1){
							$('#qnaDetailTr_'+index+' #qnaAImg').css('display','');
							$('#qnaDetailTr_'+index+' #qnaASpan').html(list[i]);
						}
						if(user_Id==qnaWriter){

							$('#qnaDetailTr_'+index+' #updateQnaDiv').css('display','');
						}else{
							$('#qnaDetailTr_'+index+' #updateQnaDiv').css('display','none');
						}
						
					})
					
					
				}
			})	
		
			
		}
		
		function changeKind(num,value) {
			if(num==1){
				$('#reviewKind').val(value)
			}else if(num==2){
				$('#questionKind').val(value)
			}
			movePage(num,1)
		}
		
		function qnaUpdateForm(num) {
			updateQnaIndex = num;
			var qnaNo = $('#qnaListTr_'+num+' #qnaNo').val();
			var qnaCategory = $('#qnaListTr_'+num+' #qnaCategory').val();
			var qnaSecret = $('#qnaListTr_'+num+' #secretCheck').val();
			var qnaTitleTd = $('#qnaListTr_'+num+' #qnaTitleTd').html();
			var qnacContent = $('#qnaDetailTr_'+num+' #qnaQSpan').html();
			
			$('#qnaUpdateTitle').val(qnaTitleTd);
			$('#qnaUpdateContent').val(qnacContent.replaceAll("<br>","\r\n"));
			$("#qnaUpdateRadio"+qnaCategory).prop("checked", true);
			if(qnaSecret==1){
				$('#qnaUpdateSecretCheck').prop("checked", true);
			}else{
				$('#qnaUpdateSecretCheck').prop("checked", false);
			}
			$('#qnaUpdateModal').modal('show');
			
		}
		
		function qnaUpdate() {
			if(!confirm("입력하신 정보로 문의사항을 수정하시겠습니까?")){
				return false;
			}
			var CategoryArr = ['상품', '배송', '교환', '반품/환불', '기타'];
			if($('#qnaUpdateSecretCheck').prop('checked')){
				var qnaSecret = 1;
			}else{
				var qnaSecret = 0;
			}
			var qnaNo = $('#qnaListTr_'+updateQnaIndex+' #qnaNo').val();
			
			var qnaCategory = $('input[name=qnaUpdateCategory]:checked').val();
			var qnaTitle = $('#qnaUpdateTitle').val();
			var qnaContent = $('#qnaUpdateContent').val().replaceAll(/\n/g,"<br>");
			
			
			$.ajax({
				url : "qnaUpdate.qa",
				type : "post",
				data : {
					qnaNo : qnaNo,
					qnaSecret : qnaSecret,
					qnaCategory : qnaCategory,
					qnaTitle : qnaTitle,
					qnaContent : qnaContent 
					
					
				},
				success : function(str) {
					$('#qnaListTr_'+updateQnaIndex+' #qnaCategory').val(qnaCategory);
					$('#qnaListTr_'+updateQnaIndex+' #qnaCategorySpan').html(CategoryArr[qnaCategory]);
					if(qnaSecret==1){
						$('#qnaListTr_'+updateQnaIndex+' #qnaSecretImg').css('display','');
						
					}else{
						$('#qnaListTr_'+updateQnaIndex+' #qnaSecretImg').css('display','none');
					}
					$('#qnaListTr_'+updateQnaIndex+' #secretCheck').val(qnaSecret);
					$('#qnaListTr_'+updateQnaIndex+' #qnaTitleTd').html(qnaTitle);
					$('#qnaDetailTr_'+updateQnaIndex+' #qnaQSpan').html(qnaContent);
					$('#closeUpdateModal').click();
				},
				error : function(e) {
					alert("qna 수정중 ajax 통신 오류")
				}
				
				
				
			})
			
			
			
		
		}
		
		function deleteQna(qnaNo) {
			if(confirm("정말로 문의사항을 삭제하시겠습니까?")){
				$.ajax({
					url : "qnaDelete.qa",
					type : "post",
					data : {
						qnaNo : qnaNo		
						
					},
					success : function(str) {
												
						movePage(2,1)
					},
					error : function(e) {
						alert("qna 삭제중 ajax 통신 오류")
					}
					
					
					
				})
				
			}
			
		}
		function qnaInsertForm() {
			if(!loginCheck()){
				return false;
			}
			$('#qnaInsertModal').modal('show');
		}
		function qnaInsertInfoCheck() {
			
			if(!$('input[name=qnaCategory]:checked').val()){
				alert("문의 유형을 선택하십시오.")
				return false;
			}
			if(!$('#qnaInsertTitle').val()||!$('#qnaInsertContent').val()||$('#qnaInsertContent').val()==''){
				alert("내용을 입력하셔야 합니다.")
				return false;
			}
			if(!confirm("입력하신 내용으로 문의사항을 등록하시겠습니까?")){
				return false;
			}
			if($('#qnaInsertSecretCheck').prop('checked')){
				var qnaSecret = 1;
			}else{
				var qnaSecret = 0;
			}
			var qnaCategory = $('input[name=qnaCategory]:checked').val();
			var qnaTitle = $('#qnaInsertTitle').val();
			var qnaContent = $('#qnaInsertContent').val().replaceAll(/\n/g,"<br>");
			var user_Id = "${sessionScope.loginUser.userId}";
			var bookTitle = "${requestScope.book.bookTitle}";
			var bookISBN = "${requestScope.book.bookISBN}";
			
			$.ajax({
				url : "qnaInsert.qa",
				type : "post",
				data : {
					bookISBN : bookISBN,
					bookTitle : bookTitle,
					user_Id : user_Id,
					qnaSecret : qnaSecret,
					qnaCategory : qnaCategory,
					qnaTitle : qnaTitle,
					qnaContent : qnaContent 
					
					
				},
				success : function(str) {
					$('#closeInsertModal').click();
					movePage(2,1)
					
				},
				error : function(e) {
					alert("qna 등록중 ajax 통신 오류")
				}
				
				
				
			})
			
		}
	
    </script>
</head>
<body style="width: 1000px; margin: 0 auto;">
	<hr>
	<main>

		<div style="display: flex;">

			<div style="width: 400px;">
				<img
					src="${pageContext.servletContext.contextPath }/resources/images/book_img/${requestScope.book.bookMainImg}"
					alt="" style="width: 300px; height: auto;">
			</div>
			<div>
				<br>
				<c:set var="price" value="${requestScope.book.bookPrice}" />
				<span style="font-size: 30px; font-weight: bold;"><c:out
						value="${requestScope.book.bookTitle}" /></span> &nbsp;
				<c:if test="${requestScope.book.bookCategory==2}">
					<span style="color: red;">[eBook]</span>
				</c:if>
				<br>
				<c:if test="${requestScope.book.bookSubTitle!='없음'}">
					<span><c:out value="${requestScope.book.bookSubTitle}" /></span>
					<br>
				</c:if>
				<br>
				<br> <span>ISBN : <c:out
						value="${requestScope.book.bookISBN}" /></span><br>
				<br> <span><c:out
						value="${requestScope.book.bookWriter}" /> 지음 | <c:if
						test="${requestScope.book.bookTranslator!='없음'}">역자 <c:out
							value="${requestScope.book.bookTranslator}" />  | </c:if>
					<c:out value="${requestScope.book.bookPublisher}" /> 출판 | <fmt:formatDate
						value="${requestScope.book.bookPublicheDate}"
						pattern="yyyy년 MM월 dd일" /> 출간</span><br>
				<br> <span>평점 : <c:out
						value="${requestScope.book.bookRating}" />/10 (<c:out
						value="${requestScope.book.bookRatingCount}" />명 참여) | 리뷰 <c:out
						value="${requestScope.book.bookReviewCount}" />개
				</span><br>
				<br> <span>국내 베스트 <span
					style="color: red; font-weight: bold;">${requestScope.book.allBestRank}</span>위
					| 소설 베스트 <span style="color: red; font-weight: bold;">${requestScope.book.categoryBestRank}</span>위
				</span><br>
				<br>
				<hr>
				<br>
				<br> <span>정가 : <fmt:formatNumber type="number"
						value="${price}" /> 원
				</span><br>
				<br> <span>판매가 : <a
					style="font-size: 25px; color: crimson"><fmt:formatNumber
							type="number" value="${price*0.9}" /></a>원 [10%↓ <fmt:formatNumber
						type="number" value="${price*0.1}" />원 할인]
				</span><br>
				<br> <span>배송비 : 0 원</span>&nbsp;&nbsp;&nbsp;
				<button id="">배송비 안내</button>
				<br>
				<br> <span>혜택 : [기본혜택] <fmt:formatNumber type="number"
						value="${price*0.05}" />pt (5% 기본적립)<br>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[리뷰작성] <fmt:formatNumber
						type="number" value="${price*0.02}" />pt (2% 추가적립)
				</span><br>
				<br>

			</div>

		</div>
		<hr>
		<br>
		<br>
		<div style="display: flex;">

			<div style="width: 400px;">

				주문수량 : <input type="text" style="width: 30px; text-align: right;"
					value="1" id="orderQuantity" name="QUANTITY">권
				<button type="button" onclick="modiQuntity(1)">+</button>
				<button type="button" onclick="modiQuntity(0)">-</button>





			</div>
			<div>
				<button onclick="basketMove()" type="button">장바구니</button>
				<button>바로주문</button>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a
					href="bookEnrollForm.book">도서 입고로 이동</a>
			</div>
		</div>
		<br>
		<br>
		<hr>
		<br> <span
			style="font-size: 20px; font-weight: bold; color: blue;">${categoryName}</span>
		분야 주간 베스트 도서 <br>
		<br>
		<div style="display: flex;">
			<div style="margin-top: 125px">
				<img alt=""
					src="${pageContext.servletContext.contextPath }/resources/img/btn_prev.gif"
					height="50px" style="margin-right: 15px; cursor: pointer;"
					onclick="bestListMove(0,${requestScope.book.bookSubCategory})">
			</div>
			<c:forEach items="${requestScope.bestList}" var="list"
				varStatus="status">
				<div style="width: 180px; text-align: center;">
					<img alt=""
						src="${pageContext.servletContext.contextPath }/resources/images/book_img/${list.bookMainImg}"
						width="170px" height="250px" style="margin: 5px; cursor: pointer;"
						onclick="detailbook('${list.bookISBN}')"
						id="bestBookImg${status.index}"><br> <span
						id="bestBookTitle${status.index}" style="cursor: pointer;"
						onclick="detailbook('${list.bookISBN}')"><c:out
							value="${list.bookTitle}"></c:out></span><br> <span
						style="color: red;" id="bestBookPrice${status.index}"><fmt:formatNumber
							value="${list.bookPrice}"></fmt:formatNumber>원</span>

				</div>

			</c:forEach>
			<div style="margin-top: 125px">
				<img alt=""
					src="${pageContext.servletContext.contextPath }/resources/img/btn_next.gif"
					height="50px" style="margin-left: 15px; cursor: pointer;"
					onclick="bestListMove(1,${requestScope.book.bookSubCategory})">
			</div>
		</div>
		<br>
		<br>
<div><hr></div>
		
		<br><br>
		<a id="bookInfoPosition" href="#bookInfoPosition"></a>
		<div class="moving">
		<button type="button" onclick="pagePositionMove('bookInfoPosition')" style="border-bottom: none;">도서정보
        </button><button type="button" onclick="pagePositionMove('reviewPosition')">도서리뷰
        </button><button type="button" onclick="pagePositionMove('qnaPosition')">도서1:1문의
        </button><button type="button" onclick="pagePositionMove('noticePosition')">교환/환불</button>
		</div><br><br>
		
		<div style="display: flex;">
			<div style="width: 700px;">
				<br> <span style="font-size: 20px; font-weight: bold;">책
					소개</span><br>
				<br> <span><c:out value="${requestScope.book.bookIntro}"
						escapeXml="false" /> </span><br>
				<br>
				<br>
				<br>
				<br> <span style="font-size: 20px; font-weight: bold;">상세
					이미지</span><br>
				<br> <img
					src="${pageContext.servletContext.contextPath }/resources/images/book_img/${requestScope.book.bookDetailImg}"
					alt="" width="700px" height="auto"><br>
				<br>
				<br>
				<br>
				<br> <span style="font-size: 20px; font-weight: bold;">목차</span><br>
				<br> <span> <c:out
						value="${requestScope.book.bookContents}" escapeXml="false" />
				</span>
			</div>
			<div style="width: 300px;">
				<div style="width: 280px; border: solid 1px black; margin: 10px">
					<br>
					<span
						style="font-size: 20px; font-weight: bold; color: blue; margin-left: 10px">${categoryName}</span>분야
					신간 도서<br>
					<br>
					<hr>
					<br>
					<c:forEach items="${requestScope.newBookList}" var="list"
						varStatus="status">
						<div style="display: flex;">

							<div>
								<img
									src="${pageContext.servletContext.contextPath }/resources/images/book_img/${list.bookMainImg}"
									alt=""
									style="width: 100px; height: 150px; margin: 10px; cursor: pointer;"
									onclick="detailbook('${list.bookISBN}')">
							</div>
							<div>
								<br> <span style="font-weight: bold; cursor: pointer;"
									onclick="detailbook('${list.bookISBN}')"><c:out
										value="${list.bookTitle}" /></span><br>
								<br> <span><c:out value="${list.bookWriter}" /></span><br>
								<span style="color: red; font-weight: bold;"><fmt:formatNumber
										value="${list.bookPrice}"></fmt:formatNumber>원</span>
							</div>
						</div>

					</c:forEach>

				</div>
			</div>
		</div>
		<br>
		<br>
		<br>
		<div style="width: 800px"><hr></div>
		
		<br><br>
		<a id="reviewPosition" href="#reviewPosition"></a>
		<div class="moving">
        <button type="button" onclick="pagePositionMove('bookInfoPosition')">도서정보
        </button><button type="button" onclick="pagePositionMove('reviewPosition')"  style="border-bottom: none;">도서리뷰
        </button><button type="button" onclick="pagePositionMove('qnaPosition')">도서1:1문의
        </button><button type="button" onclick="pagePositionMove('noticePosition')">교환/환불</button>
    	</div>
		<br><br>
		
		<div style="width: 800px">
		도서 구입 후 간단한 리뷰를 작성하시면 도서 정가의 2%(<fmt:formatNumber value="${price*0.02}"/>pt)를 추가 적립해 드립니다. <button type="button" class="btn btn-secondary btn-sm" onclick="reviewInsert()">리뷰작성</button>
		
		
		</div>
		<div id="reviewWrap" style="width: 800px"><br>
		<hr>
		<div id="selectReviewKindDiv" style="display: flex;">
		<div style="margin-left: auto;">
		<select onchange="changeKind(1,this.value)">
			<option value="1" selected>정렬 방식을 선택해주세요</option>
           <option value="1">최신순</option>
           <option value="2">평점 높은순</option>
           <option value="3">평점 낮은순</option>
        </select>
        </div>
        </div>
        <br>
		<%-- <input type="hidden" name="reviewKind" id="reviewKind" value="${request.reviewKind}"> --%>
		<c:forEach items="${requestScope.reviewList}" var="list" varStatus="status">
		<div id="reviewInnerWrap" class="reviewInnerWrap">
		<div id="reviewHeader">
		<span style="font-weight: bold; font-size: 18px" id="reviewTitleSpan_${status.index}">${list.reviewTitle} </span><span>|</span> <span id="reviewWriterSpan_${status.index}">${list.reviewWriter}</span> <span>|</span> <span><fmt:formatDate value="${list.reviewDate}" pattern="yyyy-MM-dd"/></span> <span>|</span>   
		<span><c:forEach begin="1" end="${list.bookRating/2}">
		<img src="${pageContext.servletContext.contextPath }/resources/img/fHeart.jpg" style="width: 15px" > 
		</c:forEach></span>
		
		</div><br>
		<div id="reviewBody">
		<span id="reviewContentSpan_${status.index}">${list.reviewContent}</span>
		</div><br>
		<input type="hidden" id="reviewReplyCount_${status.index}" value="${list.reviewReplyCount}" >
		<div id="reviewFooter" style="display: flex;">
		<div style="margin-right: auto;">
		<c:choose>
		<c:when test="${list.reviewWriter eq sessionScope.loginUser.userId}">
		<button class="btn btn-secondary btn-sm" id="reviewUpdateBtn_${status.index}" type="button" onclick="reviewUpdateForm(${status.index})">리뷰 수정</button>
		<button type="button" style="display: none;" id="RUCloseBtn_${status.index}" class="btn btn-secondary btn-sm" onclick="closeComponent(${status.index},'reviewUpdate')">수정 취소</button>
		</c:when>
		<c:otherwise>
		<button type="button" id="RInsertBtn_${status.index}" class="btn btn-secondary btn-sm" onclick="reviewReply(${status.index})">댓글 쓰기</button>
		<button type="button" style="display: none;" id="RCloseBtn_${status.index}" class="btn btn-secondary btn-sm" onclick="closeComponent(${status.index},'replyWrite')">작성 취소</button>
		</c:otherwise>
		
		</c:choose>

		</div>
		<p>
		<c:choose>
		<c:when test="${list.reviewReplyCount > 0}">
		
		<span class="replyShowSpan" style="display: inline;" id="replyShowSpan_${status.index}" onclick="selectReviewReply(${list.reviewNo},${status.index})">댓글 보기</span>
		<span class="replyCloseSpan" id="replyCloseSpan_${status.index}" style="display: none" onclick="closeComponent(${status.index},'replyShow')">댓글 닫기</span>
		
		</c:when>
		<c:otherwise>
		<span style="display: none;" id="replyShowSpan_${status.index}" onclick="selectReviewReply(${list.reviewNo},${status.index})">댓글 보기</span>
		<span id="replyCloseSpan_${status.index}" style="display: none" onclick="closeComponent(${status.index},'replyShow')">댓글 닫기</span>
		</c:otherwise>
		</c:choose>
		</p>
		</div>
		<div id="reviewInnerContent_${status.index}">
		<input type="hidden" id="innerReviewNo_${status.index}" value="${list.reviewNo}">
		</div>
		<p style="margin-top: 30px"><hr></p>
		</div>
		
		</c:forEach>
		
		<div id="footPageNumber" style="text-align: center; width: 800px">
		<c:if test="${requestScope.reviewPaging.prePage==1}"><span onclick="movePage(1,${requestScope.reviewPaging.startPage-10})">이전</span></c:if>&nbsp;
		<c:forEach begin="${requestScope.reviewPaging.startPage}" end="${requestScope.reviewPaging.endPage}" varStatus="status">
		<c:choose>
		<c:when test="${status.current==requestScope.reviewPaging.nowPage}">
		&nbsp;${status.current}&nbsp;
		</c:when>
		<c:otherwise>
		&nbsp;<span style="cursor: pointer; color: blue;" onclick="movePage(1,${status.current})">${status.current}</span>&nbsp;
	
		</c:otherwise>
		</c:choose>
		</c:forEach>
		&nbsp;<c:if test="${requestScope.reviewPaging.nextPage==1}"><span onclick="movePage(1,${requestScope.reviewPaging.startPage+10})">다음</span></c:if>
		</div>
		
		</div>
		



    <br><br>
<div style="width: 800px"><hr></div>
    
    <br><br>
		<a id="qnaPosition" href="#qnaPosition"></a>
		<div class="moving">
		<button type="button" onclick="pagePositionMove('bookInfoPosition')">도서정보
        </button><button type="button" onclick="pagePositionMove('reviewPosition')">도서리뷰
        </button><button type="button" onclick="pagePositionMove('qnaPosition')" style="border-bottom: none;">도서1:1문의
        </button><button type="button" onclick="pagePositionMove('noticePosition')">교환/환불</button>
		</div><br><br>
		<div style="width: 800px">
		궁금하거나 알고 싶은 정보가 있으시면 문의 해주세요. <button type="button" class="btn btn-secondary btn-sm" onclick="qnaInsertForm()">문의하기</button><br>
		<hr></div>
    <div id="selectQnaKindDiv" style="display: flex; width: 800px">
    <button type="button" class="btn btn-secondary btn-sm">내 글보기</button>
		<div style="margin-left: auto;">
		
		<select onchange="changeKind(2,this.value)">
			<option value="5" selected>문의유형을 선택해주세요</option>
           <option value="5">전체보기</option>
           <option value="0">상품</option>
           <option value="1">배송</option>
           <option value="2">교환</option>
           <option value="3">반품/환불</option>
           <option value="4">기타</option>
        </select>
        </div>
        </div>
        <br>

    <div id="qnaWrap">
    	<c:set var="array">상품, 배송, 교환, 반품/환불, 기타</c:set>
        <table id="qnaViewTable" class="table table-hover" style="width: 800px; text-align: center;">
                                <thead>
                                    <tr>
                                    	<th style="width: 50px;"></th>
                                        <th style="width: 100px;">답변여부</th>
                                        <th style="width: 100px;">문의유형</th>
                                        <th>문의제목</th>
                                        <th style="width: 120px;">작성자</th>
                                        <th style="width: 110px;">작성일</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${requestScope.qnaList}" var="list" varStatus="status">
                                    <tr id="qnaListTr_${status.index}">
                                        <td>
	                                        <input type="hidden" name="qnaNo" id="qnaNo" value="${list.qnaNo}">
	                                        <input type="hidden" name="qnaSecret" id="secretCheck" value="${list.qnaSecret}">
	                                        <input type="hidden" name="qnaCategory" id="qnaCategory" value="${list.qnaCategory}">
	                                        <input type="hidden" id="qnaWriter" value="${list.user_Id}">
	                                        <c:choose>
	                                        <c:when test="${list.qnaSecret==0}">
	                                        <img src="${pageContext.servletContext.contextPath }/resources/img/fHeart.jpg" style="display: none;width:15px"  id="qnaSecretImg">
	                                        </c:when>
	                                        <c:otherwise>
	                                        <img src="${pageContext.servletContext.contextPath }/resources/img/fHeart.jpg" style="display: inline;width:15px" id="qnaSecretImg">
	                                        </c:otherwise>
	                                        </c:choose>
                                        </td>
                                        <td>
                                        <c:choose>
                                        <c:when test="${list.qnaAnswer==1}">답변완료</c:when>
                                        <c:otherwise>미답변</c:otherwise>
                                        </c:choose>
                                        </td>
                                        <td id="qnaCategoryTd"><c:forEach items="${array}" var="qnaKind" varStatus="kindStatus">
                                        <c:if test="${list.qnaCategory==kindStatus.index}"><span id="qnaCategorySpan"><c:out value="${qnaKind}"/></span></c:if>
                                        </c:forEach></td>
                                        <td style="text-align: left; cursor: pointer;" onclick="selectQnaDetail(${status.index},${list.qnaNo})"><span  id="qnaTitleTd" ><c:out value="${list.qnaTitle}"/></span></td>
                                        <td>${list.user_Id}</td>
                                        <td><fmt:formatDate	value="${list.qnaDate}" pattern="yyyy-MM-dd" /></td>
                                   </tr>
                                   <tr id="qnaDetailTr_${status.index}" style="display: none" class="qnaDetailTr">
                                   <td></td><td></td>
                                   <td colspan="3" id="qnaDetailTd" style="text-align: left;">
                                   <div style="display: flex; ">
                                   <img src="${pageContext.servletContext.contextPath }/resources/img/qnaq.png" style="display: none;width:44px; height: 32px" id="qnaQImg" class="qnaImg">
                                   <p style="margin-left: 10px" id="qnaQSpan" class="qnaSpan"></p></div>
                                   <div style="display: flex; margin-left: 100px">
                                   <img src="${pageContext.servletContext.contextPath }/resources/img/qnaa.png" style="display: none;width:44px; height: 32px" id="qnaAImg" class="qnaImg">
                                   <p style="margin-left: 10px"  id="qnaASpan" class="qnaSpan"></p></div>
                                   <div style="display: flex; ">
                                   
                                   <div id="updateQnaDiv" style="display: none">
		
										<button class="btn btn-secondary btn-sm" type="button" onclick="qnaUpdateForm(${status.index})">수정</button>
										<button type="button" class="btn btn-secondary btn-sm" onclick="deleteQna(${list.qnaNo})">삭제</button>
	

								</div>
								<div style="margin-left: auto;">
		
									<button class="btn btn-secondary btn-sm" type="button" onclick="closeComponent(${status.index},'qnaDetail')">닫기</button>
								
							
									</div>	
			                    </div>
                                   </td><td></td>
                                   </tr>
                                   </c:forEach>
                                </tbody>
                                <tfoot>
                                <tr>
                                <td colspan="6">
                                <c:if test="${requestScope.qnaPaging.prePage==1}"><span onclick="movePage(2,${requestScope.qnaPaging.startPage-10})">이전</span></c:if> <c:forEach begin="${requestScope.qnaPaging.startPage}" end="${requestScope.qnaPaging.endPage}" varStatus="status">
									<c:choose>
									<c:when test="${status.current==requestScope.qnaPaging.nowPage}"> ${status.current} </c:when>
									<c:otherwise> <span style="cursor: pointer; color: blue;" onclick="movePage(2,${status.current})">${status.current}</span> </c:otherwise>
									</c:choose>
									</c:forEach> <c:if test="${requestScope.qnaPaging.nextPage==1}"><span onclick="movePage(2,${requestScope.qnaPaging.startPage+10})">다음</span></c:if>
									</td>
                                </tr>
                                </tfoot>
								
                            </table>
    </div>
    
    
    
    <br><br><br><br><br><br>
<div style="width: 800px"><hr></div>
    
    <br><br>
		<a id="noticePosition" href="#noticePosition"></a>
		<div class="moving">
		<button type="button" onclick="pagePositionMove('bookInfoPosition')">도서정보
        </button><button type="button" onclick="pagePositionMove('reviewPosition')">도서리뷰
        </button><button type="button" onclick="pagePositionMove('qnaPosition')">도서1:1문의
        </button><button type="button" onclick="pagePositionMove('noticePosition')" style="border-bottom: none;">교환/환불</button>
		</div><br><br>
    
    
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    
    
    
    
    
    
    
    
    <div id="tempDiv">
   		
		
		
		<div style="display: none; align-items: center;margin-top: 20px" id="reviewReplyInsertDiv"> 
		  	<img src="${pageContext.servletContext.contextPath }/resources/img/replyArrow.png">
		    <textarea rows="4" cols="80" name="reviewReplyContent" id="reviewReplyContent" style="resize: none;" maxlength="150" placeholder="150자 이내로 입력해 주세요&#13;&#10;답글이 달린 후 수정과 삭제는 불가능 합니다.&#13;&#10;서로간의 예의를 지켜주십시오."></textarea>
		    <button style="height: 100px; width: 250px;" onclick="reviewReplyInsert(0)" id="reviewReplyInsertBtn">등록</button>
   		</div>
		
		
		<div style="display: none; align-items: center;margin-top: 20px;" id="reviewUpdateDiv"> 
		       리뷰 제목 수정 : <input type="text" name="reviewTitle" id="reviewUpdateTitle" style="width: 350px;  margin-right: 20px;">
		    <button onclick="reviewUpdate()" id="reviewUpdateBtn">리뷰 수정 등록</button><br>
		       리뷰 내용 수정 :<br>
	    	<textarea rows="4" cols="80" name="reviewContent" id="reviewUpdateContent" style="resize: none;" maxlength="150"></textarea>
	    	
	   	</div>
	   	
	   	<div style="display: none; align-items: center;margin-top: 20px;" id="replyUpdateDiv" class="replyUpdateDiv"> 
		       댓글 내용 수정 :<br>
	    	<textarea rows="4" cols="80" name="replyContent" id="replyUpdateContent" style="resize: none;" maxlength="150"></textarea><br>
	    	
		    <button onclick="replyUpdate()" id="replyUpdateBtn">댓글 수정 등록</button>
	    	
	   	</div>
	   	
	   	<div style="display: none; align-items: center;margin-top: 20px;" id="answerInsertDiv" class="answerInsertDiv"> 
		       답글 내용 :<br>
	    	<textarea rows="4" cols="80" name="answerContent" id="answerInsertContent" placeholder="150자 내외로 작성해주십시오." style="resize: none;" maxlength="150"></textarea><br>
	    	
		    <button onclick="answerInsert()" id="answerInsertBtn">답글 등록</button>
	    	
	   	</div>
	   	
	   	<form action="selectBook.book" method="post" id="detailBookForm">
			<input type="hidden" name="bookISBN" id="inputISBN">
		
		</form>
		<form action="selectBook.book" method="post" id="detailBookPageForm">
		<input type="hidden" name="bookISBN" id="temp00" value="${requestScope.book.bookISBN}">
		<input type="hidden" name="reviewNowPage" id="reviewNowPage" value="${requestScope.reviewNowPage}">
		<input type="hidden" name="reviewKind" id="reviewKind" value="${requestScope.reviewKind}">
		<input type="hidden" name="questionKind" id="questionKind" value="${requestScope.questionKind}">
		<input type="hidden" name="questionNowPage" id="questionNowPage" value="${requestScope.questionNowPage}">
		<input type="hidden" name="pagePosition" id="pagePosition" value="0">
		
		</form>
		
		<form action="shoppingCart.sc" method="post" id="moveCartForm">
		
		<input type="hidden" value="${sessionScope.loginUser.userId}" name="user_Id">

	</form>
	
	</div>
	<div id="reviewReplyInnerWrap" class="reviewReplyInnerWrap" style="display : none">
			<div id="reviewReplyHeader">
				<span style="font-weight: bold; font-size: 15px" id="reviewReplyWriter">이름 </span><span>|</span><span id="reviewReplyDate"><fmt:formatDate value="${list.reviewDate}" pattern="yyyy-MM-dd"/></span> 
			</div><br>
			<div id="reviewReplyContent">
				<span id="reviewReplyBody"></span>
			</div><br>
			<div id="reviewReplyFooter" style="display: flex: ;">
				<input type="hidden" id="reviewReplyIndex" value="">
				<input type="hidden" id="reviewReplyNo" value="">
				<div id="replyModifyDiv" style="display: none;">
				<button type="button" id="replyUpdateFormBtn"  class="btn btn-secondary btn-sm" onclick="">댓글 수정</button>
				<button type="button" style="display: none;" id="replyUpdateCloseBtn" class="btn btn-secondary btn-sm" onclick="">수정 취소</button>
				<button type="button" id="replyDeleteBtn"  class="btn btn-secondary btn-sm" onclick="">댓글 삭제</button>
				</div>
				<button type="button" style="display: none;" id="replyAnswerBtn" class="btn btn-secondary btn-sm" onclick="">답글 쓰기</button>
				<button type="button" style="display: none;" id="replyAnswerCloseBtn" class="btn btn-secondary btn-sm" onclick="reviewReplyClose()">작성 취소</button>
			</div>
			
			<p style="margin-top: 30px"><hr></p>
		</div>
		
		
			
	<div class="modal fade" id="reviewModal">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
        <!-- Modal Header -->
        <div class="modal-header" >
            <h4 class="modal-title">도서 리뷰<span style="font-size: 15px;">(리뷰 작성시 <fmt:formatNumber value="${price*0.02}"/>pt를 추가 지급해 드립니다)</span></h4><br>
            <button type="button" class="close" data-dismiss="modal">&times;</button> 
        </div>

            <!-- Modal Body -->
            <div class="modal-body" >
               
                <div>
                    <span style="font-weight: bold;">도서평점</span> - 책에 대한 점수를 표시해 주세요<br>
                    <br>
                    <img src="${pageContext.servletContext.contextPath }/resources/img/eHeart.jpg" alt="" id="scoreImg_1" onclick="reviewScore(1)" > 
                    <img src="${pageContext.servletContext.contextPath }/resources/img/eHeart.jpg"  id="scoreImg_2" alt="" onclick="reviewScore(2)" > 
                    <img src="${pageContext.servletContext.contextPath }/resources/img/eHeart.jpg"  id="scoreImg_3" alt="" onclick="reviewScore(3)" >
                    <img src="${pageContext.servletContext.contextPath }/resources/img/eHeart.jpg" alt=""  id="scoreImg_4" onclick="reviewScore(4)" > 
                    <img src="${pageContext.servletContext.contextPath }/resources/img/eHeart.jpg"  id="scoreImg_5" alt="" onclick="reviewScore(5)" >

                </div>

                <hr>

                <div>
                    <form action="insertReview.re" method="post" id="insertReviewForm">
                        <input type="hidden" name="reviewWriter" id="reviewWriter" value="${sessionScope.loginUser.userId}">
                        <input type="hidden" name="bookISBN" id="reviewBookISBN" value="${requestScope.book.bookISBN}">
                        <input type="hidden" name="bookRating" id="bookRating" value="0">
                    <span style="font-weight: bold;">도서리뷰</span> - 책에 대하여 사람들에게 말해주세요<br>
                    <br>
                    리뷰 제목 : <input type="text" name="reviewTitle" id="reviewTitle" style="width: 760px;"><br>
                    리뷰 내용 :<br>
                    <textarea name="reviewContent" id="reviewContent" cols="100" rows="10" maxlength="1000" placeholder="공백 포함 1000자 이내로 입력해 주세요&#13;&#10;등록된 리뷰는 포인트 정책상 삭제가 불가능하며 댓글이 달린 후 수정도 불가능 합니다.&#13;&#10;성의없는 포인트 수집용 리뷰는 불이익을 받으실 수 있습니다."></textarea>
                    </form>
                </div>
            </div>
            

            <!-- Modal footer -->
            <div class="modal-footer" >
                <button type="button" class="btn btn-primary mr-auto" onclick="insertReview()">리뷰 등록</button>
                
                <button type="button" class="btn btn-danger" id="closeModal"data-dismiss="modal">취소</button>
            </div>
        
	        </div>
	    </div>
	</div>
					<div class="modal fade" id="qnaInsertModal">
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
                                           
                                        </div>
                                        
                    
                                        <!-- Modal footer -->
                                        <div class="modal-footer" >
                                            <button type="button" class="btn btn-primary mr-auto" onclick="qnaInsertInfoCheck()">문의하기</button>
                                            <button type="button" class="btn btn-danger" id="closeInsertModal"data-dismiss="modal">취소</button>
                                        </div>
                                    
                                    </div>
                                </div>
                            </div>

                            <div class="modal fade" id="qnaUpdateModal">
                                <div class="modal-dialog modal-lg">
                                    <div class="modal-content">
                                    <!-- Modal Header -->
                                    <div class="modal-header">
                                        <h4 class="modal-title">문의사항 수정</h4>
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
                                                        <td><input type="text" name="qnaTitle" id="qnaUpdateTitle" style="width: 535px;" maxlength="30" placeholder="30자 내로 입력해주십시오.">
                                                        </td>
                                                    </tr>
                                                <tr>
                                                    
                                                    <td class="tTd">문의 유형</td>
                                                    <td><input type="radio" value="0" name="qnaUpdateCategory" id="qnaUpdateRadio0" class="qnaCategory qnaUpdateRadio">상품 <input type="radio" value="1" name="qnaUpdateCategory" id="qnaUpdateRadio1"  class="qnaCategory qnaUpdateRadio">배송 
                                                        <input type="radio" value="2" name="qnaUpdateCategory" id="qnaUpdateRadio2"  class="qnaCategory qnaUpdateRadio">교환 
                                                        <input type="radio" value="3" name="qnaUpdateCategory" id="qnaUpdateRadio3"  class="qnaCategory qnaUpdateRadio">반품/환불 <input type="radio" value="4" name="qnaUpdateCategory" id="qnaUpdateRadio4"  class="qnaCategory qnaUpdateRadio">기타
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="tTd">문의 내용</td>
                                                    <td><textarea name="qnaContent" id="qnaUpdateContent" cols="70" rows="5" maxlength="200" 
                                                        style="resize: none;" placeholder="개인정보 유출에 주의하십시오 &#13;&#10;비방,광고,부적절한 글은 불이익이 따를 수 있습니다.&#13;&#10;200자 내로 입력해 주세요"></textarea></td>
                                                </tr>
                                            </tbody>
                                            <tfoot>
                                                <tr>
                                                    <td class="tTd">비밀 글로 문의하기</td>
                                                    <td><input type="checkbox" id="qnaUpdateSecretCheck"> 비밀글로 설정 (질문자와 관리자만 볼 수 있습니다)</td>
                                                </tr>
                                            </tfoot>
                                            </table>
                                            </form>
                                           
                                        </div>
                                        
                    
                                        <!-- Modal footer -->
                                        <div class="modal-footer" >
                                            <button type="button" class="btn btn-primary mr-auto" onclick="qnaUpdate()">문의 수정</button>
                                            <button type="button" class="btn btn-danger" id="closeUpdateModal"data-dismiss="modal">취소</button>
                                        </div>
                                    
                                    </div>
                                </div>
                            </div>
	
	
	
	</main>
	
</html>
