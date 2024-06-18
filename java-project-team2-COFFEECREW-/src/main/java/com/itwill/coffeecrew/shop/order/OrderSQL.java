package com.itwill.coffeecrew.shop.order;

public class OrderSQL {
	public final static String ORDER_DELETE_BY_ID = 
			"DELETE FROM orders WHERE id = ?";
	public final static String ORDER_DELETE_BY_O_NO = 
			"DELETE FROM orders WHERE o_no = ?";
	public final static String ORDER_INSERT = 
			"INSERT INTO orders (o_no, o_name, o_date, o_total_price, o_request, o_pay_mtd, id) VALUES (orders_o_no_seq.NEXTVAL, ?, sysdate, ?, ?, ?, ?)";
	public final static String ORDERITEM_INSERT = 
			"INSERT INTO order_item (oi_no, oi_qty, o_no, p_no) VALUES (order_item_oi_no_seq.NEXTVAL, ?, orders_o_no_seq.CURRVAL, ?)";
	public final static String ORDER_SELECT_BY_ID = 
			"SELECT * FROM orders WHERE ID = ?";
	public final static String ORDER_SELECT_WITH_ORDERITEM_BY_O_NO = 
			"SELECT * FROM orders o JOIN order_item oi ON o.o_no = oi.o_no JOIN product p ON oi.p_no = p.p_no WHERE o.o_no = ?";
	public final static String ORDER_SELECT_WITH_ORDERITEM_BY_ID = 
			"SELECT * FROM orders o JOIN order_item oi ON o.o_no = oi.o_no JOIN product p ON oi.p_no = p.p_no WHERE o.id = ?";
}
