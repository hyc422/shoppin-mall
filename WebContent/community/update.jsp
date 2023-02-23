<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>우리 북카페</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath }/css/list.css?v=3">
	</head>
	<body>
		<main id="write">
			<h3>북챗 :: 커뮤니티</h3>
			<p>오늘 무슨책을 읽으셨나요?</p>
			<hr style="color:white;">
			<form action="update" method="POST" name="update">
				<input type="hidden" name="idx" value="${vo.idx}">
				<input type="hidden" name="page" value="${page}">
				<table>
					<tr>
						<th>제목</th>
						<td>
							<c:choose>
								<c:when test="${fn:contains(vo.title,'[수정]')}">
									<input type="text" name="title" size="50" value="${vo.title}" readonly>
									<!-- 입력불가 --> 
								</c:when>
								<c:otherwise>
									<input type="text" name="title" size="50" value="[수정]${vo.title}" readonly>
									<!-- 입력불가 --> 
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
					<tr>
						<th>작성자</th>
						<td>
							<input type="text" name="writer" size="50" value="${vo.writer}" disabled="disabled">
							<!-- disabled : 입력 불가 + parameter 전송 불가 -->
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
							<button type="button" onclick="location.href='list?page=${page}'">목록</button>
						</td>
					</tr>
				</table>
			</form>
		</main>
	</body>
</html>