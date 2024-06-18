package com.itwill.shop.order;

import java.util.List;

import com.itwill.shop.cart.CartDao;
import com.itwill.shop.cart.CartDaoImplMyBatis;
import com.itwill.shop.product.ProductDao;
import com.itwill.shop.product.ProductDaoImplMyBatis;

public class OrderService {

	private OrderDao orderDao;
	private ProductDao productDao;
	private CartDao cartDao;
	
	public OrderService() throws Exception{
		orderDao = new OrderDaoImplMyBatis();
		productDao = new ProductDaoImplMyBatis();
		cartDao = new CartDaoImplMyBatis();
	}
	
	/*
	 * 주문1건삭제
	 */
	public int deleteByOrderNo(int oNo) throws Exception {
		return orderDao.deleteByOrderNo(oNo);
	}

	/*
	 * 주문전체삭제(ON DELETE CASCADE)
	 */
	public int deleteByUserId(String sUserId) throws Exception{
		return orderDao.deleteByUserId(sUserId);
	}
	
	/*
	 * 주문전체(특정사용자)
	 */

	public List<Order> orderList(String sUserId) throws Exception{
		return orderDao.findOrderByUserId(sUserId);
	}
	
	/*
	 * 주문 이미지 업데이트
	 */
	public int updateImg(String oImg, int oNo) throws Exception{
		return orderDao.updateImg(oImg, oNo);
	}
	

	/*
	 * 회원 한 명의 주문리스트(주문상세정보 + 상품정보)
	 */
	public List<Order>  orderWithOrderItemList(String sUserId) throws Exception{
		return orderDao.findListByUserId(sUserId);
	}
	
	/*
	 * 주문 한 개의 주문리스트(주문상세정보 + 상품정보)
	 */
	public Order orderWithOrderItem(int oNo) throws Exception{
		return orderDao.findListByOrderNo(oNo);
	}

	/*
	 * 주문의 대표 이미지 검색
	 */

	public String findPrimaryImage(int oNo) throws Exception{
		return orderDao.findPrimaryImage(oNo);
	}
	
	
	
	/****************** 세션객체를 사용해서 주문하기  ******************/
	
	
	/*
	 * 상품에서 직접주문, 카트에서 선택주문
	 */
	public int create(Order order, String[] cart_item_noStr_array) throws Exception {
		int selectPk = orderDao.insertOrder(order);
		if(cart_item_noStr_array !=null) {
			for (int i = 0; i < cart_item_noStr_array.length; i++) {
				cartDao.deleteByCartNo(Integer.parseInt(cart_item_noStr_array[i]));
			}
		}
		return selectPk;
	}
	
	// 상품에서 직접주문 
	public int createAtProduct(Order order) throws Exception{
		OrderItem orderItem = order.getOrderItemList().get(0);
		int pNo = orderItem.getProductOption().getProduct().getPNo();
		int pSize = orderItem.getProductOption().getPoSize();
		int poNo =  cartDao.findPoNo(pNo, pSize);
		orderItem.getProductOption().setPoNo(poNo);
		int selectPk = orderDao.insertOrder(order);
		
		return selectPk;
	}

	
	/*
	 * 장바구니 전체주문 
	 */
	public int create(Order order) throws Exception{
		int rowCount = orderDao.insertOrder(order);
		cartDao.deleteByCartUserId(order.getUId());
		return rowCount;
	}


	
	
	
}
