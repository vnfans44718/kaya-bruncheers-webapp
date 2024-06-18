package com.itwill.shop.ship;

public class ShipSQL {
	// 배송지 1개 추가
	public final static String SHIP_INSERT = "insert into ship(s_no,s_name,s_phone,s_addr,u_id) values(ship_s_no_SEQ.nextval,?,?,?,?)";
	// 최초로 기본배송지 추가
	public final static String SHIP_INSERT_BY_ORDER_ADDR = " INSERT INTO ship(s_no, s_name, s_phone, s_addr, u_id) SELECT ship_s_no_SEQ.nextval, o.o_name AS s_name, o.o_phone AS s_phone, o.o_addr AS s_addr, u.u_id FROM userinfo u JOIN orders o ON u.u_id = o.u_id WHERE o.o_no = ?";
	// 회원 1명의 배송지 목록
	public final static String SHIP_FIND_BY_U_ID = "select * from ship where u_id = ?";
	// 배송지 번호로 배송지 불러오기
	public final static String SHIP_FIND_BY_SNO = "select * from ship where s_no = ?";
	// 회원 1명의 기본 배송지
	public final static String SHIP_FIND_DEFAULT_ADDR = "SELECT * FROM (SELECT rownum as idx, s.* FROM ( SELECT * FROM ship WHERE u_id = ? ORDER BY s_no ASC) s ) WHERE idx = 1";
	// 배송지 번호로 배송지 수정
	public final static String SHIP_UPDATE= "update ship set s_no = ? ,s_name = ?, s_phone= ?, s_addr=? where s_no=?";
	// 회원 1명의 배송지 1개 삭제
	public final static String SHIP_DELETE_BY_S_NO = "delete from ship where s_no=?";
	// 회원 1명의 배송지 전체 삭제
	public final static String SHIP_DELETE_BY_U_ID = "delete from ship where u_id=?";
}
