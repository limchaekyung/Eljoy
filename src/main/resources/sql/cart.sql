create table cart (
  write_no number(10) primary key,
  product_num VARCHAR2(50),
  product_name VARCHAR2(50),
  payment_total number(10),
  cart_state VARCHAR2(50),
  cart_photo VARCHAR2(50),
  member_id VARCHAR2(50)
);

create sequence cart_seq;