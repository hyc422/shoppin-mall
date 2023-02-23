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
<title>구매내역</title>
	<%@ include file="../top.jsp"%>
<style type="text/css">
body {
    margin:20px auto;
    padding: 0;
    font-family:"맑은 고딕";
    font-size:0.9em;
    
}
main{
height: 700px;}
.title{
	background-color: #373737;
	color:#ffffff;
	font-size: 18px;
	
}
ul#navi {
    width: 200px;
    text-indent: 15px;
}
ul#navi, ul#navi ul {
    margin:0;
    padding:0;
    list-style:none;
}
li.group {
    margin-bottom: 4px;
}
li.group div.title {
    height: 35px;
    line-height: 35px;
    background-color: #323232;
    cursor:pointer;
}
body {
    display: block;
    margin: 20px;
    
}
body {
    -webkit-text-size-adjust: none;
    font-family: dotum,sans-serif;
    font-size: 16px;
    line-height: 1.6;
    color: #666;
}	
.usermodify {
    position: relative;
}

input, textarea, select, button {
    font-family: sans-serif;
    font-size: 100%;
}
.usermodify{
    padding-left: 100px;
	margin-left: 300px;
}
h2{
    margin: 40px;
   margin-top: 1px;
   margin-bottom: 10px;
}
table{
       width: auto;
    border: 1px solid #bfbfbf;
    width: 700px; 
table-layout: fixed;
  
     
}
td {
    border: 1px solid #bfbfbf;
    padding :10px;
  }
  tr > td:first-child {
	color: #000000;
}

.Withdrawal{
	margin-left : 270px;
	margin-top: 40px;
}


</style>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/paylist.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/product.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/cart.js"></script>
</head>
<body>

	<h3>마이페이지</h3>
	
	
    <ul id="navi">
        <li class="group">
            <div class="title">My 쇼핑</div>
            <ul class="sub">
                <li><a href="#">구매 내역/리뷰 작성</a></li>
                <li><a href="#">장바구니</a></li>
            </ul>
        </li>
        <li class="group">
            <div class="title">MY 정보</div>
            <ul class="sub">
                <li><a href="#">개인정보확인 수정</a></li>                
            </ul>
        </li>
           
    </ul>
    <main>
	<div id="wrap">
		<section id="contents-cart" class="contents-cart async-content"
			style="visibility: visible;">
			<h4 style="text-align: center; margin: 10px 10px;">구매 내역</h4>
            <input type="hidden" name="cmd" value="order">
            <div class="basketdiv" id="basket">
                <div class="row head">
                    <div class="subdiv">
                        <div class="img">이미지</div>
                        <div class="pname">상품명</div>
                    </div>
                    <div class="subdiv">
                        <div class="basketprice">가격</div>
                        <div class="num">수량</div>
                        <div class="sum">합계</div>
                    </div>
                    <div class="subdiv">
                        <div class="basketcmd">리뷰</div>
                    </div>
                    <div class="split"></div>
                </div>
        	<c:forEach items="${vo }" var="vo" varStatus="num">
                <div class="row data">
                    <div class="subdiv">
                        <div class="check"><input type="checkbox" name="buy" value="260" checked="" onclick="javascript:basket.checkItem();">&nbsp;</div>
                        <div class="img"><a href="${vo.productNum}"> 
                        <img src="${vo.fileName }" width="60"></a></div>
                        <div class="pname">
                            <span>
                            <a href="${vo.productNum}"><input type="hidden" name="productName" value=" ${vo.productName }"> ${vo.productName }</a>
                            </span>
                        </div>
                    </div>
                    <div class="subdiv">
                        <div class="basketprice">
                        <input type="hidden" name="p_price${num.index }" id="p_price${num.index }" class="p_price" value="${vo.productPrice }"><fmt:formatNumber
											value="${vo.productPrice }" pattern="###,###,###" /></div>
                        <div class="num">
						  <form method="post"action="paylist">
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
                        <div class="basketcmd"><button type="submit">리뷰</button></div>
                    </div>
                    <div class="subdiv">
                        <div class="basketcmd">
                    <form method="post" action="cart/delete">
                    <input type="hidden" name="cartNum" value="${vo.cartNum }">
                    <input type="hidden" name="id" value="${vo.id }">
                       <!--  <a href="javascript:void(0)" class="abutton">
                        <button type="submit" style="background: none; color: white;">후기</button>
                        </a> -->
                    </form>	
                        </div>
                    </div>
                </div>
        	</c:forEach>
        
        
            </div>
    		</form>
            <div class="bigtext right-align sumcount" id="sum_p_num" >상품갯수: ${sum }개</div>
            <div class="bigtext right-align box blue summoney" id="sum_p_price">합계금액: ${totalPrice }원</div>
    	
            <div id="goorder" class="">
                <div class="clear"></div>
                <div class="buttongroup center-align cmd">
                </div>
            </div>

		</section>
	</div>
</main>

	<%@ include file="../footer.jsp"%>
</body>
</html>