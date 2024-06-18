package com.itwill.shop.order;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.itwill.shop.product.Product;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Builder.Default;
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
public class Order {
private int oNo;
private int oPrice;
private String oAddr;
private String oName;
private String oPhone;
private String oPayment;
private String oImg;
private Date oDate;

/*************FK****************/
private String uId;
/***********List<OrderItem>****/

@Default
private List<OrderItem> orderItemList = new ArrayList<OrderItem>();



}
