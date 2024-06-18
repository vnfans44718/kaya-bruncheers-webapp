<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.itwill.shop.user.UserService"%>
<%@ page import="com.itwill.shop.user.User"%>

<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/main.css">
</head>
<%
    String uId = request.getParameter("uId");
    String uPhone = request.getParameter("uPhone");
    UserService userService = new UserService();
    User user = null;
    boolean isValidUser = false;

    try {
        user = userService.findUserPassword(uId, uPhone);
        isValidUser = true;
    } catch(Exception e) {
        isValidUser = false;
    }

    if (isValidUser) {
%>
    <div class="login_form_inner">
        <h1>비밀번호 변경</h1>
        <form method="post" action="user_findPassword_result.jsp" class="row login_form" onsubmit="return validatePassword()">
            <input type="hidden" name="uId" value="<%= uId %>">
            <div class="col-md-12 form-group">
                <input type="password" class="form-control" id="uPass1" name="uPass1" placeholder="비밀번호" onfocus="this.placeholder = ''" onblur="this.placeholder = '비밀번호'" value="" required>
            </div>
            <div class="col-md-12 form-group">
                <input type="password" class="form-control" id="uPass2" name="uPass2" placeholder="비밀번호 확인" onfocus="this.placeholder = ''" onblur="this.placeholder = '비밀번호 확인'" value="" required>
            </div>
            <div class="col-md-12 form-group">
                <button type="submit" value="확인" class="primary-btn">비밀번호 변경</button>
            </div>
            <script>
                function validatePassword() {
                    var password = document.getElementById("uPass1").value;
                    var confirmPassword = document.getElementById("uPass2").value;
                    if (password != confirmPassword) {
                        alert("비밀번호가 일치하지 않습니다. 다시 확인해주세요.");
                        document.getElementById("uPass1").value = "";
                        document.getElementById("uPass2").value = "";
                        document.getElementById("uPass1").focus();
                        return false;
                    }
                    return true;
                }
            </script>
        </form>
    </div>
<%
    } else {
%>
    <div class="login_form_inner">
        <p>아이디와 전화번호가 일치하지 않습니다. 다시 확인해주세요.</p>
        <a href="user_findPassword_form.jsp" class="primary-btn">확인</a>
    </div>
<%
    }
%>
</html>
