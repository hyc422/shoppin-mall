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
#all:checked ~ #all_content, #programming:checked ~ #programming_content,
	#design:checked ~ #design_content {
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
			<input id="all" type="radio" name="tab_item" checked>
			 <label class="tab_item" for="all">아이디 찾기</label> 
			 
			 <input id="programming" type="radio" name="tab_item">
			  <label class="tab_item" for="programming">비밀번호 찾기</label>
			 	
			<div class="tab_content" id="all_content">
				<form action="findmem" method="post" name="findid">
					<ul>
						<li>성함</li> 
						<li><input type="text" id="name" name="name" class="form-control"
							required></li>
					</ul>
					<ul>
						<li>이메일</li>
						<li><input type="text" id="email" name="email" class="form-control"
							required></li>
					</ul>
					<ul>
						<li><button type="submit" class="tab_item">아이디찾기</button></li>
						<li id="vo">${vo.id }</li>
					</ul>
				</form>
				 <ul>
				 	<li id="user">찾으시는 분의 아이디는 ${user.id} 입니다.</li>
				 </ul>
			</div>
		</div>
		<div class="tab_content" id="programming_content">
			<form action="findmem" method="post">
				<ul>
					<li>아이디</li>
					<li><input type="text" id="id" class="form-control" required>
					</li>
				</ul>
				<ul>
					<li>이메일</li>
					<li><input type="text" id="email" class="form-control"
						required></li>
				</ul>
				<ul>
					<li><button class="tab_item">비밀번호 찾기</button></li>
				</ul>
			</form>
		</div>
	</div>
</body>
</html>