package com.itwill.shop.cart;

import java.util.List;

import com.itwill.shop.user.User;

public class CartService {
	private CartDao cartDao;
	public CartService() throws Exception{
		cartDao = new CartDaoImplMyBatis();
	}
	
	public int ProductCountByAdd(String sUserId,int pNo,int cQty,int pSize)throws Exception{
		int poNo = cartDao.findPoNo(pNo, pSize);
		if(cartDao.countByProductNo(sUserId, poNo) > 0) {
			int cartNo = cartDao.findCartNoByPoNo(poNo, sUserId);
			return cartDao.updateByCartNo(cartNo, cQty);
		}else {
			return cartDao.insert(sUserId, cQty, poNo);
		}
	}
	
	// 카트추가
	public int addCart(User sUserId,int poNo,int cQty) throws Exception{
		return cartDao.insert(sUserId.getUId(), cQty, poNo);
	}
	
	//카드 리스트 보기
	public List<Cart> getCartItemByUserId(String sUserId)throws Exception{
		return cartDao.findByUserId(sUserId);
	}
	
	//카트 아이템 1개 보기
	public Cart getCartItemByCartNo(int cart_no) throws Exception{
		return cartDao.findByCartNo(cart_no);
	}
	
	
	public int ProductUpdateUp (int cQty, String sUserId,int poNo)throws Exception{
		return cartDao.updateByProductNoUP(poNo, cQty);
	}
	
	// 카트에 있는 제품 수량감소
	public int ProductUpdateDown (int cQty, String sUserId,int poNo)throws Exception{
		return cartDao.updateByProductNoDown(sUserId, poNo);
	}
	
	// 카트 수량변경 
	public int CartUpdate(int cNo,int cQty)throws Exception {
		return cartDao.updateByProductNoUP(cNo,cQty);
	}
	
	// 카트아이템 하나 삭제 
	public int CartItemDeleteNo(int cNo)throws Exception {
		return cartDao.deleteByCartNo(cNo);
	}
	
	// 카트아이템 전체 삭제
	public int CartItemDelete(String sUserId)throws Exception{
		return cartDao.deleteByCartUserId(sUserId);
	}
}

