<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>[책장메이트] - 판매자 가입</title>
  <script type="text/javascript" src="resources/js/seller.js"></script>
</head>

<body>
 	<jsp:include page="../ubook/ubookMenu.jsp"/>



  <!--================ 바디 =================-->
  <div class="mycontainer">
    <div class="row">

      <!--================ 좌측 사이드바(도서 카테고리 선택) =================-->
      <div class="col-xl-3 col-lg-4 col-md-5">
        <div class="sidebar-categories">
          <div class="head category">Browse Categories</div>
          <div class="categorybody">Browse Categories</div>
          <div class="categorybody">Browse Categories</div>
          <div class="categorybody">Browse Categories</div>
          <div class="categorybody">Browse Categories</div>
          <div class="categorybody">Browse Categories</div>
          <div class="categorybody">Browse Categories</div>
          <div class="categorybody">Browse Categories</div>
          <div class="categorybody">Browse Categories</div>
          <div class="categorybody">Browse Categories</div>
          <div class="categorybody">Browse Categories</div>
          <!--background-color: #c9ae9c;-->
        </div>
      </div>
      <!--================ End 좌측 사이드바(도서 카테고리 선택) =================-->

      <!--================ 메인 Content =================-->
      <div class="col-xl-9 col-lg-8 col-md-7 maincon">
        <!--================ 메인 Content 헤더 =================-->
        <nav id="header" class="maintab">
          <div id="header-container" class="container navbar-container">
            <div class="navbar-header">
              <h2 class="signuptitle">책장메이트 판매자 가입</h2>
            </div>
          </div>
        </nav>
        <main class="site-main sellerCon">
          <!--================ 판매자 가입 폼 =================-->
          <div class="container mt-5">
            <div class="row d-flex justify-content-center align-items-center">
              <div class="col-md-12 regForm">
                <!--================ 메인 Content 헤더 =================-->
                <div class="all-steps" id="all-steps">
                  <span class="step"></span>
                  <span class="step"></span>
                  <span class="step"></span>
                </div>
 
                <!--================ 판매자 이용약관 동의 =================-->
                <div class="tab">
                  <h1 id="register">책장메이트 판매자 이용약관 동의</h1>
                  <br><br>
                  <div class="form-group">
                    <label class="container-checkbox">
                      책장메이트 이용약관을 모두 읽었으며 이에 동의합니다.
                      <input class="chk" type="checkbox" checked="checked" required>
                      <span class="checkmark-box"></span>
                    </label>
                  </div>
                  <textarea style="resize: none;" class="txtarea">
                    책장메이트 이용약관
                    1. 책구메이트 회원은 ~~~~~
                    ~~~~~~~~~~~
                    ~~~~~~~~~~
                    ㅇ
                    ㅇ
                    ㅇ
                    ㅇ
                    ㅇ
                    ㅇ
                    ㅇ
                    </textarea>
                  <br>
                  <br>
                  <div class="form-group">
                    <label class="container-checkbox">
                      책장메이트 판매자 가입 약관을 모두 읽었으며 이에 동의합니다.
                      <input class="chk" type="checkbox" checked="checked" required>
                      <span class="checkmark-box"></span>
                    </label>
                  </div>
                  <textarea style="resize: none;" class="txtarea">
                      책장메이트 이용약관
                      1. 책구메이트 회원은 ~~~~~
                      ~~~~~~~~~~~
                      ~~~~~~~~~~
                      ㅇ
                      ㅇ
                      ㅇ
                      ㅇ
                      ㅇ
                      ㅇ
                      ㅇ
                  </textarea>
                  <br>
                  <br>
                </div>
                <!--================ 판매자 정보입력 =================-->
                <form id="sellerRegForm" action="insertSeller.se">
                  <div class="tab">
                    <h1 id="register">책장메이트 판매자 정보입력</h1>
                    <br>
                    <h3>판매자 정보 입력</h3><br>
                    <label>판매자 아이디</label>
                    <input id="datainput" value="${ sessionScope.loginUser.userId }" readonly name="sellerId">
                    <br><br>
                    <label>판매자 닉네임</label>
                    <input id="datainput" placeholder="사용하실 닉네임을 입력해주세요" oninput="this.className = ''" name="sellerNickN">
                    <br><br>
                    <label>판매자 이메일</label>
                    <input id="datainput" placeholder="이메일을 입력해주세요" oninput="this.className = ''" name="sellerEmail">
                    <br><br>
                    <label>판매자 핸드폰</label>
                    <input id="datainput" placeholder="핸드폰 번호를 입력해주세요 (010-0000-0000)" oninput="this.className = ''" name="sellerPhone">
                    <button class="phoneChkbtn">번호 인증</button>
                    <br><br>
                    <hr>
                    <h3>판매자 배송정보 입력</h3><br>
                    <label class="inputlabel">배송방법</label>
                    <label class="container leftradio">&nbsp;&nbsp; 편의점 택배
                      <input type="radio" checked="checked" name="sellerDel" value="conveni">
                      <span class="checkmark"></span>
                    </label>
                    <label class="container rightradio">&nbsp;&nbsp; 직접 택배 업체 지정
                       <input type="radio" name="sellerDel" value="self">
                       <span class="checkmark"></span>
                    </label>
                    <br><br>
                    <label class="inputlabel">배송비</label>
                    <label class="container leftradio2">&nbsp;&nbsp; 기본 : 2600원
                      <input class="deleveryChk" type="checkbox" checked="checked" name="sellerDelP1" value="2600">
                      <span class="checkmark"></span>
                    </label>
                    <label class="container rightradio">&nbsp;&nbsp; 도서산간지역 : 4000원
                      <input class="deleveryChk" type="checkbox" checked="checked" name="sellerDelP2" value="4000"> <span class="checkmark"></span> </label>
                    <br><br>
                    <label class="inputlabel">출고지</label>
                    <input id="datainput2" placeholder=""
                      oninput="this.className = ''" name="post"><button class="postBtn">우편번호 검색</button>
                    <br><br>
                    <input id="datainput3" placeholder="도로명 주소" oninput="this.className = ''"
                      name="detailaddress1">
                    <input id="datainput3" placeholder="상세 주소를 입력해주세요" oninput="this.className = ''"
                      name="detailaddress2">
                    <br><br>
                  </div>
                  <div class="thanks-message text-center" id="text-message"> <img src="https://i.imgur.com/O18mJ1K.png"
                      width="100" class="mb-4">
                    <h3>판매자 가입 성공!</h3>
                    <br>
                    <span>책장메이트에서 판매자로 활동을 시작해보세요</span>
                  </div>
                  <br><br>
                  <div style="overflow:auto;" id="nextprevious">
                    <center>
                      <button type="button" id="prevBtn" onclick="nextPrev(-1)">Previous</button>
                      <button type="button" id="nextBtn" onclick="nextPrev(1)">Next</button>
                    </center>
                  </div>
                </form>
              </div>
            </div>
          </div>
          <br>
          <br>

        </main>
      </div>
    </div>
  </div>


 	<jsp:include page="../common/footer.jsp"/>
</body>

</html>