package com.itwill.coffeecrew.shop.test.김하은;

import com.itwill.coffeecrew.shop.member.MemberDao;

public class MemberDaoTestMain {

	public static void main(String[] args) throws Exception {
		
		MemberDao memberDao = new MemberDao();
		
		/*
		/********** 회원삭제 O *********
		System.out.println("0.delete -> "+memberDao.delete("kimcoffee"));
		*/
		
		/*
		 * /********** 회원넣기 O *********
		System.out.println("1.insert -> "+memberDao.insert(new Member("2", "2", "2", "2", 12345678, "2", "2")));
		*/
		

		/*
		 * /********** 회원정보수정 O *********
		System.out.println("2.update -> "+memberDao.update(new Member("2", "3", "3", "3", 12345678, "3", "3")));
		 */
		
		/*
		 * /********** 아이디로 회원정보읽기 O *********
		System.out.println("3-1.selectById -> "+memberDao.selectByMemberId("2"));
		*/

		/*
		 * /********** 핸드폰번호로 회원정보읽기 O *********
		System.out.println("3-2.selectByPhone -> "+memberDao.selectByMemberPhone("3"));
		*/
		
		/*
		 * /********** 이메일로 회원정보읽기 O *********
		System.out.println("3-3.selectByEmail -> "+memberDao.selectByMemberEmail("3"));
		*/
		
		/*
		 * /********** 전체회원정보읽기(관리자) O *********
		System.out.println("3-4.selectAll -> "+memberDao.selectAll());
		*/
		
	}

}
