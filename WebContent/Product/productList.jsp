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
<title>ComPanda</title>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="../css/product.css" />
<link rel="stylesheet" href="../css/productList.css" />
<script type="text/javascript" src="../js/productList.js"></script>
</head>
<body>
	<%@ include file="../top.jsp"%>
	<div id="content"
		style="margin: 0px; padding: 0px; text-align: center;"></div>

	<div class="shop">
		<section class="serv-list">
			<!-- 네비게이션 Tab -->
			<div class="category">
				<ul class="nav nav-tabs" role="tablist">
					<c:forEach items="${Pvo }" var="Pvo">
						<li class="nav-item"><a class="nav-link active" 
							href="?Categories=${Pvo.productCategories}">${Pvo.productCategories }</a></li>
					</c:forEach>
				</ul>
			</div>
			<!-- Tab panes -->
			<div class="tab-content">
					<div id="test"
						class="container tab-pane active">
						<c:forEach items="${Pvo }" var="Pvo">
						<a href="${Pvo.productCategories }"></a>
						</c:forEach>
						<br> <br>
						<div class="item-list">
							<c:forEach items="${selectOneList1 }" var="vo">
								<div class="card">
									<div class="img">
										<a href="product?productNum=${vo.productNum }"> <img src="../images/${vo.fileName }"
											width="250">
										</a>
									</div>
									<div class="text">
										상품명 : ${vo.productName }<input type="hidden" id="p_name"
											name="p_name" value="${vo.productName }" class="textStyle">
										<br> <br> 제품가격 :<span
											class="productPriceSpan"><input type="hidden" id="qty"
											name="qty" value="1" class="textStyle">₩ <fmt:formatNumber value="${vo.productPrice }" pattern="###,###,###"/>
										</span> <br>
										<button type="button" onclick="addCart()">장바구니</button>
									</div>
								</div>
							</c:forEach>
						</div>
						<hr>
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