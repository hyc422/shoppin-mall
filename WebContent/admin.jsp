<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="top.jsp"%>
<title>술공장 관리자 페이지</title>
</head>
<body>
	
	<a href="${pageContext.request.contextPath}/Product/productAdd">상품등록</a>
	<a style= "text-decoration: none; color: black; font-size: 13px;'" href="RecommendUpdate">추천상품 등록</a>
	
</body>
<%@ include file="footer.jsp"%>
</html>