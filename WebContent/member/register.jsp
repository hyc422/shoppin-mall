<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<style>
.form-select{
display: block;
    padding: 0.375rem 2.25rem 0.375rem 0.75rem;
    font-size: 1rem;
    font-weight: 400;
    line-height: 1.5;
    color: #212529;
    background-color: #fff;
    background-size: 16px 12px;
    border: 1px solid #ced4da;
    border-radius: 0.375rem;
    transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;
    appearance: none;
    }
.form-date{
display: block;
    padding: 0.375rem 2.25rem 0.375rem 0.75rem;
    font-size: 1rem;
    font-weight: 400;
    line-height: 1.5;
    color: #212529;
    background-color: #fff;
    background-size: 16px 12px;
    border: 1px solid #ced4da;
    border-radius: 0.375rem;
    transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;
    appearance: none;
}
</style>
<head>
<link rel="stylesheet" href="/lib/w3.css">
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<%@include file="../top.jsp"%>
	<h3 style="text-align: center;">회원 가입</h3>
	<hr>
	<div>
		<form action="register" method="post">
			<div 	style="position: absolute;
				   left: 50%;
				   margin-left: -265px;
				   width: 800px;
				   background: white; 
				   padding: 15px;">
				<div class="col-md-4">
					<label style="float: left; text-align: center;">아이디</label> <input
						type="text" class="form-control" name="id" id="id"
						placeholder="영문,숫자 5~11글자" required>
				</div>
				<div id='result' onchange="checkID"></div>
				<div class="col-md-4">
					<label>비밀번호</label> <input type="password" class="form-control"
						name="password" placeholder="숫자,영문,특수문자 조합 최소8자" required>
				</div>
				<div class="col-md-4">
					<input type="password" class="form-control" name="password"
						placeholder="비밀번호 재입력" required>
				</div>
				<label style="width:100px; text-align: center;">이메일</label>
				<div style="display: flex;" class="col-md-4">
					<input type="text" name="email" class="form-control"
						placeholder="이메일 입력" style="width: 100px; display: inline;" required>
					<span class="input-group-text" id="gbe"
						style="width: 100px; display: inline;">@</span> <input
						type="text" name="email2" class="form-control"
						style="width: 100px; display: inline;" required> <select
						style="display: inline;" class="form-select" required>
						<option>직접 입력</option>
						<option>naver.com</option>
						<option>daum.net</option>
						<option>gmail.com</option>
					</select>
				</div>
				<div class="col-md-4">
					<input type="text" class="form-control" name="name"
						placeholder="성함" required>
				</div>
				<div class="col-md-4">
					<input type="text" class="form-control" name="nickname"
						placeholder="별명 한글 2~8자" required>
				</div>
				<div style="display: flex; align-items: baseline;" class="col-md-4">
					<select style="width: 100px; display: inline;" name="phone1"
						class="form-select" required>
						<option value="010">010</option>
						<option value="011">011</option>
					</select> <span class="input-group-text" id="gbe"
						style="width: 100px; display: inline;">-</span> <input
						type="text" name="phone2 " class="form-control"
						style="width: 100px; display: inline;"> <span
						class="input-group-text" id="gbe"
						style="width: 100px; display: inline;">-</span> <input
						type="text" name="phone3 " class="form-control"
						style="width: 100px; display: inline;">
				</div>
				<div class="col-md-4">
					<label>생년월일</label> <input type="date" name="birth" class="form-date" required>
				</div>
				<div class="col-md-4">
					<label>주소</label> <input type="text" name="address"
						class="form-control" required>
				</div>
				<div class="col-md-4">
					<label>우편번호</label> <input type="text" name="c_code"
						class="form-control" required>
				</div>
				<div>
					<label for="agree_all"> 
						<input type="checkbox" name="agree_all" id="agree_all"> 
						<span>모두 동의합니다</span>
					</label><br>
					<label for="agree">
						<input type="checkbox" name="agree" value="1" required>
						 <span>이용약관 동의<strong>(필수)</strong><br></span>
					</label> <br>
					<label for="agree">
						 <input type="checkbox" name="agree"value="2" required> 
						 <span>개인정보 수집, 이용 동의<strong>(필수)</strong></span>
					</label> <br>
					<label for="agree"> 
						<input type="checkbox" name="agree"value="3" required>
						 <span>개인정보 이용 동의<strong>(필수)</strong><br></span>
					</label><br>
					 <label for="agree"> 
						 <input type="checkbox" name="agree"value="4"> 
						 <span>이벤트, 혜택정보 수신동의<strong class="select_disable">(선택)</strong></span>
					</label><br>
				</div>
				 <a style="color: #212529;">아이디/비밀번호 찾기</a>
				 <a style="color: #212529;" href="../login">로그인</a><br>
				<button class="btn btn-primary" type="submit">회원가입</button>
			</div>
		</form>
	</div>
</body>
</html>