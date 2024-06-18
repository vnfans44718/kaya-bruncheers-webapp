<%@page import="com.itwill.shop.ship.ShipService"%>
<%@page import="com.itwill.shop.ship.Ship"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="user_login_check.jspf" %>
<% 

// 배송지 수정 시 필요한 update_form.jsp 필요

/* GET 방식 쳐내기 */
if(request.getMethod().equalsIgnoreCase("GET")){
	response.sendRedirect("ship_list_popup.jsp");
	return;
}

/* 파라메타 받기 */
Ship ship = new Ship();
ship.setSNo(Integer.parseInt(request.getParameter("sNo")));
ship.setSName(request.getParameter("sName"));
ship.setSPhone(request.getParameter("sPhone"));
ship.setSAddr(request.getParameter("sAddr"));
ship.setUId(request.getParameter("uId"));


/* 배송지 정보 업데이트 */
ShipService shipService = new ShipService();
int rowCount = shipService.update(ship);

response.sendRedirect("ship_list_popup.jsp");
%>
