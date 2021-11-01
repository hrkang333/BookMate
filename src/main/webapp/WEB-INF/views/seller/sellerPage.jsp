<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<!------ 
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.11.1.min.js"></script> ---------->

<!------ Include the above in your HEAD tag ---------->

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>

<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<head>
    <title>[책장메이트] - 판매자 페이지</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/used.css">
    <script type="text/javascript" src="js/seller_page.js"></script>
    <script type="text/javascript" src="js/seller.js"></script>





    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
</head>

<body>
    <!--================ 헤더(로고 + 검색 + 로그인 된 회원) =================-->
    <header class="header_area">
        <div class="main_menu">
            <nav class="navbar navbar-expand-lg navbar-light">
                <div class="container">
                    <!--로고링크-->
                    <a href="index copy.html" class="logo_link">
                        <img src="img/logo1.png" class="logo1">
                    </a>
                    <a href="ubook_main.html" class="logo_link2">
                        <img src="img/logo2.png" class="logo2">
                    </a>
                    <br />
                    <!--검색-->
                    <div class="row justify-content-center searchbar">
                        <div class="col-12 col-md-10 col-lg-8 searchbar">
                            <form class="card card-sm searchbar">
                                <div class="card-body row no-gutters align-items-center">
                                    <!--검색 input-->
                                    <div class="col">
                                        <input class="form-control form-control-lg form-control-borderless"
                                            type="search" placeholder="도서명 혹은 저자를 입력하세요">
                                    </div>
                                    <!--검색버튼-->
                                    <div class="col-auto">
                                        <button class="btn btn-lg searchbtn" type="submit">Search</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <!--로그인 회원정보-->
                    <a href="index copy.html" class="logo_link">
                        <img src="img/logo1.png" class="logo1">
                    </a>
                    <br />
                </div>
            </nav>
        </div>
    </header>
    <!--================ End 헤더 =================-->
    <div class="container bootstrap snippet">
        <div class="row">
            <!--좌측 info-->
            <div class="col-sm-3">
                <!--left col-->
                <div class="text-center">
                </div>
                </hr><br>
                <div class="panel panel-default">
                    <div class="panel-body">
                        <center>
                            <img src="http://ssl.gstatic.com/accounts/ui/avatar_2x.png"
                                class="avatar img-circle img-thumbnail" alt="avatar">
                        </center>
                        <h4>판매자 닉네임</h4>
                        <center>
                            <input style="font-size: 17px; text-align: center;" type="file"
                                class="text-center center-block file-upload">
                        </center>
                    </div>
                    <div class="panel-heading">
                        <h4>구매 만족도 65%</h4>
                    </div>

                </div>
            </div>
            <!--판매자 페이지-->
            <div class="col-sm-9">
                <div class="newsInner">
                    <!--탭 시작-->
                    <div id="tabs">
                        <ul class="tab">
                            <li class="active"><span>판매자 정보관리</span></li>
                            <li><span>도서관리</span></li>
                            <li><span>판매관리</span></li>
                            <li><span>도서문의</span></li>
                        </ul>
                        <!-- 판매자 정보관리 -->
                        <div class="tabContent active">
                            <div class="tabContentInner">
                                <div id="sellerInfo">
                                    <form class="form" action="##" method="post" id="registrationForm">
                                        <div class="form-group sellerForm">
                                            <div class="col-xs-6">
                                                <label>
                                                    <h4>아이디</h4>
                                                </label>
                                                <input type="text" class="form-control" name="sellerId" id="sellerId"
                                                    placeholder="현재 로그인 된 아이디" readonly>
                                            </div>
                                            <div class="col-xs-6">
                                                <label>
                                                    <h4>닉네임</h4>
                                                </label>
                                                <input type="text" class="form-control" name="sellernickn"
                                                    id="sellernickn" placeholder="현재 로그인한 회원의 판매자 닉네임" readonly>
                                            </div>
                                            <div class="col-xs-6">
                                                <br>
                                                <label>
                                                    <h4>이메일</h4>
                                                </label>
                                                <input type="email" class="form-control" name="selleremail"
                                                    id="selleremail" placeholder="you@email.com">
                                            </div>
                                            <div class="col-xs-6">
                                                <br>
                                                <label>
                                                    <h4>핸드폰 번호</h4>
                                                </label>
                                                <input type="text" class="form-control" name="sellerphone"
                                                    id="sellerphone" placeholder="010-0000-0000">
                                            </div>
                                            <div class="col-xs-6">
                                                <br>
                                                <label class="inputlabel">배송비</label>
                                                <br>
                                                <label class="container leftradio2">&nbsp;&nbsp; 기본 : 2600원
                                                    <input class="deleveryChk" type="checkbox" checked="checked"
                                                        name="radio" value="2600">
                                                    <span class="checkmark"></span>
                                                </label>
                                                <label class="container rightradio">&nbsp;&nbsp; 도서산간지역 : 4000원
                                                    <input class="deleveryChk" type="checkbox" checked="checked"
                                                        name="radio" value="4000"> <span class="checkmark"></span>
                                                </label>

                                            </div>
                                            <div class="col-xs-6">
                                                <br>
                                                <label class="inputlabel">배송방법</label>
                                                <br>
                                                <label class="container leftradio">&nbsp;&nbsp; 편의점 택배
                                                    <input type="radio" checked="checked" name="radio" value="conveni">
                                                    <span class="checkmark"></span>
                                                </label>
                                                <label class="container rightradio">&nbsp;&nbsp; 직접 택배 업체 지정
                                                    <input type="radio" name="radio" value="self">
                                                    <span class="checkmark"></span>
                                                </label>
                                            </div>
                                            <div class="col-xs-12">
                                                <br>
                                                <label class="inputlabel">출고지</label>
                                                <br>
                                                <br>
                                                <div class="inputmargin">
                                                    <input id="datainput2" placeholder="" oninput="this.className = ''"
                                                        name="postnumber">
                                                    <button class="postBtn">우편번호 검색</button>
                                                    <br>
                                                    <input id="datainput3" placeholder="상세 주소를 입력해주세요"
                                                        oninput="this.className = ''" name="detailaddress">
                                                </div>
                                            </div>

                                            <div class="col-xs-12">
                                                <br>
                                                <center>
                                                    <button class="btn btn-lg btn-success" type="submit"><i
                                                            class="glyphicon glyphicon-ok-sign"></i>저장</button>
                                                    <button class="btn btn-lg" type="button" data-toggle="modal"
                                                        id="dormancyBtn" data-target="#dormancy">
                                                        <i class="glyphicon glyphicon-remove"></i>
                                                        판매자 휴면 신청</button>
                                                </center>
                                                <!-- 판매자 Modal -->
                                                <div class="modal fade" id="dormancy" tabindex="-1" role="dialog"
                                                    aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                    <div class="modal-dialog" role="document" style="margin-left: 16%;">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h5 class="modal-title" id="exampleModalLabel">판매자 휴면 신청
                                                                </h5>
                                                                <button type="button" class="close" data-dismiss="modal"
                                                                    aria-label="Close">
                                                                    <span aria-hidden="true">×</span>
                                                                </button>
                                                            </div>
                                                            <div class="modal-body">
                                                                <label>
                                                                    <h4>비밀번호 입력</h4>
                                                                </label>
                                                                <input type="password" class="form-control"
                                                                    name="sellerId" id="sellerPwd"
                                                                    placeholder="현재 비밀번호를 입력해주세요">
                                                                <h6>※ 비밀번호를 입력하면 판매자 계정이 휴면 상태로 전환됩니다. <br>
                                                                    언제든 다시 판매자 계정을 복구할 수 있습니다.</h6>

                                                            </div>
                                                            <div class="modal-footer">
                                                                <button type="button" class="btn btn-secondary"
                                                                    data-dismiss="modal">Close</button>
                                                                <button type="button" class="btn btn-primary">Save
                                                                    changes</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <!-- 도서관리 -->
                        <div class="tabContent">
                            <ul class="tab1">
                                <li><span>등록 도서 조회</span></li>
                                <li><span>도서 등록</span></li>
                            </ul>
                            <div class="tabContentInner">
                                <br>
                                <div class="tabContentInner">
                                    <div>
                                        <!-- 등록 도서 조회 -->
                                        <div class="tabContent3 active">
                                            <section class="content">
                                                <h2>등록 도서 조회</h2>
                                                <div class="col-md-offset-2 qnaTable">
                                                    <div class="panel panel-default">
                                                        <div class="panel-body">
                                                            <div class="pull-right">
                                                                <div class="btn-group">
                                                                    <button type="button"
                                                                        class="btn btn-success btn-filter"
                                                                        data-target="pagado">Pagado</button>
                                                                    <button type="button"
                                                                        class="btn btn-warning btn-filter"
                                                                        data-target="pendiente">Pendiente</button>
                                                                    <button type="button"
                                                                        class="btn btn-danger btn-filter"
                                                                        data-target="cancelado">Cancelado</button>
                                                                    <button type="button"
                                                                        class="btn btn-default btn-filter"
                                                                        data-target="all">Todos</button>
                                                                </div>
                                                            </div>
                                                            <div class="table-container">
                                                                <table class="table table-filter">
                                                                    <colgroup>
                                                                        <col width="20px" />
                                                                        <col width="400px" />
                                                                    </colgroup>
                                                                    <tbody>
                                                                        <tr data-status="pagado">
                                                                            <td>
                                                                                <div class="tbNo">
                                                                                    1
                                                                                </div>
                                                                            </td>
                                                                            <td>
                                                                                <div class="media">
                                                                                    <a href="#" class="pull-left">
                                                                                        <img src="img/test.jpg"
                                                                                            class="media-photo">
                                                                                    </a>
                                                                                    <div class="media-body">
                                                                                        <span
                                                                                            class="media-meta pull-right">Febrero
                                                                                            13, 2016</span>
                                                                                        <h4 class="title">
                                                                                            Lorem Impsum
                                                                                            <span
                                                                                                class="pull-right pagado">(Pagado)</span>
                                                                                        </h4>
                                                                                        <p class="summary">Ut enim ad
                                                                                            minim
                                                                                            veniam, quis nostrud
                                                                                            exercitation...
                                                                                        </p>
                                                                                    </div>
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                        <tr data-status="pendiente">
                                                                            <td>
                                                                                <div class="tbNo">
                                                                                    1
                                                                                </div>
                                                                            </td>
                                                                            <td>
                                                                                <div class="media">
                                                                                    <a href="#" class="pull-left">
                                                                                        <img src="img/test.jpg"
                                                                                            class="media-photo">
                                                                                    </a>
                                                                                    <div class="media-body">
                                                                                        <span
                                                                                            class="media-meta pull-right">Febrero
                                                                                            13, 2016</span>
                                                                                        <h4 class="title">
                                                                                            Lorem Impsum
                                                                                            <span
                                                                                                class="pull-right pendiente">(Pendiente)</span>
                                                                                        </h4>
                                                                                        <p class="summary">Ut enim ad
                                                                                            minim
                                                                                            veniam, quis nostrud
                                                                                            exercitation...
                                                                                        </p>
                                                                                    </div>
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                        <tr data-status="cancelado">
                                                                            <td>
                                                                                <div class="tbNo">
                                                                                    1
                                                                                </div>
                                                                            </td>
                                                                            <td>
                                                                                <div class="media">
                                                                                    <a href="#" class="pull-left">
                                                                                        <img src="img/test.jpg"
                                                                                            class="media-photo">
                                                                                    </a>
                                                                                    <div class="media-body">
                                                                                        <span
                                                                                            class="media-meta pull-right">Febrero
                                                                                            13, 2016</span>
                                                                                        <h4 class="title">
                                                                                            Lorem Impsum
                                                                                            <span
                                                                                                class="pull-right cancelado">(Cancelado)</span>
                                                                                        </h4>
                                                                                        <p class="summary">Ut enim ad
                                                                                            minim
                                                                                            veniam, quis nostrud
                                                                                            exercitation...
                                                                                        </p>
                                                                                    </div>
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                        <tr data-status="pagado" class="selected">
                                                                            <td>
                                                                                <div class="tbNo">
                                                                                    1
                                                                                </div>
                                                                            </td>
                                                                            <td>
                                                                                <div class="media">
                                                                                    <a href="#" class="pull-left">
                                                                                        <img src="img/test.jpg"
                                                                                            class="media-photo">
                                                                                    </a>
                                                                                    <div class="media-body">
                                                                                        <span
                                                                                            class="media-meta pull-right">Febrero
                                                                                            13, 2016</span>
                                                                                        <h4 class="title">
                                                                                            Lorem Impsum
                                                                                            <span
                                                                                                class="pull-right pagado">(Pagado)</span>
                                                                                        </h4>
                                                                                        <p class="summary">Ut enim ad
                                                                                            minim
                                                                                            veniam, quis nostrud
                                                                                            exercitation...
                                                                                        </p>
                                                                                    </div>
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                        <tr data-status="pendiente">
                                                                            <td>
                                                                                <div class="tbNo">
                                                                                    1
                                                                                </div>
                                                                            </td>
                                                                            <td>
                                                                                <div class="media">
                                                                                    <a href="#" class="pull-left">
                                                                                        <img src="img/test.jpg"
                                                                                            class="media-photo">
                                                                                    </a>
                                                                                    <div class="media-body">
                                                                                        <span
                                                                                            class="media-meta pull-right">Febrero
                                                                                            13, 2016</span>
                                                                                        <h4 class="title">
                                                                                            Lorem Impsum
                                                                                            <span
                                                                                                class="pull-right pendiente">(Pendiente)</span>
                                                                                        </h4>
                                                                                        <p class="summary">Ut enim ad
                                                                                            minim
                                                                                            veniam, quis nostrud
                                                                                            exercitation...
                                                                                        </p>
                                                                                    </div>
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </section>
                                        </div>
                                        <!-- 도서 등록 -->
                                        <div class="tabContent3">
                                            <div class="container2" id="sell_book">
                                                <div class="row2">
                                                    <h2>도서 등록</h2>
                                                    <table class="table table-bordered success">
                                                        <colgroup>
                                                            <col width="100px" />
                                                            <col width="400px" />
                                                        </colgroup>
                                                        <thead>
                                                            <tr>
                                                                <th class="info">도서명</th>
                                                                <td><input class="usedBookInfo" name="ubName"
                                                                        placeholder="도서명을 입력해주세요"></td>
                                                            </tr>
                                                            <tr>
                                                                <th class="info">저자(지은이)</th>
                                                                <td><input class="usedBookInfo" name="ubWriter"
                                                                        placeholder="저자를 입력해주세요"></td>
                                                            </tr>
                                                            <tr>
                                                                <th class="info">ISBN</th>
                                                                <td><input class="usedBookInfo" name="ubIsbn"
                                                                        placeholder="도서의 ISBN을 입력해주세요(- 없이)"></td>
                                                            </tr>
                                                            <tr>
                                                                <th class="info">카테고리</th>
                                                                <td>
                                                                    <select id="bookCate" name="bookCate"
                                                                        class="form-control">
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
                                                                    </select>
                                                                </td>
                                                            </tr>

                                                            <tr>
                                                                <th class="info">역자</th>
                                                                <td><input class="usedBookInfo" name="ubTrans"
                                                                        placeholder="역자를 입력해주세요"></td>
                                                            </tr>
                                                            <tr>
                                                                <th class="info">출판사</th>
                                                                <td><input class="usedBookInfo" name="ubPub"
                                                                        placeholder="출판사를 입력해주세요"></td>
                                                            </tr>
                                                            <tr>
                                                                <th class="info">출판일</th>
                                                                <td><input class="usedBookInfo" name="ubPubDate"
                                                                        placeholder="출판일을 입력해주세요"></td>
                                                            </tr>
                                                            <tr>
                                                                <th valign="top" class="info">정가</th>
                                                                <td><input class="usedBookInfo" name="ubOPrice"
                                                                        placeholder="정가를 입력해주세요"></td>
                                                            </tr>
                                                            <tr>
                                                                <th class="info">판매가</th>
                                                                <td><input class="usedBookInfo" name="ubPrice"
                                                                        placeholder="판매가를 입력해주세요"></td>
                                                            </tr>
                                                            <tr>
                                                                <th class="info">재고수량</th>
                                                                <td><input class="usedBookInfo" name="ubStock"
                                                                        placeholder="재고수량을 입력해주세요"></td>
                                                            </tr>

                                                            <tr>
                                                                <th class="info">도서 품질</th>
                                                                <td>
                                                                    <select id="bookQual" name="ubQual"
                                                                        class="form-control">
                                                                        <option value="" selected>== 도서 품질 선택 ==
                                                                        </option>
                                                                        <option value="S">S</option>
                                                                        <option value="A">A</option>
                                                                        <option value="B">B</option>
                                                                        <option value="C">C</option>
                                                                        <option value="D">D</option>
                                                                    </select>
                                                                </td>
                                                            </tr>

                                                            <tr>
                                                                <th class="info">도서 상세</th>
                                                                <td>
                                                                    <textarea name="ubDetail" id="bookdetail" cols="54"
                                                                        rows="10"
                                                                        placeholder="도서의 줄거리, 도서 품질 상세 정보 등을 입력해주세요"></textarea>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <th class="info">도서 이미지</th>
                                                                <td>
                                                                    <input type="file"
                                                                        class="text-center center-block file-upload">
                                                                </td>
                                                            </tr>
                                                        </thead>
                                                    </table>
                                                    <center>
                                                        <input type="submit" id="approve_btn" class="btn btn-info"
                                                            name="approve_btn" value="등록하기">
                                                        <input type="button" id="approve_btn" class="btn btn-warning"
                                                            name="approve_btn" value="취소하기">
                                                    </center>
                                                    <br><br>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- 판매관리 -->
                        <div class="tabContent">
                            <ul class="tab2">
                                <li><span>주문현황</span></li>
                                <li><span>배송관리</span></li>
                                <li><span>판매내역</span></li>
                            </ul>
                            <div class="tabContentInner">
                                <br>
                                <div class="tabContentInner">
                                    <div class="miniTab">
                                        <!-- 주문현황 -->
                                        <div class="tabContent2 active">
                                            <div class="container">
                                                <h2>주문현황</h2>
                                                <div class="table-wrapper2">
                                                    <table class="table table-bordered tbtxtAlign">
                                                        <colgroup>
                                                            <col width="15%" />
                                                            <col width="12%" />
                                                            <col width="20%" />
                                                            <col width="15%" />
                                                            <col width="15%" />
                                                            <col width="15%" />
                                                            <col width="17%" />
                                                        </colgroup>
                                                        <thead>
                                                            <tr>
                                                                <th>주문번호</th>
                                                                <th>주문자</th>
                                                                <th style="text-align: center;">상품명</th>
                                                                <th>주문수량</th>
                                                                <th>주문금액</th>
                                                                <th>주문상태</th>
                                                                <th>수정/삭제</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <tr>
                                                                <td>12313</td>
                                                                <td>김유미</td>
                                                                <td>워드프로세서 실기</td>
                                                                <td>1</td>
                                                                <td>9000</td>
                                                                <td>
                                                                    <select class="form-control select_v" id="test"
                                                                        name="test" onchange="">
                                                                        <option value="0" ${test=='0'
                                                                            ? 'selected="selected"' : '' }>해지
                                                                        </option>
                                                                        <option value="1" ${test=='1'
                                                                            ? 'selected="selected"' : '' }>진행
                                                                        </option>
                                                                        <option value="2" ${test=='2'
                                                                            ? 'selected="selected"' : '' }>완료
                                                                        </option>
                                                                    </select>
                                                                </td>
                                                                <td>
                                                                    <a class="add" title="Add" data-toggle="tooltip"><i
                                                                            class="material-icons"></i></a>
                                                                    <a class="edit" title="Edit"
                                                                        data-toggle="tooltip"><i
                                                                            class="material-icons"></i></a>
                                                                    <a class="delete" title="Delete"
                                                                        data-toggle="tooltip"><i
                                                                            class="material-icons"></i></a>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>12313</td>
                                                                <td>김유미</td>
                                                                <td>워드프로세서 실기</td>
                                                                <td>1</td>
                                                                <td>15000</td>
                                                                <td>
                                                                    <form>
                                                                        <select class="form-control select_v" id="test"
                                                                            name="test" onchange="">
                                                                            <option value="0" ${test=='0'
                                                                                ? 'selected="selected"' : '' }>해지
                                                                            </option>
                                                                            <option value="1" ${test=='1'
                                                                                ? 'selected="selected"' : '' }>진행
                                                                            </option>
                                                                            <option value="2" ${test=='2'
                                                                                ? 'selected="selected"' : '' }>완료
                                                                            </option>
                                                                        </select>
                                                                    </form>
                                                                </td>
                                                                <td>
                                                                    <a class="add" title="Add" data-toggle="tooltip"><i
                                                                            class="material-icons"></i></a>
                                                                    <a class="edit" title="Edit"
                                                                        data-toggle="tooltip"><i
                                                                            class="material-icons"></i></a>
                                                                    <a class="delete" title="Delete"
                                                                        data-toggle="tooltip"><i
                                                                            class="material-icons"></i></a>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>12313</td>
                                                                <td>김유미</td>
                                                                <td>워드프로세서 실기</td>
                                                                <td>1</td>
                                                                <td>9000</td>
                                                                <td>
                                                                    <form>
                                                                        <select class="form-control select_v" id="test"
                                                                            name="test" onchange="">
                                                                            <option value="0" ${test=='0'
                                                                                ? 'selected="selected"' : '' }>해지
                                                                            </option>
                                                                            <option value="1" ${test=='1'
                                                                                ? 'selected="selected"' : '' }>진행
                                                                            </option>
                                                                            <option value="2" ${test=='2'
                                                                                ? 'selected="selected"' : '' }>완료
                                                                            </option>
                                                                        </select>
                                                                    </form>
                                                                </td>
                                                                <td>
                                                                    <a class="add" title="Add" data-toggle="tooltip"><i
                                                                            class="material-icons"></i></a>
                                                                    <a class="edit" title="Edit"
                                                                        data-toggle="tooltip"><i
                                                                            class="material-icons"></i></a>
                                                                    <a class="delete" title="Delete"
                                                                        data-toggle="tooltip"><i
                                                                            class="material-icons"></i></a>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- 배송관리 -->
                                        <div class="tabContent2">
                                            <div class="container">
                                                <h2>배송관리</h2>
                                                <div class="table-wrapper2">
                                                    <table class="table table-bordered tbtxtAlign">
                                                        <colgroup>
                                                            <col width="15%" />
                                                            <col width="12%" />
                                                            <col width="20%" />
                                                            <col width="15%" />
                                                            <col width="15%" />
                                                            <col width="15%" />
                                                            <col width="17%" />
                                                        </colgroup>
                                                        <thead>
                                                            <tr>
                                                                <th>주문번호</th>
                                                                <th>주문자</th>
                                                                <th style="text-align: center;">상품명</th>
                                                                <th>주문수량</th>
                                                                <th>주문금액</th>
                                                                <th>주문상태</th>
                                                                <th>수정/삭제</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <tr>
                                                                <td>12313</td>
                                                                <td>김유미</td>
                                                                <td>워드프로세서 실기</td>
                                                                <td>1</td>
                                                                <td>9000</td>
                                                                <td>
                                                                    <select class="form-control select_v" id="test"
                                                                        name="test" onchange="">
                                                                        <option value="0" ${test=='0'
                                                                            ? 'selected="selected"' : '' }>해지
                                                                        </option>
                                                                        <option value="1" ${test=='1'
                                                                            ? 'selected="selected"' : '' }>진행
                                                                        </option>
                                                                        <option value="2" ${test=='2'
                                                                            ? 'selected="selected"' : '' }>완료
                                                                        </option>
                                                                    </select>
                                                                </td>
                                                                <td>
                                                                    <a class="add" title="Add" data-toggle="tooltip"><i
                                                                            class="material-icons"></i></a>
                                                                    <a class="edit" title="Edit"
                                                                        data-toggle="tooltip"><i
                                                                            class="material-icons"></i></a>
                                                                    <a class="delete" title="Delete"
                                                                        data-toggle="tooltip"><i
                                                                            class="material-icons"></i></a>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>12313</td>
                                                                <td>김유미</td>
                                                                <td>워드프로세서 실기</td>
                                                                <td>1</td>
                                                                <td>15000</td>
                                                                <td>
                                                                    <form>
                                                                        <select class="form-control select_v" id="test"
                                                                            name="test" onchange="">
                                                                            <option value="0" ${test=='0'
                                                                                ? 'selected="selected"' : '' }>해지
                                                                            </option>
                                                                            <option value="1" ${test=='1'
                                                                                ? 'selected="selected"' : '' }>진행
                                                                            </option>
                                                                            <option value="2" ${test=='2'
                                                                                ? 'selected="selected"' : '' }>완료
                                                                            </option>
                                                                        </select>
                                                                    </form>
                                                                </td>
                                                                <td>
                                                                    <a class="add" title="Add" data-toggle="tooltip"><i
                                                                            class="material-icons"></i></a>
                                                                    <a class="edit" title="Edit"
                                                                        data-toggle="tooltip"><i
                                                                            class="material-icons"></i></a>
                                                                    <a class="delete" title="Delete"
                                                                        data-toggle="tooltip"><i
                                                                            class="material-icons"></i></a>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>12313</td>
                                                                <td>김유미</td>
                                                                <td>워드프로세서 실기</td>
                                                                <td>1</td>
                                                                <td>9000</td>
                                                                <td>
                                                                    <form>
                                                                        <select class="form-control select_v" id="test"
                                                                            name="test" onchange="">
                                                                            <option value="0" ${test=='0'
                                                                                ? 'selected="selected"' : '' }>해지
                                                                            </option>
                                                                            <option value="1" ${test=='1'
                                                                                ? 'selected="selected"' : '' }>진행
                                                                            </option>
                                                                            <option value="2" ${test=='2'
                                                                                ? 'selected="selected"' : '' }>완료
                                                                            </option>
                                                                        </select>
                                                                    </form>
                                                                </td>
                                                                <td>
                                                                    <a class="add" title="Add" data-toggle="tooltip"><i
                                                                            class="material-icons"></i></a>
                                                                    <a class="edit" title="Edit"
                                                                        data-toggle="tooltip"><i
                                                                            class="material-icons"></i></a>
                                                                    <a class="delete" title="Delete"
                                                                        data-toggle="tooltip"><i
                                                                            class="material-icons"></i></a>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- 판매내역 -->
                                        <div class="tabContent2">
                                            <div class="container">
                                                <h2>판매내역</h2>
                                                <!-- 판매내역 검색 -->
                                                <div class="col-md-3 tab_search">
                                                    <form action="#" method="get">
                                                        <div class="input-group">
                                                            <input class="form-control" id="system-search" name="q"
                                                                placeholder="Search for" required>
                                                            <span class="input-group-btn">
                                                                <button type="submit" class="btn btn-default"
                                                                    style="height: 50px;">
                                                                    <i class="glyphicon glyphicon-search"></i>
                                                                </button>
                                                            </span>
                                                        </div>
                                                    </form>
                                                </div>
                                                <br>
                                                <br>
                                                <!-- 판매내역 table -->
                                                <div class="col-md-9 sellTb">
                                                    <table class="table table-list-search tbtxtAlign">
                                                        <colgroup>
                                                            <col width="15%" />
                                                            <col width="20%" />
                                                            <col width="30%" />
                                                            <col width="15%" />
                                                            <col width="20%" />
                                                        </colgroup>
                                                        <thead>
                                                            <tr>
                                                                <th>주문번호</th>
                                                                <th>주문자</th>
                                                                <th>도서명</th>
                                                                <th>수량</th>
                                                                <th>진행상황</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <tr>
                                                                <td>Sample</td>
                                                                <td>Filter</td>
                                                                <td>12-11-2011 11:11</td>
                                                                <td>OK</td>
                                                                <td>123</td>
                                                            </tr>
                                                            <tr>
                                                                <td>Try</td>
                                                                <td>It</td>
                                                                <td>11-20-2013 08:56</td>
                                                                <td>It</td>
                                                                <td>Works</td>
                                                            </tr>
                                                            <tr>
                                                                <td>§</td>
                                                                <td>$</td>
                                                                <td>%</td>
                                                                <td>&</td>
                                                                <td>/</td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- 도서문의 -->
                        <div class="tabContent">
                            <section class="content">
                                <h2>도서 문의 내역</h2>
                                <div class="col-md-offset-2 qnaTable">
                                    <div class="panel panel-default">
                                        <div class="panel-body">
                                            <div class="pull-right">
                                                <div class="btn-group">
                                                    <button type="button" class="btn btn-success btn-filter"
                                                        data-target="pagado">Pagado</button>
                                                    <button type="button" class="btn btn-warning btn-filter"
                                                        data-target="pendiente">Pendiente</button>
                                                    <button type="button" class="btn btn-danger btn-filter"
                                                        data-target="cancelado">Cancelado</button>
                                                    <button type="button" class="btn btn-default btn-filter"
                                                        data-target="all">Todos</button>
                                                </div>
                                            </div>
                                            <div class="table-container">
                                                <table class="table table-filter">
                                                    <colgroup>
                                                        <col width="20px" />
                                                        <col width="400px" />
                                                    </colgroup>
                                                    <tbody>
                                                        <tr data-status="pagado">
                                                            <td>
                                                                <div class="tbNo">
                                                                    1
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="media">
                                                                    <div class="media-body">
                                                                        <span class="media-meta pull-right">Febrero
                                                                            13, 2016</span>
                                                                        <h4 class="title">
                                                                            Lorem Impsum
                                                                            <span
                                                                                class="pull-right pagado">(Pagado)</span>
                                                                        </h4>
                                                                        <p class="summary">Ut enim ad minim
                                                                            veniam, quis nostrud exercitation...
                                                                        </p>
                                                                    </div>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr data-status="pendiente">
                                                            <td>
                                                                <div class="tbNo">
                                                                    1
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="media">
                                                                    <div class="media-body">
                                                                        <span class="media-meta pull-right">Febrero
                                                                            13, 2016</span>
                                                                        <h4 class="title">
                                                                            Lorem Impsum
                                                                            <span
                                                                                class="pull-right pendiente">(Pendiente)</span>
                                                                        </h4>
                                                                        <p class="summary">Ut enim ad minim
                                                                            veniam, quis nostrud exercitation...
                                                                        </p>
                                                                    </div>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr data-status="cancelado">
                                                            <td>
                                                                <div class="tbNo">
                                                                    1
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="media">
                                                                    <div class="media-body">
                                                                        <span class="media-meta pull-right">Febrero
                                                                            13, 2016</span>
                                                                        <h4 class="title">
                                                                            Lorem Impsum
                                                                            <span
                                                                                class="pull-right cancelado">(Cancelado)</span>
                                                                        </h4>
                                                                        <p class="summary">Ut enim ad minim
                                                                            veniam, quis nostrud exercitation...
                                                                        </p>
                                                                    </div>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr data-status="pagado" class="selected">
                                                            <td>
                                                                <div class="tbNo">
                                                                    1
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="media">
                                                                    <div class="media-body">
                                                                        <span class="media-meta pull-right">Febrero
                                                                            13, 2016</span>
                                                                        <h4 class="title">
                                                                            Lorem Impsum
                                                                            <span
                                                                                class="pull-right pagado">(Pagado)</span>
                                                                        </h4>
                                                                        <p class="summary">Ut enim ad minim
                                                                            veniam, quis nostrud exercitation...
                                                                        </p>
                                                                    </div>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr data-status="pendiente">
                                                            <td>
                                                                <div class="tbNo">
                                                                    1
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="media">
                                                                    <div class="media-body">
                                                                        <span class="media-meta pull-right">Febrero
                                                                            13, 2016</span>
                                                                        <h4 class="title">
                                                                            Lorem Impsum
                                                                            <span
                                                                                class="pull-right pendiente">(Pendiente)</span>
                                                                        </h4>
                                                                        <p class="summary">Ut enim ad minim
                                                                            veniam, quis nostrud exercitation...
                                                                        </p>
                                                                    </div>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </section>
                        </div>
                    </div>
                    <!--tabs end-->
                </div>
            </div>
            <!--탭 이동-->
            <script>
                // tab menu
                $(".tab li").click(function () {
                    var num = $(".tab li").index(this);
                    $(".tabContent").removeClass('active');
                    $(".tabContent").eq(num).addClass('active');
                    $(".tab li").removeClass('active');
                    $(this).addClass('active')
                });

                $(".tab1 li").click(function () {
                    var num = $(".tab1 li").index(this);
                    $(".tabContent3").removeClass('active');
                    $(".tabContent3").eq(num).addClass('active');
                    $(".tab1 li").removeClass('active');
                    $(this).addClass('active')
                });

                $(".tab2 li").click(function () {
                    var num = $(".tab2 li").index(this);
                    $(".tabContent2").removeClass('active');
                    $(".tabContent2").eq(num).addClass('active');
                    $(".tab2 li").removeClass('active');
                    $(this).addClass('active')
                });

            </script>

        </div>
        <!--/col-9-->
    </div>
    <!--/row-->

    <!--================ Start footer Area  =================-->
    <footer class="footer">
        <div class="footer-area">
            <div class="container">
                <div class="row section_gap">
                    <div class="col-lg-3 col-md-6 col-sm-6">
                        <div class="single-footer-widget tp_widgets">
                            <h4 class="footer_title large_title">Our Mission</h4>
                            <p>
                                So seed seed green that winged cattle in. Gathering thing made fly you're no
                                divided deep moved us lan Gathering thing us land years living.
                            </p>
                            <p>
                                So seed seed green that winged cattle in. Gathering thing made fly you're no divided
                                deep moved
                            </p>
                        </div>
                    </div>
                    <div class="offset-lg-1 col-lg-2 col-md-6 col-sm-6">
                        <div class="single-footer-widget tp_widgets">
                            <h4 class="footer_title">Quick Links</h4>
                            <ul class="list">
                                <li><a href="#">Home</a></li>
                                <li><a href="#">Shop</a></li>
                                <li><a href="#">Blog</a></li>
                                <li><a href="#">Product</a></li>
                                <li><a href="#">Brand</a></li>
                                <li><a href="#">Contact</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-6 col-sm-6">
                        <div class="single-footer-widget instafeed">
                            <h4 class="footer_title">Gallery</h4>
                            <ul class="list instafeed d-flex flex-wrap">
                                <li><img src="img/gallery/r1.jpg" alt=""></li>
                                <li><img src="img/gallery/r2.jpg" alt=""></li>
                                <li><img src="img/gallery/r3.jpg" alt=""></li>
                                <li><img src="img/gallery/r5.jpg" alt=""></li>
                                <li><img src="img/gallery/r7.jpg" alt=""></li>
                                <li><img src="img/gallery/r8.jpg" alt=""></li>
                            </ul>
                        </div>
                    </div>
                    <div class="offset-lg-1 col-lg-3 col-md-6 col-sm-6">
                        <div class="single-footer-widget tp_widgets">
                            <h4 class="footer_title">Contact Us</h4>
                            <div class="ml-40">
                                <p class="sm-head">
                                    <span class="fa fa-location-arrow"></span>
                                    Head Office
                                </p>
                                <p>123, Main Street, Your City</p>

                                <p class="sm-head">
                                    <span class="fa fa-phone"></span>
                                    Phone Number
                                </p>
                                <p>
                                    +123 456 7890 <br>
                                    +123 456 7890
                                </p>

                                <p class="sm-head">
                                    <span class="fa fa-envelope"></span>
                                    Email
                                </p>
                                <p>
                                    free@infoexample.com <br>
                                    www.infoexample.com
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer-bottom">
            <div class="container">
                <div class="row d-flex">
                    <p class="col-lg-12 footer-text text-center">
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                        Copyright &copy;
                        <script>document.write(new Date().getFullYear());</script> All rights reserved | This template
                        is made with
                        <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com"
                            target="_blank">Colorlib</a>
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                    </p>
                </div>
            </div>
        </div>
    </footer>
    <!--================ End footer Area  =================-->
</body>

</html>