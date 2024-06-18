<%@page import="java.net.URLEncoder"%>
<%@page import="com.itwill.shop.user.User"%>
<%@page import="com.itwill.shop.user.exception.PasswordMismatchException"%>
<%@page import="com.itwill.shop.user.exception.UserNotFoundException"%>
<%@page import="com.itwill.shop.user.UserService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if (request.getMethod().equalsIgnoreCase("GET")){
		response.sendRedirect("user_login_form.jsp");
		return;
	}

	String uId = null;
	String uPass = null;

	try{
		uId = request.getParameter("uId");
		uPass = request.getParameter("uPass");
		UserService userService = new UserService();
		User loginUser = userService.login(uId, uPass);
		session.setAttribute("sUserId", uId);
		session.setAttribute("sUser", loginUser);
		response.sendRedirect("index.jsp");

	} catch (UserNotFoundException e) {
		request.setAttribute("msg1", e.getMessage());
		request.setAttribute("fuser", new User(uId, uPass, "", "", "", "", ""));
		RequestDispatcher rd = request.getRequestDispatcher("user_login_form.jsp");
		rd.forward(request, response);

	} catch (PasswordMismatchException e) {
		request.setAttribute("msg2", e.getMessage());
		request.setAttribute("fuser", new User(uId, uPass,"", "", "", "", ""));
		RequestDispatcher rd = request.getRequestDispatcher("user_login_form.jsp");
		rd.forward(request, response);

	} catch (Exception e) {
		e.printStackTrace();
		RequestDispatcher rd = request.getRequestDispatcher("user_error.jsp");
		rd.forward(request, response);
	}
%>








