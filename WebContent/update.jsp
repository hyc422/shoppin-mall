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
height: auto;
}
.tit{
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
}/*  */
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
	
<div style=" float: left; width: 33%;">
    <ul id="navi">
        <li class="group">
		<h3>마이페이지</h3>
            <ul class="sub">
            <li class="tit">MY 쇼핑</li>
                <li><a href="${pageContext.request.contextPath }/paylist?id=${user.id}">구매 내역/리뷰 작성</a></li>
            </ul>
        </li>
        <li class="group">
            <ul class="sub">
            <li class="tit">MY 정보<li>
                <li><a href="${pageContext.request.contextPath }/update?idx=${user.idx}">개인정보확인/수정</a></li>                
            	    <li><a href="${pageContext.request.contextPath }/reviewlist?nickname=${user.nickname}">내가 쓴 리뷰</a></li>
            	<li><a href="${pageContext.request.contextPath }/qnalist?nickname=${user.nickname}">QnA</a></li>               
            	
            </ul>
        </li>
    </ul>
</div>
    <main class="usermodify">
	    <div>
	    	<h2 style="text-align: left;" style="background-color: #e6f1ff ">회원정보 수정</h2>
	   		<form action="update" method="post" name="updateForm" id="updateForm" >
				<input type="hidden" name="idx" value="${vo.idx}">
	
				<div class="form-group">
					<table class="userupdate" style="table-layout: fixed; "  >
					
						<tr>
							<td class="ID2" style=" width: 150px; text-align:right; background-color: #a8a8a8 ">회원 ID</td>
							<td><input type="text" name="ID" value="${user.id }"  readonly style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px; "></td>
						</tr>
						
						<tr>
							<td class="pass" style=" width: 200px;text-align:right;  background-color: #a8a8a8 ">패스워드</td>
							<td><input type="text" name="password" value="${vo.password }"></td>
						</tr>
						
						<tr>
							<td class="email" style="width: 200px; text-align:right; background-color: #a8a8a8 ">이메일</td>
							
							<td>
							
								<input type="text" id="email1" name="email1" class="ui_input" value="${email2 }">@
								<input type="text" id="email2" name="email2" class="ui_input" value="${email3 }">
								<select id="email3" name="email3" title="이메일 주소 선택" class="ui_select">
					            	<option value="">  이메일주소 직접입력  </option>
					               	<option value="naver.com">naver.com</option>
					               	<option value="nate.com">nate.com</option>
					               	<option value="gmail.com">gmail.com</option>
					               	<option value="yahoo.com">yahoo.com</option>
					               	<option value="hanmail.net">hanmail.net</option>
					           	</select>
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
							<td class="code" style="width: 200px; text-align:right; background-color: #a8a8a8; ">주소</td>
							<td><input type="text" name="c_code"
						id="sample4_postcode" placeholder="우편번호" class="form-control" value="${vo.c_code }">
						<input type="button"
						onclick="sample4_execDaumPostcode()" value="우편번호 찾기"  style="width: 150px;"
						class="form-control"readOnly><input type="text"
						name="address1" id="sample4_roadAddress" placeholder="도로명주소"
						class="form-control" readOnly value="${vo.address1 }">
						<input type="text" name="address2"
						id="sample4_jibunAddress" placeholder="지번주소"
						class="form-control" readOnly value="${vo.address2 }">
						<span id="guide"
						style="color: #999; display: none" class="form-control" ></span> <input
						type="text" id="sample4_detailAddress" placeholder="상세주소"
						class="form-control" name="address3" required value="${vo.address3 }">
						</td>
						</tr>
	
						<tr>
							<td class="day" style="width: 200px; text-align:right;  background-color: #a8a8a8; ">생년월일</td>
							<td><input type="date" name="birth" value="${vo.birth }" readonly style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px; "></td>
						</tr>
					</table>
				</div>
			<div class="Withdrawal">
			<!-- <input type="submit" class="form-control" value="취소">
				<input type="submit" class="form-control" value="수정완료"> -->
				<input type="button" class="drawal" name="updateBtn" id="updateBtn" value="수정">
				<input type="reset" class="drawal" value="다시입력">
				<input type="button" class="drawal" value="회원탈퇴" onclick="del()">
			</div>
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
   
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script>
        $( "#email3" ).change(function(){
            $("#email2").val( $("#email3").val() );
        });
        
        $("#updateBtn").click(function() {
        	$("#updateForm").submit();
        });
    </script>
   
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
                $('#sample4_detailAddress').val(''); // 상세주소 값을 비운다.
/*                
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
*/
            }
        }).open();
    }
</script>
</body>
<%@ include file="footer.jsp" %>
</html>