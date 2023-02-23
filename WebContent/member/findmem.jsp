<%@page import="org.shoppingMall.vo.Member"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<style>
.head {
	border-bottom: 3px solid gray;
	text-align: center;
}

.tabs {
	margin-top: 50px;
	padding-bottom: 40px;
	background-color: #ffffff;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
	width: 700px;
	margin: 0 auto;
}

/* 탭 스타일 */
.tab_item {
	width: calc(100%/ 3);
	height: 50px;
	border-bottom: 3px solid #333333;
	background-color: #f8f8f8;
	line-height: 50px;
	font-size: 16px;
	text-align: center;
	color: #333333;
	display: block;
	float: left;
	text-align: center;
	font-weight: bold;
	transition: all 0.2s ease;
}

.tab_item:hover {
	opacity: 0.75;
}

/* 라디오 버튼 UI삭제*/
input[name="tab_item"] {
	display: none;
}

/* 탭 컨텐츠 스타일 */
.tab_content {
	display: none;
	padding: 40px 40px 0;
	clear: both;
	overflow: hidden;
}

/* 선택 된 탭 콘텐츠를 표시 */
#all:checked ~ #all_content, #pwd:checked ~ #pwd_content, #design:checked 
	 ~ #design_content {
	display: block;
}

/* 선택된 탭 스타일 */
.tabs input:checked+.tab_item {
	background-color: #333333;
	color: #fff;
}

li {
	list-style: none;
}
</style>
<head>
<meta charset="UTF-8">
<title>아이디/비밀번호 찾기</title>
</head>
<body>
	<h3 class="head">아이디/비밀번호 찾기</h3>
	<div>
		<div class="tabs">
			<input id="all" type="radio" name="tab_item" checked> <label
				class="tab_item" for="all">아이디 찾기</label> <input id="pwd"
				type="radio" name="tab_item"> <label class="tab_item"
				for="pwd">비밀번호 찾기</label>

			<div class="tab_content" id="all_content">
				<form action="findmem" method="post" name="find">
					<c:if test="${sessionScope.mem == null && sessionScope.pwd == null}">
						<ul>
							<li>성함</li>
							<li><input type="text" id="name" name="name" required></li>
						</ul>
						<ul>
							<li>이메일</li>
							<li><input type="text" id="email" name="email" required></li>
						</ul>
						<ul>
							<li><button type="submit" class="tab_item">아이디찾기</button></li>
						</ul>
					</c:if>
					<c:if test="${sessionScope.mem != null }">
						<ul>
							<li class="nav-link"><span id="mem">찾으시는 ID는
									['${mem.id }'] 입니다.</span></li>
							<li><a class="tab_item" href="../logout"
								onclick="closeTap()">닫기</a></li>
						</ul>
					</c:if>
					<c:if test="${sessionScope.pwd != null }">
						<ul>
							<li class="nav-link"><span id="pwd">찾으시는 PASSWORD는
									['${pwd.password }'] 입니다.</span></li>
							<li><a class="tab_item" href="../logout"
								onclick="closeTap()">닫기</a></li>
						</ul>
					</c:if>
				</form>
			</div>
			<div class="tab_content" id="pwd_content">
				<form action="findmem" method="post" name="find">
						<ul>
							<li>아이디</li>
							<li><input type="text" name="id" class="form-control"
								required></li>
						</ul>
						<ul>
							<li>이메일</li>
							<li><input type="text" name="email" class="form-control"
								required></li>
						</ul>
						<ul>
							<li><button type="submit" class="tab_item">비밀번호 찾기</button></li>
						</ul>
				</form>
			</div>
		</div>
	</div>
</body>
<script>
	function closeTap() {
		window.close();
	}
</script>
</html>