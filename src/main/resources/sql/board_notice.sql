create table board_notice(
  notice_no number(10) primary key,
  notice_group VARCHAR2(100),
  notice_content VARCHAR2(500),
  notice_writedate date default sysdate,
  notice_title VARCHAR2(100),
  notice_hit number(10) default 0
<<<<<<< HEAD
);

create sequence notice_seq;
=======
);
>>>>>>> kim
