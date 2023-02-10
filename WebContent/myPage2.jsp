<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Page</title>
<style type="text/css">
 body {
        margin:20px auto;
        padding: 0;
        font-family:"맑은 고딕";
        font-size:0.9em;
}
    ul#navi {
        width: 200px;
        text-indent: 10px;
}
    ul#navi, ul#navi ul {
        margin:0;
        padding:0;
        list-style:none;
}
    li.group {
        margin-bottom: 3px;
}
    li.group div.title {
        height: 35px;
        line-height: 35px;
        background:#9ab92e;
        cursor:pointer;
}
	
</style>
</head>
<body>
<div id="page">
<header>
	<h2 style="text-align: center;">술공장</h2>
</header>
<!--  -->
	<main>
		<h3>마이페이지</h3>
	
	
    <ul id="navi">
        <li class="group">
            <div class="title">My 쇼핑</div>
            <ul class="sub">
                <li><a href="#">구매 내역/리뷰 작성</a></li>
                <li><a href="#">장바구니</a></li>
                <li><a href="#">취소/반품/교환/환불내역</a></li>
            </ul>
        </li>
        <li class="group">
            <div class="title">MY 정보</div>
            <ul class="sub">
                <li><a href="#">개인정보확인 수정</a></li>                
                <li><a href="#">결제수단</a></li>                
                <li><a href="#">배송지관리</a></li>                
            </ul>
        </li>
           
    </ul>
    <h3>구매내역</h3>
    <table border="1">
<tr>
   <td>주문번호</td>
   <td>상품명</td>
   <td>결재 방법</td>
   <td>주문금액</td>
   <td>주문상태</td>
   <td>주문일시</td>
   <td>운송장번호</td>
</tr>
	
</table>
    
    </main>
</div>
</body>
</html>