<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ include file="top.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>술공장</title>
<style type="text/css">
body {
    margin:20px auto;
    padding: 0;
    font-family:"맑은 고딕";
    font-size:0.9em;
     
    
}
main{
height: 300px;
}
table {
	background-color: #F5F5F5;
	
}
td{
padding: 20px;
}
</style>
</head>
<body  >
 <h3 style="text-align: center; margin: 30px; font-size: 20px;"> 비밀번호를 다시 한번 입력하세요.</h3>
 <div align="center">
  <form action="deleteForm" method="post">
<main>
 <table>
  <tr>
  <td><a>비밀번호</a></td>
  <td><input type="password" name="password" id="password" value="${vo.password }"></td>
  </tr>
 <tr>
		<td colspan="2" align="center">
			<input type="submit" value="회원탈퇴"/>
			<input type="reset" value="취소" onclick="location.href='index.jsp'"/>
		</td>
		</tr>
 
 </table>
 
 </main>
 </form>
 </div>
</body>
   <%@ include file="footer.jsp" %>
</html>