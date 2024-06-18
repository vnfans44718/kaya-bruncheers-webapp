/************************************* 회원(member) insert *************************************/

INSERT INTO member(id, pw, pwcheck, phone, birthdate, email, nickname) VALUES('kim1', '1111', '1111', '010-1111-1111', 19950101, 'kimcoffee@naver.com', '김커피');
INSERT INTO member(id, pw, pwcheck, phone, birthdate, email, nickname) VALUES('lee2', '2222', '2222', '010-2222-2222', 19950202, 'leecoffee@naver.com', '이커피');
INSERT INTO member(id, pw, pwcheck, phone, birthdate, email, nickname) VALUES('park3', '3333', '3333', '010-3333-3333', 19950303, 'parkcoffee@naver.com', '박커피');
INSERT INTO member(id, pw, pwcheck, phone, birthdate, email, nickname) VALUES('choi4', '4444', '4444', '010-4444-4444', 19950404, 'choicoffee@naver.com', '최커피');
INSERT INTO member(id, pw, pwcheck, phone, birthdate, email, nickname) VALUES('jeong5', '5555', '5555', '010-5555-5555', 19950505, 'jeongcoffee@naver.com', '정커피');



/************************************* 상품(product) insert *************************************/

/*
INSERT INTO product(p_no, p_name, p_price, p_image, p_category) VALUES(1, '아메리카노ICE', 4000, '이미지1', '커피');
INSERT INTO product(p_no, p_name, p_price, p_image, p_category) VALUES(2, '카페라떼ICE', 5000, '이미지2', '커피');
INSERT INTO product(p_no, p_name, p_price, p_image, p_category) VALUES(3, '카푸치노', 6000, '이미지3', '커피');
INSERT INTO product(p_no, p_name, p_price, p_image, p_category) VALUES(4, '밀크티HOT', 6500, '이미지4', '티');
INSERT INTO product(p_no, p_name, p_price, p_image, p_category) VALUES(5, '캐모마일HOT', 6000, '이미지5', '티');
INSERT INTO product(p_no, p_name, p_price, p_image, p_category) VALUES(6, '자몽허니블랙티ICE', 6500, '이미지6', '티');
INSERT INTO product(p_no, p_name, p_price, p_image, p_category) VALUES(7, '딸기스무디', 8000, '이미지7', '스무디');
INSERT INTO product(p_no, p_name, p_price, p_image, p_category) VALUES(8, '블루베리스무디', 7000, '이미지8', '스무디');
INSERT INTO product(p_no, p_name, p_price, p_image, p_category) VALUES(9, '밀크쉐이크', 7000, '이미지9', '스무디');
INSERT INTO product(p_no, p_name, p_price, p_image, p_category) VALUES(10, '샷추가', 500, '이미지10', '기타');
INSERT INTO product(p_no, p_name, p_price, p_image, p_category) VALUES(11, '시럽추가', 500, '이미지11', '기타');
*/

