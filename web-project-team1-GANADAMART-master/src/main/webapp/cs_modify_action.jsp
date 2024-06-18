<%@page import="com.itwill.shop.cs.CsService"%>
<%@page import="com.itwill.shop.cs.Cs"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="user_login_check.jspf"%>
<% 

 //post 요청인 경우 요청 데이터에 한글 문자셋으로 설정
if (request.getMethod().toLowerCase().equals("post")) {
	 
}

//1. cs 객체를 만들고 사용자가 입력한 데이터를 저장
Cs cs = new Cs();
cs.setCsNo(Integer.parseInt(request.getParameter("csNo")));
cs.setCsTitle(request.getParameter("csTitle"));
cs.setUId(request.getParameter("uId"));
cs.setCsContent(request.getParameter("csContent"));

//2. 데이터베이스에 변경된 내용 적용
new CsService().csUpdate(cs);
String pageno = "1";
if (request.getParameter("pageno") != null) {
	pageno = request.getParameter("pageno");
}
//3. cs_view.jsp로 이동
response.sendRedirect(
	String.format("cs_view.jsp?csNo=%d&pageno=%s",
	cs.getCsNo(), pageno));
%>
    
