<%@page import="org.shoppingMall.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<style>
.form-select {
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
	transition: border-color .15s ease-in-out, box-shadow .15s ease-in-out;
	appearance: none;
}

.form-date {
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
	transition: border-color .15s ease-in-out, box-shadow .15s ease-in-out;
	appearance: none;
}
</style>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<%@include file="../top.jsp"%>
	<h3 style="text-align: center;">회원 가입</h3>
	<hr>
	<div>
		<form action="register" method="post" name="join">
			<div
				style="position: absolute; left: 50%; margin-left: -265px; width: 800px; background: white; padding: 15px;">
				<div class="col-md-4">
					<label style="float: left; text-align: center;">아이디</label> 
					<input
						type="text" class="form-control" name="id" id="id"
						placeholder="영문,숫자 5~11글자" required>
						<div id="msg"></div>
						 <input type="button" id="btnIdCheck" class="btn btn-primary" value="중복검사">
				</div>
				<div class="col-md-4">
					<label>비밀번호</label> <input type="password" class="form-control"
						name="password" id="password" placeholder="숫자,영문,특수문자 조합 최소8자"
						required>
				</div>
				<div class="col-md-4">
					<input type="password" class="form-control" name="password2"
						id="password2" placeholder="비밀번호 재입력" required>
				</div>
				<label style="width: 100px; text-align: center;">이메일</label>
				<div style="display: flex;" class="col-md-4">
					<input type="text" name="email" class="form-control"
						placeholder="이메일 입력" style="width: 100px; display: inline;"
						required> <span class="input-group-text" id="gbe"
						style="width: 100px; display: inline;">@</span> <input type="text"
						name="email2" class="form-control"
						style="width: 100px; display: inline;" value="" disabled>
					<select name="email1" style="display: inline;" class="form-select"
						onchange="email_change()" required>
						<option value="0">선택</option>
						<option value="9">직접 입력</option>
						<option value="naver.com">naver.com</option>
						<option value="daum.net">daum.net</option>
						<option value="gmail.com">gmail.com</option>
					</select>
				</div>
				<div class="col-md-4">
					<input type="text" class="form-control" name="name" id="name"
						placeholder="성함" required>
				</div>
				<div class="col-md-4">
					<input type="text" class="form-control" name="nickname"
						id="nickname" placeholder="별명 한글 2~8자" required>
				</div>
				<div style="display: flex; align-items: baseline;" class="col-md-4">
					<select style="width: 100px; display: inline;" name="phone1"
						class="form-select" required>
						<option value="010">010</option>
						<option value="011">011</option>
					</select> <span class="input-group-text" id="gbe"
						style="width: 100px; display: inline;">-</span> <input type="text"
						name="phone2" class="form-control"
						style="width: 100px; display: inline;"> <span
						class="input-group-text" id="gbe"
						style="width: 100px; display: inline;">-</span> <input type="text"
						name="phone3" class="form-control"
						style="width: 100px; display: inline;">
				</div>
				<div class="col-md-4">
					<label>생년월일</label> <input type="date" name="birth"
						class="form-date" max="2004-12-31" min=" 1950-01-01" required>
				</div>
				<div class="col-md-4">
					<label>우편번호</label> <input type="text" name="c_code"
						id="sample4_postcode" placeholder="우편번호" class="form-control"
						readOnly> <input type="button"
						onclick="sample4_execDaumPostcode()" value="우편번호 찾기"
						class="form-control"><br> <input type="text"
						name="address" id="sample4_roadAddress" placeholder="도로명주소"
						class="form-control" readOnly> <input type="text"
						id="sample4_jibunAddress" placeholder="지번주소" style="width: 350px"
						class="form-control" readOnly> <span id="guide"
						style="color: #999; display: none" class="form-control"></span> <input
						type="text" id="sample4_detailAddress" placeholder="상세주소"
						class="form-control" name="realaddr" required> <input
						type="text" id="sample4_extraAddress" placeholder="참고항목"
						class="form-control">
				</div>
				<div>
					<label for="agree_all"> <input type="checkbox"
						name="agree_all" id="agree_all"> <span>모두 동의합니다</span>
					</label><br> <label for="agree"> <input type="checkbox"
						name="agree" value="1" required> <span>이용약관 동의<strong>(필수)</strong><br></span>
					</label> <br> <label for="agree"> <input type="checkbox"
						name="agree" value="2" required> <span>개인정보 수집, 이용
							동의<strong>(필수)</strong>
					</span>
					</label> <br> <label for="agree"> <input type="checkbox"
						name="agree" value="3" required> <span>개인정보 이용 동의<strong>(필수)</strong><br></span>
					</label><br> <label for="agree"> <input type="checkbox"
						name="agree" value="4"> <span>이벤트, 혜택정보 수신동의<strong
							class="select_disable">(선택)</strong></span>
					</label><br>
				</div>
				<a type="button" style="color: #212529;"
					href="javascript:find_member()">아이디/비밀번호 찾기</a> <a
					style="color: #212529;" href="../login">로그인</a><br>
				<button class="btn btn-primary" type="button" name="rkdlq"
					onclick="sendit()">회원가입</button>
			</div>
		</form>
	</div>
