<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="top.jsp"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/lib/w3.css">
<style>
.mySlides {
	display: none;
	margin: 0px;
}

.w3-left, .w3-right, .w3-badge {
	cursor: pointer
}

.w3-badge {
	height: 13px;
	width: 13px;
	padding: 0
}

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

<meta charset="UTF-8">

<title>술공장</title>
<link href="css/index.css" rel="stylesheet">
</head>
<body>
	<main>
		<div class="w3-content w3-display-container"
			style="max-width: 100%; margin: 0px;">
			<img class="mySlides" src="<%=request.getContextPath() %>/image/배너1.jpg" style="width: 100%">
			<img class="mySlides" src="<%=request.getContextPath() %>/image/배너2.jpg" style="width: 100%">
			<img class="mySlides" src="<%=request.getContextPath() %>/image/배너3.jpg" style="width: 100%">
			<div
				class="w3-center w3-section w3-large w3-text-white w3-display-bottomleft"
				style="width: 100%">
				<div
					style="display: inline; float: left; position: relative; left: 40px; top: -330px;"
					class="w3-left w3-padding-left w3-hover-text-khaki"
					onclick="plusDivs(-1)">&#10094;</div>
				<div
					style="position: relative; float: right; right: 40px; top: -330px;"
					class="w3-right w3-padding-right w3-hover-text-khaki"
					onclick="plusDivs(1)">&#10095;</div>
				<span style=""
					class="w3-badge demo w3-border w3-transparent w3-hover-white"
					onclick="currentDiv(1)"></span> <span
					class="w3-badge demo w3-border w3-transparent w3-hover-white"
					onclick="currentDiv(2)"></span> <span
					class="w3-badge demo w3-border w3-transparent w3-hover-white"
					onclick="currentDiv(3)"></span>
			</div>
		</div>
		<br>
		<br>
		<div style="background-color: #e1e4ed; width: 100%; height: 100px;">
			<div>
				<p style="margin-left: 190px; display: inline;">
					<strong style="font-size: 18px; color: #424242;">이번주 술공장 PICK</strong>
				</p>
				<img alt="술" src="<%=request.getContextPath() %>/image/술.png" style="display: inline;"> <br>
				<p
					style="margin-left: 200px; display: inline; color: #ff6f00; font-size: 19px;">
					<strong>이술은 어떠세요?</strong>
				</p>
			</div>
		</div>
		<br>
		<br>			<!-- 상품 더보기 -->
				<div		
					style="float:right; display: inline; margin-right: 20px; width: 60px; height: 25px; background-color: white; border: 1px solid black; text-align: center;">
					<a href=""			
						style="color: black; text-decoration: none; font-size: 13px;">More</a>
				</div>
				<h3 style="text-align: center;">추천상품</h3>
		<br>
		<!-- 추천상품 -->
		<div class="div_cont">
			<div
				style="border: 1px solid black; border-radius: 30px; width: 70%; height: 330px; margin-left: 49px; margin-top: 10px;">
				<div>
					<img alt="" src="<%=request.getContextPath() %>/image/시트러스 혼디주 12도 330ml 제주감귤과실주.jpg"
						style="width: 80%; height: 240px;">
				</div>
				<hr style="margin: 0px;">
				<h5 style="text-align: center;">상품이름</h5>
				<p style="text-align: center; margin: 0px;">상품가격 : 30000원</p>
			</div>
			<div
				style="border: 1px solid black; border-radius: 30px; width: 70%; height: 330px;  margin-left: 49px; margin-top: 10px;">
				<div>
					<img alt="" src="<%=request.getContextPath() %>/image/시트러스 혼디주 12도 330ml 제주감귤과실주.jpg"
						style="width: 80%; height: 240px;">
				</div>
				<hr style="margin: 0px;">
				<h5 style="text-align: center;">상품이름</h5>
				<p style="text-align: center; margin: 0px;">상품가격 : 30000원</p>
			</div>
			<div
				style="border: 1px solid black; border-radius: 30px; width: 70%; height: 330px;  margin-left: 49px; margin-top: 10px;">
				<div>
					<img alt="" src="<%=request.getContextPath() %>/image/시트러스 혼디주 12도 330ml 제주감귤과실주.jpg"
						style="width: 80%; height: 240px;">
				</div>
				<hr style="margin: 0px;">
				<h5 style="text-align: center;">상품이름</h5>
				<p style="text-align: center; margin: 0px;">상품가격 : 30000원</p>
			</div>
			<div
				style="border: 1px solid black; border-radius: 30px; width: 70%; height: 330px; margin-left: 49px; margin-top: 10px;">
				<div>
					<img alt="" src="<%=request.getContextPath() %>/image/시트러스 혼디주 12도 330ml 제주감귤과실주.jpg"
						style="width: 80%; height: 240px;">
				</div>
				<hr style="margin: 0px;">
				<h5 style="text-align: center;">상품이름</h5>
				<p style="text-align: center; margin: 0px;">상품가격 : 30000원</p>
			</div>
			<div
				style="border: 1px solid black; border-radius: 30px; width: 70%; height: 330px; margin-left: 49px; margin-top: 10px;">
				<div>
					<img alt="" src="<%=request.getContextPath() %>/image/시트러스 혼디주 12도 330ml 제주감귤과실주.jpg"
						style="width: 80%; height: 240px;">
				</div>
				<hr style="margin: 0px;">
				<h5 style="text-align: center;">상품이름</h5>
				<p style="text-align: center; margin: 0px;">상품가격 : 30000원</p>
			</div>
			<div
				style="border: 1px solid black; border-radius: 30px; width: 70%; height: 330px; margin-left: 49px; margin-top: 10px;">
				<div>
					<img alt="" src="<%=request.getContextPath() %>/image/시트러스 혼디주 12도 330ml 제주감귤과실주.jpg"
						style="width: 80%; height: 240px;">
				</div>
				<hr style="margin: 0px;">
				<h5 style="text-align: center;">상품이름</h5>
				<p style="text-align: center; margin: 0px;">상품가격 : 30000원</p>
			</div>
			<div
				style="border: 1px solid black; border-radius: 30px; width: 70%; height: 330px; margin-left: 49px; margin-top: 10px;">
				<div>
					<img alt="" src="<%=request.getContextPath() %>/image/시트러스 혼디주 12도 330ml 제주감귤과실주.jpg"
						style="width: 80%; height: 240px;">
				</div>
				<hr style="margin: 0px;">
				<h5 style="text-align: center;">상품이름</h5>
				<p style="text-align: center; margin: 0px;">상품가격 : 30000원</p>
			</div>
			<div
				style="border: 1px solid black; border-radius: 30px; width: 70%; height: 330px; margin-left: 49px; margin-top: 10px;">
				<div>
					<img alt="" src="<%=request.getContextPath() %>/image/시트러스 혼디주 12도 330ml 제주감귤과실주.jpg"
						style="width: 80%; height: 240px;">
				</div>
				<hr style="margin: 0px;">
				<h5 style="text-align: center;">상품이름</h5>
				<p style="text-align: center; margin: 0px;">상품가격 : 30000원</p>
			</div>
		</div>			<!-- 관리자 추천상품 변경 -->
				<div style="border: 1px solid silver; float: right; display:inline; width: 90px; height:25px; margin-bottom :20px; margin-right: 10px; text-align: center; background-color: #e1e4ed;">
				<a style= "text-decoration: none; color: black; font-size: 13px;'" href="">추천상품 수정</a></div>
		<br>
		<br>
		




		<script>
			/* 양옆 버튼으로 넘기기 */
			var slideIndex = 1;
			showDivs(slideIndex);

			function plusDivs(n) {
				showDivs(slideIndex += n);
			}

			function currentDiv(n) {
				showDivs(slideIndex = n);
			}

			function showDivs(n) {
				var i;
				var x = document.getElementsByClassName("mySlides");
				var dots = document.getElementsByClassName("demo");
				if (n > x.length) {
					slideIndex = 1
				}
				if (n < 1) {
					slideIndex = x.length
				}
				;
				for (i = 0; i < x.length; i++) {
					x[i].style.display = "none";
				}
				for (i = 0; i < dots.length; i++) {
					dots[i].className = dots[i].className.replace(" w3-white",
							"");
				}
				x[slideIndex - 1].style.display = "block";
				dots[slideIndex - 1].className += " w3-white";
			}

			var myIndex = 0;
			carousel();

			/* 슬라이드 */
			function carousel() {
				var i;
				var x = document.getElementsByClassName("mySlides");
				for (i = 0; i < x.length; i++) {
					x[i].style.display = "none";
				}
				myIndex++;
				if (myIndex > x.length) {
					myIndex = 1
				}
				x[myIndex - 1].style.display = "block";
				setTimeout(carousel, 3000);
			}
		</script>


	</main>
</body>
<%@include file="footer.jsp"%>
</html>