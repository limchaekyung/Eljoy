create table faq (
  faq_no number(10) primary key,
  faq_group number(10), --0:회원/정보관리, 1:주문/결제, 2:배송, 3:취소/환불, 4:반품/교환
  faq_subject VARCHAR2(500),
  faq_content VARCHAR2(500)
);