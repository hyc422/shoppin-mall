

function addCart() {
	let yn
	if ('${user.id}' == '') {
		yn = confirm('장바구니는 로그인이 필요합니다. 로그인 하시겠습니까?')
		if (yn) location.href = '../login?back=w'
	} else {
		location.href = '../index.jsp'
	}

}