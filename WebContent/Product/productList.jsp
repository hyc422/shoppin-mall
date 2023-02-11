<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<title>ComPanda</title>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link rel="stylesheet" href="../css/product.css" />
<link rel="stylesheet" href="../css/productList.css" />
</head>
<body>
	<%@ include file="../top.jsp"%>
	<div id="content"
		style="margin: 0px; padding: 0px; text-align: center;"></div>
	<div class="shop">
		<section class="serv-list">
			<div class="container">
		<div class="main-menu">
			<hr>
			<a href="#">카테고리</a>
			<a href="#">카테고리</a>
			<a href="#">카테고리</a>
			<a href="#">카테고리</a>
			<a href="#">카테고리</a>
			<a href="#">카테고리</a>
		<hr>
		</div>
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
			</div>




		</section>

		<script type="text/javascript">
			$(".form").submit(function() {

				var add = confirm("장바구니에 추가하기겠습니까?")
				if (!add) {
					return false;
				}

			});
		</script>


	</div>

	<br>
	<br>
	<br>
	<br>
	<br>
	<%@ include file="../footer.jsp"%>

</body>
</html>