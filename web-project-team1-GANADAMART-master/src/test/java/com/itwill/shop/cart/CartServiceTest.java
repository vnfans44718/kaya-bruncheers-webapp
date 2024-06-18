package com.itwill.shop.cart;

import static org.junit.jupiter.api.Assertions.*;

import java.util.List;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;

class CartServiceTest {
	CartService cartService;
	
	@BeforeEach
	void setUp() throws Exception {
		cartService = new CartService();
		
	}
	
	//멤버 카트에 제품번호 존재여부확인 후 추가
	
	
	
	//카트추가
	@Test
	void testAddCart() throws Exception{
		fail("Not yet implemented");
	}
	
	
	//카드 리스트 보기
	@Disabled
	@Test
	void testGetCartItemByUserId() throws Exception{
		List<Cart> cartList = cartService.getCartItemByUserId("cccc");
		System.out.println(cartList);
	}
	
	//멤버 카트 아이템 총 가격 
	
	//카트에 있는 제품 수량증가
	@Test
	void testProductUpdateUp() throws Exception{
		int rowCount = cartService.ProductUpdateUp(7, "cccc", 3);
		System.out.println(rowCount);
	}
	
	@Test
	void testProductUpdateDown() throws Exception{
		int rowCount = cartService.ProductUpdateDown(7, "cccc", 3);
		System.out.println(rowCount);
	}
	
	// 카트 수량변경 
	@Test
	void testUpdateCart() throws Exception{
		int rowCount = cartService.CartUpdate(7, 7);
		System.out.println(rowCount);
	}
	
	// 카트아이템 하나 삭제 
	@Disabled
	@Test
	void testDeleteCartItemByCartNo() throws Exception{
		int rowCount = cartService.CartItemDeleteNo(3);
		System.out.println(rowCount);
	}

	// 카트아이템 전체 삭제
	@Disabled
	@Test
	void testDeleteCartItemByUserId() throws Exception{
		int rowCount = cartService.CartItemDelete("bbbb");
		System.out.println(rowCount);
	}
	

}
