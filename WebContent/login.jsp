<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<%@include file="../top.jsp"%>
</head>
<body>
	<h3 style="text-align: center;">로그인</h3>
	<hr>
	<div style="margin-left:720px; width: 800px; background: white; padding: 15px;">
		<form action="login" method="post">
				<div class="col-md-4" style="display: grid;">
					<label for="id">아이디</label> 
					<input type="text" id="id" placeholder="아이디를 입력해주세요" name="id" class="form-control" required>
				</div>
				<div style="padding-top: 10px;" class="col-md-4">
					<label>패스워드</label> 
					<input type="password" id="password" placeholder="비밀번호를 입력해주세요" name="password" class="form-control" required>
				</div>
				<div class="col-md-4">
					<button type="submit" style="margin-left: 75px; margin-top: 15px; margin-bottom: 5px;" class="btn btn-primary">로그인</button>
				</div>
				<p style="margin-left: 90px; margin-bottom:0px; margin-top:10px; font-size: 14px;">간편로그인</p>
				<hr style="width: 250px; float: left;">
				<div class="col-md-4">
					<ul style="list-style: none;">
						<li onclick="kakaoLogin();"><a href="javascript:void(0)">
								<img src="kakao_login_medium_narrow.png">
						</a></li>
						<li onclick="kakaoLogout();"><a href="javascript:void(0)">
								<span>카카오 로그아웃</span>
						</a></li>
					</ul>
				</div>
		</form>
		<a style="color: #212529;" href="javascript:find_member()">아이디/비밀번호찾기</a>
		<a style="color: #212529;" href="member/register">회원가입</a>
	</div>
</body>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
	Kakao.init('81cad4a2cb412d63f4a60b98379df9d3'); //발급받은 키 중 javascript키를 사용해준다.
	console.log(Kakao.isInitialized()); // sdk초기화여부판단
	//카카오로그인
	function kakaoLogin() {
		Kakao.Auth.login({
			success : function(response) {
				Kakao.API.request({
					url : '/v2/user/me',
					success : function(response) {
						console.log(response)
					},
					fail : function(error) {
						console.log(error)
					},
				})
			},
			fail : function(error) {
				console.log(error)
			},
		})
	}
	//카카오로그아웃  
	function kakaoLogout() {
		if (Kakao.Auth.getAccessToken()) {
			Kakao.API.request({
				url : '/v1/user/unlink',
				success : function(response) {
					console.log(response)
				},
				fail : function(error) {
					console.log(error)
				},
			})
			Kakao.Auth.setAccessToken(undefined)
		}
	}
</script>
<script>
	function find_member() {
		window.open("member/findmem.jsp", "Child",
				"width=450, height=400, top=50, left=50");

	}
</script>
</html>