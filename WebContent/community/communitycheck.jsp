<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>COMMUNITY</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/communityread.css?v=3">
	</head>
	<%@include file="../top.jsp"%>
	<body>
		<main id="read">
			<!-- community : qna -->
			<h3>COMMUNITY - QnA</h3>
			<hr style="color:white;">
			<form action="communitycheck" method="POST">
				<input type="hidden" name="idx" value="${idx}">
				<input type="hidden" name="category" value="${category}">
				<input type="hidden" name="page" value="${page}">
				<input type="hidden" name="listpassword" value="${vo.password}">
				<div style="width: 80%; margin: auto; max-width: 760px;">
					<ul id="table">
						<li>
							<ul class="row">
								<li>제목</li>
								<li><c:out value="${vo.title}"/></li>
								<li>조회수</li>
								<li><c:out value="${vo.readCount}"/></li>
							</ul>
						</li>
						<li>
							<ul class="row">
								<li>작성자</li>
								<li><c:out value="${vo.nickname}"/>
								<span style="font-size: 70%; padding-left: 30px;">(<c:out value="${vo.ip}"/>)</span></li>
								<li>작성날짜</li>
								<li><fmt:formatDate value="${vo.createdAt}" type="both"/></li>
							</ul>
						</li>
						<li>
							<c:if test="${vo.productNum != null}">
								<ul class="row">
									<li class="box" style="height:110px; line-height: 100px">상품 정보</li>
									<li>
										<a href="${pageContext.request.contextPath}/Product/product?productNum=${vo.productNum}">
											<img src="../images/community/${vo.fileName}" border="0">
											<span>${vo.productName}</span>
										</a>
									</li>
								</ul>
							</c:if>
						</li>
						<li id="content">
							<ul>
								<li>내용</li>			
								<li style="padding: 125px; padding-left: 280px">
									<input type="password" name="password" size="12" placeholder="숫자 4자리 입력" style="padding:7px">
									<button type="button" onclick="check()">확인</button>
								</li>				
							</ul>
						</li>
					</ul>
					<div style="text-align: center;margin-bottom: 10px;">
							<a class="button" href="communitylist?category=${category}&page=${page}">목록</a>
					</div>
				</div>
			</form>
		</main>
	<c:if test="${param.fail == 'y'}">
		<script type="text/javascript">
			alert('비밀번호가 틀렸습니다!')
			location.href = "communitycheck?idx=" + ${idx} + "&category=" + ${category} + "&page=" + ${page}
		</script>
	</c:if>
	
	<script type="text/javascript">
		function check()
		{		
			let password = document.forms[1].password.value
			
			if(password != '')
			{
				if(password.length == 4 && !(isNaN(Number(password))))
					document.forms[1].submit()
				else
				{
					alert('password는 숫자 4개입니다.')
					return false;
				}
			}
			else
			{
				alert('password를 입력하세요!')
				password.focus()
				return false
			}
		}
	</script>
	</body>
	<%@include file="../footer.jsp"%>
</html>