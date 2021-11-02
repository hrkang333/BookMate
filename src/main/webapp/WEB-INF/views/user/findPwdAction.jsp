<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width-device-width,initial-scale=1">
<title>아이디 찾기</title>

    <link rel="icon" href="resources/img/Fevicon.png" type="image/png">
  <link rel="stylesheet" href="resources/vendors/bootstrap/bootstrap.min.css">
  <link rel="stylesheet" href="resources/vendors/fontawesome/css/all.min.css">
   <link rel="stylesheet" href="resources/vendors/themify-icons/themify-icons.css">
  <link rel="stylesheet" href="resources/vendors/nice-select/nice-select.css">
  <link rel="stylesheet" href="resources/vendors/owl-carousel/owl.theme.default.min.css">
  <link rel="stylesheet" href="resources/vendors/owl-carousel/owl.carousel.min.css">

  <link rel="stylesheet" href="resources/css/style.css">
</head>

<body >
 <jsp:include page="../common/menubar.jsp"/>

	<section class="login_box_area section-margin">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">


	<div class = "col-md-12 form-group" style="margin:auto;text-align:center;padding-top:50px;">
	<div class = "col-md-12 form-group" style="margin:auto;text-align:center;padding-top:110px;">
	<span class="col-md-12 form-group" style="font-size: 20px;" >비밀번호 찾기 결과<br><br>
	<h5>
		${findPwd }
	</h5>
	</div>
	</div>
	
	
	</div>
	</div>
	</div>
	</section>
		   	<jsp:include page="../common/footer.jsp"/>
	
</body>
</html>