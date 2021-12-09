package com.care.root.admin.product.dto;

import javax.servlet.http.HttpServletRequest;

public class MessageDTO {
	private int result; // modify_form에 자바스크립트에 functionreader.onload = function(e) { 
									// e : 이벤트 안에 result 값이 파일의 정보를 가지고 있다
									//${"#preview"}.attr('src', e.target.result)
	private HttpServletRequest request; //path값을 얻어오기 위해서
	private String successMessage; //result == 1 성공 했을때 메시지
	private String failMessage; //result == 0 실패 했을때 메시지
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































