<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>COMMUNITY</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/communitylist.css?v=3">
	</head>
	<%@include file="../top.jsp"%>
	<body>
		<main id="list">
			
			<!-- TITLE -->
			<h3>COMMUNITY</h3>
			
			<!-- NAV TAB-->
			<div style="width:max-content;margin: auto;padding: 10px;text-align: center;">
				<ul class="nav">
					<li><a href="communitylist?category=1">공지사항</a></li>
					<li><a href="communitylist?category=2">상품후기</a></li>
					<li><a href="communitylist?category=3">QnA</a></li>
				</ul>
			</div>
			
			<hr style="color:white;">
			<div style="margin:auto;width:1200px;">
			
				<!-- community : announcement -->
				<c:if test="${category == 1}">
					<ul id="main">
						<li>	
							<ul class="row1">
								<li>번호</li>
								<li>제목</li>
								<li>작성자</li>
								<li>조회수</li>
								<li>작성일</li>
							</ul>
						</li>
						
					 	<c:forEach var="vo" items="${list}"> 
							<li>
								<ul class="row1">
									<li>
										<c:out value="${vo.idx}"/>
									</li>
									<li>
										<a href="communityread?idx=${vo.idx}&category=${category}&page=${paging.currentPage}" class="title">
											<c:out value="${vo.title}"/>
										</a>
								 	</li>
									<li>
										<c:out value="${vo.nickname}"/>
									</li>
									<li>
										<c:out value="${vo.readCount}"/>
									</li>
									<li>
										<fmt:formatDate value="${vo.createdAt}" pattern="yyyy-MM-dd" var="createdAt"/>
										<c:if test='${createdAt == today}'>
											<fmt:formatDate value="${vo.createdAt}" type="time"/>
										</c:if>
										<c:if test='${createdAt != today}'>
											<fmt:formatDate value="${vo.createdAt}" pattern="yyyy-MM-dd"/>
										</c:if>
									</li>
								</ul>
							</li>
					 	</c:forEach>
					</ul>
					<c:if test="${user.admin == 'y'}">
						<div style="float:right;margin:10px;">
							<a href="javascript:write()" class="button">글쓰기</a>
						</div>
					</c:if>
				</c:if>
				
				<!-- community : review -->
				<c:if test="${category == 2}">
					<ul id="main">
						<li>	
							<ul  class="row2">
								<li>번호</li>
								<li>상품정보</li>
								<li>제목</li>
								<li>작성자</li>
								<li>조회수</li>
								<li>작성일</li>
								<li>평점</li>
							</ul>
						</li>
						
					 	<c:forEach var="vo" items="${list}"> 
							<li>
								<ul  class="row2">
									<li>
										<c:out value="${vo.idx}"/>
									</li>
									<li>	
										<a href="${pageContext.request.contextPath}/product?productNum=${vo.productNum}">
											<img src="../images/community/${vo.fileName}" border="0">
										</a>
									</li>
									<li>
										<a href="communityread?idx=${vo.idx}&category=${category}&page=${paging.currentPage}" class="title">
											<c:out value="${vo.title}"/>
										</a>
								 		..<span style="color:orange;font-size: 80%;">(<c:out value="${vo.commentCount}"/>)
								 		</span></li>
									<li>
										<c:out value="${vo.nickname}"/>
									</li>
									<li>
										<c:out value="${vo.readCount}"/>
									</li>
									<li>
										<fmt:formatDate value="${vo.createdAt}" pattern="yyyy-MM-dd" var="createdAt"/>
										<c:if test='${createdAt == today}'>
											<fmt:formatDate value="${vo.createdAt}" type="time"/>
										</c:if>
										<c:if test='${createdAt != today}'>
											<fmt:formatDate value="${vo.createdAt}" pattern="yyyy-MM-dd"/>
										</c:if>
									</li>
									<li>
										<c:if test="${vo.point == 0}">
											<img src="https://img.echosting.cafe24.com/skin/base/board/ico_point0.gif">
										</c:if>
										<c:if test="${vo.point == 1}">
											<img src="https://img.echosting.cafe24.com/skin/base/board/ico_point1.gif">
										</c:if>
										<c:if test="${vo.point == 2}">
											<img src="https://img.echosting.cafe24.com/skin/base/board/ico_point2.gif">
										</c:if>
										<c:if test="${vo.point == 3}">
											<img src="https://img.echosting.cafe24.com/skin/base/board/ico_point3.gif">
										</c:if>
										<c:if test="${vo.point == 4}">
											<img src="https://img.echosting.cafe24.com/skin/base/board/ico_point4.gif">
										</c:if>
										<c:if test="${vo.point == 5}">
											<img src="https://img.echosting.cafe24.com/skin/base/board/ico_point5.gif">
										</c:if>
									</li>
								</ul>
							</li>
					 	</c:forEach>
					</ul>
					<c:if test="${user.id != null}">
						<div style="float:right;margin:10px;">
							<a href="javascript:write()" class="button">글쓰기</a>
						</div>
					</c:if>
				</c:if>
				
				<!-- community : QnA -->
				<c:if test="${category == 3}">
					<ul id="main">
						<li>	
							<ul  class="row3">
								<li>번호</li>
								<li>상품정보</li>
								<li>제목</li>
								<li>작성자</li>
								<li>조회수</li>
								<li>작성일</li>
							</ul>
						</li>
						
					 	<c:forEach var="vo" items="${list}"> 
							<li>
								<ul  class="row3">
									<li>
										<c:out value="${vo.idx}"/>
									</li>
									<li>
										<c:if test="${vo.fileName == null}">
											<label>없음</label>
											<%-- <img src="../images/community/${vo.fileName}" border="0"> --%>
										</c:if>
										<c:if test="${vo.fileName != null}">
											<a href="${pageContext.request.contextPath}/product?productNum=${vo.productNum}">
												<img src="../images/community/${vo.fileName}" border="0">
											</a>
										</c:if>	
									</li>
									<li>
										<c:if test="${vo.password == null}">
											<a href="communityread?idx=${vo.idx}&category=${category}&page=${paging.currentPage}" class="title">
												<c:out value="${vo.title}"/>
											</a>
										</c:if>
										<c:if test="${vo.password != null}">
											<a href="communitycheck?idx=${vo.idx}&category=${category}&page=${paging.currentPage}" class="title">
												<c:out value="${vo.title}"/>
											</a>
											<img src="http://img.echosting.cafe24.com/design/skin/admin/ko_KR/ico_lock.gif">
										</c:if>
								 		..<span style="color:orange;font-size: 80%;">(<c:out value="${vo.commentCount}"/>)
								 		</span></li>
									<li>
										<c:out value="${vo.nickname}"/>
									</li>
									<li>
										<c:out value="${vo.readCount}"/>
									</li>
									<li>
									<fmt:formatDate value="${vo.createdAt}" pattern="yyyy-MM-dd" var="createdAt"/>
									<c:if test='${createdAt == today}'>
										<fmt:formatDate value="${vo.createdAt}" type="time"/>
									</c:if>
									<c:if test='${createdAt != today}'>
										<fmt:formatDate value="${vo.createdAt}" pattern="yyyy-MM-dd"/>
									</c:if>
									</li>
								</ul>
							</li>
					 	</c:forEach>
					</ul>
					<c:if test="${user.id != null}">
						<div style="float:right; margin:10px;">
							<a href="javascript:write()" class="button">글쓰기</a>
						</div>
					</c:if>
				</c:if>
			</div>
			
			<hr style="color:white;">
			<br>	
				
			<div style="width:max-content;margin: auto;padding: 10px;text-align: center;">
				<a class="pagenum" href="communitylist?category=${category}&page=1">&lt;&lt;</a>
				
				<a class="pagenum" href="communitylist?category=${category}&page=${paging.startPage-1}"      
						style='<c:if test="${paging.startPage==1}">display:none;</c:if>' >&lt;</a>
				
				<c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
					<a class="pagenum ieach" href="communitylist?category=${category}&page=${i}"><c:out value="${i}"/></a>
				</c:forEach>
				
				<a class="pagenum" href="communitylist?category=${category}&page=${paging.endPage+1}"
						style='<c:if test="${paging.endPage==paging.totalPage}">display:none;</c:if>'>&gt;</a>
						
				<a class="pagenum" href="communitylist?category=${category}&page=${paging.totalPage}">&gt;&gt;</a>
			</div>
			</main>
		
		<script type="text/javascript">
			function write() 
			{
				let yn
				if('${user.id}'=='')
				{
					yn=confirm('글쓰기는 로그인이 필요합니다. 로그인 하시겠습니까?')
					if(yn) location.href='${pageContext.request.contextPath}/login?back=w'
				}
				else
				location.href='communitywrite?category=${category}&page=${paging.currentPage}'	
			}
			
			const pnums = document.querySelectorAll('.ieach');
			
			pnums.forEach(function(item)
			{
				console.log(item);
				
				if(item.innerHTML=='${paging.currentPage}') 
				{    
					item.style.color = 'black';
					item.style.fontWeight = 'bold';
				}
				else
					item.style.color = '#37966f';
			});
		</script>
			
	</body>
	<%@include file="../footer.jsp"%>
</html>