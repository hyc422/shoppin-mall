<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="../top.jsp"%>
<title>술공장 검색페이지</title>
<style type="text/css">
h3 {
	text-align: center;
}

th {
	padding-right: 20px;
	text-align: left;
	font-size: 14px;
}

.div_search {
	width: 80%;
	height: 800px;
	overflow: hidden;
	margin: auto;
	display: grid;
	grid-template-columns: 1fr 1fr 1fr 1fr;
	grid-template-rows: 1fr 1fr;
	column-gap: 20px;
}

select {
	font-size: 13px;
}
</style>
</head>
<body>
	<main>

		<h3>상품검색</h3>
		<br>
		<div
			style="width: 80%; height: 200px; border: 3px solid silver; border-radius: 5px; margin: auto;">
			<table style="margin-top: 20px; margin-left: 530px;">
				<tr>
					<th>상품분류</th>
					<td><select style="width: 250px;">
							<option>과실주</option>
							<option>막걸리</option>
							<option>청주</option>
							<option>브랜디</option>
							<option>소주</option>
							<option>위스키</option>
					</select></td>
				</tr>
				<tr>
					<th>검색조건</th>
					<td><select>
							<option>카테고리</option>
							<option>이름</option>
					</select> <input type="text" value="검색어" style="font-size: 13px; width: 170px;"></td>
				</tr>
				<tr>
					<th>판매가격대</th>
					<td><input type="text" style="font-size: 13px; width: 115px;"> ~ <input
						type="text" style="font-size: 13px; width: 115px;"></td>
				</tr>
				<tr>
					<th>검색정렬기준</th>
					<td><select style="padding-left: 10px; width: 250px;">
							<option>상품명순</option>
							<option>낮은가격순</option>
							<option>높은가격순</option>
							<option>인기순</option>
					</select></td>
				</tr>
			</table>
			<div style="margin-left: 700px; padding-top: 10px;">
				<button style="border: none; background-color: black; color: white;">검색</button>
			</div>
		</div>
		<br> <br>
		<div style="border: 1px solid silver; width: 80%; margin: auto; border-radius: 5px;"><p style="margin-left: 40px; font-size: 15px; margin-top:14px; "> 총 @@ 개의 상품이 검색되었습니다.</p></div>

		<br>
		<!-- grid -->
		<div class="div_search">
		<c:forEach items="${vo }" var="vo">
			<div
				style="border: 1px solid black; border-radius: 30px; width: 70%; height: 330px; margin-left: 49px; margin-top: 10px;">
				<div>
					<img alt="" src="images/Alochol/"
						style="width: 80%; height: 240px;margin-left: 45px;">
				</div>
				<hr style="margin: 0px;">
				<h5 style="text-align: center;">${vo.name }</h5>
				<p style="text-align: center; margin: 0px; font-size: 13px;">판매가 : ${vo.price }원</p>
			</div>
		</c:forEach>
		</div>
	</main>
</body>
<%@include file="../footer.jsp"%>
</html>