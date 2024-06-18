package com.itwill.shop.cs;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;

class CsDaoImplMyBatisTest {
	CsDao csDao;
	Cs cs;
	private Integer getCsCount;
	
	
	@BeforeEach
	void setUp() throws Exception {
		csDao=new CsDaoImplMyBatis();
		cs = new Cs();
	}

	@Disabled
	@Test
	void testcsCreate() throws Exception {
		int count = csDao.csCreate(cs);
		System.out.println(count);
		assertTrue(count!=0);
	}

	@Disabled
	@Test
	void testFindCsList() throws Exception {	
		assertNotEquals(csDao.findCsList(1,10), null);
		System.out.print(csDao.findCsList(1,10));
	}

	@Disabled
	@Test
	void testCsRemove() throws Exception {
		int count = csDao.csRemove(0);
		System.out.println(count);
		assertTrue(count!=1);
	}

	@Disabled
	@Test
	void testCsUpdate() throws Exception {
		int count = csDao.csUpdate(cs);
		System.out.println(count);
		assertFalse(count!=0);
	}

	@Disabled
	@Test
	void testFindCs()throws Exception {
		assertNotEquals(csDao.findCs(2), null);
		System.out.println(csDao.findCs(2));
	}

	@Disabled
	@Test
	void testGetCsCount()throws Exception {
	    Cs cs = new Cs(); 
	    int actualCsCount = csDao.getCsCount();
	    int expectedCsCount = csDao.getCsCount();
	    assertEquals(expectedCsCount, actualCsCount, "카운트가 일치하지 않습니다");
	}

}
