<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<title>상품 목록 페이지</title>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/product.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/productList.css" />
<script type="text/javascript" src="${pageContext.request.contextPath }/js/productList.js"></script>
</head>
<body>
	<%@ include file="../top.jsp"%>
	<div id="content"
		style="margin: 0px; padding: 0px; text-align: center;"></div>

	<div class="shop">
		<section class="serv-list">
			<!-- 네비게이션 Tab -->
			<div class="category" style="font-size: 20px;">
				<ul class="nav nav-tabs" role="tablist">
					<c:forEach items="${Pvo }" var="Pvo">
						<li class="nav-item"><a style="width: 180px; text-align: center;" class="nav-link active"
							href="?Categories=${Pvo.productCategories}&page=1">${Pvo.productCategories }</a></li>
					</c:forEach>
				</ul>
			</div>
			<!-- Tab panes -->
			<div class="tab-content">
				<div id="test" class="container tab-pane active">
						<br> <br>
					<div class="item-list">
						<c:forEach items="${selectOneList1 }" var="vo">
							<div class="card">
								<div class="img">
									<a href="product?productNum=${vo.productNum }&page=${paging.currentPage}"> <img
										src="${pageContext.request.contextPath }/images/Product/${vo.fileName }" width="250">
									</a>
								</div>
								<div class="text">
									상품명 : ${vo.productName }<input type="hidden" id="p_name"
										name="p_name" value="${vo.productName }" class="textStyle">
									<br> <br> 제품가격 &nbsp;&nbsp; <span
										class="productPriceSpan"> <input type="hidden" id="amt"
										name="amt" value="₩${vo.productPrice }" class="textStyle">
										<input type="hidden" id="qty" name="qty" value="1"
										class="textStyle"> ₩ <fmt:formatNumber
											value="${vo.productPrice }" pattern="###,###,###" />원
									</span> <br>
								</div>
							</div>
						</c:forEach>


					</div>
					<hr>

					<div
						style="width: 700px; margin: auto; padding: 10px; text-align: center;">
						<br> 
						<hr>
						<a class="pagenum" href="?Categories=${a }&page=1">&lt;&lt;</a>
						<a class="pagenum" href="?Categories=${a }&page=${paging.startPage-1 }"
							style='<c:if test="${paging.startPage==1 }">display:none;</c:if>'>&lt;</a>
						<c:forEach var="i" begin="${paging.startPage }"
							end="${paging.endPage }">
							<a class="pagenum ieach" href="?Categories=${a }&page=${i }"><c:out
									value="${i }" /></a>
						</c:forEach>
						<a class="pagenum" href="?Categories=${a }&page=${paging.endPage+1 }"
							style='<c:if test="${paging.endPage==paging.totalPage }">display:none;</c:if>'>&gt;</a>

						<a class="pagenum" href="?Categories=${a }&page=${paging.totalPage }">&gt;&gt;</a>
					</div>
		<script type="text/javascript">
			const pnums = document.querySelectorAll('.ieach');
			pnums.forEach(function(item) {
				/* item 번호가 현재 페이지 이면 글꼴 스타일을 다르게함. */
				if (item.innerHTML == '${paging.currentPage}') {
					item.style.color = 'black';
					item.style.fontWeight = 'bold';
				} else {
					item.style.color = '#37966f';
				}
			});
		</script>


				</div>
			</div>
		</section>
	</div>

	<br>
	<br>
	<br>
	<br>
	<br>
	<%@ include file="../footer.jsp"%>

</body>
</html>