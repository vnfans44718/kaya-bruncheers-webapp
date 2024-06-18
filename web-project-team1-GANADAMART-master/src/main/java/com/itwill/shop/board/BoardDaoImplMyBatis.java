package com.itwill.shop.board;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.itwill.shop.mapper.BoardMapper;


public class BoardDaoImplMyBatis implements BoardDao {
	private SqlSessionFactory sqlSessionFactory;

	public BoardDaoImplMyBatis() throws Exception {
		this.sqlSessionFactory = new SqlSessionFactoryBuilder()
				.build(Resources.getResourceAsStream("mybatis-config.xml"));
	}
	
	// 1.게시물 삭제
	@Override
	public int remove(int bNo) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
		int rowCount = boardMapper.remove(bNo);
		sqlSession.close();
		return rowCount;
	}
	
	// 2.게시물 쓰기
	@Override
	public int create(Board board) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
		int rowCount = boardMapper.create(board);
		sqlSession.close();
		return rowCount;
	}
	
	// 3.답글 쓰기
	@Override
	public int createReply(Board board) throws Exception {
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
	
	// 4.게시물 1개 선택
	@Override
	public Board findBoard(int bNo) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
		Board board = boardMapper.findBoard(bNo);
		System.out.println(board);
		sqlSession.close();
		return board;
	}
	
	// 5.게시물 리스트보기
	@Override
	public List<Board> findBoardList(int start, int last) throws Exception {
		System.out.println("" + start + " ~ " + last);
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
		Map param = new HashMap();
		param.put("start", start);
		param.put("last", last);
		List<Board> boardList = boardMapper.findBoardList(param);
		sqlSession.close();
		return boardList;
	}
	
	// 6.게시물 수정
	@Override
	public int update(Board board) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
		int rowCount = boardMapper.update(board);
		sqlSession.close();
		return rowCount;
	}
	
	// 7.게시물 조회수 1 증가
	@Override
	public void increaseReadCount(int bReadcount) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
		boardMapper.increaseReadCount(bReadcount);
		sqlSession.close();
	}
	
	// 8.답글 존재여부 확인
	@Override
	public boolean countReplay(Board board) throws SQLException {
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
	
	// 9.게시물 총 건수 조회, 반환
	@Override
	public int getBoardCount() throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
		int totCount = boardMapper.getBoardCount();
		sqlSession.close();
		return totCount;
	}

}






