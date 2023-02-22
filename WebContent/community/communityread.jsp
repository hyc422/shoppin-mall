<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>우리 북카페</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/read.css?v=3">
	<body>
		<main id="read">
		
			<!-- community : announcement -->
			<c:if test="${category == 1}">
				<h3>COMMUNITY - ANNOUNCEMENT</h3>
				<hr style="color:white;">
				<div style="width: 80%; margin: auto;max-width: 760px;">
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
								<li>
									<c:out value="${vo.nickName}"/>
									<span style="font-size: 70%; padding-left: 30px;">(<c:out value="${vo.ip}"/>)</span>
								</li>
								<li>작성날짜</li>
								<li><fmt:formatDate value="${vo.createdAt}" type="both"/></li>
							</ul>
						</li>
						<li id="content">
							<ul>
								<li>내용</li>			
								<li>
									<pre><c:out value="${vo.content}"/></pre>
								</li>				
							</ul>
						</li>
					</ul>
					
					<div style="text-align: center;margin-bottom: 10px;">
						<c:if test="${user.nickName==vo.nickName}">
							<a class="button" href="javascript:execute(1)">수정</a>
							<a class="button" href="javascript:execute(2)">삭제</a>
						</c:if>
							<a class="button" href="communitylist?category=${category}&page=${page}">목록</a>
					</div>
						
					<hr>
		
				</div>
			</c:if>
			
			<!-- community : review -->
			<c:if test="${category == 2}">
				<h3>COMMUNITY - REVIEW</h3>
				<hr style="color:white;">
				<div style="width: 80%; margin: auto;max-width: 760px;">
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
								<li><c:out value="${vo.nickName}"/>
								<span style="font-size: 70%; padding-left: 30px;">(<c:out value="${vo.ip}"/>)</span></li>
								<li>작성날짜</li>
								<li><fmt:formatDate value="${vo.createdAt}" type="both"/></li>
							</ul>
						</li>
						<li>
							<a href="${pageContext.request.contextPath}/product?productNum=${vo.productNum}">
								<img src="../images/community/${vo.fileName}" border="0">
								<span>${vo.productName}</span>
							</a>
						</li>
						<li id="content">
							<ul>
								<li>내용</li>			
								<li>
									<pre><c:out value="${vo.content}"/></pre>
								</li>				
							</ul>
						</li>
					</ul>
					<div style="text-align: center;margin-bottom: 10px;">
						<c:if test="${user.nickName==vo.nickName }">
							<a class="button" href="javascript:execute(1)">수정</a>
							<!--  예시 : 글 비밀번호 입력하여 삭제. -->
							<a class="button" href="javascript:execute(2)">삭제</a>
						</c:if>
							<a class="button" href="communitylist?category=${category}&page=${page}">목록</a>
					</div>
			
				<hr>
		
					<form action="comments" method="post">
					
					<input type="hidden" name="mref" value="${vo.idx}">
					<input type="hidden" name="idx" value="0" >
					<input type="hidden" name="f" value="0">
					<input type="hidden" name="page" value="${page}">
					<input type="hidden" name="category" value="${category}">
						<ul>
							<li>
								<ul class="row">
									<li>작성자</li>		
									<li><input name="writer" class="input" value="${user.nickName}" readonly></li>	
								</ul>
							</li>
							<li>
								<ul style="display: flex;">
									<li>
										<textarea rows="5" cols="80" name="content" 
										style="resize:none;margin-right:20px;" 
										placeholder="로그인 후에 댓글을 작성하세요." class="input"></textarea>
									</li>				
										<li style="align-self: center;margin-bottom: 20px;">
											<c:if test="${sessionScope.user != null}">
												<button type="button" onclick="executeCmt('1',0)">저장</button>
											</c:if>	
											<c:if test="${sessionScope.user == null }">
												<button type="button" onclick="location.href='../login'">로그인</button>
											</c:if>
									</li>
								</ul>
							</li>
							<li>
									<span>댓글</span>
									<span>[<c:out value="${vo.commentCount}" />]</span>
								<hr>
							</li>
							
							<c:forEach var="cmt" items="${cmtlist}">
								<li>
									<ul class="crow">
										<li><c:out value="${cmt.nickName}" /></li>				
										<li><c:out value="${cmt.ip}" /></li>				
										<li><c:out value="${cmt.createdAt}" /></li>	
									<c:if test="${user.nickName==cmt.nickName}"> 	
										<li><a href="javascript:executeCmt('2','${cmt.idx}')">삭제</a></li>				
									</c:if>	
									</ul>
								</li>
								<li>
									<pre class="cmtcontent"><c:out value="${cmt.content}" /></pre>
								</li>
							</c:forEach>
						</ul>	
					</form>
				</div>
			</c:if>
			
			<!-- community : qna -->
			<c:if test="${category == 3}">
				<h3>COMMUNITY - QnA</h3>
				<hr style="color:white;">
				<div style="width: 80%; margin: auto;max-width: 760px;">
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
								<li><c:out value="${vo.nickName}"/>
								<span style="font-size: 70%; padding-left: 30px;">(<c:out value="${vo.ip}"/>)</span></li>
								<li>작성날짜</li>
								<li><fmt:formatDate value="${vo.createdAt}" type="both"/></li>
							</ul>
						</li>
						<li>
							<a href="${pageContext.request.contextPath}/product?productNum=${vo.productNum}">
								<img src="../images/community/${vo.fileName}" border="0">
								<span>${vo.productName}</span>
							</a>
						</li>
						<li id="content">
							<ul>
								<li>내용</li>			
								<li>
									<pre><c:out value="${vo.content}"/></pre>
								</li>				
							</ul>
						</li>
					</ul>
					<div style="text-align: center;margin-bottom: 10px;">
						<c:if test="${user.nickName==vo.nickName}">
							<a class="button" href="javascript:execute(1)">수정</a>
							<!--  예시 : 글 비밀번호 입력하여 삭제. -->
							<a class="button" href="javascript:execute(2)">삭제</a>
						</c:if>
							<a class="button" href="communitylist?category=${category}&page=${page}">목록</a>
					</div>
					<hr>
		
					<form action="comments" method="post">
					<!-- 필요한 파라미터.화면에는 표시안함. -->
					<input type="hidden" name="mref" value="${vo.idx}">
					<input type="hidden" name="idx" value="0" >
					<input type="hidden" name="f" value="0">
					<input type="hidden" name="page" value="${page}">
					<input type="hidden" name="category" value="${category}">
						<ul>
							<li>
								<ul class="row">
									<li>작성자</li>	
									<li><input name="writer" class="input" value="${user.nickName}" readonly></li>	
								</ul>
							</li>
							<li>
								<ul style="display: flex;">
									<li>
										<textarea rows="5" cols="80" name="content" 
										style="resize:none;margin-right:20px;" 
										placeholder="로그인 후에 댓글을 작성하세요." class="input"></textarea>
									</li>				
										<li style="align-self: center;margin-bottom: 20px;">
											<c:if test="${sessionScope.user == admin}">
												<button type="button" onclick="executeCmt('1',0)">저장</button>
											</c:if>	
									</li>
								</ul>
							</li>
							<li>
									<span>댓글</span>
									<span>[<c:out value="${vo.commentCount}" />]</span>
								<hr>
							</li>
							
							<!-- 댓글 목록 -->
							<c:forEach var="cmt" items="${cmtlist}">
								<li>
									<ul class="crow">
										<li><c:out value="${cmt.writer}" /></li>				
										<li><c:out value="${cmt.ip}" /></li>				
										<li><c:out value="${cmt.createdAt}" /></li>	
									<c:if test="${user.id==cmt.nickName}"> 	
										<li><a href="javascript:executeCmt('2','${cmt.idx}')">삭제</a></li>				
									</c:if>	
									</ul>
								</li>
								<li>
									<pre class="cmtcontent"><c:out value="${cmt.content}"/></pre>
								</li>
							</c:forEach>
						</ul>	
					</form>
				</div>
			</c:if>
		</main>	
	<script type="text/javascript">
		function execute(f)
		{
			let url
			let message
			if(f===1)
				message='글 수정하시겠습니까?'
			else if(f===2)
				message='글 삭제하시겠습니까?'
			const yn = confirm(message)
			if(yn) 
			{
				url = (f===1)? 'update?idx='+${vo.idx} :(f===2)? 'delete?idx='+${vo.idx}:'#';
				location.href=url+'&category='+${category}+'&page='+${page};
			}
			else
				alert('취소합니다.')
		}
	
		function executeCmt(fval,cidx)
		{	
			console.log(fval)
			document.forms[0].f.value=fval
			
			if(fval==='2') 
			{
				document.forms[0].idx.value=cidx
				const yn = confirm('댓글 삭제하시겠습니까?')
				if(yn)	document.forms[0].submit()	
			}
			
			else if(fval==='1')
				document.forms[0].submit()			
		}
		
		function reset_content() 
		{
			document.forms[0].content.value=''
		}
	</script>
	</body>
</html>