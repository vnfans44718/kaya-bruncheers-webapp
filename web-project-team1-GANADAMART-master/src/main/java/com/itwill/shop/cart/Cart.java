package com.itwill.shop.cart;

import com.itwill.shop.product.Product;
import com.itwill.shop.product.ProductOption;
import com.itwill.shop.user.User;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@Builder
@NoArgsConstructor
@ToString
public class Cart {
	
	private int cNo;
	private int cQty;
	private User user;
	private ProductOption productOption;
}
