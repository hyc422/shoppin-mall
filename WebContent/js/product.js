
//구매 수량에 따른 가격 변화
var sell_price;
var amount;
function init() {
	sell_price = document.form.sell_price.value;
	amount = document.form.amount.value;
	document.form.sum.value = sell_price;
	change();
}
function add() {
	hm = document.form.amount;
	sum = document.form.sum;
	hm.value++;
	sum.value = hm.value * sell_price;
}
function del() {
	hm = document.form.amount;
	sum = document.form.sum;
	if (hm.value > 1) {
		hm.value--;
		sum.value = hm.value * sell_price;
	}
}
function change() {
	hm = document.form.amount;
	sum = document.form.sum;
	if (hm.value < 1) {
		hm.value = 1;
	} else {
		sum.value = hm.value * sell_price;
	}
}



//주소 설정해주기
$("cart_put").click(function(){
	location.href = 'index.jsp';
});

$("payBtn").click(function(){
	location.href = '';
});

function cartPut(){
	location.href="index.jsp"
}



$("#boardForm").submit(function() {

	if ($("#board_content").val().replace(/ /g, '') == "") {
		alert("내용을 입력해주세요.")
		return false;
	}


});
$(window).onload(function() {

	$.cookie("scroll", $(document).scrollTop());

});
$(document).ready(function() {

	if ($.cookie("scroll") !== null) {

		$(document).scrollTop($.cookie("scroll"));
	}

});


$("#member_cart_put").click(function() {

	if (confirm("장바구니에 추가하시겠습니까?") == true) {
		$("#storeForm").attr("action", "/companda/index.jsp?workgroup=cart&work=cart");
		$("#storeForm").submit();
	} else {
		false;
	}
});

$("#member_payBtn").click(function() {

	$("#storeForm").attr("action", "/companda/index.jsp?workgroup=order&work=order");
	$("#storeForm").submit();
});
