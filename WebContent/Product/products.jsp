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
</head>
<body>
<%-- <%@ include file=""%> --%>
	<style type="text/css">
@import
	url('https://fonts.googleapis.com/css2?family=Noto+Sans&family=Open+Sans&display=swap')
	;

body {
	font-family: 'Noto Sans', sans-serif;
}

a {
	font-size: 13px;
	color: #999999;
	text-decoration: none;
	letter-spacing: 0.01em;
}

a:hover {
	color: #00FF00;
	text-decoration: none;
	font-size: 13px;
}

.logo_image {
	width: 350px;
	height: 80px;
	margin: auto;
}

.common.center {
	padding-top: 15px;
	padding-bottom: 15px;
	border: 1px;
	float: left;
	width: 47%;
}

.common.left {
	padding-top: 35px;
	padding-bottom: 15px;
	border: 1px;
	float: left;
	width: 26%;
}

.common.right {
	padding-top: 37px;
	padding-bottom: 15px;
	border: 1px;
	float: right;
	width: 26%;
}

#header {
	max-width: 1400px;
	margin: auto;
	text-align: center;
	position: sticky;
	top: 0px; /* 도달했을때 고정시킬 위치 */
	padding: 5px;
	z-index: 10;
}
</style>
	<!-- <div id="header">
		<div class="companda_header">
			<div class="common left">
				<div class="hcontet">

					<a href="">SHOP</a>&nbsp;&nbsp;&nbsp; <a href="">QnA</a>&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			<div class="common center">
				<div class="hcontent">
					<a href="" id="main_logo"> <img class="logo_image" src="">
					</a>
				</div>
			</div>
			<div class="common right">
				<div class="hcontent">
					클릭시 페이지 이동하도록 href 설정해주기
					<a href="" class="">Log In</a>&nbsp;&nbsp;&nbsp; <a href=""
						class="right_btn">Sign Up</a>&nbsp;&nbsp;&nbsp; <a href=""
						class="right_btn">CART</a>&nbsp;&nbsp;&nbsp;
					&nbsp; 스페이스
				</div>
			</div>
		</div>
	</div> -->
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<div id="content"
		style="margin: 0px; padding: 0px; text-align: center;">
		<link rel="stylesheet" href="/resources/css/cart.css">
		<style type="text/css">
.serv-list {
	padding-top: 70px;
	padding-bottom: 70px;
	margin-left: 75px;
	margin-right: 75px;
}

.serv-list .container {
	max-width: 1300px;
	margin: auto;
}

.serv-list .container .item-list {
	display: flex;
	flex-wrap: wrap;
	justify-content: space-between;
}

.serv-list .container .item-list .card {
	height: 400px;
	width: 300px;
	padding: 5px;
	margin-bottom: 10px;
}

.serv-list .container .item-list .card img {
	height: 250px;
	width: 250px;
}

.serv-list .container .item-list .card .text p {
	text-decoration: none;
	font-size: 12px;
	opacity: .8;
}

.serv-list .container .item-list .card .text button {
	background: black;
	color: white;
	border: 2px solid white;
	border-radius: 5px;
	padding: 5px 10px;
	font-size: 8px;
	transition: .5s ease;
}

.serv-list .container .item-list .card .text button:hover {
	transition: .5s ease;
	border: 2px solid black;
	background: transparent;
	color: black;
}
</style>
		
		<style type="text/css">
.shop {
	max-width: 1300px;
	margin: auto;
}

.main-menu {
	display: inline-block;
}

.main-menu a {
	text-decoration: none;
	font-size: 17px;
	padding-left: 50px;
	padding-right: 50px;
}

.main-menu a:visited {
	text-decoration: none;
	color: #666666;
}

.main-menu a:hover {
	color: #66ff66;
}
</style>
		<div class="shop">
			<div class="main-menu">
				<a href="#">카테고리</a>&nbsp;&nbsp; <a href="#">카테고리</a>&nbsp;&nbsp; <a
					href="#">카테고리</a>&nbsp;&nbsp; <a href="#">카테고리</a>&nbsp;&nbsp; <a
					href="#">카테고리</a>&nbsp;&nbsp;
			</div>
			<section class="serv-list">
				<div class="container">
					<div class="item-list">
						<%
							for(int i=0; i<12;i++){
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

		<br> <br> <br> <br> <br>
<%-- <%@ include file=""%> --%>

</body>
</html>