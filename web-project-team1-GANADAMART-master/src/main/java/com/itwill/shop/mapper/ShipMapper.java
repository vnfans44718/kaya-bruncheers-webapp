package com.itwill.shop.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.itwill.shop.ship.Ship;

public interface ShipMapper {
	// 배송지 1개 추가
	@Insert("insert into ship(s_no,s_name,s_phone,s_addr,u_id) values(ship_s_no_SEQ.nextval,#{sName},#{sPhone},#{sAddr},#{uId})")
	int insert(Ship ship) throws Exception;
	// 최초로 기본배송지 추가
	@Insert("INSERT INTO ship(s_no, s_name, s_phone, s_addr, u_id) SELECT ship_s_no_SEQ.nextval, o.o_name AS s_name, o.o_phone AS s_phone, o.o_addr AS s_addr, u.u_id FROM userinfo u JOIN orders o ON u.u_id = o.u_id WHERE o.o_no = #{oNo}")
	int insertByOrderAddr(int oNo) throws Exception;

	// 회원 1명의 배송지 목록
	@Select("select * from ship where u_id = #{uId}")
	List<Ship> findByUserId(@Param("uId") String sUserId) throws Exception;
	
	// 배송지 번호로 배송지 불러오기
	@Select("select * from ship where s_no = #{sNo}")
	Ship findShipBySNo(int sNo) throws Exception;

	// 회원 1명의 기본 배송지
	@Select("SELECT * FROM (SELECT rownum as idx, s.* FROM ( SELECT * FROM ship WHERE u_id = #{uId} ORDER BY s_no ASC) s ) WHERE idx = 1")
	Ship findDefaultAddr(@Param("uId") String sUserId) throws Exception;

	// 배송지 번호로 배송지 수정
	@Update("update ship set s_no = #{sNo} ,s_name = #{sName}, s_phone= #{sPhone}, s_addr=#{sAddr} where s_no=#{sNo}")
	int update(Ship ship) throws Exception;

	// 회원 1명의 배송지 1개 삭제
	@Delete("delete from ship where s_no=#{sNo}")
	int deleteByShipNo(int sNo) throws Exception;

	// 회원 1명의 배송지 전체 삭제
	@Delete("delete from ship where u_id=#{uId}")
	int deleteByUserId(String sUserID) throws Exception;

}
