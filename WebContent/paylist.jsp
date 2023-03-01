<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width">
<title>술공장</title>
	<%@ include file="../top.jsp"%>
<style type="text/css">
body {
    padding: 0;
    font-family:"맑은 고딕";
    display: block;
    -webkit-text-size-adjust: none;
    font-family: dotum,sans-serif;
    font-size: 16px;
    line-height: 1.6;
    color: #666;
}
main{
height: auto;
}
.tit{
	background-color: #373737;
	color:#ffffff;
	font-size: 18px;
	
}
ul#navi {
    width: auto;
    text-indent: 15px;
}
ul#navi, ul#navi ul {
    margin:0;
    padding:0;
    list-style:none;
}
li.group {
    margin-bottom: 4px;
}
div.tit {
color: white;
}
li.group div.tit {
    height: 35px;
    line-height: 35px;
    background-color: #323232;
    cursor:pointer;
}
.usermodify {
    position: relative;
}
.form-group{
	border: 1px solid #D3D3D3;
	width: 1000px;
	    height: auto;
}
input, textarea, select, button {
    font-family: sans-serif;
    font-size: 100%;
}
.usermodify{
    padding-left: 100px;
	margin-left: 300px;
}

table{
   border-collapse:border;
   max-width:1400px;
table-layout: fixed;
border-bottom:1px solid #373737;
  
     
}
td,tr{
  border-collapse : border;
    border-right:none;
border-left:none;
border-top:none;
border-bottom:none;
  }

  
  th{
   padding: 10px;
  border-bottom: 1px solid #373737;
  background-color: #373737;
  color:white
 
  }
  tr > td:first-child {
	color: #000000;
}

.Withdrawal{
	margin-left : 270px;
	margin-top: 40px;
}
.shopping{
    margin-left: 1000px;
}

.review{
	margin-left: 400px;
    margin-top: 50px;
   
    
}
.button{
 border-color: cornsilk;
    background-color: #373737;
    color: white;
    padding : 10px;
    border-radius: 10px;
}
h2{
	text-align: center;
	color:black;
	margin-right: 700px;
	width : 1000px;
	padding : 20px;
}
</style>


</head>
<body>

	<div style="width: 200px; float: left;">
	<h3>마이페이지</h3>
	
    <ul id="navi">
        <li class="group">
            <div class="tit">My 쇼핑</div>
            <ul class="sub">
                <li><a href="${pageContext.request.contextPath }/paylist?id=${user.id}">구매 내역/리뷰 작성</a></li>
            </ul>
        </li>
        <li class="group">
            <div class="tit">MY 정보</div>
            <ul class="sub">
                <li><a href="${pageContext.request.contextPath }/update?idx=${user.idx}">개인정보확인/수정</a></li>                
            	    <li><a href="${pageContext.request.contextPath }/rivewlist?nickname=${user.nickname}">내가 쓴 리뷰</a></li>
            	     <li><a href="${pageContext.request.contextPath }/qnalist?nickname=${user.nickname}">QnA</a></li>
            </ul>
        </li>
           
    </ul>
    </div>
    
    <main class="usermodify">
    	
    			<h2>구매내역</h2>
    	<div class="form-group">
    			<input type="hidden" name="id" value="${user.id}">
    		<table class="userupdate" style="table-layout: fixed; "  >
    			<tr style="text-align: center;">
    				<th style="width: 200px;">구매 날짜</th>
    				<th style="width: 200px;">이미지</th>
    				<th style="width: 200px;">상품명</th>
    				<th style="width: 200px;">가격</th>
    				<th style="width: 200px;" class="num">수량</th>
    				<th style="width: 200px;" class="sum">합계</th>
    				<th style="width: 200px;" class="adress">주소</th>
    			</tr>
     <c:forEach items="${vo }" var="vo" varStatus="num">
     	
    	<tr>
    			<td><input type="text" name="pDate" value="${vo.pDate }" readonly="readonly" style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px; text-align: center;"></td>
    			<td><a href="${pageContext.request.contextPath }/Product/product?productNum=${vo.productNum}"> 
                        <img src="${pageContext.request.contextPath }/images/Product/${vo.fileName }" width="60"></a></td>
    			<td><input type="text" name="productNum" value="${vo.productNum }" readonly="readonly" style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px; text-align: center;"></td>
    			<td><input type="text" name="productName" value="${vo.productName }" readonly="readonly"style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px; text-align: center;"></td>
    			<td><input type="text" name="productPrice" value="${vo.productPrice }" readonly="readonly"style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px; text-align: center;"></td>
    			<td><input type="text" name="amount" value="${vo.amount }" readonly="readonly"style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px; text-align: center;"></td>
    			<td><input type="button" name="review" value="리뷰" readonly="readonly"style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px; text-align: center;"></td>
    			</tr>
   </c:forEach>
   
   		
    		</table>
    			<div class="review">
    				<a href="${pageContext.request.contextPath }"><input type="button" class="button"name="button" value="홈으로 가기"></a>
    			</div>
    			<br>
    	</div>
</main>

	<%@ include file="../footer.jsp"%>
</body>
</html>