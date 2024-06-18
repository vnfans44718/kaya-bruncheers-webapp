package com.itwill.coffeecrew.shop.product;

public class ProductSQL {

	public final static String PRODUCT_SELECT_ALL = 
			"SELECT p_no, p_name, p_price, p_image, p_category FROM product";

	public final static String PRODUCT_SELECT_BY_NO = 
			"SELECT p_no, p_name, p_price, p_image, p_category FROM product WHERE p_no = ?";

	public final static String PRODUCT_SELECT_BY_CATEGORY = 
			"SELECT p_no, p_name, p_price, p_image, p_category FROM product WHERE p_category = ?";

	public final static String PRODUCT_INSERT = 
			"INSERT INTO product(p_no, p_name, p_price, p_image, p_category) VALUES (?, ?, ?, ?, ?)";

	public final static String PRODUCT_DELETE_BY_NAME = 
			"DELETE FROM product WHERE p_name = ?";

	public final static String PRODUCT_UPDATE = 
			"UPDATE product SET p_name = ? , p_price = ?, p_image = ?, p_category = ? WHERE p_no = ?";
}
