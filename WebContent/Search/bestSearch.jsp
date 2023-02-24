<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<%@include file="../top.jsp" %>
<meta charset="UTF-8">
<title>인기검색어 변경페이지</title>
</head>
<body>
	<main>
		<p style="position: fixed; bottom: 10px; right: 20px;">관리자 전용 페이지 입니다.</p>
		<p style="position: fixed; bottom: 28px; right: 20px;">실시간검색어는 최대 5개 까지 가능합니다.</p>
	
		<div style="width: 100%; height: 30px; background-color:#e1e4ed; font-size: 19px; color: #ff6f00;"><strong style=" margin-left: 800px;">등록하실 상품을 선택해주세요.</strong></div>
		<br>
		<!-- 실시간검색어 등록 -->
		<h3>현재 베스트상품</h3>
		
		
		
			<br>
		<form action="" method="POST" name="frms">
			<table style="margin: auto;">
			<tr>
				<td>
					<span id = "result"></span>
				</td>
			</tr>
				<tr>
					<th>상품사진</th>
					<th>상품이름</th>
					<th>상품가격</th>
					<th>선택</th>
					<td><button type="submit">등록</button> </td>
					<td><button type="reset">다시선택</button> </td>
				</tr>
			<c:forEach items="${list }" var="list">
			<input type="hidden" name = "price" value="${list.productPrice }">
			<input type="hidden" name = "fileName" value="${list.fileName }">
				<tr>
					<td>
					<img src="<%=request.getContextPath() %>/images/Product/${list.fileName }" style="width: 100px; height: 100px;"></td>
					<td>${list.productName}</td>
					<td>${list.productPrice }원</td>
					<td><input type="checkbox" name="productName" value="${list.productName}"></td>
				</tr>
			</c:forEach>
			</table>
		</form>
	






	</main>
</body>
<%@include file="../footer.jsp"%>
</html>