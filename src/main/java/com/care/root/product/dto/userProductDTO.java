package com.care.root.product.dto;

public class userProductDTO {
	private String productNum; // 상품코드 -
	private String productName; // 상품이름 -
	private String productTitle; // 상품 글 제목 -
	private String productCategory; // 상품 카테고리 -
	private String productContent; // 상품설명 -ㄴ
	private String productDate; // 상품등록날짜
	private String productCompany; // 상품 제조사 -
	private String productQuantity; // 상품 수량 -
	private String productPee; // 상품가격 -
	private String productPeriod; //상품대여기간
	
	
	private int fileNo;
	private String filePath;
	private String fileName;
	private int fileLevel;
	private String parentBoardNo;
	
	public int getFileNo() {
		return fileNo;
	}
	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public int getFileLevel() {
		return fileLevel;
	}
	public void setFileLevel(int fileLevel) {
		this.fileLevel = fileLevel;
	}
	public String getParentBoardNo() {
		return parentBoardNo;
	}
	public void setParentBoardNo(String parentBoardNo) {
		this.parentBoardNo = parentBoardNo;
	}
	public String getProductNum() {
		return productNum;
	}
	public void setProductNum(String productNum) {
		this.productNum = productNum;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getProductTitle() {
		return productTitle;
	}
	public void setProductTitle(String productTitle) {
		this.productTitle = productTitle;
	}
	public String getProductCategory() {
		return productCategory;
	}
	public void setProductCategory(String productCategory) {
		this.productCategory = productCategory;
	}
	public String getProductContent() {
		return productContent;
	}
	public void setProductContent(String productContent) {
		this.productContent = productContent;
	}
	public String getProductDate() {
		return productDate;
	}
	public void setProductDate(String productDate) {
		this.productDate = productDate;
	}
	public String getProductCompany() {
		return productCompany;
	}
	public void setProductCompany(String productCompany) {
		this.productCompany = productCompany;
	}
	public String getProductQuantity() {
		return productQuantity;
	}
	public void setProductQuantity(String productQuantity) {
		this.productQuantity = productQuantity;
	}
	public String getProductPee() {
		return productPee;
	}
	public void setProductPee(String productPee) {
		this.productPee = productPee;
	}
	public String getProductPeriod() {
		return productPeriod;
	}
	public void setProductPeriod(String productPeriod) {
		this.productPeriod = productPeriod;
	}
	
}
