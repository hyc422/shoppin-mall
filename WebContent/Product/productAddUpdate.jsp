<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 수정 페이지</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/productDetail.css" />
</head>
<body>
<%@ include file="../top.jsp" %>
	<div>
		<h1 style="text-align: center;">상품 수정 페이지</h1>
		<hr>
	</div>
	<div style="margin-left: 300px;">
		<form method="post" action="productAddUpdate" name="productForm" id="productForm" enctype="multipart/form-data">
			<div>
				<label>
					상품코드  <input type="text" name="productNum" id="productNum" value="${vo.productNum}" readonly="readonly">
				</label>
			</div>
			<div>
				<label>
					상품명  <input type="text" name="productName" id="productName" value="${vo.productName}" readonly="readonly">
				</label>
			</div>
			<div>
				<label>
					상품가격  <input type="text" name="productPrice" id="productPrice" placeholder="수정할 가격을 입력해주세요">
				</label>
			</div>
			<div>
				<label>
					재고수  <input type="text" name="productStock" id="productStock" placeholder="수정할 재고수를 입력해주세요">
				</label>
			</div>
			<div>
				<label>
					카테고리
					<select name="productCategories" id="productCategories" disabled="disabled">
						<option value="${vo.productCategories}"/>
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
				<input type="button" value="수정" class="btn btn-outline-light" id="okButtonOption">
				<input type="button" onclick="history.back()" value="취소" class="btn btn-outline-light" id="okButtonOption">
			</div>
		</form>
	</div>
	<%@ include file="../footer.jsp" %>
</body>
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script>
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