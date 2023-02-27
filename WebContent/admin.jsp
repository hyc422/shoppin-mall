<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="top.jsp"%>
<title>술공장 관리자 페이지</title>
<style type="text/css">
.div1 {
	border: 1px solid silver; 
	width: 200px; 
	height: 400px; 
	margin-left: 50px;
}
div > h5 {
	padding: 10px;
	margin: 0px;
	text-align: center;
	background: #9AB9FF;
	color: black;
}

div > hr {
	margin: 0px;
}

ul {
	list-style: none;
}

li > .alink {
	text-decoration: none;
	color: black;
	font-size: 13px;
}
.div1 > ul > li {
	margin: 5px;
}

li > .alink:hover {
	color: #FF6D00;
}
</style>
</head>
<body>
	<div class="div1">
	<h5>관리자 메뉴</h5>
		<hr>
		<ul>
			<li>
				<a class="alink" href="${pageContext.request.contextPath}/Product/productAdd">상품등록</a>
			</li>
			<li>
				<a class="alink" href="RecommendUpdate">추천상품 등록</a>
			</li>
			<li>
				<a class="alink" href="RecommendUpdate">실시간 재고확인</a>
			</li>
			<li>
				<a class="alink" href="RecommendUpdate">실시간 평점확인</a>
			</li>
			<li>
				<a class="alink" href="RecommendUpdate">관리자 권한부여</a>
			</li>
			<li>
				<a class="alink" href="RecommendUpdate">이런걸 더 만들까요?</a>
			</li>
		</ul>
	</div>
	
	<br>
	<br>
</body>
<%@ include file="footer.jsp"%>
</html>