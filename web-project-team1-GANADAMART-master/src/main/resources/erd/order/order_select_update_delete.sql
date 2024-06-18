
-- 상품 이미지 select
select p_img,idx FROM (select p_img, rownum idx from(select p.p_img FROM order_item oi join product_option po ON oi.po_no = po.po_no join product p on p.p_no = po.p_no where o_no=6 order by oi.oi_no)) where idx=1; 


------------- SELECT -------------
/* 회원 한 명의 주문 전체 목록 */
select * from orders where u_id='user1';

/* 회원 한 명의 주문 한 개 */
select * from orders where o_no=1;

/* 주문 한 개의 주문 상세 (주문 하나 에 담긴 주문 아이템까지 보여주기) */
select * from order_item where o_no=1;

/* 회원 한 명의 주문리스트(주문상세정보 + 상품정보) */
select * from orders o join order_item oi on o.o_no = oi.o_no join product_option po on oi.po_no = po.po_no join product p on po.p_no = p.p_no where u_id='user3';




/* 주문 한 개의 주문리스트(주문상세정보 + 상품정보) */
select * from orders o join order_item oi on o.o_no = oi.o_no join product_option po on oi.po_no = po.po_no join product p on po.p_no = p.p_no where o.o_no='3';

select * from order_item oi join product_option po on oi.po_no = po.po_no join product p on po.p_no = p.p_no where oi.o_no=1;

------------- DELETE -------------
/* 멤버 한 사람의 주문 내역 전체 삭제 */
delete from order_item where o_no in(select o_no from orders where u_id='user2');
delete from orders where u_id = 'user2';

/* 주문 한 개 삭제 */
delete from order_item where o_no = 2;
delete from orders where o_no=2;