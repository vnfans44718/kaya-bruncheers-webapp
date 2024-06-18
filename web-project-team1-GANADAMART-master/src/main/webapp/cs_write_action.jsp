<%@page import="com.itwill.shop.cs.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="user_login_check.jspf"%>
<%
	Cs cs=new Cs();
	cs.setCsTitle(request.getParameter("csTitle"));
	cs.setUId(sUserId);
	cs.setCsContent(request.getParameter("csContent"));
	
	new CsService().csCreate(cs);
	response.sendRedirect("cs_list.jsp");
%>