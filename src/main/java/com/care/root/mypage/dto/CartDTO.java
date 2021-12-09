package com.care.root.mypage.dto;

public class CartDTO {
	//장바구니 DB
	private int cart_no; //장바구니 번호
	private String product_num; //상품코드
	private String product_name; //상품이름
	private int payment_total; //총금액
	private String cart_state; //대여가능여부
	private String cart_photo; //상품사진
	private String member_id; //아이디
	
	public int getCart_no() {
		return cart_no;
	}
	public void setCart_no(int cart_no) {
		this.cart_no = cart_no;
	}
	public String getProduct_num() {
		return product_num;
	}
	public void setProduct_num(String product_num) {
		this.product_num = product_num;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public int getPayment_total() {
		return payment_total;
	}
	public void setPayment_total(int payment_total) {
		this.payment_total = payment_total;
	}
	public String getCart_state() {
		return cart_state;
	}
	public void setCart_state(String cart_state) {
		this.cart_state = cart_state;
	}
	public String getCart_photo() {
		return cart_photo;
	}
	public void setCart_photo(String cart_photo) {
		this.cart_photo = cart_photo;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	
	
}
