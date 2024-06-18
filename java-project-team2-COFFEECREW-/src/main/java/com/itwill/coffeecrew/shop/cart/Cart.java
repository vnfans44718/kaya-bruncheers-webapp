package com.itwill.coffeecrew.shop.cart;

import com.itwill.coffeecrew.shop.member.Member;
import com.itwill.coffeecrew.shop.member.Member.MemberBuilder;
import com.itwill.coffeecrew.shop.product.Product;
import com.itwill.coffeecrew.shop.product.Product.ProductBuilder;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder

public class Cart {
	private int cNo;
	private Member member;
	private Product product;
	private int cQty;
}
