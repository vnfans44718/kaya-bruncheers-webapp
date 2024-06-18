package com.itwill.coffeecrew.shop.test;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import com.itwill.coffeecrew.shop.order.Order;
import com.itwill.coffeecrew.shop.order.OrderDao;
import com.itwill.coffeecrew.shop.order.OrderItem;
import com.itwill.coffeecrew.shop.product.Product;
import com.itwill.coffeecrew.shop.product.ProductDao;

public class OrderDaoTestMain {

	public static void main(String[] args) throws Exception {
		OrderDao orderDao = new OrderDao();
		
		System.out.println(orderDao.deleteByOrderNo(22));
		
		System.out.println(orderDao.findOrderById("coffee1"));
		
		System.out.println(orderDao.deleteById("coffee2"));
		
		
		List<OrderItem> orderItemList = new ArrayList<>();
		
		Order newOrder = new Order();
		newOrder = Order.builder()
						.id("coffee1")
						.oName("아메리카노 외 1")
						.oTotalPrice(90000)
						.oRequest("얼음많이")
						.oPayMtd("신용카드")
						.orderItemList(orderItemList)
						.build();
		
		OrderItem orderItem1 = OrderItem.builder()
										.oiQty(1)
										.product(new Product(1, "아메", 1500, "image", "category"))
										.build();
		
		OrderItem orderItem2 = OrderItem.builder()
										.oiQty(1)
										.product(new Product(2, "라떼", 3000, "image", "category"))
										.build();
		
		orderItemList.add(orderItem1);
		orderItemList.add(orderItem2);
		
		newOrder.setOrderItemList(orderItemList);
		
		System.out.println(orderDao.insert(newOrder));
		
		
		
		System.out.println(orderDao.findByOrderNo(36));
		
		System.out.println(orderDao.findOrderWithOrderItemById("coffee1"));
		
	}

}
