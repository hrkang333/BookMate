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
.infoTable{
    border: 1px solid;
}
.infoTable th{
    background-color: rgb(228, 201, 166);
    height: 100px;
}
.infoTable th,.infoTable td{
   border: 1px solid;
   padding-left: 10px;
   padding-right: 10px;
}

.modal {
        text-align: center;
} 
@media screen and (min-width: 768px) { 
        .modal:before {
                display: inline-block;
                vertical-align: middle;
                content: " ";
                height: 100%;
        }
} 
.modal-dialog {
        display: inline-block;
        text-align: left;
        vertical-align: middle;
}
</style>    
<script>
var listIndex = 0;
var updateQnaIndex = 0;
var wishListStatus = "${requestScope.checkWishList}"=='pass' ? 1 : 2;
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
								$('#bestBookPrice'+i).text(list[i].bookPrice.toLocaleString('ko-KR')+"???");
							})
					},
					error : function (request, status, error){
			               
					    var errorMsg = "?????? ?????? ????????? ?????????????????????. \n";
					   
					    if(request.status == 0){ //offline
					        errorMsg += "???????????? ????????? ?????????????????????.";
					    }else if(request.status==401){//Unauthorized
					        errorMsg += "????????? ????????????. \n??????????????? ??????????????????.";
					    }else if(request.status==403){//Forbidden
					        errorMsg += "????????? ?????????????????????. \n??????????????? ??????????????????.";
					    }else if(request.status==404){//Not Found
					        errorMsg += "????????? ???????????? ?????? ??? ????????????. \n??????????????? ??????????????????.";
					    }else if(request.status==500){ //Internel Server Error
					        errorMsg += "?????? ??? ????????? ?????????????????????. \n??????????????? ??????????????????.";
					    }else if(status=='parsererror'){ //Error.nParsing JSON Request failed.
					        errorMsg += "?????? ????????? ??????????????? ????????? ??? ????????????. \n??????????????? ??????????????????.";
					    }else if(status=='timeout'){ //Request Time out.
					        errorMsg += "?????? ?????? ????????? ?????????????????????. ?????? ??????????????????.";
					    }else { //Unknow Error
					        errorMsg += "\n??????????????? ??????????????????.";
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
        				alert('?????? ??????????????? ?????? ???????????????.')
        			}else{
						if(confirm("????????? ??????????????? ???????????????. ??????????????? ?????????????????????????")){
							$('#moveCartForm').submit();
						}
						return false;
        			}
				}
        		
        		
        	})
        	
        	
			
		}
        
        function singleOrder() {
        	if(!loginCheck()){
        		return false
        	}
        	
        	$('#S_Order_Quantity').val($('#orderQuantity').val());
        	$('#moveSingleOrderForm').submit();
        	
        	
			
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
        
        //?????? ????????? id ??????
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
						alert('?????? ????????? ?????????????????????');
					}else if(str == '0'){
						checkStatus = 0;
						alert('?????? ??????????????? ????????? ???????????? ??? ????????????');
					}else{

		            	$('#reviewModal').modal('show');
					}
				},
				error : function(e) {
					alert("?????? ?????? ?????? ajax ?????? ??????")
				}
        		
        		
        	})
        	return false
        	
		}
        
     
        
     
       
    
        
        //????????? ??????
        function loginCheck() {
        	var user_Id = "${sessionScope.loginUser.userId}";
        	if(user_Id == null||user_Id == ""){
        		alert("???????????? ????????? ???????????????.")
        		return false;
        	}
        	return true;
		}
        
        //????????? ??? ??????
       function pagePositionMove(str) {
		$('#'+str).get(0).click();
		
		
	}
       //?????? ?????? ????????? ??????
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
				alert("?????? ?????? ????????? ajax ??????")
			}
			
		})
		
	}
       
       
      
       
       
       

      
       //???????????? ????????? ??????
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
       //????????????
       function insertReview() {
       	if($('#bookRating').val()==0){
       		alert("????????? ???????????? ??????????????????.");
       		return false;
       	}
			if($('#reviewContent').val().length==0||!$('#reviewTitle').val()){
				alert("????????????")
       		return false;
			}
			if(confirm("???????????? ???????????? ????????? ?????????????????????????")){
				
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
						$('#pagePosition').val(2);
						$('#detailBookPageForm').submit();
					},
					error : function(e) {
						alert("ajax ???????????? ??????")
					}
					
				})
				
				
				
			}
		}
       //?????? ????????? ??????
       function reviewUpdateForm(num){
    	  if($('#reviewReplyCount_'+num).val() != 0){
    		  alert("????????? ?????????????????? ????????? ??????????????? ????????????.")
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
       
       //?????? ?????? ??????
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
					alert("?????? ????????? ajax ?????? ??????")
				}
    	   
    	   
    	   })
    	 
	}
       //?????? ?????? ????????? ??????
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
   
       //?????? ?????? ??????
        function reviewReplyInsert(num) {
    	   
    	   var reviewReplyContent = $('#reviewInnerContent_'+num+' #reviewReplyContent').val().replaceAll(/\n/g,"<br>")
        	var reviewReplyWriter = "${sessionScope.loginUser.userId}";
        	var reviewNo = $('#innerReviewNo_'+num).val()
        	var reviewReplyCount = $('#reviewReplyCount_'+num).val()
    	  
        	if(reviewReplyWriter == null || reviewReplyWriter == ""){
    		   alert("????????? ??????????????? ?????????.")
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
				alert("?????? ?????? ajax ?????? ??????")
			}
    		   
    	   })
        	
    	   
        	
			
		}

        //?????? ?????? ?????? ????????? ??????
        function replyUpdateForm(num,reviewNo,reviewIndex,reviewReplyNo) {
     	   var temp = '#reviewReplyInnerWrap_'+num;
     	   $(temp+' #replyUpdateFormBtn').css("display","none")
           	$(temp+' #replyUpdateCloseBtn').css("display","inline-block")
           	
           	$('#replyUpdateDiv').clone().appendTo($(temp))
           	
           	$(temp+' #replyUpdateBtn').attr("onclick","replyUpdate("+num+","+reviewNo+","+reviewIndex+","+reviewReplyNo+")")
           	
           	$(temp+' #replyUpdateContent').text($(temp+' #reviewReplyBody').html().replaceAll("<br>","\r\n"))
           	$(temp+' #replyUpdateDiv').css("display","block")
 	}
        
        //?????? ?????? ?????? ?????? ????????????
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
 					alert("?????? ?????? ????????? ajax ?????? ??????")
 				}
     	   
     	   
     	   })
 	}
        
        
        
        //?????? ?????? ??????
        function replyDelete(num,reviewNo,reviewIndex,reviewReplyNo) {
     	  
     	   if(!confirm("?????? ????????? ?????? ???????????????????")){
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
 				alert("?????? ?????? ????????? ajax ?????? ??????")
 			}
     		   
     	   })
     	   
     	  
     	   
    	}
        
        //?????? ?????? ????????? ??????
        function replyAnswerForm(num,reviewNo,reviewIndex,reviewWriter,reviewReplyIndex) {
     	var temp = '#reviewReplyInnerWrap_'+num; 
        	$('#reviewReplyInnerWrap_'+num+' #replyAnswerBtn').css("display","none")
        	$('#reviewReplyInnerWrap_'+num+' #replyAnswerCloseBtn').css("display","inline-block")
        	 
        	$('#answerInsertDiv').clone().appendTo($(temp))
        	$(temp+' #answerInsertBtn').attr("onclick","answerInsert("+num+","+reviewNo+","+reviewIndex+",'"+reviewWriter+"',"+reviewReplyIndex+")")
           	
           	$(temp+' #answerInsertDiv').css("display","block")
 		}
        
      //?????? ?????? ??????
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
 					alert("?????? ?????? ????????? ajax ?????? ??????")
 				}
     		   
 				
     		   
     	   })
     	   
     	   
 	}
		//?????? ????????????
        function answerDelete(num,reviewNo,reviewIndex,reviewReplyNo,reviewReplyIndex) {
           	   if(!confirm("?????? ????????? ?????? ???????????????????")){
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
 				alert("?????? ?????? ????????? ajax ?????? ??????")
 			}
     		   
     	   })
       	}
		
		
		function selectQnaDetail(index,qnaNo) {
			var user_Id = "${sessionScope.loginUser.userId}";
			var qnaWriter = $('#qnaListTr_'+index+' #qnaWriter').val();
			var qnaSecret = $('#qnaListTr_'+index+' #secretCheck').val();
			
			if(qnaSecret==1){
				if(!(user_Id==qnaWriter)){
					alert("???????????? ???????????? ???????????? ????????? ??? ????????????.")
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
			if(!confirm("???????????? ????????? ??????????????? ?????????????????????????")){
				return false;
			}
			var CategoryArr = ['??????', '??????', '??????', '??????/??????', '??????'];
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
					alert("qna ????????? ajax ?????? ??????")
				}
				
				
				
			})
			
			
			
		
		}
		
		function deleteQna(qnaNo) {
			if(confirm("????????? ??????????????? ?????????????????????????")){
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
						alert("qna ????????? ajax ?????? ??????")
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
				alert("?????? ????????? ??????????????????.")
				return false;
			}
			if(!$('#qnaInsertTitle').val()||!$('#qnaInsertContent').val()||$('#qnaInsertContent').val()==''){
				alert("????????? ??????????????? ?????????.")
				return false;
			}
			if(!confirm("???????????? ???????????? ??????????????? ?????????????????????????")){
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
					alert("qna ????????? ajax ?????? ??????")
				}
				
				
				
			})
			
		}
	
		function updateWishList(bookISBN) {
			var path = "${pageContext.servletContext.contextPath}/resources/img/";
			if(!loginCheck()){
				return false;
			}
			if(parseInt(wishListStatus)==1){
				if(!confirm("??? ????????? ??? ????????? ?????????????????????????")){
					return false;
				}
			}else{
				if(!confirm("?????? ???????????? ?????? ???????????????.\n??????????????? ?????????????????????????")){
					return false;
				}
			}
			$.ajax({
			
				url : "updateWishList.wl",
				type : "post",
				data : {
					bookISBN : bookISBN,
					wishListStatus : wishListStatus
				},
				success : function(str) {
					if(parseInt(wishListStatus)==1){
						$('#wishListImg').attr('src',path+'fWishList.png')
						wishListStatus = 2;
						alert("??? ????????? ???????????? ?????????????????????.")
					}else{
						$('#wishListImg').attr('src',path+'eWishList.png')
						wishListStatus = 1;
						alert("??? ????????? ??????????????? ?????????????????????.")
					}
				},
				error : function(e) {
					alert("??? ?????? ??????????????? ajax ?????? ??????")
				}
			})
			
		}
    </script>
