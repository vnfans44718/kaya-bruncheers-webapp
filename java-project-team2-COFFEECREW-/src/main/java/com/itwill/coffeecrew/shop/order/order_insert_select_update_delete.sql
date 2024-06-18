/************order insert********************/
--cart 안에있는 아이템들주문
/******coffee1님 주문1*********/
--orders
INSERT INTO orders (o_no, o_name, o_date, o_total_price, o_request, o_pay_mtd, id)
VALUES (orders_o_no_seq.NEXTVAL, '아메리카노 외 2', sysdate, 8000, '얼음 많이', '신용카드', 'coffee1');
--order_item
INSERT INTO order_item (oi_no, oi_qty, o_no, p_no) 
VALUES (order_item_oi_no_seq.NEXTVAL, 1, orders_o_no_seq.CURRVAL, 1);
INSERT INTO order_item (oi_no, oi_qty, o_no, p_no) 
VALUES (order_item_oi_no_seq.NEXTVAL, 1, orders_o_no_seq.CURRVAL, 2);
INSERT INTO order_item (oi_no, oi_qty, o_no, p_no) 
VALUES (order_item_oi_no_seq.NEXTVAL, 1, orders_o_no_seq.CURRVAL, 3);
INSERT INTO order_item (oi_no, oi_qty, o_no, p_no) 
VALUES (order_item_oi_no_seq.NEXTVAL, 1, orders_o_no_seq.CURRVAL, 4);

/******coffee2님 주문1*********/
INSERT INTO orders (o_no, o_name, o_date, o_total_price, o_request, o_pay_mtd, id)
VALUES (orders_o_no_seq.NEXTVAL, '아메리카노 외 2', sysdate, 6000, '얼음 많이', '신용카드', 'coffee2');
--order_item
INSERT INTO order_item (oi_no, oi_qty, o_no, p_no) 
VALUES (order_item_oi_no_seq.NEXTVAL, 2, orders_o_no_seq.CURRVAL, 1);

INSERT INTO order_item (oi_no, oi_qty, o_no, p_no) 
VALUES (order_item_oi_no_seq.NEXTVAL, 1, orders_o_no_seq.CURRVAL, 2);

/****************order********************/
--1.멤버한사람의 주문전체목록(coffee1)
SELECT * FROM orders WHERE id = 'coffee1';
--1.멤버한사람의 주문(주문아이템+제품)전체목록(coffee1)
SELECT * FROM orders o 
JOIN order_item oi 
ON o.o_no = oi.o_no 
JOIN product p 
ON oi.p_no = p.p_no
WHERE o.id = 'coffee1';

--2.멤버한사람의 주문(주문아이템+제품)한개(coffee1)
SELECT * FROM orders WHERE o_no = 2;

SELECT * FROM orders o
JOIN order_item oi 
ON o.o_no = oi.o_no
JOIN product p 
ON oi.p_no = p.p_no
WHERE o.o_no = 2;

--3.로그인한멤버(coffee1)주문한개삭제
-- on delete cascade
DELETE FROM orders WHERE o_no = 4;

--4. 로그인한멤버(coffee1)주문전체삭제
DELETE FROM orders WHERE id = 'coffee1';



