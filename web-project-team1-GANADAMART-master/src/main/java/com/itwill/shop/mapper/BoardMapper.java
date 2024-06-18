package com.itwill.shop.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;

import com.itwill.shop.board.Board;

public interface BoardMapper {
	
	// 1.게시물 삭제
	@Delete("delete board where b_no = #{BNo}")
	int remove(int boardNo) throws Exception;
	
	// 2.게시물 쓰기
	@SelectKey(before = true, resultType = Integer.class, keyProperty = "bNo", statement = "select board_b_no_SEQ.nextval from dual")
	@Insert("insert into board(b_no,b_title,u_id,b_content,b_groupno,b_step,b_depth) values(#{BNo},#{BTitle},#{UId},#{BContent},board_b_no_SEQ.currval,1,0)")
	int create(Board board) throws Exception;
	
	// 3.답글 쓰기
	@Insert("insert into board(b_no,b_title,u_id,b_content,b_groupno,b_step,b_depth) values(board_b_no_SEQ.nextval,#{BTitle},#{UId},#{BContent},#{BGroupno},#{BStep},#{BDepth})")
	int createReply(Board board) throws Exception;
	
	// 3-1.답글 쓰기 전  b_step update 하는 메써드
	@Update("update board set b_step=b_step+1 where b_step > #{BStep} and b_groupno=#{BGroupno}")
	int updateReply(Board temp) throws Exception;
	
	// 4.게시물 1개 선택
	@Select("select board.* from board where b_no = #{BNo}")
	Board findBoard(int bNo) throws Exception;

	// 5.게시물 리스트 반환(시작번호, 끝번호)
	@Select("SELECT * FROM ( SELECT rownum rn, s.* FROM( "
			+ "                            SELECT b_no, b_title,b_content, u_id,b_date,b_readcount,b_groupno, b_step, b_depth "
			+ "                            FROM board ORDER BY b_groupno DESC, b_step ASC"
			+ "                            ) s"
			+ "               )"
			+ "WHERE rn >= #{start} AND rn <= #{last}")
	List<Board> findBoardList(Map param) throws Exception;
	
	// 6.게시물 수정
	@Update("update board set b_title=#{BTitle},b_content= #{BContent},u_id=#{UId} where b_no=#{BNo}")
	int update(Board board) throws Exception;
	
	// 7.게시물 조회수 1 증가
	@Update("update board set b_readcount=b_readcount+1 where b_no=#{BNo}")
	void increaseReadCount(int bReadcount) throws Exception;
	
	// 8.답글 존재여부 확인
	@Select("select count(*) cnt from board where b_groupno=#{BGroupno} and b_depth >= #{BDepth} and b_step >=#{BStep} order by b_step,b_depth asc")
	int countReplay(Board board) throws SQLException;

	// 9.게시물 총 건수 조회, 반환
	@Select("select count(*) from board")
	int getBoardCount() throws Exception;
	
}








