<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@include file="../top.jsp"%>   
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>COMMUNITY</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/list.css?v=3">
	</head>
	<body>
		<main id="list">
		
		<!-- NAV TAB-->
		<h3>COMMUNITY</h3>
		
		<p><a href="communitylist?category=1">공지사항</a></p>
		<p><a href="communitylist?category=2">상품 후기</a></p>
		<p><a href="communitylist?category=3">상품 QnA</a></p>
		
		<!--  -->
		<hr style="color:white;">
		<div style="margin:auto;width:900px;">
		
			<!-- community : announcement -->
			<c:if test="${category == 1}">
				<ul id="main">
					<li>	
						<ul  class="row">
							<li>번호</li>
							<li>제목</li>
							<li>작성자</li>
							<li>조회수</li>
							<li>작성일</li>
						</ul>
					</li>
					
				 	<c:forEach var="vo" items="${list}"> 
						<li>
							<ul  class="row">
								<li>
									<c:out value="${vo.idx}"/>
								</li>
								<li>
									<a href="read?idx=${vo.idx}&page=${paging.currentPage}" class="title">
										<c:out value="${vo.title}"/>
									</a>
							 	</li>
								<li>
									<c:out value="${vo.writer}"/>
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
			</c:if>
			
			<!-- community : review -->
			<c:if test="${category == 2}">
				<ul id="main">
					<li>	
						<ul  class="row">
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
							<ul  class="row">
								<li>
									<c:out value="${vo.idx}"/>
								</li>
								<li>	
									<a href="${pageContext.request.contextPath}/product?productNum=???">
										<img src="../images/community/${vo.fileName}" border="0">
										<span>${vo.fileName}</span>
									</a>
								</li>
								<li>
									<a href="read?idx=${vo.idx}&page=${paging.currentPage}" class="title">
										<c:out value="${vo.title}"/>
									</a>
							 		..<span style="color:orange;font-size: 80%;">(<c:out value="${vo.commentCount }"/>)
							 		</span></li>
								<li>
									<c:out value="${vo.writer}"/>
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
			</c:if>
			
			<!-- community : QnA -->
			<c:if test="${category == 3}">
				<ul id="main">
					<li>	
						<ul  class="row">
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
							<ul  class="row">
								<li>
									<c:out value="${vo.idx}"/>
								</li>
								<li>	
									<a href="${pageContext.request.contextPath}/product?productNum=???">
										<img src="../images/community/${vo.fileName}" border="0">
										<span>${vo.fileName}</span>
									</a>
								</li>
								<li>
									<a href="read?idx=${vo.idx}&page=${paging.currentPage}" class="title">
										<c:out value="${vo.title}"/>
									</a>
							 		..<span style="color:orange;font-size: 80%;">(<c:out value="${vo.commentCount }"/>)
							 		</span></li>
								<li>
									<c:out value="${vo.writer}"/>
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
			</c:if>
			
				<div style="float:right;margin:40px;">
					<a href="javascript:write()" class="button">글쓰기</a>
				</div>
			</div>
			
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
					location.href='write?page=${paging.currentPage}'	
				}
			</script>
			
			<div style="width:700px;margin: auto;padding: 10px;text-align: center;">
				전체 글 개수 : <c:out value="${paging.totalCount}"/> <br>
				<hr>
				<a class="pagenum" href="?page=1">&lt;&lt;</a>
				
				<a class="pagenum" href="?page=${paging.startPage-1}"      
						style='<c:if test="${paging.startPage==1}">display:none;</c:if>' >&lt;</a>
				
				<c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
					<a class="pagenum ieach" href="?page=${i }"><c:out value="${i }"/></a>
				</c:forEach>
				
				<a class="pagenum" href="?page=${paging.endPage+1 }"
						style='<c:if test="${paging.endPage==paging.totalPage }">display:none;</c:if>'	>&gt;</a>
						
				<a class="pagenum" href="?page=${paging.totalPage }">&gt;&gt;</a>
			</div>

		</main>
		
		<script type="text/javascript">
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