package com.itwill.shop.cart;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

public interface CartDao {
	
	/*
	 *  멤버한사람의 카트에 제품번호 존재여부
	 */
	int countByProductNo(String sUserId,int poNo)throws Exception;
	
	/*
	 *	pNo와 pSize를 이용해 poNo찾기 
	 */
	int findPoNo(int pNo,int pSize) throws Exception;
	
	int findCartNoByPoNo(int poNo,String sUserId) throws Exception;
	/*
	 *  카트추가
	 */
	int insert(String sUserId,int cQty,int poNo)throws Exception;
	
	/*
	 *  멤버한사람의 카트아이템 리스트
	 */
	List<Cart> findByUserId(String sUserId)throws Exception;
	
	/*
	 *  멤버의 카트 아이템 총 가격
	 */
	List<Cart> findByUserIdCartPrice(String sUserId)throws Exception;
	
	/*
	 * 1. 카트 수량 변경
	 * u_id 카트에 있는 제품의 수량증가
	 */
	int updateByProductNoUP(int cNo,int cQty)throws Exception;
	
	/*
	 * u_id 카트에 있는 제품의 수량감소
	 */
	int updateByProductNoDown(String sUserId,int poNo)throws Exception;
	
	/*
	 * 카트에 있는 제품 수량 수정
	 */
	int updateByCartNo(int cQty,int cNo)throws Exception;
	
	/*
	 * 1. 카트아이템 n개 삭제
	 */
	int deleteByCartNo(int cNo)throws Exception;
	
	/*
	 * 2. 카트아이템 전체 삭제
	 */
	int deleteByCartUserId(String sUserId)throws Exception;
	
	
	Cart findByCartNo(int cart_no) throws Exception;
}
