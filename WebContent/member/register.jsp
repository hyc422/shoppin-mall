<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
<h3>회원 가입</h3>
<div class="">
	<form action="register" method="post">
		<div>
			<label>회원 ID :</label>
			<input type="text" name="id" id="id" placeholder="아이디를 입력해주세요"required>
		</div>
		<div id='result' onchange="checkID"></div>
		<div>
			<label>패스워드 :</label>
			<input type="password" name="password" placeholder="최소 8~20글자" required>
		</div>
		<div>
			<label>패스워드 재입력 :</label>
			<input type="password" name="password" placeholder="비밀번호 재입력" required>
		</div>
		<div>
			<label>이메일 :</label>
			<input type="text" name="email">@
			<select>
				<option>naver.com</option>
				<option>daum.net</option>
				<option>gmail.com</option>
				<option>직접 입력</option>
			</select>
			<input type="text" name="email2">
		</div>
		<div>
			<label>성함 :</label>
			<input type="text" name="name">
		</div>
		<div>
			<label>별명 :</label>
			<input type="text" name="nickname" placeholder="한글 2~8자">
		</div>
		<div>
			<label>전화번호</label>
			<select name="phone1" required>
				<option value="010">010</option>
				<option value="011">011</option>
			</select>-
			<input type="text" name="phone2"> -
			<input type="text" name="phone3">
		</div>
		<div>
			<label>생년월일</label>
			<input type="date" name="birth">
		</div>
		<div>
			<label>주소</label>
			<input type="text" name="address">
		</div>
		<div>
			<label>우편번호</label>
			<input type="text" name="c_code">
		</div>
		<div>
			<label>약간동의<input type="checkbox" value="Y" name="agree" id="agree">약간에 동의합니다.</label>
		</div>
		<button type="submit">회원가입</button>
	</form>
</div>
</body>
</html>