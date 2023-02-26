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
		<form method="post" action="productAddUpdate" name="productForm" id="productForm">
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
					<input type="text" name="productCategories" id="productCategories" value="${vo.productCategories}" readonly="readonly">
				</label>
			</div>
			<div style="display:flex; justify-content:space-around; margin: 10px 0px;">
			<div class="files1" style="width:40%;">
				<span id="productManual">제품설명</span>  
				<div>
					<label for="product_file1" style="display:inline;">
						<img id="productImageImg" name="productImageImg" src="${pageContext.request.contextPath}/images/Product/${fileName}" width="110px" height="110px" style="display:inline;">
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
						<img id="productImageImg" name="productImageImg" src="${pageContext.request.contextPath}/images/Product/${fileNameOriginal}" width="110px" height="110px" style="display:inline;">
					</label>
				</div>
				<input id="productImage" name="productImage" type="file">
				<br>
				<input type="button" onclick="cancelFile('productImage')" value="이미지 삭제">
			</div>
			</div>
			<div class="okButton">
				<input type="button" onclick="ok()" value="수정" class="btn btn-outline-light" id="okButtonOption">
				<input type="button" onclick="history.back()" value="취소" class="btn btn-outline-light" id="okButtonOption">
			</div>
		</form>
	</div>
	<%@ include file="../footer.jsp" %>
</body>
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script>
function ok(){
	
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
	
    if (confirm("수정 하시겠습니까?")) {
        alert("수정이 완료되었습니다.");
		document.productForm.submit();
    } else {
        alert("취소되었습니다.");
        return;
    }
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