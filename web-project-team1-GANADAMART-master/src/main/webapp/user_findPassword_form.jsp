<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/main.css">
<div class="login_form_inner">
    <h3>비밀번호 찾기</h3>
    <form class="row login_form" method="post" action="user_findPassword_action.jsp">
        <div class="col-md-12 form-group">
        <input type="text" class="form-control" name="uId" placeholder="아이디" onfocus="this.placeholder = ''" onblur="this.placeholder = '아이디'" value="">
    </div>
    <div class="col-md-12 form-group">
        <input type="text" class="form-control" id ="uPhone" name="uPhone" placeholder="전화번호" onfocus="this.placeholder = ''" onblur="this.placeholder = '전화번호'" value="" oninput="phoneMask(this)" maxlength="13">
    </div>
    <script>
        function addHyphen() {
            var phone = document.getElementById('uPhone');
            var num = phone.value.replace(/-/g, '');

            if (num.length < 4) {
                phone.value = num;
            } else if (num.length < 7) {
                phone.value = num.substr(0, 3) + '-' + num.substr(3);
            } else if (num.length < 11) {
                phone.value = num.substr(0, 3) + '-' + num.substr(3, 4) + '-' + num.substr(7);
            } else {
                phone.value = num.substr(0, 3) + '-' + num.substr(3, 4) + '-' + num.substr(7, 4);
            }
        }
        document.getElementById('uPhone').addEventListener('keyup', addHyphen);
    </script>
    <div class="col-md-12 form-group">
        <button type="submit" value="확인" class="primary-btn">확인</button>
    </div>
</form>
</div>
