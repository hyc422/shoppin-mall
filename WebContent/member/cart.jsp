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
                        <div class="basketcmd">저장</div>
                    </div>
                    <div class="subdiv">
                        <div class="basketcmd">삭제</div>
                    </div>
                    <div class="split"></div>
                </div>
        
        	<c:forEach items="${vo }" var="vo" varStatus="num">
			  <form name="orderform" id="orderform" method="post" class="orderform" action="">
                <div class="row data">
                    <div class="subdiv">
                        <div class="check"><input type="checkbox" name="buy" value="260" checked="" onclick="javascript:basket.checkItem();">&nbsp;</div>
                        <div class="img"><a href="${pageContext.request.contextPath }/Product/product?productNum=${vo.productNum}"> 
                        <img src="${pageContext.request.contextPath }/images/Product/${vo.fileName }" width="60"></a></div>
                        <input type="hidden" name="id" value="${vo.id }">
                        <input type="hidden" name="productName" value="${vo.productName }">
                        <input type="hidden" name="fileName" value="${vo.fileName }">
                        <input type="hidden" name="productNum" value="${vo.productNum }">
                        <input type="hidden" name="productCategories" value="${vo.productCategories }">
                        <input type="hidden" name="productPrice" value="${vo.productPrice }">
                        <input type="hidden" name="cartNum" value="${vo.cartNum }">
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
                            <div class="updown">
                                <input type="text" id="p_num${num.index }"name="p_num" id="p_num${num.index }" size="1" maxlength="2" class="p_num" value="${vo.amount }" onkeyup="javascript:basket.changePNum(${num.index });">
                                <span onclick="javascript:basket.changePNum(${num.index });"><button type="submit" class="fas fa-arrow-alt-circle-up up" value="+"></button><i ></i></span>
                                <span onclick="javascript:basket.changePNum(${num.index });"><button type="submit" class="fas fa-arrow-alt-circle-down down" value="-"></button><i ></i></span>
                            </div>
                        </div>
                        <div class="sum"><fmt:formatNumber value="${vo.productPrice*vo.amount }" pattern="###,###,###" />원</div>
                    </div>
                    <div class="subdiv">
                        <div class="basketcmd"><button type="submit">저장</button></div>
                    </div>
                    <div class="subdiv">
                        <div class="basketcmd"><a href="javascript:void(0)" class="abutton" onclick="javascript:basket.delItem();">삭제</a></div>
                    </div>
                </div>
        </form>
        	</c:forEach>
        
        
            </div>
    
            <div class="right-align basketrowcmd">
                <a href="javascript:void(0)" class="abutton" onclick="javascript:basket.delCheckedItem();">선택상품삭제</a>
                <a href="javascript:void(0)" class="abutton" onclick="javascript:basket.delAllItem();">장바구니비우기</a>
            </div>
    
            <div class="bigtext right-align sumcount" id="sum_p_num">상품갯수: ${sum }개</div>
            <div class="bigtext right-align box blue summoney" id="sum_p_price">합계금액: ${totalPrice }원</div>
    
            <div id="goorder" class="">
                <div class="clear"></div>
                <div class="buttongroup center-align cmd">
                    <a href="javascript:void(0);">선택한 상품 주문</a>
                </div>
            </div>

		</section>
	</div>


	<%@ include file="../footer.jsp"%>
</body>
</html>