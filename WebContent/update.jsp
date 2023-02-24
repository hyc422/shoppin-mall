<%@page import="org.shoppingMall.dao.MemberDao"%>
<%@page import="java.lang.reflect.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="top.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Page</title>
<style type="text/css">
body {
    margin:20px auto;
    padding: 0;
    font-family:"맑은 고딕";
    font-size:0.9em;
    
}

main{
height: 700px;}
.title{
	background-color: #373737;
	color:#ffffff;
	font-size: 18px;
	
}
ul#navi {
    width: 200px;
    text-indent: 15px;
}
ul#navi, ul#navi ul {
    margin:0;
    padding:0;
    list-style:none;
}
li.group {
    margin-bottom: 4px;
}
li.group div.title {
    height: 35px;
    line-height: 35px;
    background-color: #323232;
    cursor:pointer;
}
body {
    display: block;
    margin: 20px;
    
}
body {
    -webkit-text-size-adjust: none;
    font-family: dotum,sans-serif;
    font-size: 16px;
    line-height: 1.6;
    color: #666;
}	
.usermodify {
    position: relative;
}

input, textarea, select, button {
    font-family: sans-serif;
    font-size: 100%;
}
.usermodify{
    padding-left: 100px;
	margin-left: 300px;
}
h2{
    margin: 40px;
   margin-top: 1px;
   margin-bottom: 10px;
}
table{
       width: auto;
    border: 1px solid #bfbfbf;
    width: 700px; 
table-layout: fixed;
  
     
}
td {
    border: 1px solid #bfbfbf;
    padding :10px;
  }
  tr > td:first-child {
	color: #000000;
}

.Withdrawal{
	margin-left : 270px;
	margin-top: 40px;
}

</style>


</head>
<body>
	
	
	
<div style=" float: left; width: 33%;">

<!--  -->
	
	
    <ul id="navi">
        <li class="group">
		<h3>마이페이지</h3>
		
            
            <ul class="sub">
            <li class="title">MY 쇼핑</li>
                <li><a href="${pageContext.request.contextPath }/paylist?id=${user.id}">구매 내역/리뷰 작성</a></li>
            </ul>
        </li>
        <li class="group">
            <ul class="sub">
            <li class="title">MY 정보<li>
                <li><a href="${pageContext.request.contextPath }/update?idx=${user.idx}">개인정보확인 수정</a></li>                
            </ul>
        </li>
    </ul>
	      </div>

    		
    <main class="usermodify">
    <div>
    	<h2 style="text-align: left;" style="background-color: #e6f1ff ">회원정보 수정</h2>
    		<form action="update" method="post" >
					<input type="hidden" name="idx" value="${vo.idx }">
				<div class="form-group">
					<table class="userupdate" style="table-layout: fixed; "  >
					
						<tr>
							<td class="ID2" style=" width: 150px; text-align:right; background-color: #a8a8a8 ">회원 ID</td>
							<td><input type="text" name="ID" value="${vo.id }"  readonly></td>
						</tr>
						
						<tr>
							<td class="pass" style=" width: 200px;text-align:right;  background-color: #a8a8a8 ">패스워드</td>
							<td><input type="text" name="password" value="${vo.password }"></td>
						</tr>
						
						<tr>
							<td class="mail" style="width: 200px; text-align:right; background-color: #a8a8a8 ">이메일</td>
						<td>
							<select>
								<option>naver.com</option>
								<option>daum.net</option>
								<option>gmail.com</option>
								<option>직접 입력</option>
							</select>
							<input type="text" name="email" value="${vo.email }">
						</td>
						</tr>
						
						<tr>
							<td class="name1" style="width: 200px; text-align:right; background-color: #a8a8a8;" >이름</td>
							<td><input type="text" name="name" value="${vo.name }"></td>
						</tr>
						
						<tr>		
							<td class="nick" style="width: 200px; text-align:right; background-color: #a8a8a8; ">별명</td>
							<td><input type="text" name="nickname" value="${vo.nickname }" ></td>
						</tr>
	
						<tr>
							<td class="tell" style="width: 200px;text-align:right;  background-color: #a8a8a8; ">연락처</td>
							<td><input type="text" name="phone2" value="${vo.phone }"></td>
						</tr>
						
						<tr>
							<td class="dress" style="width: 200px; text-align:right; background-color: #a8a8a8; ">주소</td>
							<td><input type="text" name="address" value="${vo.address }" ></td>
						</tr>
	
						<tr>
							<td class="code" style="width: 200px; text-align:right; background-color: #a8a8a8; ">우편번호</td>
							<td><input type="text" name="c_code" value="${vo.c_code }"></td>
						</tr>
	
						<tr>
							<td class="day" style="width: 200px; text-align:right;  background-color: #a8a8a8; ">생년월일</td>
							<td><input type="date" name="birth" value="${vo.birth }" readonly></td>
						</tr>
					</table>
				</div>
				
				
				
		<div class="Withdrawal">
		<!-- <input type="submit" class="form-control" value="취소">
				<input type="submit" class="form-control" value="수정완료"> -->
				<input type="submit" class="drawal" value="수정">
				<input type="reset" class="drawal" value="다시입력">
				<input type="button" class="drawal" value="회원탈퇴" onclick="del()">
		</div>
		
	<script type="text/javascript">
	function del() {
		 const frm = document.forms[2];
		 const value = frm.name;
		if(confirm("회원탈퇴를 하시겠습니까?")) {
		frm.submit();
		} else {
			alert('취소하셨습니다.')
		}
	}
	</script>
		
			</form>
		</div>
		
			<!-- 회원탈퇴용 -->
			<form action="deleteForm" method="POST" name="deform">
				<input type="hidden" value="${vo.idx }" name="idx">
			</form>
			
		
		
		
		
		<div class="col-lg-4"></div>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
    </main>
    
</body>
<%@ include file="footer.jsp" %>
</html>