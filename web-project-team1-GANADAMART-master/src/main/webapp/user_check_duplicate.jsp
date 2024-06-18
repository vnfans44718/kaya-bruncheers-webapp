<%@ page language="java" contentType="text/plain; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.itwill.shop.user.UserService"%>

<%
    UserService userService = new UserService();
    String uId = request.getParameter("uId");
    boolean isDuplicate = userService.checkDuplicateUserId(uId);

    out.print(isDuplicate ? "이미 사용 중인 아이디입니다." : "사용 가능한 아이디입니다.");
%>