</body>
<script type="text/javascript" src="agreeCHK.js"></script>
<script type="text/javascript" src="regist.js"></script>
<script type="text/javascript">
function find_member(){
   window.open( "findmem.jsp", "Child", "width=450, height=400, top=50, left=50" );
}
function sendit(){
	   var join = document.join;
	   var pwdchk = /^(?=.[a-zA-Z])(?=.*[!@#$%^&*-])(?=.*[0-9]).{8,25}$/;
	   var patternid = /^(?=.[a-zA-z])(?=.*[0-9]).{5,11}$/;
	   var patternph = /^\d{4}$/;
	   var patternnm = /^(?=.[가-힣]).{2,4}$/;
	   var emailptn = /^[a-z]$/;
	   let isValid = true;
	   
	   
	   if(!patternid.test(join.id.value)){
	      alert("영문 , 숫자 포함 5~11글자")
	      join.id.focus();
	      isValid = false;
	   }
	   
	   if(!pwdchk.test(join.password.value)){
	   alert("비밀번호는 8글자 이상, 숫자 , 대문자 , 소문자 , 특수문자를 포함해야함")
	   join.password.focus();
	   isValid = false;
	   }
	   
	   if(join.password.value != join.password2.value){
	      alert("비밀번호 불일치")
	      join.password.focus();
	      isValid = false;
	   }
	   
	   if(!patternnm.test(join.name.value)){
	      alert("이름을 다시 확인해주세요.")
	      join.name.focus();
	      isValid = false;
	   }
	   if(join.nickname.value.length < 2 || join.nickname.value.length > 8){
	      alert("별명은 2글자 이상 8글자 이하")
	         join.nickname.focus();
	      isValid = false;
	      }
	   if(isValid){
		   alert('회원완료');
		   join.action='register';
		   join.submit();
	   }else{
		   alert('검사 실패')
	   }
	}
</script>
<script type="text/javascript">
	function idcheck(){
		var join = document.join;
		join.action='idCheckPro';
		join.submit();
	}
</script>
<script type="text/javascript">
   function email_change(){
      if(document.join.email1.options[document.join.email1.selectedIndex].value == '0'){

          document.join.email2.disabled = true;

          document.join.email2.value = "";

         }

         if(document.join.email1.options[document.join.email1.selectedIndex].value == '9'){

          document.join.email2.disabled = false;

          document.join.email2.value = "";

          document.join.email2.focus();

         } else{

          document.join.email2.disabled = true;

          document.join.email2.value = document.join.email1.options[document.join.email1.selectedIndex].value;

          document.join.email2.focus();
         }
   }
</script>



<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백(' ')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>
</html>