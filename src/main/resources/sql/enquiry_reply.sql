CREATE TABLE enquiry_reply(
e_reply_content VARCHAR2(500),
e_reply_writedate date DEFAULT sysdate,
enquiry_reply_no NUMBER
);
SELECT * FROM enquiry_reply;
DROP TABLE enquiry_reply;
alter table enquiry_reply add
   constraint fk_ENQUIRY_NO
   foreign key (enquiry_reply_no)
      references board_enquiry(ENQUIRY_NO) on delete cascade;

      
