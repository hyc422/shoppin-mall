<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="top.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/lib/w3.css">
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<h3 style="text-align:center;">로그인</h3>
	<hr>
		<div style="position: absolute;
				   left: 50%;
				   margin-left: -265px;
				   width: 800px;
				   background: white; 
				   padding: 15px;">
			<form action="login" method="post">
			<div>
					<label for="id">아이디:</label> <input type="text" id="id" 
						placeholder="아이디를 입력해주세요" name="id" class="form-control" required>
			</div>
			<div>
				<label for="password">패스워드:</label> <input type="password" id="password"
					placeholder="비밀번호를 입력해주세요" name="password" class="form-control" required>
			</div>
			<button type="submit" class="btn btn-primary">로그인</button>
			</form>
			<ul>
				<li>아이디찾기</li>
				<li>비밀번호찾기</li>
				<li><a href="member/register">회원가입</a></li>
			</ul>
		</div>
</body>
</html>