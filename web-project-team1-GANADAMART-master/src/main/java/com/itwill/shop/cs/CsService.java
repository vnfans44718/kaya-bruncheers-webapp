package com.itwill.shop.cs;

import java.util.List;

import com.itwill.shop.cs.util.PageMaker;

public class CsService {
	
	private CsDao csDao;
	public CsService() throws Exception{
		csDao=new CsDaoImplMyBatis();
	}
	
	// 1.게시물 삭제
		public int csRemove(int csNo) throws Exception {
			return csDao.csRemove(csNo);
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
		public int csCreate(Cs cs) throws Exception {
			return csDao.csCreate(cs);
		}
		
		/*
		// 3.답글 쓰기
		public int createReply(Board board) throws Exception {
			return boardDao.createReply(board);
		}
		*/
		
		// 4.게시물 1개 선택
		public Cs findCs(int csNo) throws Exception {
			Cs cs = csDao.findCs(csNo);
			return cs;
		}
		
		public void updateHitCount(int csNo) throws Exception{
			csDao.csIncreaseReadCount(csNo);
		}
		
		// 5.게시물 리스트보기
		public CsListPageMakerDto findCsList(int currentPage) throws Exception {
			// 1)전체글의 갯수
			int totalRecordCount = csDao.getCsCount();
			// 2)paging계산(PageMaker 유틸클래스)
			PageMaker pageMaker = new PageMaker(totalRecordCount, currentPage);
			// 3)게시물데이타 얻기
			List<Cs> csList = csDao.findCsList(pageMaker.getPageBegin(), pageMaker.getPageEnd());
			CsListPageMakerDto pageMakerCsList = new CsListPageMakerDto();
			pageMakerCsList.itemList = csList;
			pageMakerCsList.pageMaker = pageMaker;
			return pageMakerCsList;
		}
		
		// 6.게시물 수정
		public int csUpdate(Cs cs) throws Exception {
			return csDao.csUpdate(cs);
		}

}
