package com.itwill.shop.ship;

import java.util.List;

public interface ShipDao {
	// 배송지 1개 추가
	int insert(Ship ship) throws Exception;
	// 최초로 기본배송지 추가
	int insertByOrderAddr(int oNo) throws Exception;
	// 회원 1명의 배송지 목록
	List<Ship> findByUserId(String sUserId) throws Exception;
	// 배송지 번호로 배송지 불러오기
	Ship findShipBySNo(int sNo) throws Exception;
	// 회원 1명의 기본 배송지
	Ship findDefaultAddr(String sUserId) throws Exception;
	// 배송지 번호로 배송지 수정
	int update(Ship ship) throws Exception;
	// 회원 1명의 배송지 1개 삭제
	int deleteByShipNo(int sNo) throws Exception;
	// 회원 1명의 배송지 전체 삭제
	int deleteByUserId(String sUserID) throws Exception;
}
