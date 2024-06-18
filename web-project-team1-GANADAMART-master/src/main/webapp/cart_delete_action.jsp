<%@page import="com.itwill.shop.cart.CartService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String sUserId = "bbbb";
	

	if(request.getMethod().equals("GET")){
		response.sendRedirect("index.jsp");
		return;
	}
	CartService cartService = new CartService();
	cartService.CartItemDelete(sUserId);
	String referer=request.getHeader("referer");
	response.sendRedirect(referer);

%>    
    
