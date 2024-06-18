<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.itwill.shop.user.User" %>
<%@ page import="com.itwill.shop.user.UserService" %>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/main.css">
</head>
<body>
    <div class="login_form_inner">
        <h1>아이디 찾기 결과</h1>
        <%
            String uName = request.getParameter("uName");
            String uPhone = request.getParameter("uPhone");
            UserService userService = new UserService();
            User user = null;
            try {
                user = userService.findUserId(uName, uPhone);
        %>
        <p>회원님의 아이디는 <%= user.getUId() %> 입니다.</p>
        <button onclick="closeWindow()" class="primary-btn">확인</button>
        <script>
            function closeWindow() {
                window.close();
            }
        </script>
        <%
            } catch (Exception e) {
        %>
        <p>아이디를 찾을 수 없습니다. 입력한 정보를 다시 확인해주세요.</p>
        <a href="user_findId_form.jsp" class="primary-btn">확인</a>
        <%
            e.printStackTrace();
            }
        %>
        <form class="row login_form" action="user_findId_action.jsp" method="post">
            <div class="col-md-12 form-group">
            </div>
        </form>
    </div>
</body>
</html>
