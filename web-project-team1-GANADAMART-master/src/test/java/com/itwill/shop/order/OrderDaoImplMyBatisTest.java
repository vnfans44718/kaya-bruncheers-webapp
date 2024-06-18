package com.itwill.shop.order;

import static org.junit.jupiter.api.Assertions.*;

import java.util.ArrayList;
import java.util.List;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;
import org.springframework.test.annotation.Rollback;

import com.itwill.shop.product.Product;
import com.itwill.shop.product.ProductDao;
import com.itwill.shop.product.ProductDaoImplMyBatis;
import com.itwill.shop.product.ProductOption;

class OrderDaoImplMyBatisTest {
	OrderDao orderDao;
Order order;
	@BeforeEach
	void setUp() throws Exception {
		orderDao = new OrderDaoImplMyBatis();
		ProductDao productDao = new ProductDaoImplMyBatis();
		
		Product product = productDao.findByPrimaryKey(3);
		ProductOption productOption = ProductOption.builder().poNo(2).poSize(3).product(product).build();
		List<OrderItem> orderItemList = new ArrayList<OrderItem>();
		OrderItem orderItem = OrderItem.builder().oiQty(2).productOption(productOption).build();
		orderItemList.add(orderItem);
		order = Order.builder().oPrice(30000).oAddr("서울시").oName("김새봄").oPhone("010-1111-1111").oPayment("카드").oImg("shoe.jpg").uId("user1").orderItemList(orderItemList).build();
	
		//order.getOrderItemList().add(orderItem);
		//orderItemList.add(OrderItem.builder().oiQty(2).oNo(order.getONo()).productOption(productOption).build());
	}
	
	@Test
	void testOrderDaoImplMyBatis() {
		
	}

	@Disabled
	@Test
	void testDeleteByUserId() throws Exception {
	int Count = orderDao.deleteByUserId("user3");
	System.out.println(Count);
	assertTrue(Count!=0);
	
	}

	@Disabled
	@Test
	void testDeleteByOrderNo() throws Exception {
		int Count = orderDao.deleteByOrderNo(2);
		System.out.println(Count);
		assertTrue(Count!=0);
	}


	@Test
	@Rollback(value = false)
	void testInsertOrder() throws Exception {
		
		int Count = orderDao.insertOrder(order);
		System.out.println(Count);
		assertTrue(Count>0);
	}
	

	@Disabled
	@Test
	void testFindPrimaryImage() throws Exception {
		assertNotEquals(orderDao.findPrimaryImage(2), null);
		System.out.println(orderDao.findPrimaryImage(2));
		
	}
	//@Disabled
	@Test
	void updateImg() throws Exception {
		int Count = orderDao.updateImg("이미지야 보고싶어", 1);
		assertTrue(Count>0);
		System.out.println(Count);
		
	}
	
	@Disabled
	@Test
	void testFindOrderByUserId() throws Exception {
		assertNotEquals(orderDao.findOrderByUserId("user3"), null);
		System.out.println(orderDao.findOrderByUserId("user3"));
	}
	
	@Disabled
	@Test
	void testFindListByOrderNo() throws Exception {
		assertNotEquals(orderDao.findListByOrderNo(2), null);
		System.out.println(orderDao.findListByOrderNo(2));
	}

	@Disabled
	@Test
	void testFindListByUserId() throws Exception {
		assertNotEquals(orderDao.findListByUserId("user3"), null);
		System.out.println(orderDao.findListByUserId("user3"));
	}

}
