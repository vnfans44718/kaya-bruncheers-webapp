package com.itwill.coffeecrew.shop.product;

import java.util.List;

public class ProductService {
	private ProductDao productDao;

	public ProductService() throws Exception {
		productDao = new ProductDao();
	}

	// 카테고리 별로 보기
	public List<Product> productListByCategory(String pCategory) throws Exception {
		return productDao.findByCategory(pCategory);
	}

	// 전체 상품 보기
	public List<Product> productList() throws Exception {
		return productDao.findProductAll();
	}

	// 상품 하나 보기
	public Product productDetail(int pNo) throws Exception {
		return productDao.findByProductNo(pNo);
	}

	// 상품 추가하기

	public int productInsert(Product product) throws Exception {
		return productDao.productInsert(product);
	}

	// 상품 업데이트 하기
	public int productUpdate(Product product) throws Exception {
		return productDao.productUpdate(product);
	}

	// 상품 삭제하기
	public int productDelete(String pName) throws Exception {
		return productDao.productDelete(pName);
	}

}
