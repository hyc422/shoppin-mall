<%@page import="org.shoppingMall.vo.RecommendVo"%>
<%@page import="org.shoppingMall.dao.ProductDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

.div_new {
	width: 80%;
	height: 500px;
	overflow: hidden;
	margin: auto;
	display: grid;
	grid-template-columns: 1fr 1fr;
	grid-template-rows: 1fr;
	column-gap: 20px;
}
.div_baner{
	width: 80%;
	height: 200px;
	overflow: hidden;
	margin: auto;
	display: grid;
	grid-template-columns: 1fr 1fr;
	grid-template-rows: 1fr;
	column-gap: 20px;
}
.div_baner2{
	width: 100%;
	height: 300px;
	overflow: hidden;
	margin: auto;
	display: grid;
	grid-template-columns: 1fr 1fr;
	grid-template-rows: 1fr;
	column-gap: 5px;
}
</style>

<meta charset="UTF-8">

<title>술공장</title>
<link href="css/index.css" rel="stylesheet">
</head>
<body>
<%
		ProductDAO dao = ProductDAO.getInstance();
		List<RecommendVo> vo = dao.selectrecommend();
%>
	
	<main>
	<!-- 상단배너 -->
		<div class="w3-content w3-display-container"
			style="max-width: 100%; margin: 0px;">
			<a href="${pageContext.request.contextPath }/Product/product?productNum=40"><img class="mySlides" src="<%=request.getContextPath() %>/images/BannerAndIcon/배너1.jpg" style="width: 100%"></a>
			<a href="${pageContext.request.contextPath }/Product/product?productNum=43"><img class="mySlides" src="<%=request.getContextPath() %>/images/BannerAndIcon/배너2.jpg" style="width: 100%"></a>
			<a href="${pageContext.request.contextPath }"><img class="mySlides" src="<%=request.getContextPath() %>/images/BannerAndIcon/배너3.jpg" style="width: 100%"></a>
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
				<img alt="술" src="<%=request.getContextPath() %>/images/BannerAndIcon/술.png" style="display: inline;"> <br>
				<p
					style="margin-left: 200px; display: inline; color: #ff6f00; font-size: 19px;">
					<strong>오늘밤 이술은 어때요?</strong>
				</p>
			</div>
		</div>
		<br>
		<br>			<!-- 상품 더보기 -->
				<div		
					style="float:right; display: inline; margin-right: 20px; width: 60px; height: 25px; background-color: white; border: 1px solid black; text-align: center;">
					<a href="<%=request.getContextPath() %>/search?name="			
						style="color: black; text-decoration: none; font-size: 13px;">More</a>
				</div>
				<h3 style="text-align: center;">추천상품</h3>
		<br>
		
		<!-- 추천상품 -->
		<div class="div_cont">
		<% 
			for(int i=0; i<vo.size();i++) {
		%>
			<div
				style="border: 1px solid black; border-radius: 30px; width: 70%; height: 330px; margin-left: 49px; margin-top: 10px;">
				<div>
					<a href="Product/product?productNum=<%=vo.get(i).getPRODUCTNUM() %>">
					<img alt="" src="images/Product/<%=vo.get(i).getFILENAME() %>"
						style="width: 80%; height: 240px; margin-left: 25px;"></a>
				</div>
				<hr style="margin: 0px;">
				
				<!-- 관리자용 상품이름보이기 -->
				<c:if test="${user.admin=='y' }">
				<h5 style="text-align: center; margin: 0px;"><%=vo.get(i).getPRODUCTNAME() %></h5>
				</c:if>
				
				<!-- 손님용 상품이름보이기 -->
				<c:if test="${user.admin !='y' }">
				<h5 style="text-align: center;"><%=vo.get(i).getPRODUCTNAME() %></h5>
				</c:if>
				
				<p style="text-align: center; margin: 0px; font-size: 13px;">판매가 : <%=vo.get(i).getPRODUCTPRICE() %>원
				<br>
				
				<!-- 관리자용 -->
				<c:if test="${user.admin=='y' }">
				<a href="RecommendDelete?productname=<%=vo.get(i).getPRODUCTNAME() %>" onclick="return confirm('추천상품을 해제하시겠습니까?');">추천상품 해제</a>
				</c:if>
				</p>
			</div>
		<% } %>	
			
		</div>			<!-- 관리자용 -->
		<c:if test="${user.admin=='y' }">
				<div style="border: 1px solid silver; float: right; display:inline; width: 90px; height:25px; margin-bottom :20px; margin-right: 200px; text-align: center; background-color: #e1e4ed;">
				<a style= "text-decoration: none; color: black; font-size: 13px;'" href="RecommendUpdate">추천상품 등록</a></div>
		</c:if>
		<br>
		<br>
		<br>
		<br>
			
			<!-- 중간배너 -->
		<div style="width: 100%">
			<a href="${pageContext.request.contextPath }/Product/product?productNum=42"><img alt="" src="images/BannerAndIcon/우리술품폄회.png"></a>
		</div>
		
		<br>
		<br>
		<br>
		

	<!-- 하단배너1 -->
	<div class="div_baner">
		<div style="display: inline;margin-left: 50px;">
			<a target="_blank" href="https://www.google.co.kr/maps/place/%EA%B0%95%EB%82%A8IT%ED%95%99%EC%9B%90-%EC%BD%94%EB%A6%AC%EC%95%84IT%EC%95%84%EC%B9%B4%EB%8D%B0%EB%AF%B8/data=!4m10!1m2!2m1!1za29yZWFpdCDslYTsubTrjbDrr7g!3m6!1s0x357ca3fe10658c31:0xf736701baa764dad!8m2!3d37.4999467!4d127.0354264!15sChRrb3JlYWl0IOyVhOy5tOuNsOuvuJIBG3RlY2huaWNhbF9lZHVjYXRpb25fYWNhZGVteeABAA!16s%2Fg%2F11c5xnpd75?hl=ko"> <img alt="" src="images/BannerAndIcon/회사위치.jpg"> </a>
		</div>
		<div style="display: inline; margin-left: 50px; ">
			<img alt="" src="images/BannerAndIcon/카톡친추.jpg">
		</div>
	</div>
	
	<br>
	<br>
	<br>
	
	<!--유튜브  -->
	<div style="width: 70%; margin: auto;">
	<iframe width="100%" height="700px;" src="https://www.youtube.com/embed/GgOL0eL9Dlg?start=1" title="YouTube video player" 
	frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
	</div>
	
	<br>
	<br>
	<br>
	
	<!-- 하단배너2 -->
	<div class="div_baner2">
		<div style="display:inline; margin-left: 50px; ">
			<img alt="" src="images/BannerAndIcon/리뷰배너.jpg" style="width: 750px; height: 230px; border: 1px solid silver; display: block; float: right;">
		</div>
		<div style="display: inline;">
		<a href = "${pageContext.request.contextPath}/member/register">
			<img alt="" src="images/BannerAndIcon/회원가입.jpg" style="width: 750px; height: 230px; border: 1px solid silver; display: block; float: left;">
		</a>
		</div>
	</div>

<br>
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