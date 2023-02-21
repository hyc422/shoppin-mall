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
	<!-- Product 테이블의 Recommend Item y면 보이고, n이면 안보이게설정 -->
	<form action="" method="POST" enctype="multipart/form-data">
	<br>
		<div style="width: 100%; height: 30px; background-color:#e1e4ed; font-size: 19px; color: #ff6f00;"><strong style=" margin-left: 800px;">상품등록</strong></div>
		<br>
		<div style="font-size: 13px; width: 200px; margin: auto;">
			<input type="file" name="coverfile" accept="image/*"> <br>
			상품이름 <input style="width: 120px; margin-top: 10px; margin-bottom: 10px;" type="text" name = "name"> <br>
			상품가격 <input style="width: 120px; margin-bottom: 10px;" type="text" name="price"> <br>
			<button type="submit" style="float: right; border: none; background-color: #e1e4ed; border:1px solid silver; margin-bottom: 10px; margin-right: 25px;">등록</button>
		</div>
	</form>
	
	

</main>

</body>
<script type="text/javascript" src="./js/recommendProduct.js"></script>
<%@include file="footer.jsp"%>
</html>