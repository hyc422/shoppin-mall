<%@page import="org.shoppingMall.dao.QnaDao"%>
<%@page import="org.shoppingMall.vo.QnaProductVo"%>
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
					<input type="hidden" name="productNum" value="${vo.productNum}">
					<input type="hidden" name="fileName" value="${vo.fileName}">
					<input type="hidden" name="productName" value="${vo.productName}">
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
							<th><label>상품</label></th>
							<td>
								<img src="../images/community/${vo.fileName}">
								<span>${vo.productName}</span>
							</td>				
						</tr>
						<tr>
							<th><label>별점</label></th>
							<td style="width:850px;">
								<input type="radio" name="point"value="0">
								<label><img src="https://img.echosting.cafe24.com/skin/base/board/ico_point0.gif"></label>
								<input type="radio" name="point" value="1">
								<label><img src="https://img.echosting.cafe24.com/skin/base/board/ico_point1.gif"></label>
								<input type="radio" name="point" value="2">
								<label><img src="https://img.echosting.cafe24.com/skin/base/board/ico_point2.gif"></label>
								<input type="radio" name="point" value="3" checked="checked">
								<label><img src="https://img.echosting.cafe24.com/skin/base/board/ico_point3.gif"></label>
								<input type="radio" name="point" value="4">
								<label><img src="https://img.echosting.cafe24.com/skin/base/board/ico_point4.gif"></label>
								<input type="radio" name="point" value="5">
								<label><img src="https://img.echosting.cafe24.com/skin/base/board/ico_point5.gif"></label>
							</td>				
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
			<h3>QnA</h3>
			<hr style="color:white;">
				<form action="communitywrite" method="POST" name="qna">
					<input type="hidden" name="category" value="${category}">
					<table>
						<tr>
							<th><label>제목</label></th>	
							<td><input type="text" name="title" size="50" required></td>				
						</tr>
						<tr>
							<th><label>작성자</label></th>
							<td><input type="text" name="nickname" value="${user.nickname}" size="10" readonly></td>				
						</tr>
						<tr>
							<th>
								<label>상품 선택</label>
							</th>
							<td>
								<select id="product" onchange="selectProduct()">
									<option selected>-상품 종류-</option>
									<c:forEach var="list" items="${list}">
										<option value="${list.productNum}">
											${list.productName}
										</option>
									</c:forEach>
									<c:set var="pnum" value=""/>
									<c:forEach var="list" items="${list}">
										<input type="hidden" id="fn${list.productNum}" value="${list.fileName}">
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th><label>상품</label></th>
							<td>
								<input type="hidden" name="productNum" value="0">
								<img id="img" src="../images/community/no_img.jpg">
								<input type="hidden" name="fileName" value="">
								<input type="text" name="productName" value="" size="50" readonly>
							</td>				
						</tr>
						<tr>
							<th><label>내용</label></th>
							<td><textarea rows="30" cols="80" name="content" style="resize:none;" required></textarea></td>				
						</tr>
						<tr>
							<th><label>비밀번호</label></th>	
							<td><input type="password" name="password" size="12" placeholder="숫자 4자리"></td>	
						</tr>
						<tr>
							<td style="text-align:center; padding:10px;" colspan="2">
								<button type="button" onclick="validation()">저장</button>
								<button type="reset">다시쓰기</button>
								<button type="button" onclick="location.href='communitylist?category=${category}&page=${(page eq null)?1:page}'">목록</button>
							</td>
						</tr>
					</table>
				</form>
			</c:if>
		</main>
		<script type="text/javascript">
			function validation()
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
					password == null;
					document.forms[1].submit()
				}
			}
			
			function selectProduct()
			{
				var temp = document.getElementById("product") 
				var pnum = temp.options[document.getElementById("product").selectedIndex].value
				var fname = document.getElementById("fn"+pnum).value
				var pname = temp.options[document.getElementById("product").selectedIndex].text
				
				document.qna.productNum.value = pnum
				document.getElementById('img').src = "../images/community/" + fname
				document.qna.fileName.value = fname
				document.qna.productName.value = pname
			}
		</script>
		
		<c:out value="${pageScope.pnum}"></c:out>
	</body>
	<%@include file="../footer.jsp"%>
</html>

