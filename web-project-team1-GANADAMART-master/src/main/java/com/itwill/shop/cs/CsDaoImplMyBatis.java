package com.itwill.shop.cs;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.itwill.shop.mapper.CsMapper;


public class CsDaoImplMyBatis implements CsDao {
	private SqlSessionFactory sqlSessionFactory;

	public CsDaoImplMyBatis() throws Exception {
		this.sqlSessionFactory = new SqlSessionFactoryBuilder()
				.build(Resources.getResourceAsStream("mybatis-config.xml"));
	}
	
	// 1.게시물 삭제
	@Override
	public int csRemove(int csNo) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		CsMapper csMapper = sqlSession.getMapper(CsMapper.class);
		int rowCount = csMapper.csRemove(csNo);
		sqlSession.close();
		return rowCount;
	}
	
	// 2.게시물 쓰기
	@Override
	public int csCreate(Cs cs) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		CsMapper csMapper = sqlSession.getMapper(CsMapper.class);
		int rowCount = csMapper.csCreate(cs);
		sqlSession.close();
		return rowCount;
	}
	
	/*
	// 3.답글 쓰기
	@Override
	public int createReply(Cs cs) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
		Board temp = boardMapper.findBoard(board.getBNo());
		boardMapper.updateReply(temp);
		
		board.setBGroupno(temp.getBGroupno());
		board.setBStep(temp.getBStep()+1);
		board.setBDepth(temp.getBDepth()+1);
		
		boardMapper.createReply(board);
		sqlSession.commit();
		sqlSession.close();
		return 0;

	}
	*/
	
	// 4.게시물 1개 선택
	@Override
	public Cs findCs(int csNo) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		CsMapper csMapper = sqlSession.getMapper(CsMapper.class);
		Cs cs = csMapper.findCs(csNo);
		System.out.println(cs);
		sqlSession.close();
		return cs;
	}
	
	// 5.게시물 리스트보기
	@Override
	public List<Cs> findCsList(int start, int last) throws Exception {
		System.out.println("" + start + " ~ " + last);
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		CsMapper csMapper = sqlSession.getMapper(CsMapper.class);
		Map param = new HashMap();
		param.put("start", start);
		param.put("last", last);
		List<Cs> csList = csMapper.findCsList(param);
		sqlSession.close();
		return csList;
	}
	
	// 6.게시물 수정
	@Override
	public int csUpdate(Cs cs) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		CsMapper csMapper = sqlSession.getMapper(CsMapper.class);
		int rowCount = csMapper.csUpdate(cs);
		sqlSession.close();
		return rowCount;
	}
	
	// 7.게시물 조회수 1 증가
	@Override
	public void csIncreaseReadCount(int csReadcount) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		CsMapper csMapper = sqlSession.getMapper(CsMapper.class);
		csMapper.csIncreaseReadCount(csReadcount);
		sqlSession.close();
	}
	
	/*
	// 8.답글 존재여부 확인
	@Override
	public boolean countReplay(Cs cs) throws SQLException {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
		int rowCount = boardMapper.countReplay(board);
		System.out.println(rowCount);
		Boolean isExist = false;
		if (rowCount > 1) {
			isExist = true;
		}
		sqlSession.close();
		return isExist;
	}
	*/
	
	// 9.게시물 총 건수 조회, 반환
	@Override
	public int getCsCount() throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		CsMapper csMapper = sqlSession.getMapper(CsMapper.class);
		int totCount = csMapper.getCsCount();
		sqlSession.close();
		return totCount;
	}
}






