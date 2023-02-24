<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>COMMUNITY</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath }/css/community.css?v=3">
	</head>
	<%@include file="../top.jsp"%>
	<body>
		<main id="write">
			
			<!-- community : announcement -->
			<c:if test="${category == 1}">
				<h3>공지사항</h3>
				<hr style="color:white;">
				<form action="communityupdate" method="POST" name="update">
					<input type="hidden" name="idx" value="${vo.idx}">
					<input type="hidden" name="category" value="${category}">
					<input type="hidden" name="page" value="${page}">
					<table>
						<tr>
							<th>제목</th>
							<td>
								<c:choose>
									<c:when test="${fn:contains(vo.title,'[수정]')}">
										<input type="text" name="title" size="50" value="${vo.title}" readonly>
									</c:when>
									<c:otherwise>
										<input type="text" name="title" size="50" value="[수정]${vo.title}" readonly>
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
						<tr>
							<th>작성자</th>
							<td>
								<input type="text" name="nickname" size="50" value="${vo.nickname}" disabled="disabled">
							</td>
						</tr>
						<tr>
							<th>작성 날짜</th>
							<td><c:out value="${vo.createdAt}"/></td>
						</tr>
						<tr>
							<th>내용</th>
							<td>
								<textarea rows="30" cols="80" name="content" required> <c:out value="${vo.content}"/></textarea>
							</td>
						</tr>
						<tr>
							<td colspan="2" align="center">
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
				<form action="communityupdate" method="POST" name="update">
					<input type="hidden" name="idx" value="${vo.idx}">
					<input type="hidden" name="category" value="${category}">
					<input type="hidden" name="productNum" value="${vo.productNum}">
					<table>
						<tr>
							<th>제목</th>
							<td>
								<c:choose>
									<c:when test="${fn:contains(vo.title,'[수정]')}">
										<input type="text" name="title" size="50" value="${vo.title}" readonly>
									</c:when>
									<c:otherwise>
										<input type="text" name="title" size="50" value="[수정]${vo.title}" readonly>
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
						<tr>
							<th>작성자</th>
							<td>
								<input type="text" name="nickname" size="50" value="${vo.nickname}" disabled="disabled">
							</td>
						</tr>
						<tr>
							<th><label>상품</label></th>
							<td><img src="../images/community/${vo.fileName}" border="0"></td>				
							<td><label>${vo.productName}</label></td>
						</tr>
						<tr>
							<th>작성 날짜</th>
							<td><c:out value="${vo.createdAt}"/></td>
						</tr>
						<tr>
							<th>내용</th>
							<td>
								<textarea rows="30" cols="80" name="content" required> <c:out value="${vo.content}"/></textarea>
							</td>
						</tr>
						<tr>
							<td colspan="2" align="center">
								<button type="submit">저장</button>
								<button type="reset">다시쓰기</button>
								<!-- 링크 확인 --><button type="button" onclick="location.href='communitylist?category=${category}&page=${(page eq null)?1:page}'">돌아가기</button>
							</td>
						</tr>
					</table>
				</form>
			</c:if>
			
			<!-- community : qna -->
			<c:if test="${category == 3}">
				<h3>상품 후기</h3>
				<hr style="color:white;">
				<form action="communityupdate" method="POST" name="update">
					<input type="hidden" name="idx" value="${vo.idx}">
					<input type="hidden" name="category" value="${category}">
					<input type="hidden" name="productNum" value="${productNum}">
					<input type="hidden" name="page" value="${page}">
					<table>
						<tr>
							<th>제목</th>
							<td>
								<c:choose>
									<c:when test="${fn:contains(vo.title,'[수정]')}">
										<input type="text" name="title" size="50" value="${vo.title}" readonly>
									</c:when>
									<c:otherwise>
										<input type="text" name="title" size="50" value="[수정]${vo.title}" readonly>
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
						<tr>
							<th>작성자</th>
							<td>
								<input type="text" name="nickname" size="50" value="${vo.nickname}" disabled="disabled">
							</td>
						</tr>
						<tr>
							<th><label>상품</label></th>
							<td>
								<c:if test="${vo.fileName == null}">
									<label>없음</label>
									<%-- <img src="../images/community/${vo.fileName}" border="0"> --%>
								</c:if>
								<c:if test="${vo.fileName != null}">
									<img src="../images/community/${vo.fileName}" border="0">
								</c:if>
							</td>				
							<td>
								<c:if test="${vo.productName == null}">
									<label>없음</label>
									<%-- <img src="../images/community/${vo.fileName}" border="0"> --%>
								</c:if>
								<c:if test="${vo.productName != null}">
									<label>${vo.productName}</label>
								</c:if>
							</td>
						</tr>
						<tr>
							<th>작성 날짜</th>
							<td><c:out value="${vo.createdAt}"/></td>
						</tr>
						<tr>
							<th>내용</th>
							<td>
								<textarea rows="30" cols="80" name="content" required> <c:out value="${vo.content}"/></textarea>
							</td>
						</tr>
						<tr>
							<td colspan="2" align="center">
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