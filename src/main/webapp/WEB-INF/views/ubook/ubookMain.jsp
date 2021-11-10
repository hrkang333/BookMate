<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>[책장메이트] 책장메이트 메인</title>

</head>

<body style="width: 1200px; margin: auto;">
 	<jsp:include page="../ubook/ubookMenu.jsp"/>

  <!--================ 바디 =================-->
  <div class="mycontainer" style="width: 100% !important; padding:0px 0px 0px 0px !important; margin:0px 0px 0px 0px !important;">
    <div class="row">
 	<jsp:include page="../ubook/ubookCategory.jsp"/>

    </div>
  </div>
 	<jsp:include page="../common/footer.jsp"/>
</body>

</html>