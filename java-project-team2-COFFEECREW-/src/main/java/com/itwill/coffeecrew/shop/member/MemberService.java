package com.itwill.coffeecrew.shop.member;

public class MemberService {
	
	private MemberDao memberDao;
	
	public MemberService() throws Exception {
		memberDao = new MemberDao();
	}
	
	
	
	
	//로그인
	public Member login(String id, String pw) throws Exception {
		
		Member findMember = memberDao.selectByMemberId(id);
		
		//아이디가 존재하고 비밀번호가 일치하면 로그인 성공
		if(findMember != null && findMember.getPw().equals(pw)) {
			return findMember;
		}
		return null;
		
	}
	

	
		
	//회원가입
	public int addMember(Member newMember) throws Exception {
		
		/*
		boolean isSuccess = false;
		
		//아이디 존재여부
		Member findMember = memberDao.selectByMemberId(newMember.getId());
		
		if(findMember == null) {
			//아이디가 중복되지 않음
			isSuccess = true;
		}else {
			//아이디가 중복임
			isSuccess = false;
		}
		return isSuccess;
		
		
		/***************** UI에서 *********************/
		/*비밀번호 일치 확인 
		if(newMember.getPw().equals(newMember.getPwcheck())) {
			isSuccess = true;		
		}else {
			isSuccess = false;
		}
		return isSuccess;
		/***************** UI에서 *********************/
		
		
		/*
		//이메일 존재여부
		findMember = memberDao.selectByMemberEmail(newMember.getEmail());
		
		//이메일 중복 확인
		if(findMember == null) {
			isSuccess = true;
					
		}else {
			isSuccess = false;
		}
		return isSuccess;
		*/
		
		return memberDao.insert(newMember);
	}
	
	
	
	
	//아이디 중복체크
	public boolean idCheck(String id) throws Exception {
		
		boolean isSuccess = false;
	
		Member findMember = memberDao.selectByMemberId(id);
		
		if(findMember == null) {
			isSuccess = true;
		}else {
			isSuccess = false;
		}
		
		return isSuccess;
	}
	
	
	
	
	//이메일 중복체크 
	public boolean emailCheck(String email) throws Exception {
		
		boolean isSuccess = false;
	
		Member findMember = memberDao.selectByMemberEmail(email);
		
		if(findMember == null) {
			isSuccess = true;
		}else {
			isSuccess = false;
		}
		
		return isSuccess;
	}
	
	
	
	
	//회원정보 수정
	public int memberUpdate(Member member) throws Exception {
		return memberDao.update(member);
	}
	
	
	
	
	//회원탈퇴
	public int memberDelete(String id) throws Exception {
		return memberDao.delete(id);
	}
	
	
	
	
	//아이디 찾기
	//핸드폰 번호와 이메일이 기존 회원정보와 동일한지 확인
	public Member findId(String phone, String email) throws Exception {
		
		Member findMember = memberDao.selectByMemberPhone(phone);
		
		if(findMember != null && findMember.getPhone().equals(phone) && findMember.getEmail().equals(email)) {
			return findMember;
		}
		
		return null;
		
	}
	
	
	
	
	//비밀번호 찾기
	//아이디와 이메일이 기존 회원정보와 동일한지 확인
	public Member findPw(String id, String email) throws Exception {
		
		Member findMember = memberDao.selectByMemberId(id);
		
		if(findMember != null && findMember.getId().equals(id) && findMember.getEmail().equals(email)) {
			return findMember;
		}
	
		return null;
		
	}
	
	
	
	
	//비밀번호 변경 
	/*
	 * 비밀번호 확인 후 맞으면 비밀번호 변경
	 */
	public boolean updatePassword (String newPw, String id) throws Exception{
		boolean isSuccess = false;
		
		Member findMember = memberDao.selectByMemberId(id);
		if(findMember!= null) {
			memberDao.updatePassword(newPw, findMember.getId());
			isSuccess = true;
		}else {
			isSuccess = false;
		}
		
		
	    return isSuccess;
	}
	
	
	
	
	//회원 상세보기
	public Member memberDetail(String id) throws Exception {
		return memberDao.selectByMemberId(id);
	}
	
	

}













