
package com.itwill.shop.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;

import com.itwill.shop.cs.Cs;

public interface CsMapper {
	
	// 1.게시물 삭제
		@Delete("delete cs where cs_no = #{csNo}")
		int csRemove(int csNo) throws Exception;
		
		// 2.게시물 쓰기
		@SelectKey(before = true, resultType = Integer.class, keyProperty = "csNo", statement = "select cs_cs_no_SEQ.nextval from dual")
		@Insert("insert into cs(cs_no, cs_title, u_id, cs_content, cs_groupno, cs_step, cs_depth) values(#{csNo},#{csTitle},#{uId},#{csContent},cs_cs_no_SEQ.currval,1,0)")
		int csCreate(Cs cs) throws Exception;
		
		/*
		// 3.답글 쓰기
		@Insert("insert into board(b_no,b_title,u_id,b_content,b_groupno,b_step,b_depth) values(board_b_no_SEQ.nextval,#{BTitle},#{UId},#{BContent},#{BGroupno},#{BStep},#{BDepth})")
		int createReply(Board board) throws Exception;
		*/
		
		/*
		// 3-1.답글 쓰기 전  b_step update 하는 메써드
		@Update("update cs set cs_step = cs_step+1 where cs_step > #{CsStep} and cs_groupno=#{CsGroupno}")
		int updateReply(Cs temp) throws Exception;
		*/
		
		// 4.게시물 1개 선택
		@Select("select cs.* from cs where cs_no = #{csNo}")
		Cs findCs(int csNo) throws Exception;

		// 5.게시물 리스트 반환(시작번호, 끝번호)
		@Select("SELECT * FROM ( SELECT rownum rn, s.* FROM( "
				+ "                            SELECT cs_no, cs_title, cs_content, u_id, cs_date, cs_readcount, cs_groupno, cs_step, cs_depth "
				+ "                            FROM cs ORDER BY cs_groupno DESC, cs_step ASC"
				+ "                            ) s"
				+ "               )"
				+ "WHERE rn >= #{start} AND rn <= #{last}")
		List<Cs> findCsList(Map param) throws Exception;
		
		// 6.게시물 수정
		@Update("update cs set cs_title=#{csTitle}, cs_content= #{csContent}, u_id= #{UId} where cs_no=#{csNo}")
		int csUpdate(Cs cs) throws Exception;
		
		// 7.게시물 조회수 1 증가
		@Update("update cs set cs_readcount = cs_readcount+1 where cs_no=#{csNo}")
		void csIncreaseReadCount(int csReadcount) throws Exception;
		
		/*
		// 8.답글 존재여부 확인
		@Select("select count(*) cnt from cs where cs_groupno=#{CsGroupno} and cs_depth >= #{CsDepth} and cs_step >=#{CsStep} order by cs_step, cs_depth asc")
		int countReplay(Board board) throws SQLException;
		*/
		
		// 9.게시물 총 건수 조회, 반환
		@Select("select count(*) from cs")
		int getCsCount() throws Exception;
		
}