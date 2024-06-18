<%@page import="java.net.URLEncoder"%>
<%@page import="com.itwill.shop.user.exception.ExistedUserException"%>
<%@page import="com.itwill.shop.user.UserService"%>
<%@page import="com.itwill.shop.user.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/main.css">
    <script>
        function showSuccessMessageAndRedirect(message) {
            alert(message);
            window.location.href = "user_login_form.jsp";
        }
    </script>
</head>
<%
    if(request.getMethod().equalsIgnoreCase("GET")){
        response.sendRedirect("user_create_form.jsp");
        return;
    }

    String uId = request.getParameter("uId");
    String uPass = request.getParameter("uPass");
    String uName = request.getParameter("uName");
    String uPhone = request.getParameter("uPhone");
    String uEmail1 = request.getParameter("uEmail");
    String uEmail2 = request.getParameter("emailDomainText");
    String uEmail = uEmail1 + "@" + uEmail2;
    String uAddr = request.getParameter("uAddr");
    String uDob = request.getParameter("uDob");

    User newUser = null;

    try{
        newUser = new User(uId, uPass, uName, uPhone, uEmail, uAddr, uDob);
        UserService userService = new UserService();
        int rowCount = userService.create(newUser);
        String successMessage = "회원가입이 성공적으로 완료되었습니다. 로그인 화면으로 이동합니다.";
%>
        <script>
            showSuccessMessageAndRedirect("<%= successMessage %>");
        </script>
<%
    }catch(ExistedUserException e){
        request.setAttribute("msg", e.getMessage());
        request.setAttribute("fuser", newUser);
        RequestDispatcher rd = request.getRequestDispatcher("user_create_form.jsp");
        rd.forward(request, response);
    }catch(Exception e){
        e.printStackTrace();
        response.sendRedirect("user_error.jsp");
    }
%>
</html>