</head>
<body>
<jsp:include page="../common/menubar.jsp" />
		<main class="site-main" style="padding-top: 180px;display: flex;">
		<div id="bodyWrap" style="margin: auto;">
	<hr>
		<div style="display: flex;">

			<div style="width: 400px;">
				<c:choose>
				<c:when test="${requestScope.book.bookStock>0}">
				<img
					src="${pageContext.servletContext.contextPath }/resources/images/book_img/${requestScope.book.bookMainImg}"
					alt="" style="width: 300px; height: auto;">
				</c:when>
				<c:otherwise>
				<img
					src="${pageContext.servletContext.contextPath }/resources/images/book_img/soldout.png"
					alt="" style="width: 300px; height: auto;">
				</c:otherwise>
				</c:choose>
				
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
				<c:if test="${requestScope.book.bookSubTitle!='??????'}">
					<span><c:out value="${requestScope.book.bookSubTitle}" /></span>
					<br>
				</c:if>
				<br>
				<br> <span>ISBN : <c:out
						value="${requestScope.book.bookISBN}" /></span><br>
				<br> <span><c:out
						value="${requestScope.book.bookWriter}" /> ?????? | <c:if
						test="${requestScope.book.bookTranslator!='??????'}">?????? <c:out
							value="${requestScope.book.bookTranslator}" />  | </c:if>
					<c:out value="${requestScope.book.bookPublisher}" /> ?????? | <fmt:formatDate
						value="${requestScope.book.bookPublicheDate}"
						pattern="yyyy??? MM??? dd???" /> ??????</span><br>
				<br> <span>?????? : <c:out
						value="${requestScope.book.bookRating}" />/10 (<c:out
						value="${requestScope.book.bookRatingCount}" />??? ??????) | ?????? <c:out
						value="${requestScope.book.bookReviewCount}" />???
				</span><br>
				<br> <span>?????? ????????? <span
					style="color: red; font-weight: bold;">${requestScope.book.allBestRank}</span>???
					| ?????? ????????? <span style="color: red; font-weight: bold;">${requestScope.book.categoryBestRank}</span>???
				</span><br>
				<br>
				<hr>
				<br>
				<br> <span>?????? : <fmt:formatNumber type="number"
						value="${price}" /> ???
				</span><br>
				<br> <span>????????? : <a
					style="font-size: 25px; color: crimson"><fmt:formatNumber
							type="number" value="${price*0.9}" /></a>??? [10%??? <fmt:formatNumber
						type="number" value="${price*0.1}" />??? ??????]
				</span><br>
				<br> <span>????????? : <c:if test="${price<10000}"><fmt:formatNumber value="2500"/> ???</c:if>
				<c:if test="${price>=10000}">0 ???</c:if></span>&nbsp;&nbsp;&nbsp;
				<button type="button" data-toggle="modal" data-target="#deliveryPay">???????????????</button>
				<br>
				<br> <span>?????? : [????????????] <fmt:formatNumber type="number"
						value="${price*0.05}" />pt (5% ????????????)<br>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[????????????] <fmt:formatNumber
						type="number" value="${price*0.02}" />pt (2% ????????????)
				</span><br>
				<br>

			</div>

		</div>
		<hr>
		<br>
		<br>
		<div style="display: flex;">

			<c:if test="${requestScope.book.bookStock>0}">
			<div style="width: 400px;">

				???????????? : <input type="text" style="width: 30px; text-align: right;"
					value="1" id="orderQuantity" name="QUANTITY">???
				<button type="button" onclick="modiQuntity(1)" class="btn btn-secondary btn-sm" style="width: 30px">+</button>
				<button type="button" onclick="modiQuntity(0)" class="btn btn-secondary btn-sm"style="width: 30px"> - </button>





			</div>
			<div>
				<button onclick="basketMove()" type="button" class="btn btn-secondary btn-sm">????????????</button>
				<button type="button" onclick="singleOrder()" class="btn btn-secondary btn-sm">????????????</button>
				<c:if test="${requestScope.checkWishList eq 'pass'}">
					<img src="${pageContext.servletContext.contextPath }/resources/img/eWishList.png"
						width="45px" height="50px" style="cursor: pointer;margin-left: 50px"
						onclick="updateWishList('${requestScope.book.bookISBN}')"
						id="wishListImg">
				</c:if>
				<c:if test="${requestScope.checkWishList eq 'already'}">
					<img src="${pageContext.servletContext.contextPath }/resources/img/fWishList.png"
						width="45px" height="50px" style="cursor: pointer; margin-left: 50px"
						onclick="updateWishList('${requestScope.book.bookISBN}')"
						id="wishListImg">
				</c:if>
				<c:if test="${sessionScope.loginUser.userId eq 'admin'}">
				<button type="button" onclick="location.href='updateBook.book?bookISBN=${requestScope.book.bookISBN}'" class="btn btn-secondary btn-sm">????????????</button></c:if>
			</div>
			</c:if>
		</div>
		<br>
		<br>
		<hr>
		<br> <span
			style="font-size: 20px; font-weight: bold; color: blue;">${categoryName}</span>
		?????? ?????? ????????? ?????? <br>
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
							value="${list.bookPrice}"></fmt:formatNumber>???</span>

				</div>

			</c:forEach>
			<div style="margin-top: 125px">
				<img alt=""
					src="${pageContext.servletContext.contextPath }/resources/img/btn_next.gif"
					height="50px" style="margin-left: 15px; cursor: pointer;"
					onclick="bestListMove(1,${requestScope.book.bookSubCategory})">
			</div>
		</div><a id="bookInfoPosition" href="#bookInfoPosition"></a>
		<br>
		<br><br>
