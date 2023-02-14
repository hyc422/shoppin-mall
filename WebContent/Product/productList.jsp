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
					<li class="nav-item"><a class="nav-link active"
						data-bs-toggle="tab" href="#home">카테고리</a></li>
					<li class="nav-item"><a class="nav-link" data-bs-toggle="tab"
						href="#menu1">카테고리</a></li>
					<li class="nav-item"><a class="nav-link" data-bs-toggle="tab"
						href="#menu2">카테고리</a></li>
					<li class="nav-item"><a class="nav-link" data-bs-toggle="tab"
						href="#menu3">카테고리</a></li>
					<li class="nav-item"><a class="nav-link" data-bs-toggle="tab"
						href="#menu4">카테고리</a></li>
				</ul>
			</div>
			<!-- Tab panes -->
			<div class="tab-content">
				<div id="home" class="container tab-pane active">
					<br> <br>
					<div class="item-list">
						<%
						for (int i = 0; i < 12; i++) {
						%>
						<div class="card">
							<div class="img">
								<a href="#"> <img src="" width="250">
								</a>
							</div>
							<div class="text">
								상품명 <input type="hidden" id="p_name" name="p_name"
									value="ECTO BTK-07" class="textStyle"> <br> <br>
								제품가격 &nbsp;&nbsp; <span class="productPriceSpan"> <input
									type="hidden" id="amt" name="amt" value="₩47,000"
									class="textStyle"> <input type="hidden" id="qty"
									name="qty" value="1" class="textStyle"> ₩가격 원
								</span> <br>
								<button type="button" onclick="addCart()">장바구니</button>
							</div>
						</div>
						<%
						}
						%>
					</div>

					<hr>
				</div>
				<div id="menu1" class="container tab-pane fade">
					<br> <br>
					<div class="item-list">
						<%
						for (int i = 0; i < 9; i++) {
						%>
						<div class="card">
							<div class="img">
								<a href="#"> <img src="" width="250">
								</a>
							</div>
							<div class="text">
								상품명 <input type="hidden" id="p_name" name="p_name"
									value="ECTO BTK-07" class="textStyle"> <br> <br>
								제품가격 &nbsp;&nbsp; <span class="productPriceSpan"> <input
									type="hidden" id="amt" name="amt" value="₩47,000"
									class="textStyle"> <input type="hidden" id="qty"
									name="qty" value="1" class="textStyle"> ₩가격 원
								</span> <br>
								<button type="button" onclick="location.href='#'">장바구니</button>
							</div>
						</div>
						<%
						}
						%>
					</div>

					<hr>
				</div>
				<div id="menu2" class="container tab-pane fade">
					<br> <br>
					<div class="item-list">
						<%
						for (int i = 0; i < 12; i++) {
						%>
						<div class="card">
							<div class="img">
								<a href="#"> <img src="" width="250">
								</a>
							</div>
							<div class="text">
								상품명 <input type="hidden" id="p_name" name="p_name"
									value="ECTO BTK-07" class="textStyle"> <br> <br>
								제품가격 &nbsp;&nbsp; <span class="productPriceSpan"> <input
									type="hidden" id="amt" name="amt" value="₩47,000"
									class="textStyle"> <input type="hidden" id="qty"
									name="qty" value="1" class="textStyle"> ₩가격 원
								</span> <br>
								<button type="button" onclick="location.href='#'">장바구니</button>
							</div>
						</div>
						<%
						}
						%>
					</div>

					<hr>
				</div>
				<div id="menu3" class="container tab-pane fade">
					<br> <br>
					<div class="item-list">
						<%
						for (int i = 0; i < 6; i++) {
						%>
						<div class="card">
							<div class="img">
								<a href="#"> <img src="" width="250">
								</a>
							</div>
							<div class="text">
								상품명 <input type="hidden" id="p_name" name="p_name"
									value="ECTO BTK-07" class="textStyle"> <br> <br>
								제품가격 &nbsp;&nbsp; <span class="productPriceSpan"> <input
									type="hidden" id="amt" name="amt" value="₩47,000"
									class="textStyle"> <input type="hidden" id="qty"
									name="qty" value="1" class="textStyle"> ₩가격 원
								</span> <br>
								<button type="button" onclick="location.href='#'">장바구니</button>
							</div>
						</div>
						<%
						}
						%>
					</div>

					<hr>
				</div>
				<div id="menu4" class="container tab-pane fade">
					<br> <br>
					<div class="item-list">
						<%
						for (int i = 0; i < 3; i++) {
						%>
						<div class="card">
							<div class="img">
								<a href="#"> <img src="" width="250">
								</a>
							</div>
							<div class="text">
								상품명 <input type="hidden" id="p_name" name="p_name"
									value="ECTO BTK-07" class="textStyle"> <br> <br>
								제품가격 &nbsp;&nbsp; <span class="productPriceSpan"> <input
									type="hidden" id="amt" name="amt" value="₩47,000"
									class="textStyle"> <input type="hidden" id="qty"
									name="qty" value="1" class="textStyle"> ₩가격 원
								</span> <br>
								<button type="button" onclick="location.href='#'">장바구니</button>
							</div>
						</div>
						<%
						}
						%>
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