INSERT INTO product(p_no, p_name, p_price, p_image, p_category) VALUES(1, '아메리카노HOT', 4000, '아메리카노HOT.jpg', '커피');
INSERT INTO product(p_no, p_name, p_price, p_image, p_category) VALUES(2, '아메리카노ICE', 4500, '아메리카노ICE.jpg', '커피');
INSERT INTO product(p_no, p_name, p_price, p_image, p_category) VALUES(3, '카페라떼HOT', 5000, '카페라떼HOT.jpg', '커피');
INSERT INTO product(p_no, p_name, p_price, p_image, p_category) VALUES(4, '카페라떼ICE', 5500, '카페라떼ICE.jpg', '커피');
INSERT INTO product(p_no, p_name, p_price, p_image, p_category) VALUES(5, '카푸치노', 6000, '카푸치노.jpg', '커피');
INSERT INTO product(p_no, p_name, p_price, p_image, p_category) VALUES(6, '밀크티HOT', 6500, '밀크티HOT.jpg', '티');
INSERT INTO product(p_no, p_name, p_price, p_image, p_category) VALUES(7, '밀크티ICE', 7000, '밀크티ICE.jpg', '티');
INSERT INTO product(p_no, p_name, p_price, p_image, p_category) VALUES(8, '캐모마일HOT', 6000, '캐모마일HOT.jpg', '티');
INSERT INTO product(p_no, p_name, p_price, p_image, p_category) VALUES(9, '캐모마일ICE', 6500, '캐모마일ICE.jpg', '티');
INSERT INTO product(p_no, p_name, p_price, p_image, p_category) VALUES(10, '자몽허니블랙티HOT', 7000, '자몽허니블랙티HOT.jpg', '티');
INSERT INTO product(p_no, p_name, p_price, p_image, p_category) VALUES(11, '자몽허니블랙티ICE', 7500, '자몽허니블랙티ICE.jpg', '티');
INSERT INTO product(p_no, p_name, p_price, p_image, p_category) VALUES(12, '딸기스무디', 7000, '딸기스무디.jpg', '스무디');
INSERT INTO product(p_no, p_name, p_price, p_image, p_category) VALUES(13, '블루베리스무디', 7000, '블루베리스무디.jpg', '스무디');
INSERT INTO product(p_no, p_name, p_price, p_image, p_category) VALUES(14, '밀크쉐이크', 6500, '밀크쉐이크.jpg', '스무디');
INSERT INTO product(p_no, p_name, p_price, p_image, p_category) VALUES(15, '샷추가', 500, '이미지10', '기타');
INSERT INTO product(p_no, p_name, p_price, p_image, p_category) VALUES(16, '시럽추가', 500, '이미지11', '기타');


/************************************** 주문(order) insert **************************************/

--cart 안에있는 아이템들주문
/********* kim1님 주문1 *********/
--orders
INSERT INTO orders (o_no, o_name, o_date, o_total_price, o_request, o_pay_mtd, id)
VALUES (orders_o_no_seq.NEXTVAL, '아메리카노 외 2', sysdate, 8000, '얼음 많이', '신용카드', 'kim1');
--order_item
INSERT INTO order_item (oi_no, oi_qty, o_no, p_no) 
VALUES (order_item_oi_no_seq.NEXTVAL, 1, orders_o_no_seq.CURRVAL, 1);
INSERT INTO order_item (oi_no, oi_qty, o_no, p_no) 
VALUES (order_item_oi_no_seq.NEXTVAL, 1, orders_o_no_seq.CURRVAL, 2);
INSERT INTO order_item (oi_no, oi_qty, o_no, p_no) 
VALUES (order_item_oi_no_seq.NEXTVAL, 1, orders_o_no_seq.CURRVAL, 3);

/********* lee2님 주문1 *********/
--orders
INSERT INTO orders (o_no, o_name, o_date, o_total_price, o_request, o_pay_mtd, id)
VALUES (orders_o_no_seq.NEXTVAL, '아메리카노 외 2', sysdate, 6000, '얼음 많이', '신용카드', 'lee2');
--order_item
INSERT INTO order_item (oi_no, oi_qty, o_no, p_no) 
VALUES (order_item_oi_no_seq.NEXTVAL, 2, orders_o_no_seq.CURRVAL, 1);

INSERT INTO order_item (oi_no, oi_qty, o_no, p_no) 
VALUES (order_item_oi_no_seq.NEXTVAL, 1, orders_o_no_seq.CURRVAL, 2);



/************************************* 장바구니(cart) *************************************/
--insert
--kim1님이 1번 2개, 3번 1개, 8번 2개
insert into cart(c_no, c_qty, id, p_no) values(cart_c_no_seq.nextval, 2, 'kim1', 1);
insert into cart(c_no, c_qty, id, p_no) values(cart_c_no_seq.nextval, 1, 'kim1', 3);
insert into cart(c_no, c_qty, id, p_no) values(cart_c_no_seq.nextval, 2, 'kim1', 8);



