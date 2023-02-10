<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<h3>로그인</h3>
	<hr>
		<div>
			<form action="login" method="post">
			<div>
					<label for="id">아이디:</label> <input id="id"
						placeholder="아이디를 입력해주세요" name="id" required>
			</div>
			<div>
				<label for="pwd">패스워드:</label> <input id="password"
					placeholder="비밀번호를 입력해주세요" name="password">
			</div>
			</form>
			<button type="submit">로그인</button>
			<ul>
				<li>아이디찾기</li>
				<li>비밀번호찾기</li>
				<li><a href="member/register.jsp">회원가입</a></li>
			</ul>
		</div>
</body>
</html>