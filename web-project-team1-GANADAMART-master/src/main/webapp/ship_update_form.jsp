<%@page import="com.itwill.shop.ship.Ship"%>
<%@page import="java.util.List"%>
<%@page import="com.itwill.shop.ship.ShipService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@include file="user_login_check.jspf" %>
<%
if (request.getMethod().equalsIgnoreCase("GET")) {
	response.sendRedirect("ship_list_popup.jsp");
	return;
}
// 파라메타 받기
String sNoStr = request.getParameter("sNo");
ShipService shipService = new ShipService();
Ship ship = shipService.findShipBySNo(Integer.parseInt(sNoStr));
%>

<!DOCTYPE html>
<html lang="zxx" class="no-js">

<head>
<!-- Mobile Specific Meta -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Favicon-->
<link rel="shortcut icon" href="img/fav.png">
<!-- Author Meta -->
<meta name="author" content="CodePixar">
<!-- Meta Description -->
<meta name="description" content="">
<!-- Meta Keyword -->
<meta name="keywords" content="">
<!-- meta character set -->
<meta charset="UTF-8">
<!-- Site Title -->
<title>온 가족 신발 쇼핑 가나다마트</title>

<!--
            CSS
            ============================================= -->
<link rel="stylesheet" href="css/linearicons.css">
<link rel="stylesheet" href="css/owl.carousel.css">
<link rel="stylesheet" href="css/themify-icons.css">
<link rel="stylesheet" href="css/font-awesome.min.css">
<link rel="stylesheet" href="css/nice-select.css">
<link rel="stylesheet" href="css/nouislider.min.css">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/main.css">

<script type="text/javascript">
	/* 
	 * 배송지 수정
	 */
	function ship_update_action() {
		if (document.ship_update_form.sName.value == "") {
			alert("이름을 입력하세요.")
			document.ship_update_form.sName.focus();
			return false;
		}

		if (document.ship_update_form.sPhone.value == "") {
			alert("번호를 입력하세요.")
			document.ship_update_form.sPhone.focus();
			return false;
		}

		if (document.ship_update_form.sAddr.value == "") {
			alert("주소를 입력하세요.")
			document.ship_update_form.sAddr.focus();
			return false;
		}

		if (window.confirm('배송지를 수정하시겠습니까??')) {
			document.ship_update_form.method = 'POST';
			document.ship_update_form.action = 'ship_update_action.jsp';
			document.ship_update_form.submit();
		}
	}
	function no_action() {
		window.location.href = 'ship_list_popup.jsp';
	}
</script>

</head>

<body>


	<div class="section-top-border" style="padding: 40px">
		<h3 class="mb-30" style="padding-bottom: 10px">배송지 수정</h3>
		<div class="progress-table-wrap" style="overflow: auto;">
			<div class="progress-table" style="background-color: #FFFFFF">
				<div class="table-head">
					<div class="serial"></div>
					<div class="country">이름</div>
					<div class="visit">휴대폰 번호</div>
					<div class="percentage">주소</div>
				</div>
				<form name='ship_update_form'>
					<div class="table-row">
						<input type='hidden' name='sNo' value="<%=ship.getSNo()%>">
						<input type='hidden' name='uId' value="<%=ship.getUId()%>">
						<div class="serial"></div>
						<div class="country">
							<input type="text" name='sName' value='<%=ship.getSName()%>'>
						</div>
						<div class="visit">
							<input type="text" name='sPhone' value='<%=ship.getSPhone()%>'>
						</div>
						<div class="visit">
							<input type="text" name='sAddr' value='<%=ship.getSAddr()%>'>
						</div>
						<div class="visit"></div>
					</div>
				</form>
			</div>
			<div class="progress-table" style="background-color: #FFFFFF;">
				<button
					style="text-align: center; width: 48%; cursor: pointer; border: 7px solid #FAFAFA; background: #FAFAFA;"
					onclick="javascript:ship_update_action();">확인</button>
				<button
					style="text-align: center; width: 48%; cursor: pointer; border: 7px solid #FAFAFA; background: #FAFAFA;"
					onclick="javascript:no_action();">취소</button>
			</div>
		</div>
	</div>
</body>
</html>



