package com.itwill.shop.product;

import static org.junit.jupiter.api.Assertions.*;

import java.util.List;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;

class ProductDaoImplMyBatisTest {
	ProductDao productDao;

	@BeforeEach
	void setUp() throws Exception {
		productDao = new ProductDaoImplMyBatis();
	}
	
	@Disabled
	@Test
	void testFindAll() throws Exception {
		List<Product> productList = productDao.findAll();
		System.out.println(productList);
		assertTrue(productList!=null);
		assertTrue(productList.get(0)!=null);
	}
	
	@Disabled
	@Test
	void testFindAllOrderByPopularity() throws Exception {
		List<Product> productList = productDao.findAllOrderByPopularity();
		System.out.println(productList);
		assertTrue(productList!=null);
		assertTrue(productList.get(0)!=null);
	}
	
	@Disabled
	@Test
	void testFindAllOrderByPriceHigh() throws Exception {
		List<Product> productList = productDao.findAllOrderByPriceHigh();
		System.out.println(productList);
		assertTrue(productList!=null);
		assertTrue(productList.get(0)!=null);
	}
	
	@Disabled
	@Test
	void testFindAllOrderByPriceLow() throws Exception {
		List<Product> productList = productDao.findAllOrderByPriceLow();
		System.out.println(productList);
		assertTrue(productList!=null);
		assertTrue(productList.get(0)!=null);
	}
	
	@Disabled
	@Test
	void testFindAllOrderByName() throws Exception {
		List<Product> productList = productDao.findAllOrderByName();
		System.out.println(productList);
		assertTrue(productList!=null);
		assertTrue(productList.get(0)!=null);
	}

	@Disabled
	@Test
	void testFindByCategory() throws Exception {
		List<Product> productList = productDao.findByCategory(1);
		System.out.println(productList);
		assertTrue(productList!=null);
		assertTrue(productList.get(0)!=null);
	}
	
	@Disabled
	@Test
	void testFindByCategoryOrderByPopularity() throws Exception {
		List<Product> productList = productDao.findByCategoryOrderByPopularity(1);
		System.out.println(productList);
		assertTrue(productList!=null);
		assertTrue(productList.get(0)!=null);
	}
	@Disabled
	@Test
	void testFindByCategoryOrderByPriceHigh() throws Exception {
		List<Product> productList = productDao.findByCategoryOrderByPriceHigh(1);
		System.out.println(productList);
		assertTrue(productList!=null);
		assertTrue(productList.get(0)!=null);
	}
	
	@Disabled
	@Test
	void testFindByCategoryOrderByPriceLow() throws Exception {
		List<Product> productList = productDao.findByCategoryOrderByPriceLow(1);
		System.out.println(productList);
		assertTrue(productList!=null);
		assertTrue(productList.get(0)!=null);
	}

	@Disabled
	@Test
	void testFindByCategoryOrderByName() throws Exception {
		List<Product> productList = productDao.findByCategoryOrderByName(1);
		System.out.println(productList);
		assertTrue(productList!=null);
		assertTrue(productList.get(0)!=null);
	}
	
	@Disabled
	@Test
	void testFindByName() throws Exception {
		List<Product> productList = productDao.findByName("뉴발란스");
		System.out.println(productList);
		assertTrue(productList!=null);
		//assertTrue(productList.get(0)!=null);
	}
	
	@Disabled
	@Test
	void testFindByPrimaryKey() throws Exception {
		Product product = productDao.findByPrimaryKey(1);
		System.out.println(product);
		assertTrue(product!=null);
	}
	
	@Test
	void testFindByNameOrderByPopuarity() throws Exception {
		List<Product> productList = productDao.findByNameOrderByPopuarity("뉴발란스");
		System.out.println(productList);
		assertTrue(productList!=null);
	}

	@Test
	void testFindByNameOrderByPriceHigh() throws Exception {
		List<Product> productList = productDao.findByNameOrderByPriceHigh("뉴발란스");
		System.out.println(productList);
		assertTrue(productList!=null);
	}

	@Test
	void testFindByNameOrderByPriceLow() throws Exception {
		List<Product> productList = productDao.findByNameOrderByPriceLow("뉴발란스");
		System.out.println(productList);
		assertTrue(productList!=null);
	}
}
