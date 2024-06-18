package com.itwill.shop.board;

import java.util.Date;

import com.itwill.shop.user.User;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Builder

public class Board {
	private int rn;
	private int bNo; //게시판번호
	private String bTitle; //제목
	private String bContent; //내용
	private int bReadcount; //조회수
	private Date bDate; //등록일자
	private String uId; //FK
	
	//글의 논리적인 순서번호를 관리하기 위한 필드 (3개)
	private int bGroupno;
	private int bStep;
	private int bDepth;
	
}
