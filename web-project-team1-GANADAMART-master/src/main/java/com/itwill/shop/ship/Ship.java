package com.itwill.shop.ship;


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
public class Ship {
	private int sNo;
	private String sName;
	private String sPhone;
	private String sAddr;
	/*************FK****************/
	private String uId;
}
