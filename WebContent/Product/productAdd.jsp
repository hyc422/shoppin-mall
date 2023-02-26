<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록 페이지</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/productDetail.css" />
</head>
<body>

<%@ include file="../top.jsp" %>
	<div>
		<h1 style="text-align: center;">상품 등록 페이지</h1>
		<hr>
	</div>
	<div style="margin-left: 300px;">
		<form method="post" action="productAdd" name="productForm" id="productForm" >
			<div>
				<label class="label1">
					상품코드  <input type="text" name="productNum" id="productNum" value="${productNum}">
				</label>
			</div>
			<div>
				<label class="label1">
					상품명  <input type="text" name="productName" id="productName">
				</label>
			</div>
			<div>
				<label class="label1">
					상품가격  <input type="text" name="productPrice" id="productPrice">
				</label>
			</div>
			<div>
				<label class="label1">
					재고수  <input type="text" name="productStock" id="productStock">
				</label>
			</div>
			<div>
				<label class="label1">
					카테고리
					<select name="productCategories" id="productCategories">
						<option>선택</option>
						<option>막걸리형 전통주</option>
						<option>증류식 소주</option>
						<option>청주/리큐르주</option>
						<option>담금주</option>
					</select>
				</label>
			</div>
			<div style="display:flex; justify-content:space-around; margin: 10px 0px;">
			<div class="files1" style="width:40%;">
				<span id="productManual">제품설명</span>  
				<div>
					<label for="product_file1" style="display:inline;">
						<img id="product_file1Img" src="${pageContext.request.contextPath}/images/Product/filePlus.png" width="110px" height="110px" style="display:inline;">
					</label>
				</div>
				<input id="product_file1" name="product_file1" type="file">
				<br>
				<input type="button" onclick="cancelFile('product_file1')" value="이미지 삭제">
			</div>
			<div class="files2" style="width:40%;">
				<span id="productImages">제품 사진</span>  
				<div>
					<label for="productImage" style="display:inline;">
						<img id="productImageImg" name="productImageImg" src="${pageContext.request.contextPath}/images/Product/filePlus.png" width="110px" height="110px" style="display:inline;">
					</label>
				</div>
				<input id="productImage" name="productImage" type="file">
				<br>
				<input type="button" onclick="cancelFile('productImage')" value="이미지 삭제">
			</div>
			</div>
			<div class="okButton">
				<input type="button" onclick="ok()" value="등록" class="btn btn-outline-light" id="okButtonOption">
				<input type="button" onclick="history.back()" value="취소" class="btn btn-outline-light" id="okButtonOption">
			</div>
		</form>
	</div>
	<form action="productAddUpdate">
		<input type="button" value="등록">
	</form>
	<%@ include file="../footer.jsp" %>
</body>
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script>
	function ok(){
		if(!$("input#productNum").val()){
			alert("상품코드를 작성해주세요.");
			$("input#productNum").focus();
			return;
		}
		if(!$("input#productName").val()){
			alert("상품명을 작성해주세요.");
			$("input#productName").focus();
			return;
		}
		if(!$("input#productPrice").val()){
			alert("상품가격을 작성해주세요.");
			$("input#productPrice").focus();
			return;
		}
		if(!$("input#productStock").val()){
			alert("상품재고를 작성해주세요.");
			$("input#productStock").focus();
			return;
		}
		if(!productCategories.value || productCategories.value=="선택"){
			alert("카테고리를 선택해주세요.");
			$("input#productCategories").focus();
			return;
		}
		
		
		document.productForm.submit();
	}
	
	/* 제픔 상세정보 사진 */
	$(".files1").change(function(e){
		let file = e.target.files[0];
		let img = $(this).find("img");
		
		if(!file.type.match("image.*")){
			img.attr("src", "${pageContext.request.contextPath}/images/Product/no_img.jpg");
		}else{
			let reader = new FileReader();
			reader.onload = function(e){
				img.attr("src", e.target.result)
			}
			reader.readAsDataURL(file);
		}
	})
	
	/* 제픔 썸네일 */
	$(".files2").change(function(e){
		let file = e.target.files[0];
		let img = $(this).find("img");
		
		if(!file.type.match("image.*")){
			img.attr("src", "${pageContext.request.contextPath}/images/Product/no_img.jpg");
		}else{
			let reader = new FileReader();
			reader.onload = function(e){
				img.attr("src", e.target.result)
			}
			reader.readAsDataURL(file);
		}
	})
	
	/* 이미지 삭제 */
	function cancelFile(fileTagName){
		$("input[name='" + fileTagName + "']").val("");
		$("img#" + fileTagName + "Img").attr("src", "${pageContext.request.contextPath}/images/Product/filePlus.png");
	}
	
</script>
</html>