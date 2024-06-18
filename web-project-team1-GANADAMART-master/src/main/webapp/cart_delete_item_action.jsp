<%@page import="com.itwill.shop.cart.CartService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	if(request.getMethod().equalsIgnoreCase("GET")){
		response.sendRedirect("index.jsp");
		return;
	}
	//장바구니에서 원하는항목을 삭제시킨후에 cart_view.jsp 로 redirection
	String cart_noStr=request.getParameter("cart_no");
	CartService cartService=new CartService();
	cartService.CartItemDeleteNo(Integer.parseInt(cart_noStr));
	String referer=request.getHeader("referer");
	response.sendRedirect(referer);
	
%>