<div><hr></div>
		
		<br><br><br><br>
		
		<div class="moving">
		<button type="button" onclick="pagePositionMove('bookInfoPosition')" style="border-bottom: none;">????????????
        </button><button type="button" onclick="pagePositionMove('reviewPosition')">????????????
        </button><button type="button" onclick="pagePositionMove('qnaPosition')">??????1:1??????
        </button><button type="button" onclick="pagePositionMove('noticePosition')">??????/??????</button>
		</div><br><br>
		
		<div style="display: flex;">
			<div style="width: 700px;">
				<br> <span style="font-size: 20px; font-weight: bold;">???
					??????</span><br>
				<br> <span><c:out value="${requestScope.book.bookIntro}"
						escapeXml="false" /> </span><br>
				<br>
				<br>
				<br>
				<br> <span style="font-size: 20px; font-weight: bold;">??????
					?????????</span><br>
				<br> <img
					src="${pageContext.servletContext.contextPath }/resources/images/book_img/${requestScope.book.bookDetailImg}"
					alt="" width="700px" height="auto"><br>
				<br>
				<br>
				<br>
				<br> <span style="font-size: 20px; font-weight: bold;">??????</span><br>
				<br> <span> <c:out
						value="${requestScope.book.bookContents}" escapeXml="false" />
				</span>
			</div>
			<div style="width: 300px;">
				<div style="width: 280px; border: solid 1px black; margin: 10px">
					<br>
					<span
						style="font-size: 20px; font-weight: bold; color: blue; margin-left: 10px">${categoryName}</span>??????
					?????? ??????<br>
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
										value="${list.bookPrice}"></fmt:formatNumber>???</span>
							</div>
						</div>

					</c:forEach>

				</div>
			</div>
		</div><a id="reviewPosition" href="#reviewPosition"></a>
		<br>
		<br><br>
		<br>
		<br>
		<div style="width: 800px"><hr></div>
		
		<br><br>
		
		<div class="moving">
        <button type="button" onclick="pagePositionMove('bookInfoPosition')">????????????
        </button><button type="button" onclick="pagePositionMove('reviewPosition')"  style="border-bottom: none;">????????????
        </button><button type="button" onclick="pagePositionMove('qnaPosition')">??????1:1??????
        </button><button type="button" onclick="pagePositionMove('noticePosition')">??????/??????</button>
    	</div>
		<br><br>
		
		<div style="width: 800px">
		?????? ?????? ??? ????????? ????????? ??????????????? ?????? ????????? 2%(<fmt:formatNumber value="${price*0.02}"/>pt)??? ?????? ????????? ????????????. <button type="button" class="btn btn-secondary btn-sm" onclick="reviewInsert()">????????????</button>
		
		
		</div>
		<div id="reviewWrap" style="width: 800px"><br>
		<hr>
		<div id="selectReviewKindDiv" style="display: flex;">
		<div style="margin-left: auto;">
		<select onchange="changeKind(1,this.value)">
			<option value="1" selected>?????? ????????? ??????????????????</option>
           <option value="1">?????????</option>
           <option value="2">?????? ?????????</option>
           <option value="3">?????? ?????????</option>
        </select>
        </div>
        </div>
        <br>
        <c:if test="${empty requestScope.reviewList}">
        <br><br>
       	<div style="font-size: 30px;display: flex;"><p style="margin: auto;">????????? ?????? ????????????.</p></div>
        </c:if>
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
		<button class="btn btn-secondary btn-sm" id="reviewUpdateBtn_${status.index}" type="button" onclick="reviewUpdateForm(${status.index})">?????? ??????</button>
		<button type="button" style="display: none;" id="RUCloseBtn_${status.index}" class="btn btn-secondary btn-sm" onclick="closeComponent(${status.index},'reviewUpdate')">?????? ??????</button>
		</c:when>
		<c:otherwise>
		<button type="button" id="RInsertBtn_${status.index}" class="btn btn-secondary btn-sm" onclick="reviewReply(${status.index})">?????? ??????</button>
		<button type="button" style="display: none;" id="RCloseBtn_${status.index}" class="btn btn-secondary btn-sm" onclick="closeComponent(${status.index},'replyWrite')">?????? ??????</button>
		</c:otherwise>
		
		</c:choose>

		</div>
		<p>
		<c:choose>
		<c:when test="${list.reviewReplyCount > 0}">
		
		<span class="replyShowSpan" style="display: inline;cursor: pointer;" id="replyShowSpan_${status.index}" onclick="selectReviewReply(${list.reviewNo},${status.index})">?????? ??????</span>
		<span class="replyCloseSpan" id="replyCloseSpan_${status.index}" style="display: none;cursor: pointer;" onclick="closeComponent(${status.index},'replyShow')">?????? ??????</span>
		
		</c:when>
		<c:otherwise>
		<span style="display: none;" id="replyShowSpan_${status.index}" onclick="selectReviewReply(${list.reviewNo},${status.index})">?????? ??????</span>
		<span id="replyCloseSpan_${status.index}" style="display: none" onclick="closeComponent(${status.index},'replyShow')">?????? ??????</span>
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
		<c:if test="${requestScope.reviewPaging.prePage==1}"><span onclick="movePage(1,${requestScope.reviewPaging.startPage-10})">??????</span></c:if>&nbsp;
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
		&nbsp;<c:if test="${requestScope.reviewPaging.nextPage==1}"><span onclick="movePage(1,${requestScope.reviewPaging.startPage+10})">??????</span></c:if>
		</div>
		
		</div>
		
