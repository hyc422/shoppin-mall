<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품 상세 페이지</title>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath }/css/product.css" />
<script type="text/javascript" src="${pageContext.request.contextPath }/js/product.js"></script>

</head>
<body onload="init();">
	<%@ include file="../top.jsp"%>
	<div id="content"
		style="margin: 0px; padding: 0px; text-align: center;">
		<div class="productmain">
			<div class="main-detail-box">
				<!-- 제품메인이미지 -->
				<div class="productimg">
					<img class="mainImg" alt=""
						src="${pageContext.request.contextPath }/images/Product/${Pvo.fileName }">
				</div>
				<!-- 제품 기본 정보 -->
				<div class="productDetail" class="col-md-8">
					<div class="text" class="card-body">
						<!-- 제품이름 -->
						<h3 class="card-title">${Pvo.productName }</h3>
						<br>
						<div>
							<p class="card-text">종류 : ${Pvo.productCategories }</p>
							<p class="card-text">재고수 : ${Pvo.productStock }</p>
							<p class="card-text">배송 방법 : 택배</p>
							<p class="card-text">택배비 : 3000원</p>
						</div>
						<hr>
						<hr>

						<div class="productPrice">
							<b><span class="productPriceSpan">가격 : <fmt:formatNumber
										value="${Pvo.productPrice }" pattern="###,###,###" />원
							</span></b>
						</div>
						<!-- 제품가격 -->
						<br> <br>
						<hr>
					</div>
					<br>
					<!--장바구니 수량 담기  -->
					<div id="cart">
						<form action="" name="form" method="post" id="storeForm">
							<input type="hidden" name="id" value="dmdka"> 
							<input type="hidden" name="fileName" value="ex01.png">
							<input type="hidden" name="productName" value="dmdka"> 
							<input type="hidden" name="productCategories" value="dmdka">
							<input type="hidden" name="productNum" value="1">
							<div class="quantity">
								<span class="btn_position">주문 수량</span> &nbsp;&nbsp;&nbsp; 
								<input class="count" type="button" value="-" onclick="del();">
								<input class="count" type="hidden" name="productPrice"
									value="11111"> 
								<input class="count" type="text" name="amount" value="1" size="3"
									onchange="change();"> 
								<input class="count" type="button" value="+" onclick="add();">
							</div>
							<br>
							<div class="price">
								<b> 총 금액 &nbsp;&nbsp;&nbsp;
								<input type="text" class="price_box" name="sum" size="7"
									style="border: none; font-size: 20px;" readonly>원
								</b>
							</div>
							<br>
						</form>
					</div>
					<div class="cart_put">
						<button type="button" id="no_member_cart_put" class="order"
							onclick="addToCart()">장바구니</button>
						<button type="button" id="no_member_payBtn" class="order"
							onclick="productAddPayment()">구매하기</button>
						<button type="button" id="no_member_payBtn" class="order"
							onclick="productUpdate()">수 정</button>
					</div>

					<script type="text/javascript">
						function addToCart() {
							let yn
							if ('${user.id}' == '') {
								yn = confirm('장바구니에 추가하기 위해서는 로그인이 필요합니다. 로그인 하시겠습니까?')
								if (yn)
									location.href = '../login?back=w'
							} else {
								document.forms[1].submit();
								/* location.href = 'product?productNum=${Pvo.productNum }' */
							}
						}
						
						function productAddPayment() {
							document.forms[1].action = 'productAddPayment'
							document.forms[1].method = 'GET'
							document.forms[1].submit();
						}

						function productUpdate() {
							document.forms[1].action = 'productAddUpdate'
							document.forms[1].method = 'GET'
							document.forms[1].submit();
						}
					</script>

				</div>
				<br>
			</div>
		</div>
	</div>
	<br>



	<!-- 네비게이션 Tab -->
	<div class="sticky">
		<ul class="nav nav-tabs" role="tablist">
			<li class="nav-item"><a class="nav-link active"
				data-bs-toggle="tab" href="#home" style="margin-left: 400px;">상세
					설명</a></li>
			<li class="nav-item"><a class="nav-link" data-bs-toggle="tab"
				href="#menu1">리뷰</a></li>
			<li class="nav-item"><a class="nav-link" data-bs-toggle="tab"
				href="#menu2">QnA</a></li>
		</ul>
	</div>
	<!-- Tab panes -->
	<div class="tab-content">
		<div id="home" class="container tab-pane active">
			<br> <br>
			<!-- 상세 이미지 -->
			<div id="detailImg">
				<img class="detailImg" alt="prodectdtail"
					src="../images/Product/${Pvo.fileNameOriginal }">
			</div>
			<!-- 	<div>
				<button>펼치기</button>
			</div> -->
			<hr>
		</div>
		<div id="menu1" class="container tab-pane fade">
			<br> <br>
			<div id="review">

				<div>
					<div class="container">
						<table class="board-table">
							<thead>
								<tr>
									<th colspan="4"
										style="text-align: center; border-bottom: 1px solid #e7e7e7">Review(3)</th>
								</tr>
								<tr>
									<th scope="col" class="th-num">번호</th>
									<th scope="col" class="th-title">내용</th>
									<th scope="col" class="th-title">작성자</th>
									<th scope="col" class="th-date">등록일</th>
								</tr>
							</thead>
							<tbody>
								<%
								for (int i = 0; i < 5; i++) {
								%>
								<tr>
									<td>번호</td>
									<td>아이디(작성자)</td>
									<td>내용</td>
									<td style="text-align: center;">작성일</td>
								</tr>
								<%
								}
								%>
							</tbody>
						</table>

						<br> <br>
						<div style="text-align: center;">[ &lt; ] 페이지 [ &gt; ]</div>
					</div>
				</div>
			</div>

		</div>
		<div id="menu2" class="container tab-pane fade">
			<br> <br>
			<div id="review">


				<div>
					<div class="container">
						<table class="board-table">
							<thead>
								<tr>
									<th colspan="4"
										style="text-align: center; border-bottom: 1px solid #e7e7e7">QnA</th>
								</tr>
								<tr>
									<th scope="col" class="th-num">QnA</th>
									<th scope="col" class="th-title">내용</th>
									<th scope="col" class="th-title">작성자</th>
									<th scope="col" class="th-date">등록일</th>
								</tr>
							</thead>
							<tbody>
								<%
								for (int i = 0; i < 5; i++) {
								%>
								<tr>
									<td>번호</td>
									<td>아이디(작성자)</td>
									<td>내용</td>
									<td style="text-align: center;">작성일</td>
								</tr>
								<%
								}
								%>
							</tbody>
						</table>
						<!-- board seach area -->
						<div id="board-search">
							<div class="container">
								<div class="search-window">
									<form action="" method="post" id="boardForm">
										<div class="search-wrap">
											<input type="hidden" name="p_num" value="102"> <input
												type="hidden" name="p_name" value="ECTO BTK-11"> <label
												for="search" class="blind">QnA 작성</label>
											<textarea style="width: 450px; height: 65px;" name="rContent"
												id="board_content" placeholder="내용을 입력해주세요."></textarea>
											<c:if test="${sessionScope.user != null }">
												<button style="height: 65px;" type="submit"
													class="btn btn-dark">작성</button>
											</c:if>
											<c:if test="${sessionScope.user == null }">
												<button class="btn btn-dark" type="button"
													style="height: 65px;" onclick="">로그인</button>
											</c:if>

										</div>
									</form>
								</div>
							</div>
						</div>
						<div style="text-align: center;">[ &lt; ] 페이지 [ &gt; ]</div>
					</div>
				</div>
			</div>

		</div>
	</div>

	<br>
	<br>
	<br>
	<br>
	<br>
	<div style="clear: both;"></div>


	<br>
	<br>
	<%@ include file="../footer.jsp"%>
</body>

</html>