<%@page import="com.itwill.shop.board.BoardService"%>
<%@page import="com.itwill.shop.board.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="user_login_check.jspf"%>
<%
    
 //post 요청인 경우 요청 데이터에 한글 문자셋으로 설정
if (request.getMethod().toLowerCase().equals("post")) {
	 
}

//1. Board 객체를 만들고 사용자가 입력한 데이터를 저장
Board board = new Board();
board.setBNo(Integer.parseInt(request.getParameter("bNo")));
board.setBTitle(request.getParameter("bTitle"));
board.setUId(request.getParameter("uId"));
board.setBContent(request.getParameter("bContent"));

//2. 데이터베이스에 변경된 내용 적용
new BoardService().update(board);
String pageno = "1";
if (request.getParameter("pageno") != null) {
	pageno = request.getParameter("pageno");
}
//3. board_view.jsp로 이동
response.sendRedirect(
	String.format("board_view.jsp?bNo=%d&pageno=%s",board.getBNo(), pageno));
%>
    
