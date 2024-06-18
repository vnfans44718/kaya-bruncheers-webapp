/* 회원 INSERT */
INSERT INTO userinfo values ('user1','1111','김익명1','서울시 강남구','010-1111-1111','mail1@naver.com', '2000-01-01');
INSERT INTO userinfo values ('user2','2222','김익명2','서울시 동작구','010-2222-2222','mail2@naver.com', '2000-02-02');
INSERT INTO userinfo values ('user3','3333','김익명3','서울시 강서구','010-3333-3333','mail3@naver.com', '2000-03-03');


/* user1 주문 */
-- user1의 상품 상세에서 주문
INSERT INTO orders(o_no, o_price, o_addr, o_name, o_phone, o_payment, o_img,u_id) VALUES(orders_o_no_SEQ.nextval,200000,'서울시 관악구','김배송','010-1111-1111','카드', 'shoe.img','user1');
INSERT INTO order_item(oi_no,oi_qty,o_no,po_no) VALUES (order_item_oi_no_SEQ.nextval,2,1,1); 
INSERT INTO order_item(oi_no,oi_qty,o_no,po_no) VALUES (order_item_oi_no_SEQ.nextval,1,1,2);
INSERT INTO order_item(oi_no,oi_qty,o_no,po_no) VALUES (order_item_oi_no_SEQ.nextval,6,1,3); 
-- user1의 카트에서 주문 
INSERT INTO orders(o_no, o_price, o_addr, o_name, o_phone, o_payment, o_img,u_id) VALUES(orders_o_no_SEQ.nextval,800000,'서울시 광진구','김새봄','010-1111-1111','카드', 'shoe.img','user1');
INSERT INTO order_item(oi_no,oi_qty,o_no,po_no) VALUES (order_item_oi_no_SEQ.nextval,5,2,3); 
INSERT INTO order_item(oi_no,oi_qty,o_no,po_no) VALUES (order_item_oi_no_SEQ.nextval,2,2,5);
INSERT INTO order_item(oi_no,oi_qty,o_no,po_no) VALUES (order_item_oi_no_SEQ.nextval,1,2,1); 
/* user2 주문 */
-- user2의 상품 상세에서 주문
INSERT INTO orders(o_no, o_price, o_addr, o_name, o_phone, o_payment, o_img,u_id) VALUES(orders_o_no_SEQ.nextval,200000,'서울시 종로구','김익명','010-1111-1111','카드', 'shoe.img','user2');
INSERT INTO order_item(oi_no,oi_qty,o_no,po_no) VALUES (order_item_oi_no_SEQ.nextval,1,3,8); 
INSERT INTO order_item(oi_no,oi_qty,o_no,po_no) VALUES (order_item_oi_no_SEQ.nextval,2,3,4);
INSERT INTO order_item(oi_no,oi_qty,o_no,po_no) VALUES (order_item_oi_no_SEQ.nextval,2,3,2); 
-- user2의 카트에서 주문 
INSERT INTO orders(o_no, o_price, o_addr, o_name, o_phone, o_payment, o_img,u_id) VALUES(orders_o_no_SEQ.nextval,700000,'서울시 마포구','박구름','010-1111-1111','카드', 'shoe.img','user2');
INSERT INTO order_item(oi_no,oi_qty,o_no,po_no) VALUES (order_item_oi_no_SEQ.nextval,4,4,11); 
INSERT INTO order_item(oi_no,oi_qty,o_no,po_no) VALUES (order_item_oi_no_SEQ.nextval,5,4,2);
INSERT INTO order_item(oi_no,oi_qty,o_no,po_no) VALUES (order_item_oi_no_SEQ.nextval,6,4,1); 

/* user3 주문 */
-- user3의 상품 상세에서 주문
INSERT INTO orders(o_no, o_price, o_addr, o_name, o_phone, o_payment, o_img,u_id) VALUES(orders_o_no_SEQ.nextval,200000,'서울시 송파구','강가을','010-1111-1111','카드', 'shoe.img','user3');
INSERT INTO order_item(oi_no,oi_qty,o_no,po_no) VALUES (order_item_oi_no_SEQ.nextval,2,5,1); 
INSERT INTO order_item(oi_no,oi_qty,o_no,po_no) VALUES (order_item_oi_no_SEQ.nextval,2,5,2);
INSERT INTO order_item(oi_no,oi_qty,o_no,po_no) VALUES (order_item_oi_no_SEQ.nextval,2,5,3); 
-- user3의 카트에서 주문 
INSERT INTO orders(o_no, o_price, o_addr, o_name, o_phone, o_payment, o_img,u_id) VALUES(orders_o_no_SEQ.nextval,200000,'서울시 구로구','송하늘','010-1111-1111','카드', 'shoe.img','user3');
INSERT INTO order_item(oi_no,oi_qty,o_no,po_no) VALUES (order_item_oi_no_SEQ.nextval,3,6,19); 
INSERT INTO order_item(oi_no,oi_qty,o_no,po_no) VALUES (order_item_oi_no_SEQ.nextval,3,6,10);
INSERT INTO order_item(oi_no,oi_qty,o_no,po_no) VALUES (order_item_oi_no_SEQ.nextval,1,6,3); 





