package org.shoppingMall.vo;

public class PaymentVO {
	private int idx;
	private String id;
	private int productNum;
	private String productName;
	private int productPrice;
	private String productCategories;
	private String fileName;
	private int amount;
	private String zipcode;
	private String address;
	private String addressDetail;
	private String addressEtc;
	private String pDate;

	public PaymentVO() {;}

	public PaymentVO(int idx, String id, int productNum, String productName, int productPrice, String productCategories,
			String fileName, int amount, String zipcode, String address, String addressDetail, String addressEtc,
			String pDate) {
		super();
		this.idx = idx;
		this.id = id;
		this.productNum = productNum;
		this.productName = productName;
		this.productPrice = productPrice;
		this.productCategories = productCategories;
		this.fileName = fileName;
		this.amount = amount;
		this.zipcode = zipcode;
		this.address = address;
		this.addressDetail = addressDetail;
		this.addressEtc = addressEtc;
		this.pDate = pDate;
	}

	public PaymentVO(String id, int productNum, String productName, int productPrice, String productCategories,
			String fileName, int amount, String zipcode, String address, String addressDetail, String addressEtc) {
		super();
		this.id = id;
		this.productNum = productNum;
		this.productName = productName;
		this.productPrice = productPrice;
		this.productCategories = productCategories;
		this.fileName = fileName;
		this.amount = amount;
		this.zipcode = zipcode;
		this.address = address;
		this.addressDetail = addressDetail;
		this.addressEtc = addressEtc;
	}
	
	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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

	public String getProductCategories() {
		return productCategories;
	}

	public void setProductCategories(String productCategories) {
		this.productCategories = productCategories;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAddressDetail() {
		return addressDetail;
	}

	public void setAddressDetail(String addressDetail) {
		this.addressDetail = addressDetail;
	}

	public String getAddressEtc() {
		return addressEtc;
	}

	public void setAddressEtc(String addressEtc) {
		this.addressEtc = addressEtc;
	}
	
	public String getpDate() {
		return pDate;
	}

	public void setpDate(String pDate) {
		this.pDate = pDate;
	}
	
	
	
}
