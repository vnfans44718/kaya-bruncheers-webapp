package com.itwill.coffeecrew.shop.test.송성빈;

import java.util.List;
import com.itwill.coffeecrew.shop.product.Product;
import com.itwill.coffeecrew.shop.product.ProductService;

public class ProductServiceTestMain {

	public static void main(String[] args) throws Exception {
		ProductService productService = new ProductService();
		int rowCount = 0;

		/*
		 * System.out.println("1. insert"); rowCount = productService.productInsert(new
		 * Product(5, "모카", 6000, "이미지6")); System.out.println(">> " + rowCount);
		 */

		/*
		 * System.out.println("2.update"); rowCount=productService.productUpdate(new
		 * Product(5, "베이글", 4000, "이미지6")); System.out.println(">>"+rowCount);
		 */

		/*
		 * System.out.println("3.deleteProductByName"); rowCount =
		 * productService.productDelete("베이글"); System.out.println(">>"+rowCount);
		 */

		System.out.println("4. select one");
		System.out.println("" + productService.productDetail(1));

		System.out.println("5. select All");
		System.out.println("" + productService.productList());

		System.out.println("6. select category");
		System.out.println("" + productService.productListByCategory("티"));
	}

}
