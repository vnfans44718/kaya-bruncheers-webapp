package com.itwill.shop.cs;

import java.util.Date;

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
public class Cs {
	private int rn;
	private int csNo;
	private String csTitle;
	private String csContent;
	private int csReadCount;
	private Date csDate;
	private String uId;
	
	private int csGroupNo;
	private int csStep;
	private int csDepth;
	
}
