package com.itwill.coffeecrew.shop.order;

import java.util.List;

import com.itwill.coffeecrew.shop.product.Product;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Builder

public class OrderItem {
	private int oiNo;
	private int oiQty;
	private int oNo;
	private Product product;
}
