package com.itwill.shop.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;

import com.itwill.shop.cart.Cart;

public interface CartMapper {

	/*
	 *  멤버한사람의 카트에 제품번호 존재여부
	 */
	@Select("select count(*) as p_count from cart c where u_id=#{sUserId} and c.po_no=#{poNo}")
	int countByProductNo(@Param("sUserId") String sUserId,@Param("poNo") int poNo) throws Exception;
	
	/*
	 *	pNo와 pSize를 이용해 poNo찾기 
	 */
	@Select("select po_no from PRODUCT_OPTION where p_no=#{pNo} and PO_SIZE=#{pSize}")
	int findPoNo(@Param("pNo") int pNo,@Param("pSize") int pSize);
	
	/*
	 *  카트 추가
	 */
	@Insert("insert into cart(c_no,c_qty,po_no,u_id) values(cart_c_no_seq.nextval,#{cQty},#{poNo},#{sUserId})")
	int insert(@Param("sUserId")String sUserId,@Param("cQty")int cQty,@Param("poNo")int poNo);
	
	/*
	 *  멤버한사람의 카트아이템 리스트
	 */
	@ResultMap("cartResultMap")
	@Select("select * from cart c join product_option po on c.po_no=po.po_no join product p on po.p_no = p.p_no where c.u_id=#{sUserId}")
	List<Cart> findByUserId(@Param("sUserId") String sUserId)throws Exception;
	
	/*
	 *  멤버의 카트 아이템 총 가격
	 */
	@Select("select c.* , po.* , p.*, c.c_qty * p.p_price as \"총 가격\" \n"
			+ "from cart c \n"
			+ "join product_option po \n"
			+ "on c.po_no = po.po_no\n"
			+ "join product p  \n"
			+ "on po.po_no = p.p_no\n"
			+ "where u_id =#{sUserId}")
	List<Cart> findByUserIdCartPrice(@Param("sUserId") String sUserId)throws Exception;
	
	/*
	 * 1. 카트 수량 변경
	 * u_id 카트에 있는 제품의 수량증가
	 */
	@Update("update cart set c_qty=#{cQty}where c_no=#{cNo}")
	int updateByProductNoUP(@Param("cNo")int cNo,@Param("cQty")int cQty)throws Exception;
	
	/*
	 * u_id 카트에 있는 제품의 수량감소
	 */
	@Update("update cart set c_qty=c_qty-1 where u_id=#{sUserId} and po_no=#{poNo}")
	int updateByProductNoDown(@Param("sUserId")String sUserId,@Param("poNo")int po_no)throws Exception;
	
	/*
	 * 카트에 있는 제품 수량 수정
	 */
	@Update("update cart set c_qty=c_qty+#{cQty} where c_no=#{cNo}")
	int updateByCartNo(@Param("cNo")int cNo,@Param("cQty")int cQty)throws Exception;
	
	@Select("select c_no from cart where po_no = #{poNo} and U_ID=#{sUserId}")
	int findCartNoByPoNo(@Param("poNo")int poNo,@Param("sUserId")String sUserId) throws Exception;
	
	/*
	 * 1. 카트아이템 n개 삭제
	 */
	@Delete("delete from cart where c_no=#{cNo}")
	int deleteByCartNo(@Param("cNo")int cNo)throws Exception;
	
	/*
	 * 2. 카트아이템 전체 삭제
	 */
	@Delete("delete from cart where u_id=#{sUserId}")
	int deleteByCartUserId(@Param("sUserId") String sUserId)throws Exception;

	
	@ResultMap("cartResultMap")
	@Select("select * from cart c join product_option po on c.po_no=po.po_no join product p on po.p_no = p.p_no where c.c_no=#{cart_no}")
	Cart findByCartNo(@Param("cart_no") int cart_no) throws Exception;

}
