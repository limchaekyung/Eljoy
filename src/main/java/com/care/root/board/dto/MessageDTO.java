package com.care.root.board.dto;

import javax.servlet.http.HttpServletRequest;

public class MessageDTO {
	private int result;
	private HttpServletRequest request; //path 값 
	private String successMessage;
	private String failMessage;
	private String successURL;
	private String failURL;
	
	public int getResult() {
		return result;
	}
	public void setResult(int result) {
		this.result = result;
	}
	public HttpServletRequest getRequest() {
		return request;
	}
	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}
	public String getSuccessMessage() {
		return successMessage;
	}
	public void setSuccessMessage(String successMessage) {
		this.successMessage = successMessage;
	}
	public String getFailMessage() {
		return failMessage;
	}
	public void setFailMessage(String failMessage) {
		this.failMessage = failMessage;
	}
	public String getSuccessURL() {
		return successURL;
	}
	public void setSuccessURL(String successURL) {
		this.successURL = successURL;
	}
	public String getFailURL() {
		return failURL;
	}
	public void setFailURL(String failURL) {
		this.failURL = failURL;
	}
	
}
