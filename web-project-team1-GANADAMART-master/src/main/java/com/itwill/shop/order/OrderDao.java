package com.itwill.shop.order;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;

public interface OrderDao {

	
	/*
	 * 주문전체삭제(ON DELETE CASCADE)
	 */
	int deleteByUserId(String sUserId) throws Exception;

	/*
	 * 주문1건삭제(ON DELETE CASCADE)
	 */
	int deleteByOrderNo(int oNo) throws Exception;

	/*
	 * 주문생성
	 */
	int insertOrder(Order order) throws Exception;

	/*
	 * 주문의 대표 이미지 검색
	 */

	String findPrimaryImage(int oNo) throws Exception;
	
	/*
	 * 주문 이미지 업데이트
	 */
	int updateImg(String oImg, int oNo) throws Exception;

	/*
	 * 주문전체(특정사용자)
	 */

	List<Order> findOrderByUserId(String sUserId) throws Exception;

	/*
	 * 주문 한 개의 주문리스트(주문상세정보 + 상품정보)
	 */
	Order  findListByOrderNo(int oNo) throws Exception;

	/*
	 * 회원 한 명의 주문리스트(주문상세정보 + 상품정보)
	 */
	List<Order>  findListByUserId(String sUserId) throws Exception;

}
