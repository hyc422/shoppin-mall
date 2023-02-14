<%@page import="org.shoppingMall.dao.MemberDao"%>
<%@page import="java.lang.reflect.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
.title{
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
    padding-left: 100px;
	margin-left: 300px;
}
h2{
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

.Withdrawal{
	margin-left : 270px;
}


</style>
</head>
<body>
	
	
	
<div style=" float: left; width: 33%;">

<!--  -->
	
	
    <ul id="navi">
        <li class="group">
		<h3>마이페이지</h3>
		
            
            <ul class="sub">
            <li class="title">MY 쇼핑</li>
                <li><a href="myPage2.jsp">구매 내역/리뷰 작성</a></li>
                <li><a href="#">장바구니</a></li>
                <li><a href="#">취소/반품/교환/환불내역</a></li>
            </ul>
        </li>
        <li class="group">
            <ul class="sub">
            <li class="title">MY 정보<li>
                <li><a href="#">개인정보확인 수정</a></li>                
                <li><a href="#">결제수단</a></li>                
                <li><a href="#">배송지관리</a></li>                
            </ul>
        </li>
        
           
    </ul>
	
	      </div>

    <main class="usermodify">
    <div >
    		<h2 style="text-align: left;" style="background-color: #e6f1ff ">회원정보 수정</h2>
    	<form action="update.jsp" method="post" name="fr" onsubmit="return check();">
				<div class="form-group">
					<table class="userupdate">
						<tr>
							<td class="ID2" style="background-color: #cfcfcf ">회원 ID</td>
							<td>
							<input type="text" name="ID" value="" readonly>
							</td>
						</tr>
						<tr>
							<td class="pass" style="background-color: #cfcfcf ">패스워드</td>
							<td>
							<input type="text" name="password" value="" readonly>
							</td>
						</tr>
						<tr>
							<td class="mail" style="background-color: #cfcfcf ">이메일</td>
							
							<td>
							<select>
				<option>naver.com</option>
				<option>daum.net</option>
				<option>gmail.com</option>
				<option>직접 입력</option>
			</select>
			<input type="text" name="email">
							</td>
						</tr>
						<tr>
							<td class="name1" style="background-color: #cfcfcf;">이름</td>
							<td>
							<input type="text" name="name" value="" readonly>
							</td>
						</tr>
								<tr>			
							<td class="nick" style="background-color: #cfcfcf ">별명</td>
							<td>
							<input type="text" name="nickname" value="" >
							</td>
						</tr>
	
						<tr>
							<td class="tell" style="background-color: #cfcfcf ">연락처</td>
							<td><select name="phone1" required>
				<option value="010">010</option>
				<option value="011">011</option>
			</select>-
			<input type="text" name="phone2"> -
			<input type="text" name="phone3"></td>
						<tr>
							<td class="dress" style="background-color: #cfcfcf ">주소</td>
							<td>
							<input type="text" name="address" value="" readonly>
							</td>
						</tr>
	
						<tr>
							<td class="code" style="background-color: #cfcfcf ">우편번호</td>
							<td>
							<input type="text" name="c_code" value="" readonly>
							</td>
						</tr>
	
						<tr>
							<td class="day" style="background-color: #cfcfcf ">생년월일</td>
							<td>
							<input type="date" name="birth">
							</td>
						</tr>
					</table>
					</div>
		<div class="Withdrawal">
		
		<!-- <input type="submit" class="form-control" value="취소">
				<input type="submit" class="form-control" value="수정완료"> -->
				<input type="submit" class="drawal" value="수정 완료">
				<input type="submit" class="drawal" value="취소">
				회원탈퇴 원하시면 눌러주세요 <input type="submit" class="drawal" value="회원탈퇴"> 
				</div>
				
				
				
			
			</form>
		</div>
		<div class="col-lg-4"></div>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
    </main>
    
</body>
<%@ include file="footer.jsp" %>
</html>