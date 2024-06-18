package com.itwill.shop.board.init;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

import javax.sql.DataSource;

import org.apache.commons.dbcp2.BasicDataSource;

import com.itwill.shop.board.BoardDao;





public class BoardDataInsertMain {
	public static void main(String[] args) throws Exception{
		Connection con = null;
		Statement stmt = null;
		try {
			/******Apache BasicDataSource*****/
			/*
			 * jdbc.properties 파일을 Properties객체로생성
			 */
			BasicDataSource basicDataSource=new BasicDataSource();
			Properties properties=new Properties();
			properties.load(BoardDao.class.getResourceAsStream("/jdbc.properties"));
			basicDataSource.setDriverClassName(properties.getProperty("jdbc.driver-class-name"));
			basicDataSource.setUrl(properties.getProperty("jdbc.url"));
			basicDataSource.setUsername(properties.getProperty("jdbc.username"));
			basicDataSource.setPassword(properties.getProperty("jdbc.password"));
			basicDataSource.setInitialSize(1);
			basicDataSource.setMaxTotal(2);
			
			DataSource dataSource=basicDataSource;
			con = dataSource.getConnection();
			stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			con.setAutoCommit(false);
			for (int i = 1; i <= 500; i++) {
				stmt.addBatch("insert into board(b_no,b_title,u_id,b_content,b_groupno,b_step,b_depth) \n"
						+ "    values(board_b_no_SEQ.nextval,\n"
						+ "            '게시판타이틀'||board_b_no_SEQ.currval,\n"
						+ "            'bbbb',\n"
						+ "            '내용입니다'||board_b_no_SEQ.currval,\n"
						+ "            board_b_no_SEQ.currval,\n"
						+ "            1,\n"
						+ "            0\n"
						+ "            )");

			}
			int[] updateCounts = stmt.executeBatch();
			System.out.println("query 수:" + updateCounts.length);
			con.commit();
			System.out.println("success commit!!!!");
		} catch (SQLException e) {
			e.printStackTrace();
			try {
				con.rollback();
				System.out.println("rollback !!!");
			} catch (SQLException e1) {
				System.out.println("rollback fail!!!");
			}
		} finally {
			try {
				if (con != null) {
					con.close();
				}
			} catch (SQLException e) {
				System.out.println("close 시 에러발생");
			}
		}

	}
}
