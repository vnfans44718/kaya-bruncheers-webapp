package com.itwill.shop.product;

import com.itwill.shop.cart.Cart;

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
public class ProductOption {
	
	private int poNo;
	private int poSize;
	private Product product;
}
