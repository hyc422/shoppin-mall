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
    margin:20px auto;
    padding: 0;
    font-family:"맑은 고딕";
    font-size:0.9em;
    
}
main{
height: 500px;
}
.tit{
	background-color: #373737;
	color:#ffffff;
	font-size: 18px;
	
}
ul#navi {
    width: 200px;
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
.form-group{
	border: 1px solid #D3D3D3;
	width: 917px;
	    height: 400px;
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
       width: auto;
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
	width : 900px;
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
                <li><a href="${pageContext.request.contextPath }/paylist?idx=${user.idx}">구매 내역/리뷰 작성</a></li>
            </ul>
        </li>
        <li class="group">
            <div class="tit">MY 정보</div>
            <ul class="sub">
                <li><a href="${pageContext.request.contextPath }/update?idx=${user.idx}">개인정보확인/수정</a></li>                
            	    <li><a href="${pageContext.request.contextPath }/rivew?nickname=${user.nickname}">내가 쓴 리뷰</a></li>
            	     <li><a href="${pageContext.request.contextPath }/qnalist?nickname=${user.nickname}">QnA</a></li>
            </ul>
        </li>
           
    </ul><!--  -->
    </div>
    
    <main class="usermodify">
    	
    			<h2>QnA</h2>
    	<div class="form-group">
    		<table class="userupdate" style="table-layout: fixed; "  >
    			<tr style="text-align: center;">
    				<th>닉네임</th>
    				<th>제목</th>
    				<th>조회수</th>
    				<th>댓글</th>
    				<th>조회수</th>
    			</tr>
     <c:forEach items="${vo }" var="vo" varStatus="num">
     
    	<tr>
    			<td><input type="text" name="nickname" value="${vo.nickname }" readonly="readonly" style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px; text-align: center;"></td>
    			<td><input type="text" name="title" value="${vo.title }" readonly="readonly"style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px; text-align: center;"></td>
    			<td><input type="text" name="readCount" value="${vo.readCount }" readonly="readonly"style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px; text-align: center;"></td>
    			<td><input type="text" name="commentCount" value="${vo.commentCount }" readonly="readonly"style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px; text-align: center;"></td>
    			<td><input type="text" name="createdAt" value="${vo.createdAt }" readonly="readonly"style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px; text-align: center;"></td>
    			</tr>
   </c:forEach>
   
   		
    		</table>
    			<div class="review">
    				<input type="button" class="button"name="button" value="문의 하러 가기">
    			</div>
    	</div>
</main>

	<%@ include file="../footer.jsp"%>
</body>
</html>