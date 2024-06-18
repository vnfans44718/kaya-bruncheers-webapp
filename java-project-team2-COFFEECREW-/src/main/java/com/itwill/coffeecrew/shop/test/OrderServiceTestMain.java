package com.itwill.coffeecrew.shop.test;

import com.itwill.coffeecrew.shop.order.OrderService;

public class OrderServiceTestMain {

	public static void main(String[] args) throws Exception {
		OrderService orderService = new OrderService();
		
		System.out.println(orderService.deleteByOrderNo(40));
		
		System.out.println(orderService.delete("coffee4"));
		
		System.out.println(orderService.orderList("coffee1"));
		
		System.out.println(orderService.orderWithOrderItemList("coffee1"));
		
		System.out.println(orderService.orderWithOrderItem(44));
		
		System.out.println(orderService.create("coffee4", "연하게", "기프티콘"));
	}

}
