<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 완료 페이지</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/productDetail.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/payment.css" />
</head>
<body>
	<%@ include file="../top.jsp" %>
	<h1>결제 완료</h1>
	<form action="${pageContext.request.contextPath}" method="POST" name="productForm" id="productForm" class="label1">
		<div>
			<h3 style="text-align: center;">배송지</h3>
			<hr>
		</div>
		
		<div style="width: 700px; margin: auto; margin-bottom: 100px;" id="big1">
			<p>
				<label>
					우편번호 <input type="text" name="zipcode" class="postcodify_postcode5" value="${zipcode }" disabled="disabled" style="border-style: none; background-color: white;"/>
				</label>
			</p>
			<p>
				<label>
					도로명주소 <input type="text" name="address" class="postcodify_address" value="${address }" disabled="disabled" style="border-style: none; background-color: white; margin-left: 27px; width: 550px;"/><br />
				</label>
			</p>
			<p>
				<label>
					상세주소 <input type="text" name="addressDetail" class="postcodify_details" value="${addressDetail }" disabled="disabled" style="width: 550px; border-style: none; background-color: white;"/><br />
				</label>
			</p>
			<p>
				<label>
					참고항목 <input type="text" name="addressEtc" class="postcodify_extra_info" value="${addressEtc }" disabled="disabled" style="width: 550px; border-style: none; background-color: white;"/><br />
				</label>
			</p>
		</div>
		
		<div>
			<h3 style="text-align: center;">결제 금액</h3>
			<hr>
		</div>
		
		<div id="big2" style="width: 700px; margin: auto; margin-bottom: 40px;">
			<c:forEach items="${vo }" var="vo">
				<div>
					<img id="fileName" name="fileName" src="${pageContext.request.contextPath}/images/Product/${vo.fileName}" width="300px" height="300px" style="display:inline;" >
				</div>
				<div>
					상품코드 <input type="text" name="productNum" id="productNum" value="${vo.productNum}" disabled="disabled">
				</div>
				<div>
					상품명 <input type="text" name="productName" id="productName" value="${vo.productName}" disabled="disabled">
				</div>
				<div>
					상품가격 <input type="text" name="productPrice" id="productPrice" value="${vo.productPrice}" disabled="disabled">
				</div>
				<div>
					카테고리 <input type="text" name="productCategories" id="productCategories" value="${vo.productCategories}" disabled="disabled">
				</div>
				<div>
					개수 <input type="text" name="amount" id="amount" value="${vo.amount}" disabled="disabled">
				</div>
			</c:forEach>
			<div>
				배송비 <span id="deliveryFee" name="deliveryFee" style="float: right;">3000</span>
			</div>
			<div style="font-size: 40px; margin-top: 30px;">
				총 결제 금액<input type="text" name="totalPrice" id="totalPrice" value="${totalPrice}" disabled="disabled" style="font-size: 40px;">
			</div>
		</div>
		<hr>
		<div class="okButton">
			<input type="submit" value="홈으로" class="btn btn-outline-light" id="okButtonOption">
		</div>
	</form>
	<%@ include file="../footer.jsp" %>
</body>
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>

<script> $(function() { $("#postcodify_search_button").postcodifyPopUp(); }); </script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>

<script>
	
	let form = document.getElementById('productForm');
	
	if(form.totalPrice.value >= 100000000){
		document.getElementById('deliveryFee').innerHTML = '무료'
	} else {
		document.getElementById('deliveryFee').innerHTML = '3,000'
	}
	
	</script>
</html>