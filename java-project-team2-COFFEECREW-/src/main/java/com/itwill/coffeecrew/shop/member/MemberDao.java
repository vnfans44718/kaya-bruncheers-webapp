package com.itwill.coffeecrew.shop.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.itwill.coffeecrew.shop.common.DataSource;

public class MemberDao {
	
	private DataSource ds;
	
	public MemberDao() throws Exception {
		ds = new DataSource();
	}
	
	
	
	
	//member insert
	public int insert(Member newMember) throws Exception {
		
		Connection con = ds.getConnection();
		PreparedStatement pstmt = con.prepareStatement(MemberSQL.MEMBER_INSERT);
		
		pstmt.setString(1, newMember.getId());
		pstmt.setString(2, newMember.getPw());
		pstmt.setString(3, newMember.getPwcheck());
		pstmt.setString(4, newMember.getPhone());
		pstmt.setString(5, newMember.getBirthdate());
		pstmt.setString(6, newMember.getEmail());
		pstmt.setString(7, newMember.getNickname());
		
		int insertRowCount = pstmt.executeUpdate();
		pstmt.close();
		ds.close(con);
		
		return insertRowCount;
	}
	
	
	
	
	//member select
	public Member selectByMemberId(String id) throws Exception {
		
		Connection con = ds.getConnection();
		PreparedStatement pstmt = con.prepareStatement(MemberSQL.MEMBER_SELECT_BY_ID);
		
		pstmt.setString(1, id);
		
		ResultSet rs = pstmt.executeQuery();
		Member selectMember = null;
		
		if(rs.next()) {
			selectMember = new Member(
					rs.getString("id"), 
					rs.getString("pw"), 
					rs.getString("pwcheck"), 
					rs.getString("phone"), 
					rs.getString("birthdate"), 
					rs.getString("email"), 
					rs.getString("nickname"));
		}
		
		pstmt.close();
		ds.close(con);
		
		return selectMember;
	}
	
	public Member selectByMemberPhone(String phone) throws Exception {
		
		Connection con = ds.getConnection();
		PreparedStatement pstmt = con.prepareStatement(MemberSQL.MEMBER_SELECT_BY_PHONE);
		
		pstmt.setString(1, phone);
		
		ResultSet rs = pstmt.executeQuery();
		Member selectMember = null;
		
		if(rs.next()) {
			selectMember = new Member(
					rs.getString("id"), 
					rs.getString("pw"), 
					rs.getString("pwcheck"), 
					rs.getString("phone"), 
					rs.getString("birthdate"), 
					rs.getString("email"), 
					rs.getString("nickname"));
		}
		
		pstmt.close();
		ds.close(con);
		
		return selectMember;
	}
	
	public Member selectByMemberEmail(String email) throws Exception {
		
		Connection con = ds.getConnection();
		PreparedStatement pstmt = con.prepareStatement(MemberSQL.MEMBER_SELECT_BY_EMAIL);
		
		pstmt.setString(1, email);
		
		ResultSet rs = pstmt.executeQuery();
		Member selectMember = null;
		
		if(rs.next()) {
			selectMember = new Member(
					rs.getString("id"), 
					rs.getString("pw"), 
					rs.getString("pwcheck"), 
					rs.getString("phone"), 
					rs.getString("birthdate"), 
					rs.getString("email"), 
					rs.getString("nickname"));
		}
		
		pstmt.close();
		ds.close(con);
		
		return selectMember;
	}
	
	
	
	
	//member update
	public int update(Member updateMember) throws Exception {
		
		Connection con = ds.getConnection();
		PreparedStatement pstmt = con.prepareStatement(MemberSQL.MEMBER_UPDATE);
	
		//pstmt.setString(1, updateMember.getPw());
		pstmt.setString(1, updateMember.getPhone());
		pstmt.setString(2, updateMember.getBirthdate());
		pstmt.setString(3, updateMember.getEmail());
		pstmt.setString(4, updateMember.getNickname());
		pstmt.setString(5, updateMember.getId());
		
		int updateRowCount = pstmt.executeUpdate();
		pstmt.close();
		ds.close(con);
		
		return updateRowCount;
	}
	
	
	
	
	//member update (password)
	public int updatePassword(String newPw, String id) throws Exception {
		
		Connection con = ds.getConnection();
		PreparedStatement pstmt = con.prepareStatement(MemberSQL.MEMBER_UPDATE_PASSWORD);
		
		pstmt.setString(1, newPw);
		pstmt.setString(2, id);
		
		int updateRowCount = pstmt.executeUpdate();
		pstmt.close();
		ds.close(con);
		
		return updateRowCount;
		
	}
	

	
	
	//member delete
	public int delete(String id) throws Exception {
		
		Connection con = ds.getConnection();
		PreparedStatement pstmt = con.prepareStatement(MemberSQL.MEMBER_DELETE);
		
		pstmt.setString(1, id);
		
		int deleteRowCount = pstmt.executeUpdate();
		pstmt.close();
		ds.close(con);
		
		return deleteRowCount;
	}




	
	
	
}

