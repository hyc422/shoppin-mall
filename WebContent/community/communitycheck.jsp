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
							<c:if test="${vo.productNum == null}">
								<label>없음</label>
								<%-- <img src="../images/community/${vo.fileName}" border="0"> --%>
								<span>없음</span>
							</c:if>
							<c:if test="${vo.productNum != null}">
								<a href="${pageContext.request.contextPath}/Product/product?productNum=${vo.productNum}">
									<img src="../images/community/${vo.fileName}" border="0">
									<span>${vo.productName}</span>
								</a>
							</c:if>
						</li>
						<li id="content">
							<ul>
								<li>내용</li>			
								<li>
									<input type="text" name="password" size="50" placeholder="숫자 4자리">
									<button type="submit">확인</button>
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
	</body>
	<%@include file="../footer.jsp"%>
</html>