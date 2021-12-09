package com.care.root.payment.dto;

public class paymentDTO {
   private String member_id;   //아이디
   private String payment_id;   //주문번호
   private String product_name;   //상품이름
   private String product_num;   //상품번호
   private String payment_name;   //주문자 이름
   private String payment_addr1;   //주문자 주소
   private String payment_addr2;   //주문자 주소
   private String payment_addr3;   //주문자 주소
   private String payment_phone;   //주문자 전화번호
   private String payment_delivery;   //배송
   private String payment_memo;   //배송메시지
   private int payment_total;   //총 금액
   private String payment_date;   //날짜
   private String cart_photo;   //상품사진
   private String payment_rental; //대여기간
   
   public String getPayment_rental() {
      return payment_rental;
   }
   public void setPayment_rental(String payment_rental) {
      this.payment_rental = payment_rental;
   }
   public String getMember_id() {
      return member_id;
   }
   public void setMember_id(String member_id) {
      this.member_id = member_id;
   }
   public String getPayment_id() {
      return payment_id;
   }
   public void setPayment_id(String payment_id) {
      this.payment_id = payment_id;
   }
   public String getProduct_name() {
      return product_name;
   }
   public void setProduct_name(String product_name) {
      this.product_name = product_name;
   }
   
   public String getProduct_num() {
      return product_num;
   }
   public void setProduct_num(String product_num) {
      this.product_num = product_num;
   }
   public String getPayment_memo() {
      return payment_memo;
   }
   public void setPayment_memo(String payment_memo) {
      this.payment_memo = payment_memo;
   }
   public String getPayment_name() {
      return payment_name;
   }
   public void setPayment_name(String payment_name) {
      this.payment_name = payment_name;
   }
   public String getPayment_addr1() {
      return payment_addr1;
   }
   public void setPayment_addr1(String payment_addr1) {
      this.payment_addr1 = payment_addr1;
   }
   public String getPayment_addr2() {
      return payment_addr2;
   }
   public void setPayment_addr2(String payment_addr2) {
      this.payment_addr2 = payment_addr2;
   }
   public String getPayment_addr3() {
      return payment_addr3;
   }
   public void setPayment_addr3(String payment_addr3) {
      this.payment_addr3 = payment_addr3;
   }
   public String getPayment_phone() {
      return payment_phone;
   }
   public void setPayment_phone(String payment_phone) {
      this.payment_phone = payment_phone;
   }
   public String getPayment_delivery() {
      return payment_delivery;
   }
   public void setPayment_delivery(String payment_delivery) {
      this.payment_delivery = payment_delivery;
   }
   public String getPayment_deliveryMemo() {
      return payment_memo;
   }
   public void setPayment_deliveryMemo(String payment_deliveryMemo) {
      this.payment_memo = payment_deliveryMemo;
   }
   
   
   public int getPayment_total() {
      return payment_total;
   }
   public void setPayment_total(int payment_total) {
      this.payment_total = payment_total;
   }
   public String getPayment_date() {
      return payment_date;
   }
   public void setPayment_date(String payment_date) {
      this.payment_date = payment_date;
   }
   public String getCart_photo() {
      return cart_photo;
   }
   public void setCart_photo(String cart_photo) {
      this.cart_photo = cart_photo;
   }
   
   
}