package com.itwill.coffeecrew.shop.order;

import java.util.ArrayList;
import java.util.List;

import com.itwill.coffeecrew.shop.cart.Cart;
import com.itwill.coffeecrew.shop.cart.CartDao;
import com.itwill.coffeecrew.shop.member.Member;
import com.itwill.coffeecrew.shop.product.ProductDao;

public class OrderService {
	private OrderDao orderDao;
	private ProductDao productDao;
	private CartDao cartDao;

	public OrderService() throws Exception {
		orderDao = new OrderDao();
		productDao = new ProductDao();
		cartDao = new CartDao();
	}

	/*
	 * 주문1개삭제
	 */
	public int deleteByOrderNo(int oNo) throws Exception {
		return orderDao.deleteByOrderNo(oNo);
	}

	/*
	 * 주문전체삭제
	 */
	public int delete(String id) throws Exception {
		return orderDao.deleteById(id);
	}

	/*
	 * 주문목록
	 */
	public List<Order> orderList(String id) throws Exception {
		return orderDao.findOrderById(id);
	}

	/*
	 * 주문+주문아이템 목록
	 */
	public List<Order> orderWithOrderItemList(String id) throws Exception {
		return orderDao.findOrderWithOrderItemById(id);
	}

	/*
	 * 주문+주문아이템 상세보기
	 */
	public Order orderWithOrderItem(int oNo) throws Exception {
		return orderDao.findByOrderNo(oNo);
	}

	/*
	 * cart에서 주문
	 */
	
	public int create(String id, String request, String payMtd) throws Exception {
		List<Cart> cartList = cartDao.findByUserId(id);
		List<OrderItem> orderItemList = new ArrayList<OrderItem>();
		int o_tot_price = 0;
		int oi_tot_count = 0;
		for (Cart cart : cartList) {
			OrderItem orderItem = OrderItem.builder()
										   .oiQty(cart.getCQty())
										   .product(cart.getProduct())
										   .build();
			orderItemList.add(orderItem);
			o_tot_price += orderItem.getOiQty() * orderItem.getProduct().getPPrice();
			oi_tot_count += orderItem.getOiQty();
		}
		String o_name = orderItemList.get(0).getProduct().getPName() + "외 " + (oi_tot_count - 1);
		
		Order newOrder = Order.builder()
							  .oName(o_name)
							  .oTotalPrice(o_tot_price)
						  	  .oRequest(request)
							  .oPayMtd(payMtd)
							  .orderItemList(orderItemList)
							  .id(id)
							  .build();
		
		orderDao.insert(newOrder);
		cartDao.deleteByUserId(id);
		return 0;
	}
}
