package org.shoppingMall.vo;

public class ProductVO {
	private int productNum;
	private String productName;
	private int productPrice;
	private int productStock;
	private String productCategories;
	private String productUpdate;
	
	public ProductVO() {;}

	public ProductVO(int productNum, String productName, int productPrice, int productStock, String productCategories,
			String productUpdate) {
		super();
		this.productNum = productNum;
		this.productName = productName;
		this.productPrice = productPrice;
		this.productStock = productStock;
		this.productCategories = productCategories;
		this.productUpdate = productUpdate;
	}

	public int getProductNum() {
		return productNum;
	}

	public void setProductNum(int productNum) {
		this.productNum = productNum;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}

	public int getProductStock() {
		return productStock;
	}

	public void setProductStock(int productStock) {
		this.productStock = productStock;
	}

	public String getProductCategories() {
		return productCategories;
	}

	public void setProductCategories(String productCategories) {
		this.productCategories = productCategories;
	}

	public String getProductUpdate() {
		return productUpdate;
	}

	public void setProductUpdate(String productUpdate) {
		this.productUpdate = productUpdate;
	}
	
	
}
