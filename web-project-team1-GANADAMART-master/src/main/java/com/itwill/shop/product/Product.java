package com.itwill.shop.product;

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

public class Product {
	
	private int pNo;
	private String pName;
	private int pCount;
	private int pPrice;
	private String pImg;
	private int pCategory;
	@Override
	public String toString() {
		return "Product [pNo=" + pNo + ", pName=" + pName + ", pCount=" + pCount + ", pPrice=" + pPrice + ", pImg="
				+ pImg + ", pCategory=" + pCategory + "\n]";
	}
	
	
}
