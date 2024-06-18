package com.itwill.shop.ship;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;

class ShipDaoImplMyBatisTest {
	ShipDaoImplMyBatis shipDao;

	@BeforeEach
	void setUp() throws Exception {
	shipDao = new ShipDaoImplMyBatis();
	}

	@Disabled
	@Test
	void testInsert() throws Exception {
		Ship ship = Ship.builder().sName("이바다").sAddr("서울시 강남구").sPhone("010-1431-4653").uId("user1").build();
		int rowCount = shipDao.insert(ship);
		assertTrue(rowCount>0);
		System.out.println(rowCount);
	} 
	@Disabled
	@Test
	void testInsertByOrderAddr() throws Exception {
		int oNo = 2;
		int rowCount = shipDao.insertByOrderAddr(oNo);
		assertTrue(rowCount>0);
		System.out.println(rowCount);
	}

	@Disabled
	@Test
	void testFindByUserId() throws Exception {
		assertNotEquals(shipDao.findByUserId("aaaa"), null);
		System.out.println(shipDao.findByUserId("aaaa"));
	}
	//@Disabled
	@Test
	void testFindShipBySNo() throws Exception {
		assertNotEquals(shipDao.findShipBySNo(3), null);
		System.out.println(shipDao.findShipBySNo(3));
	}

	@Disabled
	@Test
	void testFindDefaultAddr() throws Exception {
		assertNotEquals(shipDao.findDefaultAddr("aaaa"),null);
		System.out.println(shipDao.findDefaultAddr("aaaa"));
	}

	@Disabled
	@Test
	void testUpdateByShipNo() throws Exception {
		int sNo = 3;
		Ship ship = Ship.builder().sNo(sNo).sName("이바다").sAddr("서울시 강남구").sPhone("010-1431-4653").uId("user1").build();
		int rowCount = shipDao.update(ship);
		assertTrue(rowCount>0);
		System.out.println(rowCount);
	}

	@Disabled
	@Test
	void testDeleteByShipNo() throws Exception {
		int sNo= 3;
		int rowCount = shipDao.deleteByShipNo(sNo);
		assertTrue(rowCount>0);
		System.out.println(rowCount);
	}

	@Disabled
	@Test
	void testDeleteByUserId() throws Exception {
		int rowCount = shipDao.deleteByUserId("aaaa");
		assertTrue(rowCount>0);
		System.out.println(rowCount);
	}

}