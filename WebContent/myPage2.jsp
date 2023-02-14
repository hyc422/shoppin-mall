<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ include file="top.jsp" %>
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
    text-indent: 15px;
    position: fixed;
}
ul#navi, ul#navi ul {
    margin:0;
    padding:0;
    list-style:none;
}
li.group {
    margin-bottom: 4px;
}
li.group div.title {
    height: 35px;
    line-height: 35px;
    background-color: #BDBDBD;
    cursor:pointer;
}
body {
    display: block;
    margin: 20px;
    
}
body {
    -webkit-text-size-adjust: none;
    font-family: dotum,sans-serif;
    font-size: 16px;
    line-height: 1.6;
    color: #666;
}	
.usermodify {
    position: relative;
}

input, textarea, select, button {
    font-family: sans-serif;
    font-size: 100%;
}
.usermodify{
    padding-left: 150px;
	margin-left: 300px;
}
h2{
    padding-right: 300px;
    margin: 40px;
   margin-top: 1px;
}
table{
       width: auto;
    border: 1px solid #bfbfbf;
}
td {
    border: 1px solid #bfbfbf;
    padding :10px;
  }
  tr > td:first-child {
	color: #000000;
}
	
	
</style>

</head>
<body>
<div id="page">
<hr>
<!--  -->
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
                <li><a href="update.jsp">개인정보확인 수정</a></li>                
                <li><a href="#">결제수단</a></li>                
                <li><a href="#">배송지관리</a></li>                
            </ul>
        </li>
           
    </ul>
	<main class="usermodify">
    <div class="form-group">
    <h3>구매 내역</h3>
    <table border="1" class="userupdate" >
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
    </div>
    </main>
</div>
</body>
</html>