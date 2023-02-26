/**
 * 
 */
$(function() {
	$('#btnIdCheck').on('click', function() {
		if ($('id').val == '') {
			alert('아이디를 입력하세요');
			$('#id').focus();
			return false;
		}
		const xhr = new XMLHttpRequest();
		const id = $('#id').val();
		xhr.open('GET', '2_idcheck.jsp?id=' + id, true);
		xhr.send();

		xhr.onreadystatechange = function() {
			if (xhr.readyState == XMLHttpRequest.DONE && xhr.status == 200) {
				const result = xhr.responseText;

				if (result.trim() == 'ok') {
					$('#idcheckmsg').html("<b style='color:blue'>사용 가능</b>")
					$('#isidcheck').val('y');
				} else {
					$('#idcheckmsg').html("<b style='color:red'>사용 불가능</b>")
				}
			}
		}
	});
	$("#id").on("keyup",function(){
		$("#isidcheck").val("n");
		$("#idcheckmsg").html("");
	});
});
