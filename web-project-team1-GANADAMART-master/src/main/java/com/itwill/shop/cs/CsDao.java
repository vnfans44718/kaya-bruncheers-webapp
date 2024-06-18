package com.itwill.shop.cs;

import java.util.List;

public interface CsDao {
	
	// 1.게시물 삭제
	int csRemove(int csNo) throws Exception;

	// 2.게시물 쓰기
	int csCreate(Cs cs) throws Exception;
	
	/*
	   3.답글 쓰기
	int csCreateReply(Cs cs) throws Exception;
	*/
	
	// 4.게시물 1개 선택
	Cs findCs(int csNo) throws Exception;
	
	// 5.게시물 리스트 반환(시작번호, 끝번호)
	List<Cs> findCsList(int start, int last) throws Exception;
	
	// 6.게시물 수정
	int csUpdate(Cs cs) throws Exception;
	
	// 7.게시물 조회수 1 증가
	void csIncreaseReadCount(int csReadcount) throws Exception;
	
	/*
	// 8.답글 존재여부 확인
	boolean countReplay(Cs cs) throws SQLException;
	*/
	
	// 9.게시물 총 건수 조회, 반환
	int getCsCount() throws Exception;
	
}




