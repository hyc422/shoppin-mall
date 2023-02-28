<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width">
<title>장바구니</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/cart.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/product.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/cart.js"></script>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
	<%@ include file="../top.jsp"%>
	<div id="wrap">
		<section id="contents-cart" class="contents-cart async-content"
			style="visibility: visible;">
			<h4 style="text-align: center; margin: 10px 10px;">장바구니</h4>
            <input type="hidden" name="cmd" value="order">
            <div class="basketdiv" id="basket">
                <div class="row head">
                    <div class="subdiv">
                        <div class="check">선택</div>
                        <div class="img">이미지</div>
                        <div class="pname">상품명</div>
                    </div>
                    <div class="subdiv">
                        <div class="basketprice">가격</div>
                        <div class="num">수량</div>
                        <div class="sum">합계</div>
                    </div>
                    <div class="subdiv">
                        <div class="basketcmd">삭제</div>
                    </div>
                    <div class="split"></div>
                </div>
        	<c:forEach items="${vo }" var="vo" varStatus="num">
        	<!-- onclick="javascript:basket.checkItem();" -->
                <div class="row data">
                    <div class="subdiv">
                        <div class="check">
                        <input type="checkbox" data-cartNum="${vo.cartNum}" class="buy" name="buy" value="${vo.cartNum}" >&nbsp;</div>
                        <div class="img"><a href="${pageContext.request.contextPath }/Product/product?productNum=${vo.productNum}"> 
                        <img src="${pageContext.request.contextPath }/images/Product/${vo.fileName }" width="60"></a></div>
                        <div class="pname">
                            <span>
                            <a href="${pageContext.request.contextPath }/Product/product?productNum=${vo.productNum}"><input type="hidden" name="productName" value=" ${vo.productName }"> ${vo.productName }</a>
                            </span>
                        </div>
                    </div>
                    <div class="subdiv">
                        <div class="basketprice">
                        <input type="hidden" name="p_price${num.index }" id="p_price${num.index }" class="p_price" value="${vo.productPrice }"><fmt:formatNumber
											value="${vo.productPrice }" pattern="###,###,###" /></div>
                        <div class="num">
						  <form method="post"action="cart">
						   <input type="hidden" name="cartNum" value="${vo.cartNum }">
						   <input type="hidden" name="id" value="${vo.id }">
                            <div class="updown">
                                <input type="text" id="p_num${num.index }"name="p_num" id="p_num${num.index }" size="1" maxlength="2" class="p_num" value="${vo.amount }" onkeyup="javascript:basket.changePNum(${num.index });">
                                <span onclick="javascript:basket.changePNum(${num.index });"><button type="submit" class="fas fa-arrow-alt-circle-up up" value="+"></button><i ></i></span>
                                <span onclick="javascript:basket.changePNum(${num.index });"><button type="submit" class="fas fa-arrow-alt-circle-down down" value="-"></button><i ></i></span>
                            </div>
       		 			</form>
                        </div>
                        <div class="sum"><fmt:formatNumber value="${vo.productPrice*vo.amount }" pattern="###,###,###" />원</div>
                    </div>
                    <div class="subdiv">
                        <div class="basketcmd">
                    <form method="post" action="cart/delete">
                    <input type="hidden" name="cartNum" value="${vo.cartNum }">
                    <input type="hidden" name="id" value="${vo.id }">
                        <a href="javascript:void(0)" class="abutton">
                        <button type="submit" style="background: none; color: white; border: none;">삭제</button>
                        </a>
                    </form>	
                        </div>
                    </div>
                </div>
        	</c:forEach>
        <!-- onclick="deleteValue()" -->
            </div>
            <div style=" padding-left: 18px;">
    		<input type='checkbox' name='SelectAll' onclick='selectAll(this)' style="text-align : center; transform: scale(1.5); margin: 5px;"/><b>&nbsp;모두 선택</b>
            </div>
            <div class="right-align basketrowcmd">
            <form method="post" action="cart/selectDelete">
    		  <input type="hidden" name="id" value="${user.id }">
    		  <input type="hidden" name="cartNum1" id="cartNum1" value="">
                <a class="abutton"><button onclick="deleteValue()" id="selectDelete" type="button" style="padding-top:20px; background: none; color: white;border: none;">선택상품삭제</button></a>
            </form>
            
    		 <form method="post" action="cart/deleteAll">
    		  <input type="hidden" name="id" value="${user.id }">
                <a class="abutton"> <button type="submit" style="padding-top:20px; background: none; color: white;border: none;">전체삭제</button></a>
    		</form>
    		
            </div>
            <div class="bigtext right-align sumcount" id="sum_p_num">상품갯수: ${sum }개</div>
            <div class="bigtext right-align box blue summoney" id="sum_p_price">합계금액: ${totalPrice }원</div>
            
            <div id="goorder" class="">
    		<form method="get" action="Product/productAddPayment">
            <input type="hidden" name="id" value="${user.id }">
             <input type="hidden" name="cartNum2" id="cartNum2" value="">	
                <div class="clear"></div>
                <div class="buttongroup center-align cmd">
                   <button onclick="selectPay()" style="font-size: 30px; border: none; background: black; color: white; border-radius: 5px;">선택한 상품 주문</button>
                </div>
            </form>
            </div>

		</section>
	</div>


	<%@ include file="../footer.jsp"%>
</body>
<script type="text/javascript">
	function productAddPayment() {
			location.href = '${pageContext.request.contextPath }/Product/productAddPayment'
	}
	function selectAll(selectAll)  {
		  const checkboxes 
		     = document.querySelectorAll('input[type="checkbox"]');
		  
		  checkboxes.forEach((checkbox) => {
		    checkbox.checked = selectAll.checked
		  })
		}
</script>
</html>