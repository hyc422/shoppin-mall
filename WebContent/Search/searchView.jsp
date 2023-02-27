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

div> a {
	font-size: 12px;
	padding-left: 5px;
	padding-right: 5px;
	color: black;
}
div>a:hover {
	color: #FF6D00;
}
</style>
</head>
<body>
	<main>

		<h3>상품검색</h3>
		<br>
		
		<div style="border: 1px solid silver; width: 80%; margin: auto; border-radius: 5px;"><p style="display:inline; margin-left: 40px; font-size: 15px; margin-top:14px; font-size: 14px;">
		<strong>${name }</strong>로 <strong>${count }</strong>건 검색되었습니다.</p>
			<div style="float: right;">
					<a id="productname" href="<%=request.getContextPath() %>/search?name=${name}">상품명</a>
					<a id="productpricehigh" href="<%=request.getContextPath() %>/high?name=${name}">높은가격순</a>
					<a id="productpricelow" href="<%=request.getContextPath() %>/low?name=${name}">낮은가격순</a>
			</div>
		</div>

		<br>
		<!-- grid -->
		<div class="div_search">
		<c:forEach items="${list }" var="vo">
			<div
				style="border: 1px solid black; border-radius: 30px; width: 70%; height: 330px; margin-left: 49px; margin-top: 10px;">
				<div>
					<a href="${pageContext.request.contextPath }/Product/product?productNum=${vo.productNum}"><img alt="" src="<%=request.getContextPath() %>/images/Product/${vo.fileName }"
						style="width: 80%; height: 240px;margin-left: 20px;"></a>
				</div>
				<hr style="margin: 0px;">
				<h6 style="text-align: center;">
				${vo.productName }
				</h6>
				<p style="text-align: center; margin: 0px; font-size: 13px;">판매가 : ${vo.productPrice }원</p>
			</div>
		</c:forEach>
		</div>
		<br>
		
		<!-- 페이징 -->
			<div style="width:700px;margin: auto;padding: 10px;text-align: center;">
	<br>
	<hr>
	<a class="pagenum" href="?name=${name }&page=1">&lt;&lt;</a>   <!--(1) 첫번째 페이지 1번으로 이동 -->
	
	<!--(2)  실행하면서 파악해보세요. --> <!-- 요청은 ListController가 받음.page파라미터 변경됨. -->
	<a class="pagenum" href="?name=${name }&page=${paging.startPage-1 }"      
			style='<c:if test="${paging.startPage==1 }">display:none;</c:if>' >&lt;</a>
	
	<!--(3) 페이지 범위 startPage 부터 endPage 까지 반복 -->
	<c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
		<a class="pagenum ieach" href="?name=${name }&page=${i }"><c:out value="${i }"/></a>
	</c:forEach>
	
	<!--(4)  실행하면서 파악해보세요. -->
	<a class="pagenum" href="?name=${name }&page=${paging.endPage+1 }"
			style='<c:if test="${paging.endPage==paging.totalPage }">display:none;</c:if>'	>&gt;</a>
			
	<a class="pagenum" href="?name=${name }&page=${paging.totalPage }">&gt;&gt;</a>  <!--(5) 가장 마지막 페이지로 이동 -->
</div>
<br><br>


	</main>
	
	<script type="text/javascript">
	const pnums = document.querySelectorAll('.ieach');
	pnums.forEach(function(item){
		console.log(item);
		/* item 번호가 현재 페이지 이면 글꼴 스타일을 다르게함. */
		if(item.innerHTML=='${paging.currentPage}') {    
			item.style.color = 'black';
			item.style.fontWeight = 'bold';
		}else{
			item.style.color = '#37966f';
		}
	});
</script>
</body>
<%@include file="../footer.jsp"%>
</html>