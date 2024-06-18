/******************************* select ******************************/
-- 1. 전체 카트리스트 검색
select * from cart;

--bbbb 멤버한사람의 카트에 제품번호 존재여부
select count(*) as p_count from cart c where u_id='bbbb' and c.po_no=1;

--cccc 멤버한사람의 카트아이템 리스트
select * from cart c join product_option po on c.po_no=po.po_no join product p on po.po_no = p.p_no where c.u_id='bbbb';

--bbbb 멤버의 카트 아이템 총 가격
select c.* , po.* , p.*, c.c_qty * p.p_price as "총 가격" 
from cart c 
join product_option po 
on c.po_no = po.po_no
join product p  
on po.po_no = p.p_no
where u_id = 'bbbb';

/******************************* update ******************************/
-- 1. 카트 수량 변경
--bbbb 카트에 있는 1번제품의 수량증가
update cart set c_qty=c_qty+1 where u_id='bbbb' and po_no=1;
update cart set c_qty=c_qty-1 where u_id='bbbb' and po_no=1;

--bbbb 카트에 있는 cart_no 15번의 수량 3개 수정
update cart set c_qty=3 where c_no=15; 

/******************************* delete******************************/
-- 1. 카트아이템 1개 삭제
delete from cart where c_no=1;
-- 2. 카트아이템 전체 삭제
delete from cart where u_id='bbbb';


