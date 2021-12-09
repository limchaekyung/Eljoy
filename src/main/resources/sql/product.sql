CREATE TABLE product(
product_num VARCHAR2(100) PRIMARY KEY, --상품코드 
product_name VARCHAR2(100), --상품이름
product_title VARCHAR2(100),--상품 글 제목
product_category VARCHAR2(70),--상품 카테고리
product_content clob,--상품 소개 글 내용
product_data date DEFAULT sysdate,--상품 등록 날짜
product_company VARCHAR2(20),--제조사 카테고리
product_quantity VARCHAR2(20),--상품수량
product_pee VARCHAR2(100)--상품가격

);

select * from PRODUCT;
DROP TABLE PRODUCT;

--상품 테이블
create table product(
   상품번호: product_num
   상품이름: product_name
   분류: product_category
   가격: product_pee
   수량: product_quantity
   설명: product_content
   이미지: product_thumbnail
   날짜: product_data
);



--카테고리 2차 분류
create table goods_category (
    cateName     varchar2(20)    not null,   --카테고리 이름
    cateCode     varchar2(30)    not null,   --카테고리 번호(가 있어야 나중에 링크 걸수 있어요..)
    cateCodeRef  varchar2(30)    null,   --상위카테고리
    primary key(cateCode),
    foreign key(cateCodeRef) references goods_category(cateCode)
);


--테이블 참조
alter table product add
   constraint fk_goods_category
   foreign key (cateCode)
      references goods_category(cateCode);

-- 카테고리 상품 코드
insert into goods_category(cateName, cateDode) values('카테고리1', '100');
insert into goods_category(cateName, cateDode, cateCodeRef) values('카테고리 1-1', '101', '100');
...

select * from goods_category;
commit;


