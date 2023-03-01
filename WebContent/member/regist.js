/**
 * 
 */
 const isValid = true;
$(function() {
	$('#idcheck').on('click', function() {
		const xhr = new XMLHttpRequest();
		const id = $('#id').val();
		xhr.open('GET', '2_idcheck.jsp?id=' + id, true);
		xhr.send();

		xhr.onreadystatechange = function() {
			if (xhr.readyState == XMLHttpRequest.DONE && xhr.status == 200) {
				const result = xhr.responseText;
				if (result.trim() == "ok") {
					$('#idcheckmsg').html("<b style='color:blue'>아이디 사용 가능</b>")
					$('#isidcheck').val('y');
				} else {
					$('#idcheckmsg').html("<b style='color:red'>아이디 중복</b>")
					isValid = false;
				}
			}
		}
	});
	$("#id").on("keyup", function() {
		$("#isidcheck").val("n");
		$("#idcheckmsg").html("");
	});
});

$(function() {
	$('#password').on('focusout', function() {
		const pwd = document.join.password.value;
		var pwdchk = /^(?=.[a-zA-Z])(?=.*[!@#$%^&*-])(?=.*[0-9]).{8,25}$/;
		if (!pwdchk.test(pwd)) {
			$('#pwdcheckmsg').html("<b style='color:red'>사용 불가능</b>")
			isValid = false;
		} else {
			$('#pwdcheckmsg').html("<b style='color:blue'>사용 가능</b>")
		}
	});
});
$(function() {
	$('#password2').on('focusout', function() {
	const pwd = document.join.password.value;
	const pwd2 = document.join.password2.value;
		if (pwd != pwd2) {
			$('#pwd2checkmsg').html("<b style='color:red'>사용 불가능</b>")
			isValid = false;
		} else {
			$('#pwd2checkmsg').html("<b style='color:blue'>사용 가능</b>")
		}
	});
});
$(function() {
	$('#name').on('focusout', function() {
		const namechk = /^[가-힣]+$/;
		const name = document.join.name.value;
		if (!namechk.test(name)) {
			$('#namecheckmsg').html("<b style='color:red'>이름은 한글 '최소2자 최대4자'로 입력해주세요</b>")
			isValid = false;
		} else {
			$('#namecheckmsg').html("<b style='color:blue'>사용 가능</b>")
		}
	});
});

$(function() {
	$('#nncheck').on('click', function() {
		const xhr = new XMLHttpRequest();
		const nickname = $('#nickname').val();
		xhr.open('GET', 'nnamecheck.jsp?nickname=' + nickname, true);
		xhr.send();

		xhr.onreadystatechange = function() {
			if (xhr.readyState == XMLHttpRequest.DONE && xhr.status == 200) {
				const result = xhr.responseText;
				if (result.trim() == "ok") {
					$('#nncheckmsg').html("<b style='color:blue'>별명 사용 가능</b>")
					$('#isnncheck').val('y');
				} else {
					$('#nncheckmsg').html("<b style='color:red'>별명 중복</b>")
					isValid = false;
				}
			}
		}
	});
	$("#id").on("keyup", function() {
		$("#isidcheck").val("n");
		$("#idcheckmsg").html("");
	});
});

$(function(){
	$('#rkdlq').on('click',function(){
		if(isValid){
		join.action = "register";
		join.submit();
		}
	});
});