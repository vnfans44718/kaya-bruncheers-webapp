package com.itwill.shop.board;

import java.util.List;

import com.itwill.shop.board.util.PageMaker;

public class BoardService {

	private BoardDao boardDao;
	public BoardService() throws Exception {
		boardDao = new BoardDaoImplMyBatis();
	}
	
	// 1.게시물 삭제
	public int remove(int bNo) throws Exception {
		return boardDao.remove(bNo);
		/*
		 // 답글이 달린 게시물은 삭제 불가
		Board tempBoard = boardDao.findBoard(bNo);
		boolean rExist = boardDao.countReplay(tempBoard);
		System.out.println("답글존재여부:" + rExist);
		if (boardDao.countReplay(tempBoard)) {
			//답글존재
			throw new BoardException("답글이 있는 게시물은 삭제 불가합니다.");
		} else {
			//답글없음
			return boardDao.remove(tempBoard.getBNo());
		}
		*/
	}
	
	// 2.게시물 쓰기
	public int create(Board board) throws Exception {
		return boardDao.create(board);
	}
	
	// 3.답글 쓰기
	public int createReply(Board board) throws Exception {
		return boardDao.createReply(board);
	}
	
	// 4.게시물 1개 선택
	public Board findBoard(int bNo) throws Exception {
		Board board = boardDao.findBoard(bNo);
		return board;
	}
	public void updateHitCount(int bNo) throws Exception{
		boardDao.increaseReadCount(bNo);
	}
	
	// 5.게시물 리스트보기
	public BoardListPageMakerDto findBoardList(int currentPage) throws Exception {
		// 1)전체글의 갯수
		int totalRecordCount = boardDao.getBoardCount();
		// 2)paging계산(PageMaker 유틸클래스)
		PageMaker pageMaker = new PageMaker(totalRecordCount, currentPage);
		// 3)게시물데이타 얻기
		List<Board> boardList = boardDao.findBoardList(pageMaker.getPageBegin(), pageMaker.getPageEnd());
		BoardListPageMakerDto pageMakerBoardList = new BoardListPageMakerDto();
		pageMakerBoardList.itemList = boardList;
		pageMakerBoardList.pageMaker = pageMaker;
		return pageMakerBoardList;
	}
	
	// 6.게시물 수정
	public int update(Board board) throws Exception {
		return boardDao.update(board);
	}
	
}






