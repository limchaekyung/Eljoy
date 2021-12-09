package com.care.root.admin.product.dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class boardQnaRepDTO {
	private String eReplyContent;
	private int enquiryReplyNo;
	private String eReplyWritedate;
	private int eReplyCheck;
	
	
	
	public int geteReplyCheck() {
		return eReplyCheck;
	}
	public void seteReplyCheck(int eReplyCheck) {
		this.eReplyCheck = eReplyCheck;
	}
	public void seteReplyWritedate(String eReplyWritedate) {
		this.eReplyWritedate = eReplyWritedate;
	}
	public String geteReplyContent() {
		return eReplyContent;
	}
	public void seteReplyContent(String eReplyContent) {
		this.eReplyContent = eReplyContent;
	}
	public int getEnquiryReplyNo() {
		return enquiryReplyNo;
	}
	public void setEnquiryReplyNo(int enquiryReplyNo) {
		this.enquiryReplyNo = enquiryReplyNo;
	}
	public String geteReplyWritedate() {
		return eReplyWritedate;
	}
//	public void seteReplyWritedate(String eReplyWritedate) {
//		this.eReplyWritedate = eReplyWritedate;
//	}
	
	public void seteReplyWritedate(Timestamp eReplyWritedate) {
		SimpleDateFormat format = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
		this.eReplyWritedate = format.format(eReplyWritedate);
	}
	
	
}
