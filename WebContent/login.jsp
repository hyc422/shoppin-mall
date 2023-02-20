<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<%@include file="top.jsp"%>
</head>
<body>
	<h3 style="text-align:center;">로그인</h3>
	<hr>
		<div style="position: absolute; left: 50%; margin-left: -265px; width: 800px; background: white; padding: 15px;">
			<form action="login" method="post">
			<div class="col-md-4">
					<label for="id">아이디</label> <input type="text" id="id"
						placeholder="아이디를 입력해주세요" name="id" class="form-control" required>
			</div>
			<div class="col-md-4">
				<label>패스워드</label> 
				<input type="password" id="password" placeholder="비밀번호를 입력해주세요" name="password"class="form-control" required>
			</div>
			<div class="col-md-4">
				<button type="submit" style="text-align:center;" class="btn btn-primary" >로그인</button>
			</div>
			</form>
				<a style="color: #212529;" href="javascript:find_member()">아이디/비밀번호찾기</a>
				<a style="color: #212529;" href="member/register">회원가입</a>
		</div>
</body>
<script>
function find_member(){
	window.open( "member/findmem.jsp", "Child", "width=450, height=400, top=50, left=50" );
	
}
</script>
</html>