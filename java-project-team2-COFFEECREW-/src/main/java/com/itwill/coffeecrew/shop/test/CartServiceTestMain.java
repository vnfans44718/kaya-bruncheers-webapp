package com.itwill.coffeecrew.shop.test;

import java.util.List;

import com.itwill.coffeecrew.shop.cart.Cart;
import com.itwill.coffeecrew.shop.cart.CartService;



public class CartServiceTestMain {

	public static void main(String[] args) throws Exception {
	CartService cartService=new CartService();
		
		System.out.println("1.add");
		int rowCount=cartService.addCart("coffee4",4,3);
		
		System.out.println(">>"+rowCount);
		
		System.out.println("2.update");
		rowCount=cartService.updateCart(2,3);
		System.out.println(">>"+rowCount);
		System.out.println("3.deleteCartByCartNo");
		rowCount = cartService.deleteCartItemByCartNo(1);
		System.out.println(">>"+rowCount);
		System.out.println("4.cartList");
		List<Cart> cartList1=cartService.getCartItemByUserId("coffee1");
		System.out.println("coffee1-->"+cartList1);
		

	}

}
