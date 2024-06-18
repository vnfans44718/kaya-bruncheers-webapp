package com.itwill.coffeecrew.shop.cart;

import java.util.List;



public class CartService {
	private CartDao cartDao;

	public CartService() throws Exception {
		cartDao = new CartDao();
	}

	/*
	 * 상품리스트에서 카트 추가 or 수량 증감
	 */

	public int addCart(String id, int pNo, int cQty) throws Exception {
		if (cartDao.countByProductNo(id, pNo) > 0) {
			// 수정
			cartDao.updateByProductNo(id, pNo, cQty);
		} else {
			// 추가
			cartDao.insert(id, pNo, cQty);

		}

		return 0;

	}
	
	
	public int addCart(Cart cart)throws Exception {
		if(cartDao.countByProductNo(cart.getMember().getId(), cart.getProduct().getPNo()) > 0) {
			//수정
			cartDao.updateByProductNo(cart);
		}else {
			//추가
			cartDao.insert(cart);
		}
		return 0;
	}
	
	/*
	 * 카트에서 카트수량만 변경
	 */
	public int updateCart(int cNo,int cQty)throws Exception {
		return cartDao.updateByCartNo(cNo, cQty);
	}
	public int updateCart(Cart cart)throws Exception {
		return cartDao.updateByCartNo(cart);
	}	
	
	/*
	 * 한 멤버 아이디의 카트 보기
	 */
	public List<Cart> getCartItemByUserId(String id) throws Exception{
		return cartDao.findByUserId(id);
	}
	/*
	 * 카트아이템1개보기
	 */
	public Cart getCartItemByCartNo(int cNo) throws Exception{
		return cartDao.findByCartNo(cNo);
	}
	
	/*
	 * 카트아이템1개삭제
	 */
	public int deleteCartItemByCartNo(int cNo) throws Exception{
		return cartDao.deleteByCartNo(cNo);
	}
	/*
	 * 카트삭제(멤버 아이디로 전체삭제)
	 */
	public int deleteCartItemByUserId(String id)throws Exception {
		return cartDao.deleteByUserId(id);
	}
	
	
	public int countTOtUserId(String id)throws Exception {
		return cartDao.countByTotMid(id);
	}
	

}// 끝
