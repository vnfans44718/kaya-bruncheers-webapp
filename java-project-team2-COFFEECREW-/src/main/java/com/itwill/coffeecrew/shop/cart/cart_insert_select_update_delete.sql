/*******************member insert****************/
INSERT INTO member (id,pw,pwcheck,phone,birthdate,email,nickname) VALUES ('coffee1', '1111', '유효성검사','11111111',19900101,'coffee1@gmail.com', '커피크루1');
INSERT INTO member (id,pw,pwcheck,phone,birthdate,email,nickname) VALUES ('coffee2', '2222', '유효성검사','22222222',19900202,'coffee2@gmail.com', '커피크루2');
INSERT INTO member (id,pw,pwcheck,phone,birthdate,email,nickname) VALUES ('coffee3', '3333', '유효성검사','33333333',19910303,'coffee3@gmail.com', '커피크루3');
INSERT INTO member (id,pw,pwcheck,phone,birthdate,email,nickname) VALUES ('coffee4', '4444', '유효성검사','44444444',19910404,'coffee4@gmail.com', '커피크루4');
/*******************product insert****************/
insert into product values(1, '아메리카노', 1800, 'Americano.png');
insert into product values(2, '딸기라떼', 4000, 'StrawberryLatte.png');
insert into product values(3, '카라멜스무디',3000, 'CaramelSmoothie.png');
insert into product values(4, '아인슈페너', 4200, 'Einsperner.png');
insert into product values(5, '레몬에이드', 3500, 'Lemonade.png');
insert into product values(6, '홍차', 2500, 'BlackTea.png');

/*******************cart insert****************/
--coffee1님이 1번2개,3번 1개,7번 3개
insert into cart(c_no,c_qty,id,p_no) values(cart_c_no_seq.nextval,1,'coffee1',3);
insert into cart(c_no,c_qty,id,p_no) values(cart_c_no_seq.nextval,2,'coffee1',4);
insert into cart(c_no,c_qty,id,p_no) values(cart_c_no_seq.nextval,3,'coffee1',5);
--coffee2님이 1번2개,3번 1개
insert into cart(c_no,id,p_no,c_qty) values(cart_c_no_seq.nextval,'coffee2',1,2);
insert into cart(c_no,id,p_no,c_qty) values(cart_c_no_seq.nextval,'coffee2',3,1);

/***********************카트************************/
--로그인한멤버(guard1)의 카트리스트
select * from cart where id='coffee1';
select c.*,p.*,c.c_qty*p.p_price "아이템가격" from cart c join product p 
on c.p_no=p.p_no
where id='coffee1';

--로그인한멤버(guard1)의 카트리스트전체삭제
--delete from cart where userid='guard1';
--로그인한멤버(guard1)의 카트아이템1개삭제 
--delete from cart where c_no=5;
commit;
--로그인한멤버(coffee1)의 카트1개아이템 수량변경
update cart set c_qty=c_qty+1 where id='coffee1' and p_no= 1;

--로그인한멤버(coffee1)의 카트에 존재하는 제품의수(제품존재여부판단)
select count(*)  as p_count from cart where id='coffee1' and p_no=1;
--로그인한멤버(coffee1)의 카트에담기(존재하는상품수정)
update cart set c_qty=c_qty+3 where id='coffee1' and p_no=1;

