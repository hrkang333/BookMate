//-----------------판매자 페이지
$(document).ready(function() {

    
    var readURL = function(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('.avatar').attr('src', e.target.result);
            }
    
            reader.readAsDataURL(input.files[0]);
        }
    }
    

    $(".file-upload").on('change', function(){
        readURL(this);
    });
});

//---------------문의
$(document).ready(function () {

    $('.ckbox label').on('click', function () {
      $(this).parents('tr').toggleClass('selected');
    });

    $('.btn-filter').on('click', function () {
      var $target = $(this).data('target');
      if ($target != 'all') {
        $('.table tr').css('display', 'none');
        $('.table tr[data-status="' + $target + '"]').fadeIn('slow');
      } else {
        $('.table tr').css('display', 'none').fadeIn('slow');
      }
    });

 });

 
 $(document).ready(function(){
  var actions = $("table td:last-child").html();
  // Append table with add row form on add new button click
  // $(".add-new").click(function(){
  //     $(this).attr("disabled", "disabled");
  //     var index = $("table tbody tr:last-child").index();
  //     var row = '<tr>' +
  //         '<td><input type="text" class="form-control" name="name" id="name"></td>' +
  //         '<td><input type="text" class="form-control" name="department" id="department"></td>' +
  //         '<td><input type="text" class="form-control" name="phone" id="phone"></td>' +
  //         '<td>' + actions + '</td>' +
  //     '</tr>';
  //     $("table").append(row);		
  //     $("table tbody tr").eq(index + 1).find(".add, .edit").toggle();
  //     $('[data-toggle="tooltip"]').tooltip();
  // });
  // Add row on add button click
  $(document).on("click", ".add", function(){
      var empty = false;
      var input = $(this).parents("tr").find('input[type="text"]');
      input.each(function(){
          if(!$(this).val()){
              $(this).addClass("error");
              empty = true;
          } else{
              $(this).removeClass("error");
          }
      });
      $(this).parents("tr").find(".error").first().focus();
      if(!empty){
          input.each(function(){
              $(this).parent("td").html($(this).val());
          });			
          $(this).parents("tr").find(".add, .edit").toggle();
          $(".add-new").removeAttr("disabled");
      }		
  });
  // Edit row on edit button click
  $(document).on("click", ".edit", function(){		
      $(this).parents("tr").find("td:not(:last-child)").each(function(){
          $(this).html('<input type="text" class="form-control" value="' + $(this).text() + '">');
      });		
      $(this).parents("tr").find(".add, .edit").toggle();
      $(".add-new").attr("disabled", "disabled");
  });
  // Delete row on delete button click
  $(document).on("click", ".delete", function(){
      $(this).parents("tr").remove();
      $(".add-new").removeAttr("disabled");
  });
});
  

//판매내역 검색
$(document).ready(function() {
    var activeSystemClass = $('.list-group-item.active');

    //something is entered in search form
    $('#system-search').keyup( function() {
       var that = this;
        // affect all table rows on in systems table
        var tableBody = $('.table-list-search tbody');
        var tableRowsClass = $('.table-list-search tbody tr');
        $('.search-sf').remove();
        tableRowsClass.each( function(i, val) {
        
            //Lower text for case insensitive
            var rowText = $(val).text().toLowerCase();
            var inputText = $(that).val().toLowerCase();
            if(inputText != '')
            {
                $('.search-query-sf').remove();
                tableBody.prepend('<tr class="search-query-sf"><td colspan="6"><strong>Searching for: "'
                    + $(that).val()
                    + '"</strong></td></tr>');
            }
            else
            {
                $('.search-query-sf').remove();
            }

            if( rowText.indexOf( inputText ) == -1 )
            {
                //hide rows
                tableRowsClass.eq(i).hide();
                
            }
            else
            {
                $('.search-sf').remove();
                tableRowsClass.eq(i).show();
            }
        });
        //all tr elements are hidden
        if(tableRowsClass.children(':visible').length == 0)
        {
            tableBody.append('<tr class="search-sf"><td class="text-muted" colspan="6">No entries found.</td></tr>');
        }
    });
});

//등록한 도서 수정 모달 띄우기
function showModal(ubookNo) {
	$.ajax({
        type : "POST",
        url : "ubookUpdateForm.ub",
        dataType : 'json',
        data : {ubookNo : ubookNo},
        success : function(data) {
        	console.log("책 번호 보여줘,,,,"+data.ubookNo);
        	$("input[name='ubookNo']").val(data.ubookNo);
        	$("input[name='ubookName']").eq(1).val(data.ubookName);
        	$("input[name='ubookName']").eq(1).val(data.ubookName);
        	$("input[name='ubookWriter']").eq(1).val(data.ubookWriter);
        	$("input[name='ubookIsbn']").eq(1).val(data.ubookIsbn);
        	//$('#ubCategory').val(data.ubCategory).niceSelect('update');
        	$("#ubCategory").eq(1).val(data.ubCategory).attr("selected", true);
        	$("input[name='ubookTrans']").eq(1).val(data.ubookTrans);
        	$("input[name='ubookPub']").eq(1).val(data.ubookPub);
        	var date = new Date(data.ubookPubDate);
        	var year = date.getFullYear();
        	var month = ('0' + (date.getMonth() + 1)).slice(-2);
        	var day = ('0' + date.getDate()).slice(-2);
        	$("input[name='ubookPubDate']").eq(1).val(year+"-"+month+"-"+day);
        	$("input[name='ubookOPrice']").eq(1).val(data.ubookOPrice);
        	$("input[name='ubookPrice']").eq(1).val(data.ubookPrice);
        	$("input[name='ubookStock']").eq(1).val(data.ubookStock);

        	$("#ubookQual").eq(1).val(data.ubookQual).attr("selected", true);
        	//$("select[name='ubookQual']").val(data.ubookQual).attr("selected", "true");//select
        	$("textarea[name='ubookDetail']").eq(1).val(data.ubookDetail);
        	$("textarea[name='ubookContent']").eq(1).val(data.ubookContent);
        	$("input[name='ubookImg']").eq(1).val(data.ubookImg);
        	
	   		 $('#test_cnt_2').html("("+$("textarea[name='ubookDetail']").eq(1).val().length+" / 3600)");
	
	   		 $('#test_cnt1_2').html("("+$("textarea[name='ubookContent']").eq(1).val().length+" / 3600)");
        	$("#exampleModal").modal('show');

        },
        error : function() {
        	alert("너는 뭔가 잘못하고 있따...??????");
        }
    });
}



//이미지 파일 체크
function imgCheck(img,inputId) {
	if(img.files&&img.files[0]){
		var name= img.files[0].name;
		var ext = name.substring(name.length-3,name.length);
		if(!(ext.toUpperCase()=='PNG'||ext.toUpperCase()=='JPG')){
			alert("이미지파일을 확인해주세요. png와 jpg만 가능합니다.")
			$('#'+inputId).val("")


			return;
		}
		const imgFile = new FileReader();
		imgFile.readAsDataURL(img.files[0]);
		imgFile.onload = function(e) {
			const previewUbookImage = document.getElementById("pre"+inputId);
			previewUbookImage.src = e.target.result;
			if(inputId=='ubookImg2'){
				$('#pre'+inputId).css({"width":"200px","height":"300px"});
			}			
		}		   
	}
}
