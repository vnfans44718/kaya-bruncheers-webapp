package com.itwill.coffeecrew.shop.order;

import java.util.Date;
import java.util.List;
import java.util.ArrayList;

import com.itwill.coffeecrew.shop.member.Member;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Builder.Default;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Order {
	private int oNo;
	private String oName;
	private Date oDate;
	private int oTotalPrice;
	private String oRequest;
	private String oPayMtd;
	private String id;
	@Builder.Default
	private List<OrderItem> orderItemList = new ArrayList<>();
}













