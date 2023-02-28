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
						<form action="" name="form" method="post" id="storeForm">
					<div id="cart">
							<input type="hidden" name="id" value="${user.id }"> 
							<input type="hidden" name="cartNum2" value="0"> 
							<input type="hidden" name="fileName" value="${Pvo.fileName }">
							<input type="hidden" name="fileNameOriginal" value="${Pvo.fileNameOriginal }"> 
							<input type="hidden" name="productName" value="${Pvo.productName }"> 
							<input type="hidden" name="productCategories" value="${Pvo.productCategories }">
							<input type="hidden" name="productNum" value="${Pvo.productNum }">
							<div class="quantity">
								<span class="btn_position">주문 수량</span> &nbsp;&nbsp;&nbsp; 
								<input class="count" type="button" value="-" onclick="del();">
								<input class="count" type="hidden" name="productPrice"
									value="${Pvo.productPrice }"> 
								<input class="count" type="text" name="amount" value="1" size="3"
									onchange="change();"> 
								<input class="count" type="button" value="+" onclick="add();">
							</div>
							<br>
							<div class="price">
								<b> 총 금액 &nbsp;&nbsp;&nbsp;
								<input type="text" class="price_box" name="sum" size="7" name="totalPrice"
									style="border: none; font-size: 20px;" readonly>원
								</b>
							</div>
							<br>
					</div>
					<div class="cart_put">
						<button type="button" id="no_member_cart_put" class="order"
							onclick="Cart()">장바구니</button>
						<button type="button" id="no_member_payBtn" class="order"
							onclick="productAddPayment()">구매하기</button>
							
							<c:if test="${user.admin =='y' }">
						<button type="button" id="no_member_payBtn" class="order"
							onclick="productUpdate()">수 정</button>
							</c:if>
							<c:if test="${user.admin =='y' }">
						<button type="button" id="no_member_payBtn" class="order"
							onclick="productDelete()">삭 제</button>
							</c:if>
					</div>
						</form>

					<script type="text/javascript">
						function Cart() {
							let yn
							if ('${user.id}' == '') {
								yn = confirm('장바구니에 추가하기 위해서는 로그인이 필요합니다. 로그인 하시겠습니까?')
								if (yn)
									location.href = '../login?back=w'
							} else {
								document.forms[1].submit();
								/* yn = confirm('장바구니로 이동 하시겠습니까?')
								location.href = '${pageContext.request.contextPath }/cart?id=${user.id}' */
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
		                  
		                  function productDelete() {
		                     document.forms[1].action = 'productDelete'
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
					src="${pageContext.request.contextPath }/images/Product/${Pvo.fileNameOriginal }">
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
										style="text-align: center; border-bottom: 1px solid #e7e7e7">Review(${RevPaging.totalCount })</th>
								</tr>
								<tr>
									<th scope="col" class="th-num">번호</th>
									<th scope="col" class="th-title">내용</th>
									<th scope="col" class="th-title">작성자</th>
									<th scope="col" class="th-date">등록일</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${Rev }" var="Rev">
								<tr>
									<td><a href="${pageContext.request.contextPath }/community/communityread?idx=${Rev.idx}&category=2">${Rev.idx }</a></td>
									<td><a href="${pageContext.request.contextPath }/community/communityread?idx=${Rev.idx}&category=2">${Rev.content }</a></td>
									<td><a href="${pageContext.request.contextPath }/community/communityread?idx=${Rev.idx}&category=2">${Rev.nickname }</a></td>
									<td style="text-align: center; ">${Rev.createdAt }</td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
						<%-- <div style="width: 700px; margin: auto; padding: 10px; text-align: center;">
						<br> 
						<hr>
						<a class="pagenum" href="?productNum=${a }&ReVpage=1">&lt;&lt;</a>
						<a class="pagenum" href="?productNum=${a }&ReVpage=${RevPaging.startPage-1 }"
							style='<c:if test="${RevPaging.startPage==1 }">display:none;</c:if>'>&lt;</a>
						<c:forEach var="i" begin="${RevPaging.startPage }"
							end="${RevPaging.endPage }">
							<a class="pagenum ieach" href="?productNum=${a }&ReVpage=${i }"><c:out
									value="${i }" /></a>
						</c:forEach>
						<a class="pagenum" href="?productNum=${a }&ReVpage=${RevPaging.endPage+1 }"
							style='<c:if test="${RevPaging.endPage==RevPaging.totalPage }">display:none;</c:if>'>&gt;</a>
						<a class="pagenum" href="?productNum=${a }&ReVpage=${RevPaging.totalPage }">&gt;&gt;</a>
						</div> --%>

						<br> <br>
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
										style="text-align: center; border-bottom: 1px solid #e7e7e7">QnA(${QnaPaging.totalCount })</th>
								</tr>
								<tr>
									<th scope="col" class="th-num">번호</th>
									<th scope="col" class="th-title">제목</th>
									<th scope="col" class="th-title">작성자</th>
									<th scope="col" class="th-date">등록일</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${Qna }" var="Qna">
								<tr>
									<td><a href="${pageContext.request.contextPath }/community/communityread?idx=${QnA.idx}&category=3">${Qna.idx }</a></td>
									<td><a href="${pageContext.request.contextPath }/community/communityread?idx=${QnA.idx}&category=3">${Qna.title }</a></td>
									<td><a href="${pageContext.request.contextPath }/community/communityread?idx=${QnA.idx}&category=3">${Qna.nickname }</a></td>
									<td style="text-align: center;">${Qna.createdAt }</td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
						<!-- board seach area -->
						<div id="board-search">
							<div class="container">
								<div class="search-window">
									<form action="community/communitywrite" method="post" id="boardForm">
									<c:if test="${sessionScope.user != null }">
											<div style="margin: auto; padding: 10px; float: center; text-align: center;">
											제목입력 : <input name="title" class="input">
											비밀번호 : <input name="password" class="input">
											</div>
									</c:if>
										<div class="search-wrap">
										<input type="hidden" name="category" value="3">
										<input type="hidden" name="nickname" value="${user.nickname}">
										<input type="hidden" name="fileName" value="${Pvo.fileName }">
										<input type="hidden" name="productName" value="${Pvo.productName }"> 
										<input type="hidden" name="productnum" value="${Pvo.productNum }">
											<label for="search" class="blind">QnA 작성</label>
											<c:if test="${sessionScope.user != null }">
											<textarea style="width: 450px; height: 65px;" name="content"
												id="board_content" placeholder="내용을 입력해주세요."></textarea>
												<button style="height: 65px;" type="button" onclick="Qna()"
													class="btn btn-dark">작성</button>
											</c:if>
											<c:if test="${sessionScope.user == null }">
											<button style="height: 65px;" type="button" onclick="login()"
													class="btn btn-dark">로그인</button>
											</c:if>
										</div>
									</form>
								</div>
							</div>
						</div>
						<script type="text/javascript">
						function Qna() {
							console.log(document.forms[2].title.value)
							console.log(document.forms[2].password.value)
							console.log(document.forms[2].category.value)
							console.log(document.forms[2].nickname.value)
							console.log(document.forms[2].productName.value)
							console.log(document.forms[2].productnum.value)
							console.log(document.forms[2].content.value)
							const df = document.forms[2]
							const title = df.title
							const password = df.password
							const content = df.content
							let run = true
							if (title.value == '') {
								alert('제목을 입력해주세요.')
								address.focus()
								run = false
							}
							if (password.value == '') {
								alert('비밀번호를 입력해주세요.')
								address.focus()
								run = false
							}
							if (content.value == '') {
								alert('내용을 입력해주세요.')
								address.focus()
								run = false
							}
							if (run) {
								df.submit()
							}
							
						}
						function login() {
							if ('${user.id}' == '') {
								yn = confirm('QnA 작성을 위해서는 로그인이 필요합니다. 로그인 하시겠습니까?')
								if (yn)
									location.href = '../login?back=w'
							}
						}
						</script>
					<%-- 	<div
						style="width: 700px; margin: auto; padding: 10px; text-align: center;">
						<br> 
						<hr>
						<a class="pagenum" href="?productNum=${a }&QnApage=1">&lt;&lt;</a>
						<a class="pagenum" href="?productNum=${a }&QnApage=${QnaPaging.startPage-1 }"
							style='<c:if test="${QnaPaging.startPage==1 }">display:none;</c:if>'>&lt;</a>
						<c:forEach var="i" begin="${QnaPaging.startPage }"
							end="${QnaPaging.endPage }">
							<a class="pagenum ieach" href="?productNum=${a }&QnApage=${i }"><c:out
									value="${i }" /></a>
						</c:forEach>
						<a class="pagenum" href="?productNum=${a }&QnApage=${QnaPaging.endPage+1 }"
							style='<c:if test="${QnaPaging.endPage==QnaPaging.totalPage }">display:none;</c:if>'>&gt;</a>

						<a class="pagenum" href="?productNum=${a }&QnApage=${QnaPaging.totalPage }">&gt;&gt;</a>
					</div> --%>
					</div>
				</div>
			</div>

		</div>
	</div>
	<script type="text/javascript">
			const pnums = document.querySelectorAll('.ieach');
			pnums.forEach(function(item) {
				/* item 번호가 현재 페이지 이면 글꼴 스타일을 다르게함. */
				if (item.innerHTML == '${paging.currentPage}') {
					item.style.color = 'black';
					item.style.fontWeight = 'bold';
				} else {
					item.style.color = '#37966f';
				}
			});
		</script>
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