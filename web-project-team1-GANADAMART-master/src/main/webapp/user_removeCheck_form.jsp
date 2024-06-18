<!-- user_password_check.jsp -->
<%@page import="com.itwill.shop.user.UserService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="user_login_check.jspf"%>


<%
UserService userService = new UserService();
User user = userService.findUser(sUserId);
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/main.css">


<script type="text/javascript">


   function userCheckPassAction() {


      if (f.uPass.value == "") {
         alert("비밀번호를 입력하세요.");
         f.uPass.focus();
         return;
      }

      document.f.action = "user_removeCheck_action.jsp";
      document.f.method = 'POST';
      document.f.submit();
   }
</script>
</head>
<body>


   <div class="login_form_inner">
       <h3>비밀번호 확인</h3>
       <form class="row login_form" action="" method="post" name="f">
           <div class="col-md-12 form-group">
               <input type="hidden" name="uId" value="<%=user.getUId()%>">
               <input type="password" class="form-control" id="uPass" name="uPass" placeholder="비밀번호" onfocus="this.placeholder = ''" onblur="this.placeholder = '비밀번호'" autofocus="autofocus" >
           </div>
           <div class="col-md-12 form-group">
               <button type="submit" value="확인" onclick="userCheckPassAction()" class="primary-btn">확인</button>
           </div>
       </form>
   </div>
</body>
</html>

