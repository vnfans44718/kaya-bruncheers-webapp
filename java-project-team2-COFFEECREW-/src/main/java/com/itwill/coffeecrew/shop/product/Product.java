package com.itwill.coffeecrew.shop.product;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Product {
	private int pNo;
	private String pName;
	private int pPrice;
	private String pImage;
	private String pCategory;
}