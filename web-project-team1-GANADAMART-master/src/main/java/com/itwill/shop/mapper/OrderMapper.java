package com.itwill.shop.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;

import com.itwill.shop.order.Order;
import com.itwill.shop.order.OrderItem;

public interface OrderMapper {

	/*
	 * 주문전체삭제(ON DELETE CASCADE)
	 */
	@Delete("delete from orders where u_id = #{uId}")
	int deleteByUserId(@Param("uId") String sUserId) throws Exception;

	/*
	 * 주문1건삭제(ON DELETE CASCADE)
	 */
	@Delete("delete from orders where o_no=#{oNo}")
	int deleteByOrderNo(int oNo) throws Exception;

	/*
	 * 주문생성
	 */
	@Insert("INSERT INTO orders(o_no, o_price, o_addr, o_name, o_phone, o_payment, o_img,u_id) VALUES(#{ONo},#{oPrice},#{oAddr},#{oName},#{oPhone},#{oPayment}, #{oImg},#{uId})")
	@SelectKey(before = true, keyProperty = "ONo", statement = "select orders_o_no_SEQ.nextval from dual", resultType = Integer.class)
	int insertOrder(Order order) throws Exception;

	@Insert("INSERT INTO order_item(oi_no,oi_qty,o_no,po_no) VALUES (order_item_oi_no_SEQ.nextval,#{oiQty},#{oNo},#{productOption.poNo})")
	// @SelectKey(before = true, keyProperty = "oNo", statement = "select
	// orders_o_no_SEQ.currval from dual", resultType = Integer.class)
	int insertOrderItem(OrderItem orderItem);

	/*
	 * 주문의 대표 이미지 검색
	 */

	@Select("select p_img,idx FROM (select p_img, rownum idx from(select p.p_img FROM order_item oi join product_option po ON oi.po_no = po.po_no join product p on p.p_no = po.p_no where o_no=#{oNo} order by oi.oi_no)) where idx=1")
	String findPrimaryImage(int oNo) throws Exception;

	/*
	 * 주문 이미지 업데이트
	 */
	@Update("update orders set o_img = #{oImg} where o_no=#{oNo}")
	int updateImg(@Param("oImg") String oImg, @Param("oNo")int oNo) throws Exception;

	/*
	 * 주문전체(특정사용자)
	 */
	@Select("select * from orders where u_id=#{uId}")
	List<Order> findOrderByUserId(@Param("uId") String sUserId) throws Exception;

	/*
	 * 주문 한 개의 주문리스트(주문상세정보 + 상품정보)
	 */
	@ResultMap("orderResultMap")
	@Select("select * from orders o join order_item oi on o.o_no = oi.o_no join product_option po on oi.po_no = po.po_no join product p on po.p_no = p.p_no where o.o_no=#{oNo}")
	Order findListByOrderNo(int oNo) throws Exception;

	/*
	 * 회원 한 명의 주문리스트(주문상세정보 + 상품정보)
	 */
	@ResultMap("orderResultMap")
	@Select("select * from orders o join order_item oi on o.o_no = oi.o_no join product_option po on oi.po_no = po.po_no join product p on po.p_no = p.p_no where u_id=#{uId}")
	List<Order> findListByUserId(@Param("uId") String sUserId) throws Exception;

}
