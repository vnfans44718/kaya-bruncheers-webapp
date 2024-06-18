package com.itwill.shop.order;

public class OrderSQl {
	public final static String ORDER_DELETE_BY_UID="delete from orders where u_id = ?";
	public final static String ORDER_DELETE_BY_ONO="delete from order_item where o_no = ?";
	public final static String ORDER_INSERT="INSERT INTO orders(o_no, o_price, o_addr, o_name, o_phone, o_payment, o_img,u_id) VALUES(orders_o_no_SEQ.nextval,?,?,?,?,?,?,?)";
	public final static String ORDERITEM_INSERT="INSERT INTO order_item(oi_no,oi_qty,o_no,po_no) VALUES (order_item_oi_no_SEQ.nextval,?,orders_o_no_SEQ.currval,?)";
	public final static String ORDER_SELECT_BY_UID="select * from orders where u_id=?";
	public final static String ORDER_SELECT_WITH_ORDERITEM_BY_ONO="select * from orders o join order_item oi on o.o_no = oi.o_no join product_option po on oi.po_no = po.po_no join product p on po.p_no = p.p_no where o.o_no=?";
	public final static String ORDER_SELECT_WITH_ORDERITEM_BY_UID="select * from orders o join order_item oi on o.o_no = oi.o_no join product_option po on oi.po_no = po.po_no join product p on po.p_no = p.p_no where u_id=?";
	public final static String ORDER_FIND_PRIMARY_IMAGE="select p_img,idx FROM (select p_img, rownum idx from(select p.p_img FROM order_item oi join product_option po ON oi.po_no = po.po_no join product p on p.p_no = po.p_no where o_no=? order by oi.oi_no)) where idx=1";
}
