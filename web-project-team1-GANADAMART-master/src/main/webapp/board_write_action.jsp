<%@page import="com.itwill.shop.board.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="user_login_check.jspf"%>
<%
	Board board=new Board();
	board.setUId(sUserId);
	board.setBTitle(request.getParameter("bTitle"));
	board.setBContent(request.getParameter("bContent"));
	
	new BoardService().create(board);
	response.sendRedirect("board_list.jsp");
%>
