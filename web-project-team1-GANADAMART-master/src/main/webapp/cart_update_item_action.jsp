<%@page import="com.itwill.shop.cart.CartService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%
    if(request.getMethod().equalsIgnoreCase("GET")){
    		response.sendRedirect("index.jsp");
    		return;
    	}
    	String cart_noStr=request.getParameter("cart_no");
    	String cart_qtyStr=request.getParameter("cart_qty");
		  	
    	CartService cartService=new CartService();
    	if(cart_qtyStr.equals("0")){
    		cartService.CartItemDeleteNo(Integer.parseInt(cart_noStr));
    	}else{
    		cartService.CartUpdate(Integer.parseInt(cart_noStr),Integer.parseInt(cart_qtyStr));
    	}
    	String referer=request.getHeader("referer");
    	response.sendRedirect(referer);
    	
   
    %>