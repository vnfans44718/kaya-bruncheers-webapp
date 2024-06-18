<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.itwill.shop.user.UserService" %>
<%@ page import="com.itwill.shop.user.User" %>

<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/main.css">
</head>
<%
    String uId = request.getParameter("uId");
    String uPass1 = request.getParameter("uPass1");
    String uPass2 = request.getParameter("uPass2");

    if (uPass1 != null && uPass2 != null && uPass1.equals(uPass2)) {
        UserService userService = new UserService();
        boolean changeResult = false;

        try {
            changeResult = userService.changePassword(uId, uPass1);
        } catch (Exception e) {
            e.printStackTrace();
        }

        if (changeResult) {
%>
            <div class="login_form_inner">
                <div class="col-md-12 form-group">
                    <p>비밀번호가 성공적으로 변경되었습니다. 새로운 비밀번호로 로그인해주세요.</p>
                    <a href="user_login_form.jsp" class="primary-btn" onclick="window.close();">확인</a>
                </div>
            </div>
<%
        } else {
%>
            <div class="login_form_inner">
                <div class="col-md-12 form-group">
                    <p>비밀번호 변경에 실패하였습니다. 다시 시도해주세요.</p>
                    <a href="user_findPassword_form.jsp">확인</a>
                </div>
            </div>
<%
        }
    } else {
%>
    <div class="login_form_inner">
        <div class="col-md-12 form-group">
            <p>입력한 비밀번호가 일치하지 않습니다. 다시 확인해주세요.</p>
            <a href="user_findPassword_form.jsp" class="primary-btn">확인</a>
        </div>
    </div>
<%
    }
%>
</html>
