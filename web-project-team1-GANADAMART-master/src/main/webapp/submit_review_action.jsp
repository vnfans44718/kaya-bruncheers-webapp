<%@page import="java.util.Date"%>
<%@page import="com.itwill.shop.review.Review"%>
<%@page import="com.itwill.shop.review.ReviewService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <%@include file="user_login_check.jspf" %>
 <%
 	String pNo = request.getParameter("pNo");
 	String message = request.getParameter("message");
 	String rating = request.getParameter("rating");
 	if(rating==null){
 		response.sendRedirect("index.jsp");
 		return;
 	}
 	ReviewService reviewService = new ReviewService();
 	reviewService.insert(Review.builder()
 									.rContent(message)
 									.rDate(new Date())
 									.uId(sUserId)
 									.pNo(Integer.parseInt(pNo))
 									.rRating(Integer.parseInt(rating))
 									.build());
 	String referer=request.getHeader("referer");
 	response.sendRedirect(referer);
 %>