<a id="qnaPosition" href="#qnaPosition"></a>


    <br><br><br><br><br>
<div style="width: 800px"><hr></div>
    
    <br><br>
		
		<div class="moving">
		<button type="button" onclick="pagePositionMove('bookInfoPosition')">????????????
        </button><button type="button" onclick="pagePositionMove('reviewPosition')">????????????
        </button><button type="button" onclick="pagePositionMove('qnaPosition')" style="border-bottom: none;">??????1:1??????
        </button><button type="button" onclick="pagePositionMove('noticePosition')">??????/??????</button>
		</div><br><br>
		<div style="width: 800px">
		??????????????? ?????? ?????? ????????? ???????????? ?????? ????????????. <button type="button" class="btn btn-secondary btn-sm" onclick="qnaInsertForm()">????????????</button><br>
		<hr></div>
    <div id="selectQnaKindDiv" style="display: flex; width: 800px">
    <button type="button" class="btn btn-secondary btn-sm" onclick="changeKind(2,6)">??? ?????????</button>
		<div style="margin-left: auto;">
		
		<select onchange="changeKind(2,this.value)">
			<option value="5" selected>??????????????? ??????????????????</option>
           <option value="5">????????????</option>
           <option value="0">??????</option>
           <option value="1">??????</option>
           <option value="2">??????</option>
           <option value="3">??????/??????</option>
           <option value="4">??????</option>
        </select>
        </div>
        </div>
        <br>
	
    <div id="qnaWrap" style=" margin-right: auto;width: 800px; ">
    	<c:set var="array">??????, ??????, ??????, ??????/??????, ??????</c:set>
        <table id="qnaViewTable" class="table table-hover" style="width: 800px; text-align: center; ">
                                <thead>
                                    <tr>
                                    	<th style="width: 50px;"></th>
                                        <th style="width: 100px;">????????????</th>
                                        <th style="width: 100px;">????????????</th>
                                        <th>????????????</th>
                                        <th style="width: 120px;">?????????</th>
                                        <th style="width: 110px;">?????????</th>
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
	                                        <img src="${pageContext.servletContext.contextPath }/resources/img/lock.png" style="display: none;width:15px"  id="qnaSecretImg">
	                                        </c:when>
	                                        <c:otherwise>
	                                        <img src="${pageContext.servletContext.contextPath }/resources/img/lock.png" style="display: inline;width:15px" id="qnaSecretImg">
	                                        </c:otherwise>
	                                        </c:choose>
                                        </td>
                                        <td>
                                        <c:choose>
                                        <c:when test="${list.qnaAnswer==1}">????????????</c:when>
                                        <c:otherwise>?????????</c:otherwise>
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
		
										<button class="btn btn-secondary btn-sm" type="button" onclick="qnaUpdateForm(${status.index})">??????</button>
										<button type="button" class="btn btn-secondary btn-sm" onclick="deleteQna(${list.qnaNo})">??????</button>
	

								</div>
								<div style="margin-left: auto;">
		
									<button class="btn btn-secondary btn-sm" type="button" onclick="closeComponent(${status.index},'qnaDetail')">??????</button>
								
							
									</div>	
			                    </div>
                                   </td><td></td>
                                   </tr>
                                   </c:forEach>
                                </tbody>
                                <tfoot>
                                <tr>
                                <td colspan="6">
                                <c:if test="${requestScope.qnaPaging.prePage==1}"><span onclick="movePage(2,${requestScope.qnaPaging.startPage-10})">??????</span></c:if> <c:forEach begin="${requestScope.qnaPaging.startPage}" end="${requestScope.qnaPaging.endPage}" varStatus="status">
									<c:choose>
									<c:when test="${status.current==requestScope.qnaPaging.nowPage}"> ${status.current} </c:when>
									<c:otherwise> <span style="cursor: pointer; color: blue;" onclick="movePage(2,${status.current})">${status.current}</span> </c:otherwise>
									</c:choose>
									</c:forEach> <c:if test="${requestScope.qnaPaging.nextPage==1}"><span onclick="movePage(2,${requestScope.qnaPaging.startPage+10})">??????</span></c:if>
									</td>
                                </tr>
                                </tfoot>
								
                            </table>
                          
					    </div>
					      <c:if test="${empty requestScope.qnaList}">
       						 <br><br>
					       	<div style="font-size: 30px;display: flex;width: 800px "><p style="margin: auto;">????????? ?????? ????????????.</p></div>
					        </c:if>
    
    <a id="noticePosition" href="#noticePosition"></a>
    <br><br><br><br><br>
