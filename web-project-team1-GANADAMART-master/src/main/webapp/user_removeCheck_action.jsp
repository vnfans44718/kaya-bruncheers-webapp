<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.itwill.shop.user.UserService"%>
<%@page import="com.itwill.shop.user.User"%>
<%@ include file="user_login_check.jspf"%>
<%
if (request.getMethod().equalsIgnoreCase("GET")) {
	response.sendRedirect("index.jsp");
	return;
}
String uPass = request.getParameter("uPass");
UserService userService = new UserService();
boolean isValidUser = false;
User user=null;
try {
	userService.checkDuplicateUserPass(sUserId, uPass);
	isValidUser = true;
} catch (Exception e) {
	
	isValidUser = false;
}

if (isValidUser) {
	new UserService().remove(sUserId);
	response.sendRedirect("user_logout_action.jsp");
} else {
%>
<script type="text/javascript">
	alert("비밀번호가 일치하지 않습니다.");
	window.location.href = "user_removeCheck_form.jsp";
</script>
<%
}
%>
