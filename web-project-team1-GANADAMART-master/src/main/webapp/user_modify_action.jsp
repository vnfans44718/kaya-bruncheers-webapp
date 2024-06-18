<%@page import="jakarta.servlet.jsp.tagext.TryCatchFinally"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.itwill.shop.user.UserService"%>
<%@page import="com.itwill.shop.user.User"%>
<%@ include file="user_login_check.jspf"%>
<%
 	if(request.getMethod().equalsIgnoreCase("GET")){
 		response.sendRedirect("index.jsp");
 		return; 
 	}
	try{
		
		String uName = request.getParameter("uName");
		String uPass = request.getParameter("uPass");
		String uPhone = request.getParameter("uPhone");
		String uEmail = request.getParameter("uEmail");
		String uAddr = request.getParameter("uAddr");
		
		User user = User.builder()
						.uId(sUserId)
						.uName(uName)
						.uPass(uPass)
						.uPhone(uPhone)
						.uEmail(uEmail)
						.uAddr(uAddr)
						.build();
		
		UserService userService = new UserService();
		userService.update(user);
		response.sendRedirect("user_view.jsp");
	}catch(Exception e){
		e.printStackTrace();
		response.sendRedirect("user_error.jsp");
	}
	
%>