<div style="width: 800px"><hr></div>
    
    <br><br>
		
		<div class="moving">
		<button type="button" onclick="pagePositionMove('bookInfoPosition')">????????????
        </button><button type="button" onclick="pagePositionMove('reviewPosition')">????????????
        </button><button type="button" onclick="pagePositionMove('qnaPosition')">??????1:1??????
        </button><button type="button" onclick="pagePositionMove('noticePosition')" style="border-bottom: none;">??????/??????</button>
		</div><br><br><br>
		<div>
		<span style="font-size: 20px;font-weight: bold;">??????/??????/????????????</span><br><br>
		??? ?????? ????????? ??????/?????? ?????? ????????? ?????? ?????? ??? ????????? ???????????? ?????????.(?????? ????????? ?????? ????????? ??? ????????????.)
		</div>
		
		<div  style=" margin-right: auto;width: 800px; " id="infoWrap">
    
		<table style="width: 800px;" class="infoTable">
		<tbody>
		<tr>
		    <th style="width: 200px;">??????/????????????</th>
		    <td>??????????????? > ???????????? > ??????/???????????? > ???????????? > ??????/????????????<br>
		        [1:1??????>??????/??????/??????] ?????? ???????????? (####-####)</td>
		</tr>
		<tr>
		    <th>??????/???????????? ??????</th>
		    <td>??????????????? ?????? ?????? ??? 7??? ??????,
		        ????????? ?????? ??? ??????????????? ?????? ?????? ????????? ?????? ??? 30??? ??????</td>
		</tr>
		<tr>
		    <th>??????/????????????</th>
		    <td>?????? ?????? ??????????????? ?????? ??????/????????? ????????? ?????? ??????</td>
		</tr>
		<tr>
		    <th>??????/?????? ?????? ??????</th>
		    <td>-???????????? ?????? ?????? ????????? ?????? ?????? ?????? ?????? ????????? ??????<br>
		        (?????? ????????? ?????? ?????? ????????? ??????)<br>
		        -???????????? ??????, ?????? ????????? ?????? ?????? ?????? ????????? ????????? ????????? ??????<br>
		        -????????? ????????? ?????? ?????? ????????? ????????? ??????<br>        
		        -????????? ???????????? eBook??? 1??? ?????? ??????????????? ????????? ??????<br>
		       -????????? ????????? ?????? ???????????? ????????? ????????? ????????? ????????? ????????? ??????<br>
		        -??????????????? ???????????? ?????????????????? ?????? ????????? ????????? ????????? ???????????? ?????? ?????????
		        ???????????? ??????</td>
		</tr>
		<tr>
		    <th>?????? ??????</th>
		    <td>?????????(?????????) ?????? ????????? ?????? ??????/????????? ??? ?????????, ?????? ??? ?????? ????????? ????????????
		        ???????????? ????????? ????????????????????????.</td>
		</tr>
		<tr>
		    <th>????????? ????????????<br>
		        ??????????????? ?????? ??????</th>
		    <td>-????????? ????????? ?????? ??????, A/S, ??????, ???????????? ??? ???????????? ?????? ?????? ?????????
		        ????????????????????? ?????? (????????????????????? ??????)??? ????????? ?????????<br>
		        -?????? ?????? ??? ??????????????? ?????? ????????? ?????? ??????, ?????? ?????? ??????????????? ????????????
		        ????????? ????????? ?????? ????????? ?????? ?????????</td>
		</tr>
		</tbody>
		
		
		</table>
    </div>
    <br><br><br><br><br><br><br><br><br><br><br><br>
    
    
    
    
    
    
    
    
    <div id="tempDiv">
   		
		
		
		<div style="display: none; align-items: center;margin-top: 20px" id="reviewReplyInsertDiv"> 
		  	<img src="${pageContext.servletContext.contextPath }/resources/img/replyArrow.png">
		    <textarea rows="4" cols="80" name="reviewReplyContent" id="reviewReplyContent" style="resize: none;" maxlength="150" placeholder="150??? ????????? ????????? ?????????&#13;&#10;????????? ?????? ??? ????????? ????????? ????????? ?????????.&#13;&#10;???????????? ????????? ??????????????????."></textarea>
		    <button style="height: 100px; width: 250px;" onclick="reviewReplyInsert(0)" id="reviewReplyInsertBtn">??????</button>
   		</div>
		
		
		<div style="display: none; align-items: center;margin-top: 20px;" id="reviewUpdateDiv"> 
		       ?????? ?????? ?????? : <input type="text" name="reviewTitle" id="reviewUpdateTitle" style="width: 350px;  margin-right: 20px;">
		    <button onclick="reviewUpdate()" id="reviewUpdateBtn">?????? ?????? ??????</button><br>
		       ?????? ?????? ?????? :<br>
	    	<textarea rows="4" cols="80" name="reviewContent" id="reviewUpdateContent" style="resize: none;" maxlength="150"></textarea>
	    	
	   	</div>
	   	
	   	<div style="display: none; align-items: center;margin-top: 20px;" id="replyUpdateDiv" class="replyUpdateDiv"> 
		       ?????? ?????? ?????? :<br>
	    	<textarea rows="4" cols="80" name="replyContent" id="replyUpdateContent" style="resize: none;" maxlength="150"></textarea><br>
	    	
		    <button onclick="replyUpdate()" id="replyUpdateBtn">?????? ?????? ??????</button>
	    	
	   	</div>
	   	
	   	<div style="display: none; align-items: center;margin-top: 20px;" id="answerInsertDiv" class="answerInsertDiv"> 
		       ?????? ?????? :<br>
	    	<textarea rows="4" cols="80" name="answerContent" id="answerInsertContent" placeholder="150??? ????????? ?????????????????????." style="resize: none;" maxlength="150"></textarea><br>
	    	
		    <button onclick="answerInsert()" id="answerInsertBtn">?????? ??????</button>
	    	
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
	<form action="moveS_OrderPayment.sc" method="post" id="moveSingleOrderForm">
		
		<input type="hidden" name="bookISBN" value="${requestScope.book.bookISBN}">
		<input type="hidden" name="quantity" id="S_Order_Quantity">
	</form>
	
	</div>
	<div id="reviewReplyInnerWrap" class="reviewReplyInnerWrap" style="display : none">
			<div id="reviewReplyHeader">
				<span style="font-weight: bold; font-size: 15px" id="reviewReplyWriter">?????? </span><span>|</span><span id="reviewReplyDate"><fmt:formatDate value="${list.reviewDate}" pattern="yyyy-MM-dd"/></span> 
			</div><br>
			<div id="reviewReplyContent">
				<span id="reviewReplyBody"></span>
			</div><br>
			<div id="reviewReplyFooter" style="display: flex: ;">
				<input type="hidden" id="reviewReplyIndex" value="">
				<input type="hidden" id="reviewReplyNo" value="">
				<div id="replyModifyDiv" style="display: none;">
				<button type="button" id="replyUpdateFormBtn"  class="btn btn-secondary btn-sm" onclick="">?????? ??????</button>
				<button type="button" style="display: none;" id="replyUpdateCloseBtn" class="btn btn-secondary btn-sm" onclick="">?????? ??????</button>
				<button type="button" id="replyDeleteBtn"  class="btn btn-secondary btn-sm" onclick="">?????? ??????</button>
				</div>
				<button type="button" style="display: none;" id="replyAnswerBtn" class="btn btn-secondary btn-sm" onclick="">?????? ??????</button>
				<button type="button" style="display: none;" id="replyAnswerCloseBtn" class="btn btn-secondary btn-sm" onclick="reviewReplyClose()">?????? ??????</button>
			</div>
			
			<p style="margin-top: 30px"><hr></p>
		</div>
		
		
			
	<div class="modal fade" id="reviewModal" style="z-index: 10000">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
        <!-- Modal Header -->
        <div class="modal-header" >
            <h4 class="modal-title">?????? ??????<span style="font-size: 15px;">(?????? ????????? <fmt:formatNumber value="${price*0.02}"/>pt??? ?????? ????????? ????????????)</span></h4><br>
            <button type="button" class="close" data-dismiss="modal">&times;</button> 
        </div>

            <!-- Modal Body -->
            <div class="modal-body" >
               
                <div>
                    <span style="font-weight: bold;">????????????</span> - ?????? ?????? ????????? ????????? ?????????<br>
                    <br>
                    <img src="${pageContext.servletContext.contextPath }/resources/img/eHeart.jpg"  id="scoreImg_1" onclick="reviewScore(1)" style="width: 35px"> 
                    <img src="${pageContext.servletContext.contextPath }/resources/img/eHeart.jpg"  id="scoreImg_2" onclick="reviewScore(2)" style="width: 35px" > 
                    <img src="${pageContext.servletContext.contextPath }/resources/img/eHeart.jpg"  id="scoreImg_3" onclick="reviewScore(3)" style="width: 35px" >
                    <img src="${pageContext.servletContext.contextPath }/resources/img/eHeart.jpg"  id="scoreImg_4" onclick="reviewScore(4)" style="width: 35px" > 
                    <img src="${pageContext.servletContext.contextPath }/resources/img/eHeart.jpg"  id="scoreImg_5" onclick="reviewScore(5)" style="width: 35px" >

                </div>

                <hr>

                <div>
                    <form action="insertReview.re" method="post" id="insertReviewForm">
                        <input type="hidden" name="reviewWriter" id="reviewWriter" value="${sessionScope.loginUser.userId}">
                        <input type="hidden" name="bookISBN" id="reviewBookISBN" value="${requestScope.book.bookISBN}">
                        <input type="hidden" name="bookRating" id="bookRating" value="0">
                    <span style="font-weight: bold;">????????????</span> - ?????? ????????? ??????????????? ???????????????<br>
                    <br>
                    ?????? ?????? : <input type="text" name="reviewTitle" id="reviewTitle" style="width: 760px;"><br>
                    ?????? ?????? :<br>
                    <textarea name="reviewContent" id="reviewContent" cols="100" rows="10" maxlength="1000" placeholder="?????? ?????? 1000??? ????????? ????????? ?????????&#13;&#10;????????? ????????? ????????? ????????? ????????? ??????????????? ????????? ?????? ??? ????????? ????????? ?????????.&#13;&#10;???????????? ????????? ????????? ????????? ???????????? ????????? ??? ????????????."></textarea>
                    </form>
                </div>
            </div>
            

            <!-- Modal footer -->
            <div class="modal-footer" >
                <button type="button" class="btn btn-primary mr-auto" onclick="insertReview()">?????? ??????</button>
                
                <button type="button" class="btn btn-danger" id="closeModal"data-dismiss="modal">??????</button>
            </div>
        
	        </div>
	    </div>
	</div>
					<div class="modal fade" id="qnaInsertModal" style="z-index: 10000">
                                <div class="modal-dialog modal-lg">
                                    <div class="modal-content">
                                    <!-- Modal Header -->
                                    <div class="modal-header">
                                        <h4 class="modal-title">?????? 1:1 ????????????</h4>
                                        <button type="button" class="close" data-dismiss="modal">&times;</button> 
                                    </div>
                        
                                        <!-- Modal Body -->
                                        <div class="modal-body" >
                                            <form action="bookQnaInsert.qa" method="post">
                                            <table id="qnaTable">
                                                <thead>
                                                    <tr>
                                                    <th colspan="2">????????? : ${requestScope.book.bookTitle }</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        
                                                        <td class="tTd">?????? ??????</td>
                                                        <td><input type="text" name="qnaTitle" id="qnaInsertTitle" style="width: 535px;" maxlength="30" placeholder="30??? ?????? ?????????????????????.">
                                                        </td>
                                                    </tr>
                                                <tr>
                                                    
                                                    <td class="tTd">?????? ??????</td>
                                                    <td><input type="radio" value="0" name="qnaCategory" id="qnaInsertRadio0" class="qnaCategory qnaInsertRadio">?????? <input type="radio" value="1" id="qnaInsertRadio3" name="qnaCategory" class="qnaCategory qnaInsertRadio">?????? 
                                                        <input type="radio" value="2" name="qnaCategory" id="qnaInsertRadio1" class="qnaCategory qnaInsertRadio">?????? 
                                                        <input type="radio" value="3" name="qnaCategory" id="qnaInsertRadio2" class="qnaCategory qnaInsertRadio">??????/?????? <input type="radio" value="4" id="qnaInsertRadio4" name="qnaCategory" class="qnaCategory qnaInsertRadio">??????
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="tTd">?????? ??????</td>
                                                    <td><textarea name="qnaContent" id="qnaInsertContent" cols="70" rows="5" maxlength="200" 
                                                        style="resize: none;" placeholder="???????????? ????????? ?????????????????? &#13;&#10;??????,??????,???????????? ?????? ???????????? ?????? ??? ????????????.&#13;&#10;200??? ?????? ????????? ?????????"></textarea></td>
                                                </tr>
                                            </tbody>
                                            <tfoot>
                                                <tr>
                                                    <td class="tTd">?????? ?????? ????????????</td>
                                                    <td><input type="checkbox" id="qnaInsertSecretCheck"> ???????????? ?????? (???????????? ???????????? ??? ??? ????????????)</td>
                                                </tr>
                                            </tfoot>
                                            </table>
                                            </form>
                                           
                                        </div>
                                        
                    
                                        <!-- Modal footer -->
                                        <div class="modal-footer" >
                                            <button type="button" class="btn btn-primary mr-auto" onclick="qnaInsertInfoCheck()">????????????</button>
                                            <button type="button" class="btn btn-danger" id="closeInsertModal"data-dismiss="modal">??????</button>
                                        </div>
                                    
                                    </div>
                                </div>
                            </div>

                            <div class="modal fade" id="qnaUpdateModal" style="z-index: 10000">
                                <div class="modal-dialog modal-lg">
                                    <div class="modal-content">
                                    <!-- Modal Header -->
                                    <div class="modal-header">
                                        <h4 class="modal-title">???????????? ??????</h4>
                                        <button type="button" class="close" data-dismiss="modal">&times;</button> 
                                    </div>
                        
                                        <!-- Modal Body -->
                                        <div class="modal-body" >
                                            <form action="bookQnaInsert.qa" method="post">
                                            <table id="qnaTable">
                                                <thead>
                                                    <tr>
                                                    <th colspan="2">????????? : </th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td class="tTd">?????? ??????</td>
                                                        <td><input type="text" name="qnaTitle" id="qnaUpdateTitle" style="width: 535px;" maxlength="30" placeholder="30??? ?????? ?????????????????????.">
                                                        </td>
                                                    </tr>
                                                <tr>
                                                    
                                                    <td class="tTd">?????? ??????</td>
                                                    <td><input type="radio" value="0" name="qnaUpdateCategory" id="qnaUpdateRadio0" class="qnaCategory qnaUpdateRadio">?????? <input type="radio" value="1" name="qnaUpdateCategory" id="qnaUpdateRadio1"  class="qnaCategory qnaUpdateRadio">?????? 
                                                        <input type="radio" value="2" name="qnaUpdateCategory" id="qnaUpdateRadio2"  class="qnaCategory qnaUpdateRadio">?????? 
                                                        <input type="radio" value="3" name="qnaUpdateCategory" id="qnaUpdateRadio3"  class="qnaCategory qnaUpdateRadio">??????/?????? <input type="radio" value="4" name="qnaUpdateCategory" id="qnaUpdateRadio4"  class="qnaCategory qnaUpdateRadio">??????
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="tTd">?????? ??????</td>
                                                    <td><textarea name="qnaContent" id="qnaUpdateContent" cols="70" rows="5" maxlength="200" 
                                                        style="resize: none;" placeholder="???????????? ????????? ?????????????????? &#13;&#10;??????,??????,???????????? ?????? ???????????? ?????? ??? ????????????.&#13;&#10;200??? ?????? ????????? ?????????"></textarea></td>
                                                </tr>
                                            </tbody>
                                            <tfoot>
                                                <tr>
                                                    <td class="tTd">?????? ?????? ????????????</td>
                                                    <td><input type="checkbox" id="qnaUpdateSecretCheck"> ???????????? ?????? (???????????? ???????????? ??? ??? ????????????)</td>
                                                </tr>
                                            </tfoot>
                                            </table>
                                            </form>
                                           
                                        </div>
                                        
                    
                                        <!-- Modal footer -->
                                        <div class="modal-footer" >
                                            <button type="button" class="btn btn-primary mr-auto" onclick="qnaUpdate()">?????? ??????</button>
                                            <button type="button" class="btn btn-danger" id="closeUpdateModal"data-dismiss="modal">??????</button>
                                        </div>
                                    
                                    </div>
                                </div>
                            </div>
			<div class="modal fade" id="deliveryPay">
		        <div class="modal-dialog modal-sm">
		            <div class="modal-content">
		            <!-- Modal Header -->
		            <div class="modal-header">
		                <h5 class="modal-title" style="font-weight: bold;">????????? ?????? ??????</h5>
		                <button type="button" class="close" data-dismiss="modal">&times;</button> 
		            </div>
		                <!-- Modal Body -->
		                <div class="modal-body" >
		                    <table>
		                        <tbody>
		                            <tr>
		                                <td>                                   
		                                    -1?????? ?????? ?????? ?????? ??? ????????????<br>
		                                    -eBook ?????????<br>
		                                    -???????????? ?????? ?????? 1?????? ?????? ?????? ????????? ????????????<br>
									                                    ?????? ??? ???????????? ??????<br>
									                 ????????? ??????<br>
		                                </td>                               
		                            </tr>   
		                         </tbody>
		                    </table>
		                </div>
		                <!-- Modal footer -->
		                <div class="modal-footer" >
		                </div>
		            </div>
		        </div>
		    </div>
	
	</div>
	</main>
	
	<jsp:include page="../common/footer.jsp" />
</html>
