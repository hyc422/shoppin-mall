package org.shoppingMall.vo;

public class FileVO {
	private String fileName;
	private int productNum;
	private String fileNameOriginal;
	
	public FileVO() {;}
	
	public FileVO(String fileName, int productNum, String fileNameOriginal) {
		super();
		this.fileName = fileName;
		this.productNum = productNum;
		this.fileNameOriginal = fileNameOriginal;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public int getProductNum() {
		return productNum;
	}
	public void setProductNum(int productNum) {
		this.productNum = productNum;
	}
	public String getFileNameOriginal() {
		return fileNameOriginal;
	}
	public void setFileNameOriginal(String fileNameOriginal) {
		this.fileNameOriginal = fileNameOriginal;
	}

	
	
	
}
