CREATE TABLE productImage(
file_no NUMBER,
file_path VARCHAR2(1000),
file_name VARCHAR2(50),
file_level NUMBER,
parent_board_no VARCHAR2(100)
);
DROP TABLE productImage;
alter table productImage add
   constraint fk_product_num
   foreign key (parent_board_no)
      references product(product_num);
      
      CREATE SEQUENCE SEQ_FNO;
      
select * from productImage;
commit;



SELECT * FROM PRODUCTIMAGE
		WHERE parent_board_no = 'tesst4'
    AND FILE_LEVEL = 0;


