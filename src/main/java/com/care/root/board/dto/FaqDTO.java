package com.care.root.board.dto;

public class FaqDTO {
	private int faq_no;
	private int faq_group; //0:회원/정보관리, 1:주문/결제, 2:배송, 3:취소/환불, 4:반품/교환
	private String faq_subject;
	private String faq_content;
	
	public int getFaq_no() {
		return faq_no;
	}
	public void setFaq_no(int faq_no) {
		this.faq_no = faq_no;
	}
	public int getFaq_group() {
		return faq_group;
	}
	public void setFaq_group(int faq_group) {
		this.faq_group = faq_group;
	}
	public String getFaq_subject() {
		return faq_subject;
	}
	public void setFaq_subject(String faq_subject) {
		this.faq_subject = faq_subject;
	}
	public String getFaq_content() {
		return faq_content;
	}
	public void setFaq_content(String faq_content) {
		this.faq_content = faq_content;
	}
	
	
}
