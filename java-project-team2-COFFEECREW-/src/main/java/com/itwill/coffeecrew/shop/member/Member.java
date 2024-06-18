package com.itwill.coffeecrew.shop.member;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/*
id                            		VARCHAR2(100)		 NOT NULL,
pw                            		VARCHAR2(100)		 NOT NULL,
pwcheck                       		VARCHAR2(100)		 NOT NULL,
phone                         		VARCHAR2(100)		 NOT NULL,
birthdate                     		VARCHAR2(100)		 NOT NULL,
email                         		VARCHAR2(100)		 NOT NULL,
nickname                      		VARCHAR2(100)		 NOT NULL
*/

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder

public class Member {
	
	private String id;
	private String pw;
	private String pwcheck;
	private String phone;
	private String birthdate;
	private String email;
	private String nickname;
	
}
