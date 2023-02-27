<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="top.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>추천상품 변경 페이지</title>

<style type="text/css">
.div_cont {
	width: 80%;
	height: 800px;
	overflow: hidden;
	margin: auto;
	display: grid;
	grid-template-columns: 1fr 1fr 1fr 1fr;
	grid-template-rows: 1fr 1fr;
	column-gap: 20px;
}
</style>
</head>
<body>
	<p style="position: fixed; bottom: 10px; right: 20px;">관리자 전용 페이지 입니다.</p>
	<p style="position: fixed; bottom: 28px; right: 20px;">추천상품은 최대 8개 까지 가능합니다.</p>
	
<main style="height: 700px;">
	
<div style="width: 100%; height: 30px; background-color:#e1e4ed; font-size: 19px; color: #ff6f00;"><strong style=" margin-left: 800px;">상품등록</strong></div>
	<br>
	
	<form action="" method="POST">
	<table style="margin: auto;">
		<tr>
			<td>
				<select name="productname">
					<c:forEach items="${list }" var="list">
							<option value="${list.productName }">${list.productName }</option>
					</c:forEach>
				</select>
			<button type="submit" style="float: right; border: none; background-color: #e1e4ed; border:1px solid silver; margin-left: 10px;">등록</button>
			</td>
		</tr>
	</table>
	</form>
	<br>
	<div style="width: 100%; height: 30px; background-color:#e1e4ed; font-size: 19px; color: #ff6f00;"><strong style=" margin-left: 800px;">현재 추천상품</strong></div>
	<br>
	<table style="width: 300px; margin: auto;">
		<tr>
		<c:forEach items="${list2 }" var="list2">
			<td><img src ="images/Product/${list2.FILENAME }" style="width: 100px; height: 100px;"></td>
		</c:forEach>
		</tr>
		<tr>
		<c:forEach items="${list2 }" var="list2">
			<td>${list2.PRODUCTNAME }</td>
		</c:forEach>
		</tr>
	</table>
</main>

</body>
<script type="text/javascript" src="./js/recommendProduct.js"></script>
<%@include file="footer.jsp"%>
</html>