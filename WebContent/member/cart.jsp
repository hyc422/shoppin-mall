<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/cart.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/product.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/product.js"></script>
</head>
<body >
	<%@ include file="../top.jsp"%>
		<div id="wrap">
			<section id="contents-cart" class="contents-cart async-content"
				style="visibility: visible;">
				<h4 style="text-align: center; margin: 10px 10px;">장바구니</h4>
				<div id="cartContent" data-faraway="">
						<form action="" name="form" method="post" id="storeForm">
					<table class="cartTable">
						<thead>
							<tr class="head">
								<th scope="col" class="all-select-event"
									style="width: 10%; margin: auto"><label><input
										title="모든 상품을 결제상품으로 설정" type="checkbox" checked="checked"
										class="all-deal-select"><span>&nbsp;&nbsp;전체선택</span></label></th>
								<th scope="colgroup" id="th-product-box" colspan="2"
									style="width: 40%; margin: auto">상품정보</th>
								<th scope="col" id="th-unit-total-price" style="width: 20%;">수량</th>
								<th scope="col" id="th-unit-total-price">상품금액</th>
								<th scope="col" id="th-delivery-fee">삭제</th>
							</tr>
						</thead>
						<c:forEach items="${vo }" var="vo">
							<tbody id="cartTable-sku" onload="init();">
								<tr>
								</tr>
								<tr class="cart-deal-item " data-item-status="CHECKED">

									<td class="product-select-event"
										style="text-align: left; margin-left: 10px;">
									<input style="margin-left: 10px;" type="checkbox" checked="checked"
										class="dealSelectChk"></td>
									<td class="cart-deal-item__image "
										style="width: 20%; padding: 5px; ">
										<a href="${pageContext.request.contextPath }/Product/product?productNum=${vo.productNum}" class="moveProduct"> 
										<img src="${pageContext.request.contextPath }/images/Product/${vo.fileName }"
											 width="78" height="78" class="img">
											
									</a></td>
									<td class="product-box">
										<div class="product-name-part">
											<a href="${pageContext.request.contextPath }/Product/product?productNum=${vo.productNum}" 
											class="product-name moveProduct modify-color">${vo.productName }</a>
										</div>
									</td>
									<td style="height: 35px; padding: 3px 8px;">
										<div class="quantity">
											<span class="btn_position"></span> 
											<input class="count" type="button" value="-" onclick="del();"> 
											<input class="count" type="hidden" name="productPrice" value="${vo.productPrice }"> 
											<input style="width: 50px;" class="count" type="text" name="amount" value="${vo.amount }" size="3"
												onchange="change();"> 
											<input class="count" type="button" value="+" onclick="add();">
										</div>
									</td>
									<td>
										<div class="price">
											<input type="text" class="price_box" name="sum" size="7"
												style="border: none; font-size: 20px;" readonly>원
										</div>
									</td>
									<td class="delivery-fee" rowspan="1" headers="th-delivery-fee">
										<span class="delivery-fee__free">삭제버튼인것</span>
									</td>
								</tr>
								<tr class="special-gift-area" style="display: none;">
								</tr>
								<tr class="bundle-price-total">
									<td colspan="6"></td>
								</tr>
							</tbody>
						</c:forEach>

					</table>
						</form>

					<div class="order-table-foot">

						<span class="all-select-product"> <label> <input
								style="margin-left: 10px;" title="모든 상품을 결제상품으로 설정"
								type="checkbox" checked="checked" class="all-deal-select">
								<span>전체선택</span><span class="cart-count-bottom">( <em>1</em>
									/ 1 )
							</span>
						</label> <a href="javascript:void(0);" class="selected-delete logging"
							data-login="true" data-view-type="shoppingCart"
							data-event-name="selectiveDeletionClick"
							data-log-label="cart-p-deleteMulti" data-coulog-type="clickEvent"
							data-listener-event-type="click">전체삭제</a>
						</span>

						<div class="payment-benefit"></div>
					</div>


					<div class="cart-total-price" data-total-price="25000"
						data-discount-price="0">
						<div class="cart-total-price__inner">
							<div class="price-area">
								<h2 class="sr-only" id="cart-total-price">장바구니 총 주문금액 정보</h2>

								총 상품가격 <em class="final-product-price">상품 총 가격</em>원 <span
									class="final-sale-area"> </span> <span class="symbol-plus1"><span
									class="sr-only">더하기</span></span> 총 배송비 <em
									class="final-delivery-charge">3,000</em>원 <span
									class="symbol-equal1"><span class="sr-only">결과는</span></span> 총
								주문금액 <em class="final-order-price"
									data-final-order-price="28000"> 배송비+상품 총 가격 </em>
							</div>
						</div>


					</div>
					<br>

					<div class="order-buttons"
						style="text-align: center; margin-bottom: 20px;">
						<a id="continueShoopingBtn" class="goShopping logging"
							href="${pageContext.request.contextPath }"
							data-view-type="shoppingCart"
							data-event-name="continuouslyShoppingClick"
							data-log-label="cart-p-continuouslyShoppingClick"
							data-coulog-type="clickEvent" data-listener-event-type="click">계속
							쇼핑하기</a> <a href="" class="goPayment" id="btnPay"
							data-pay-url="/cart/orderV3?isAllChecked=true">구매하기</a>
						<div class="item-disabled" style="display: none;"></div>
					</div>



				</div>


			</section>
		</div>


	<%@ include file="../footer.jsp"%>
</body>
</html>