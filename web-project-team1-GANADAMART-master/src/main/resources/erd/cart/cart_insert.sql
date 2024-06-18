/**********************cart insert************************/
--bbbb님이 1번1개,2번2개 제품담기
insert into cart(c_no,c_qty,po_no,u_id) values(cart_c_no_seq.nextval,1,1,'bbbb');
insert into cart(c_no,c_qty,po_no,u_id) values(cart_c_no_seq.nextval,2,2,'bbbb');
--cccc님이 3번8개,4번4개 제품담기
insert into cart(c_no,c_qty,po_no,u_id) values(cart_c_no_seq.nextval,8,3,'cccc');
insert into cart(c_no,c_qty,po_no,u_id) values(cart_c_no_seq.nextval,4,4,'cccc');