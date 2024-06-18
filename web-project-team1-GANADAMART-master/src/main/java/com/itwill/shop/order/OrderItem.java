package com.itwill.shop.order;

import com.itwill.shop.product.ProductOption;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


@AllArgsConstructor
@Builder
@NoArgsConstructor
@ToString
@Getter
@Setter
public class OrderItem {
	private int oiNo;
	private int oiQty;

	/*************fK****************/
	private int oNo;
	private ProductOption productOption;
	
	
}
