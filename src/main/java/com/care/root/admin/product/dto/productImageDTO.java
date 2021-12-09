package com.care.root.admin.product.dto;

public class productImageDTO {
	private int fileNo;
	private String filePath;
	private String fileName;
	private int fileLevel;
	private String parentBoardNo;
	
	public productImageDTO() {
	}
	
	public productImageDTO(String filePath, String fileName, int fileLevel, String parentBoardNo) {
		super();
		this.filePath = filePath;
		this.fileName = fileName;
		this.fileLevel = fileLevel;
		this.parentBoardNo = parentBoardNo;
	}
	
	
	public productImageDTO(int fileNo, String filePath, String fileName, int fileLevel, String parentBoardNo) {
		super();
		this.fileNo = fileNo;
		this.filePath = filePath;
		this.fileName = fileName;
		this.fileLevel = fileLevel;
		this.parentBoardNo = parentBoardNo;
	}

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
	@Override
	public String toString() {
		return "productImageDTO [fileNo=" + fileNo + ", filePath=" + filePath + ", fileName=" + fileName
				+ ", fileLevel=" + fileLevel + ", parentBoardNo=" + parentBoardNo + "]";
	}
	
	
	

	
}
