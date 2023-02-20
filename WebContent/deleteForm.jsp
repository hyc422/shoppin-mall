<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="top.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>술공장</title>
<style type="text/css">
body {
	margin: 20px auto;
	padding: 0;
	font-family: "맑은 고딕";
	font-size: 0.9em;
}

main {
	height: 300px;
}

table {
	background-color: #F5F5F5;
}

td {
	padding: 20px;
}
</style>

</head>
<body>

	<h3 style="text-align: center; margin: 30px; font-size: 20px;">
		비밀번호를 다시 한번 입력하세요.</h3>
	<div align="center">
		<form action="deleteForm" method="post">
			<main>
				<table>
					<tr>
						<td><a>비밀번호</a></td>
						<td><input type="password" name="pw">
						<input type="hidden" name="pw3" value=${vo.idx }>
						<input type="hidden"value="${vo.password }" name="pw2">
						</td>
					</tr>
					<tr>
						<td colspan="2" align="center">
						<input type="button" value="회원탈퇴" onclick="de()"/>
						<input type="reset" value="취소" /></td>
					</tr>

				</table>

			</main>
		</form>
	</div>
	<script type="text/javascript">
	function de(){
		const df = document.forms[1]
		console.log(document.forms[1])
		let run = true
		
		if(df.pw.value != df.pw2.value){
			alert('비밀번호 다시 확인 해주세요')
			df.pw2.focus()
			run = false
		}
		if(run){
			df.submit()
			alert('회원탈퇴 완료 되었습니다.')
			/* location.href='index.jsp' */
		}
	}
</script>
</body>
<%@ include file="footer.jsp"%>
</html>