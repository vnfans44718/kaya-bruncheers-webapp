package com.itwill.shop.cs;

public class CsException extends Exception {
	public CsException() {
		this("고객센터 관련 에러 발생");
	}
	public CsException(String errorMsg) {
		super(errorMsg);
	}
	public CsException(String errorMsg, Throwable cause){
		super(errorMsg, cause);
	}
}
