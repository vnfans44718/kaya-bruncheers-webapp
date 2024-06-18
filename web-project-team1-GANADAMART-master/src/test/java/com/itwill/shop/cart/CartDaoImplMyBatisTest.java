package com.itwill.shop.cart;

import static org.junit.jupiter.api.Assertions.*;

import java.util.List;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;

import com.itwill.shop.product.ProductDao;

class CartDaoImplMyBatisTest {
	CartDao cartDao;
	
	@BeforeEach
	void setUp() throws Exception {
		cartDao = new CartDaoImplMyBatis();
	}
	
	@Disabled
	@Test
	void testCountByProductNo() throws Exception{
		int rowCount = cartDao.countByProductNo("cccc", 4);
		System.out.println(rowCount);
		assertTrue(rowCount>=0);
	}
	
	
	@Test
	void testFindByUserId() throws Exception{
		List<Cart> cartList = cartDao.findByUserId("bbbb");
		System.out.println(cartList);
	
	}
	@Disabled
	@Test
	void testFindByUserIdCartPrice() throws Exception{
		List<Cart> cartList = cartDao.findByUserIdCartPrice("cccc");
		System.out.println(cartList);
	}

	@Disabled
	@Test
	void testUpdateByProductNoDown() throws Exception{
		int rowCount = cartDao.updateByProductNoDown("cccc", 3);
		System.out.println(rowCount);
	}
	@Disabled
	@Test
	void testUpdateByCartNo() throws Exception{
		int rowCount = cartDao.updateByCartNo(8, 8);
		System.out.println(rowCount);
	}
	@Disabled
	@Test
	void testDeleteByCartNo() throws Exception{
		int deleteRowCount = cartDao.deleteByCartNo(3);
		System.out.println(deleteRowCount);
	}
	@Disabled
	@Test
	void testDeleteByCartUserId() throws Exception{
		int rowCount = cartDao.deleteByCartUserId("bbbb");
		System.out.println(rowCount);
	}

}
