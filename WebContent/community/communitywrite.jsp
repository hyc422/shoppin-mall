<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>COMMUNITY</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/community.css?v=3">
	</head>
	<%@include file="../top.jsp"%>
	<body>
		<main id="write">
		
			<!-- community : announcement -->
			<c:if test="${category == 1}">
				<h3>공지사항</h3>
				<hr style="color:white;">
				<form action="communitywrite" method="POST">				
					<input type="hidden" name="category" value="${category}">
					<input type="hidden" name="page" value="${page}">
					<table>
						<tr>
							<th><label>제목</label></th>	
							<td><input type="text" name="title" size="50" required></td>				
						</tr>
						<tr>
							<th><label>작성자</label></th>
							<td><input type="text" name="nickname" value="${user.nickname}" size="50" readonly></td>				
						</tr>
						<tr>
							<th><label>내용</label></th>
							<td><textarea rows="30" cols="80" name="content" style="resize:none;" required></textarea></td>				
						</tr>
						<tr>
							<td style="text-align:center; padding:10px;" colspan="2">
								<button type="submit">저장</button>
								<button type="reset">다시쓰기</button>
								<button type="button" onclick="location.href='communitylist?category=${category}&page=${(page eq null)?1:page}'">목록</button>
							</td>
						</tr>
					</table>
				</form>
			</c:if>
			
			<!-- community : review -->
			<c:if test="${category == 2}">
			<h3>상품 후기</h3>
			<hr style="color:white;">
				<form action="communitywrite" method="POST">
					<input type="hidden" name="category" value="${category}">
					<input type="hidden" name="productNum" value="${productNum}">
					<table>
						<tr>
							<th><label>제목</label></th>	
							<td><input type="text" name="title" size="50" required></td>				
						</tr>
						<tr>
							<th><label>작성자</label></th>
							<td><input type="text" name="nickname" value="${user.nickname}" size="50" required></td>				
						</tr>
						<tr>
							<th><label>상품</label></th>
							<td><img src="../images/community/${fileName}" border="0"></td>				
							<td><label>${productName}</label></td>
						</tr>
						<tr>
							<th><label>내용</label></th>
							<td><textarea rows="30" cols="80" name="content" style="resize:none;" required></textarea></td>				
						</tr>
						<tr>
							<td style="text-align:center; padding:10px;" colspan="2">
								<button type="submit">저장</button>
								<button type="reset">다시쓰기</button>
							<!-- 링크 확인 -->	<button type="button" onclick="location.href='communitylist?category=${category}&page=${(page eq null)?1:page}'">돌아가기</button>
							</td>
						</tr>
					</table>
				</form>
			</c:if>
			
			<!-- community : QnA -->
			<c:if test="${category == 3}">
			<h3>상품 후기</h3>
			<hr style="color:white;">
				<form action="communitywrite" method="POST">
					<input type="hidden" name="category" value="${category}">
					<input type="hidden" name="productNum" value="${productNum}">
					<table>
						<tr>
							<th><label>제목</label></th>	
							<td><input type="text" name="title" size="50" required></td>				
						</tr>
						<tr>
							<th><label>작성자</label></th>
							<td><input type="text" name="nickname" value="${user.nickname}" size="50" required></td>				
						</tr>
						<tr>
							<th><label>상품</label></th>
							<td>
								<c:if test="${productNum == null}">
									<label>없음</label>
									<%-- <img src="../images/community/${fileName}" border="0"> --%>
								</c:if>
								<c:if test="${productNum != null}">
									<img src="../images/community/${fileName}" border="0">
								</c:if>
								<c:if test="${productNum == null}">
									<span>없음</span>
								</c:if>
								<c:if test="${productNum != null}">
									<span>${productName}</span>
								</c:if>
							</td>				
						</tr>
						<tr>
							<th><label>내용</label></th>
							<td><textarea rows="30" cols="80" name="content" style="resize:none;" required></textarea></td>				
						</tr>
						<tr>
							<th><label>비밀번호</label></th>	
							<td><input type="text" name="password" size="50" placeholder="숫자 4자리"></td>	
						</tr>
						<tr>
							<td style="text-align:center; padding:10px;" colspan="2">
								<button type="submit">저장</button>
								<button type="reset">다시쓰기</button>
								<button type="button" onclick="location.href='communitylist?category=${category}&page=${(page eq null)?1:page}'">목록</button>
							</td>
						</tr>
					</table>
				</form>
			</c:if>
		</main>
	</body>
	<%@include file="../footer.jsp"%>
</html>

