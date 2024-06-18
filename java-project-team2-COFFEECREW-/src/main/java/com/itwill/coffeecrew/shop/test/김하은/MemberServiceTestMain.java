package com.itwill.coffeecrew.shop.test.김하은;

import javax.swing.JOptionPane;

import com.itwill.coffeecrew.shop.member.Member;
import com.itwill.coffeecrew.shop.member.MemberService;

public class MemberServiceTestMain {

	public static void main(String[] args) throws Exception {
		
		MemberService memberService = new MemberService();
		
		
		/**************** 회원가입 O *********
		System.out.println("1.회원가입");
		memberService.addMember(Member.builder()
				.id("1")
				.pw("2222")
				.pwcheck("2222")
				.phone("4")
				.birthdate(19950609)
				.email("가나다라")
				.nickname("와랄랄라라")
				.build());
				*/
		
				
		/*
		/****************아이디 중복체크 O *********
		System.out.println("1-1.아이디 중복체크");
		boolean isSuccess1 = memberService.idCheck(Member.builder()
				.id("3")
				.pw("3333")
				.pwcheck("3333")
				.phone("678")
				.birthdate(19959999)
				.email("가나다라")
				.nickname("으아아아악")
				.build());
		System.out.println(isSuccess1);
		*/
		
		
		/*
		/******************* 이메일 중복체크 O ***********
		System.out.println("1-2. 이메일 중복체크");  
		boolean isSuccess2 = memberService.emailCheck(Member.builder()
				.id("5")
				.pw("6666")
				.pwcheck("6666")
				.phone("890890")
				.birthdate(19951111)
				.email("가나다라")
				.nickname("호두에너지바")
				.build());
		System.out.println(isSuccess2);
		*/
		
		
		/*
		/**************** 로그인 O, 로그인 성공여부 O ************* 
		System.out.println("2.로그인");
		Member loginMember1 = memberService.login("1", "3333");
		if(loginMember1 != null) {
			JOptionPane.showMessageDialog(null, "로그인되었습니다");
		}else {
			JOptionPane.showMessageDialog(null, "아이디나 비밀번호가 일치하지 않습니다");
		}
		*/
		
		
		/*
		/**************** 회원정보 수정 O *************
		System.out.println("3.회원정보 수정");
		memberService.memberUpdate(Member.builder()
				.pw("3333")
				.phone("3333")
				.birthdate(3333333)
				.email("3333")
				.nickname("삼삼삼")
				.id("1")
				.build());
		*/
		
		
		/*
		/**************** 회원탈퇴 O *************
		System.out.println("4.회원탈퇴");
		memberService.memberDelete("1");
		*/
		
		
		/*
		/**************** 아이디 찾기 O *************
		System.out.println("5. 아이디 찾기");
		boolean isSuccess1 = memberService.findId("4", "가나다라");
		if(isSuccess1 == false) {
			JOptionPane.showMessageDialog(null, "핸드폰 번호나 이메일을 잘못 입력하셨습니다");
		}else {
			JOptionPane.showMessageDialog(null, "회원님의 아이디는 1입니다");
		}
		*/
		
		
		/*
		/**************** 비밀번호 찾기 O *************
		System.out.println("6. 비밀번호 찾기");
		boolean isSuccess2 = memberService.findPw("1", "가나다라");
		
		if(isSuccess2 == false){
			JOptionPane.showMessageDialog(null, "아이디나 이메일을 잘못 입력하셨습니다");
		}else {
			JOptionPane.showMessageDialog(null, "회원님의 비밀번호는 2222입니다");
		}
		*/
		
		/******************* 비밀번호 수정 O ****************
		System.out.println("7. 비밀번호 수정(변경)");
		boolean isSuccess3 = memberService.updatePassword("8888", "kimcoffee");
		
		if(isSuccess3 == false) {
			System.out.println(isSuccess3);
		}else {
			System.out.println(isSuccess3);
		}
		*/
		
		
	}
	

}
