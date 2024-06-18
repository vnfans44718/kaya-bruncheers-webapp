<%@page import="com.itwill.shop.board.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="user_login_check.jspf"%>
<%
	//Board객체를 생성하고 입력된데이타를 읽어서 객체에저장
	Board board=new Board();
	/*
	원글 bNo
	*/
	board.setBNo(
			Integer.parseInt(request.getParameter("bNo")));
	/*
	답글 데이타
	*/
	board.setBTitle(request.getParameter("bTitle"));
	board.setUId(request.getParameter("uId"));
	board.setBContent(request.getParameter("bContent"));
	new BoardService().createReply(board);
	
	String pageno = "1";
	if(request.getParameter("pageno")!=null){
		pageno=request.getParameter("pageno");
	}
	response.sendRedirect(
			String.format("board_list.jsp?pageno=%s",pageno));
	
%>