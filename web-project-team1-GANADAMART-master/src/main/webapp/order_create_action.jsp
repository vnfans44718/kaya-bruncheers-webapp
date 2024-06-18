<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page
	import="ch.qos.logback.core.recovery.ResilientSyslogOutputStream"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.itwill.shop.user.User"%>
<%@page import="com.itwill.shop.user.UserService"%>
<%@page import="com.itwill.shop.order.Order"%>
<%@page import="com.itwill.shop.order.OrderService"%>
<%@page import="com.itwill.shop.cart.Cart"%>
<%@page import="com.itwill.shop.cart.CartService"%>
<%@page import="com.itwill.shop.product.Product"%>
<%@page import="com.itwill.shop.product.ProductService"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="user_login_check.jspf" %>
<%
if (request.getMethod().equalsIgnoreCase("GET")) {
	response.sendRedirect("index.jsp");
	return;
}

/*임시 객체 생성*/
Order order = (Order) session.getAttribute("order");
OrderService orderService = new OrderService();

/*파라미터 받기*/
String buyType = request.getParameter("buyType");
String sName = request.getParameter("sName");
String sPhone = request.getParameter("sPhone");
String sAddr = request.getParameter("sAddr");
String oPayment = request.getParameter("oPayment");
if (buyType == null) {
	buyType = "";
}
String[] cart_noStr_array = request.getParameterValues("c_no");
if (cart_noStr_array == null) {
	cart_noStr_array = new String[] {};
}


if (order == null) {
	response.sendRedirect("index.jsp");
	return;
}

int selectPk = 0;

order.setOName(sName);
order.setOPhone(sPhone);
order.setOAddr(sAddr);
order.setOPayment(oPayment);

/* 주문생성 */

if (buyType.equals("cart")) {
	selectPk = orderService.create(order, cart_noStr_array);
	String findImag = orderService.findPrimaryImage(selectPk);
	int rowCount = orderService.updateImg(findImag, selectPk);
	response.sendRedirect("order_list.jsp");
	return;

} else if (buyType.equals("cart_select")) {
	selectPk = orderService.create(order, cart_noStr_array);
	String findImag = orderService.findPrimaryImage(selectPk);
	int rowCount = orderService.updateImg(findImag, selectPk);
	response.sendRedirect("order_list.jsp");

	return;

} else if (buyType.equals("direct")) {
	selectPk = orderService.createAtProduct(order);
	String findImag = orderService.findPrimaryImage(selectPk);
	int rowCount = orderService.updateImg(findImag, selectPk);
	response.sendRedirect("order_list.jsp");
	return;
}

response.sendRedirect("order_list.jsp");
%>