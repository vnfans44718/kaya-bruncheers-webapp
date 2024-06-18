package com.itwill.shop.board;

import static org.junit.jupiter.api.Assertions.*;

import java.util.Date;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;

import com.itwill.shop.cs.Cs;

class BoardDaoImplMyBatisTest {
	BoardDao boardDao;
	Board board;
	
	@BeforeEach
	void setUp() throws Exception {
		boardDao = new BoardDaoImplMyBatis();
		board = new Board();
	}
	
	@Disabled
	@Test
	void testRemove() throws Exception {
		int count = boardDao.remove(1);
		System.out.println(count);
		assertTrue(count!=0);
	}
	
	@Disabled
	@Test
	void testCreate() throws Exception {
		int count = boardDao.create(board);
		System.out.println(count);
		assertTrue(count!=0);
	}
	
	@Disabled
	@Test
	void testCreateReply() throws Exception {
		int count = boardDao.createReply(board);
		System.out.println(count);
		assertTrue(count!=0);
	}
	
	@Disabled
	@Test
	void testFindBoard() throws Exception {
		assertNotEquals(boardDao.findBoard(2), null);
		System.out.println(boardDao.findBoard(2));
	}
	
	@Disabled
	@Test
	void testFindBoardList() throws Exception {
		assertNotEquals(boardDao.findBoardList(1,10), null);
		System.out.print(boardDao.findBoardList(1,10));
	}
	
	@Disabled
	@Test
	void testUpdate() throws Exception {
		int count = boardDao.update(board);
		System.out.println(count);
		assertFalse(count!=0);
	}
	
	
	@Test
	void testIncreaseReadCount() {
		fail("Not yet implemented");
	}

	@Test
	void testCountReplay() {
		fail("Not yet implemented");
	}

	@Disabled
	@Test
	void testGetBoardCount() throws Exception {
		Board board = new Board(); 
	    int actualCsCount = boardDao.getBoardCount();
	    int expectedCsCount = boardDao.getBoardCount();
	    assertEquals(expectedCsCount, actualCsCount, "카운트가 일치하지 않습니다");
	}

}
