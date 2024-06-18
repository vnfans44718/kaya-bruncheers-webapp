package com.itwill.coffeecrew.shop.test.송성빈;

import com.itwill.coffeecrew.shop.product.Product;
import com.itwill.coffeecrew.shop.product.ProductDao;

public class ProductDaoTestMain {

	public static void main(String[] args) throws Exception {
		ProductDao productDao = new ProductDao();
		int rowCount = 0;
		/*
		 * productDao.productInsert(new Product(5, "자바칩", 7000, "이미지5"));
		 * 
		 * productDao.findByProductNo(4);
		 * 
		 * 
		 * productDao.productUpdate(new Product(5, "베이글", 3000, "이미지6"));
		 * 
		 * productDao.productDelete("베이글");
		 */

		// System.out.println("select id " + productDao.findByProductNo(1));
		// System.out.println("select all " + productDao.findProductAll());

		productDao.findByCategory("커피");
	}

}
