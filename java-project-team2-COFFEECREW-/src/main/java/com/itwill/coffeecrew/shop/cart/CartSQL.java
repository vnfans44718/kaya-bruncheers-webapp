package com.itwill.coffeecrew.shop.cart;

public class CartSQL {

	public static final String CART_INSERT =
			"insert into cart (c_no,c_qty,id,p_no) values (cart_c_no_seq.nextval,?,?,?)";
	
	
	public static final String CART_SELECT_BY_USER_ID = 
			"select c.*,p.* from cart c join product p on c.p_no = p.p_no where id = ?";
	
	
	public static final String CART_SELECT_BY_CART_NO =
			"select c.*,p.* from cart c join product p on c.p_no=p.p_no where c_no = ?";
	
	
	public static final String CART_COUNT_BY_USERID_PRODUCT_NO =
			" select count(*) as p_count from cart where id =? and p_no=?";
	
	public static final String CART_DELETE_BY_CART_NO =
			"delete from cart where c_no = ?";
	
	
	public static final String CART_DELETE_BY_USER_ID =
			"delete from cart where id = ?";
	
	
	public static final String CART_UPDATE_BY_CART_NO =
			"update cart set c_qty =? where c_no = ?";
	
	
	public static final String CART_UPDATE_BY_PRODUCT_NO_USERID =
			"update cart set c_qty =? where p_no=? and id =?";
	
	
	public static final String CART_SELECT_TOT_BY_USER_ID =
			"SELECT SUM(c2.p_price) AS total_price "
					+ "FROM cart c "
					+ "JOIN member m ON c.id = m.id "
					+ "JOIN (SELECT p.p_price, c.p_no FROM cart c JOIN product p ON c.p_no = p.p_no) c2 ON c.p_no = c2.p_no "
					+ "WHERE m.id = ? "
					+ "GROUP BY m.id";
;
	
	
	
}
