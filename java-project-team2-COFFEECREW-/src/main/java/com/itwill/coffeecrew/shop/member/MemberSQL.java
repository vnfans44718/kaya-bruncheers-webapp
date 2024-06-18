package com.itwill.coffeecrew.shop.member;

public class MemberSQL {
		
		public static final String MEMBER_INSERT=
				"INSERT INTO member(id, pw, pwcheck, phone, birthdate, email, nickname) VALUES(?, ?, ?, ?, ?, ?, ?)";

		public static final String MEMBER_SELECT_BY_ID=
				"select id, pw, pwcheck, phone, birthdate, email, nickname from member where id=?";
		
		public static final String MEMBER_SELECT_BY_PHONE=
				"select id, pw, pwcheck, phone, birthdate, email, nickname from member where phone=?";
		
		public static final String MEMBER_SELECT_BY_EMAIL=
				"select id, pw, pwcheck, phone, birthdate, email, nickname from member where email=?";
		
		public static final String MEMBER_UPDATE=
				"update member set phone=?, birthdate=?, email=?, nickname=? where id=?";
		
		public static final String MEMBER_UPDATE_PASSWORD=
				"update member set pw=? where id=?";
		
		public static final String MEMBER_DELETE=
				"delete from member where id=?";

}
