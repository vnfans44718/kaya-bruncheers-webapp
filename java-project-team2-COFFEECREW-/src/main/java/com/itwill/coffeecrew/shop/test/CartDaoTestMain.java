package com.itwill.coffeecrew.shop.test;



import java.util.List;

import com.itwill.coffeecrew.shop.cart.Cart;
import com.itwill.coffeecrew.shop.cart.CartDao;
import com.itwill.coffeecrew.shop.member.Member;
import com.itwill.coffeecrew.shop.product.Product;


public class CartDaoTestMain {

	public static void main(String[] args) throws Exception {


		CartDao cartDao= new CartDao();
		System.out.println("1.add(insert)");
		
		
		Cart mCart = new Cart(0, new Member("coffee2", "5555", "유효성검사", "666666", 
				"998912", "나야나", "여기어디야"), Product.builder().pNo(3).build(), 2)
				;
		
		System.out.println("2.updateByCartNo");
		
		System.out.println(">>> cart insert");
		cartDao.insert(mCart);
		
		System.out.println("2.updateByCartNo");
		System.out.println(cartDao.updateByCartNo(3,4));
		System.out.println("2.updateByProductNo");
		System.out.println(cartDao.updateByProductNo(mCart.getMember().getId(), 5,6));
		System.out.println("3.delete");
		System.out.println(cartDao.deleteByUserId("coffee2"));
		System.out.println(cartDao.deleteByCartNo(3));
		System.out.println("4.cartList[select]");
		List<Cart> cartList1=cartDao.findByUserId("coffee1");
		System.out.println(cartList1);
		System.out.println("5.countByProductNo");
		System.out.println(cartDao.countByProductNo("coffee1", 5));
		
		
		

	}

}
