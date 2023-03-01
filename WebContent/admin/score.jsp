<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../top.jsp"%>
<style type="text/css">
tr>td,th {
	text-align: center;
}
table {
	width: 500px;
	margin: auto;
}

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
<title>실시간 평점</title>
</head>
<body>
	<main>
		<table border="1">
			<tr>
				<th>상품명</th>
				<th>평점</th>
			</tr>
			<c:forEach items="${list }" var="list">
				<tr>
					<td>${list.productname }</td>
					<td>${list.point }</td>
				</tr>
			</c:forEach>
		</table>
	</main>
	<br>
	<br>
	<br>
</body>
<%@ include file="../footer.jsp"%>
</html>