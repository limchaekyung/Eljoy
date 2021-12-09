create table board_enquiry (
  enquiry_no number(10) primary key,
  member_id VARCHAR2(100),
  enquiry_subject VARCHAR2(100),
  enquiry_content VARCHAR2(500),
  enquiry_hit number(10) default 0,
  enquiry_writedate date default sysdate,
  enquiry_state VARCHAR2(100)
);

create sequence enquiry_seq;