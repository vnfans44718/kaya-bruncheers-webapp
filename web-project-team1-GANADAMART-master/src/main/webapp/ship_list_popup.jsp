<%@page import="com.itwill.shop.ship.Ship"%>
<%@page import="java.util.List"%>
<%@page import="com.itwill.shop.ship.ShipService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="user_login_check.jspf"%>
<%
ShipService shipService = new ShipService();

//String sUserId = "cccc";

List<Ship> shipList = shipService.findByUserId(sUserId);
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


<!-- 자바스크립트 -->
<script type="text/javascript">
	/* 
	 배송지 삭제 
	 */
	function ship_delete_action(sNo) {
		if(window.confirm('배송지를 삭제하시겠습니까?')){
		document.ship_delete_form.method = 'POST';
		document.ship_delete_form.sNo.value=sNo;
		document.ship_delete_form.action = 'ship_delete_action.jsp';
		document.ship_delete_form.submit();
		}
	}
	/* 
	 배송지 수정
	 */
	function ship_update_action(sNo) {
		let form = document.ship_update_form;
		form.method = 'POST';
		form.sNo.value=sNo;
		console.log(sNo)
		form.action ='ship_update_form.jsp';
		form.submit();
	}
	/* 
	 선택된 배송지
	 */
	 
	
	 
	function ship_select_action(sNo) {
		
		console.log(document.getElementById('sNo_'+sNo).value)
		console.log(document.getElementById('sName_'+sNo).value)
		console.log(document.getElementById('sPhone_'+sNo).value)
		console.log(document.getElementById('sAddr_'+sNo).value)
		document.ship_select_form.sNo.value=document.getElementById('sNo_'+sNo).value;
		document.ship_select_form.sName.value=document.getElementById('sName_'+sNo).value;
		document.ship_select_form.sPhone.value=document.getElementById('sPhone_'+sNo).value;
		document.ship_select_form.sAddr.value=document.getElementById('sAddr_'+sNo).value;
		
	}
	
	function ship_submit(){
		console.log(window.document.ship_select_form);
		opener.order_create_form.sName.value = window.document.ship_select_form.sName.value;
		opener.order_create_form.sPhone.value = window.document.ship_select_form.sPhone.value;
		opener.order_create_form.sAddr.value = window.document.ship_select_form.sAddr.value;
		self.close();
	}
	
</script>

<script type="text/javascript">
function closeWindow(){
window.close();
}
</script>

</head>

<body>

	<!-- 배송지 삭제하기 위한 폼 -->
	<form name='ship_delete_form'>
		<input type='hidden' name='sNo' value="">
	</form>
	<!-- 배송지 수정하기 위한 폼 -->
	<form name='ship_update_form'>
		<input type='hidden' name='sNo' value="">
	</form>
	<!-- 배송지 선택 폼 -->
	<form name="ship_select_form">
		<input type='hidden' name='sNo' value=""> <input type='hidden'
			name='sName' value=""> <input type='hidden' name='sPhone'
			value=""> <input type='hidden' name='sAddr' value="">
	</form>


	<div class="section-top-border" style="padding: 40px">
		<h3 class="mb-30" style="padding-bottom: 10px">배송지 목록</h3>
		<div class="progress-table-wrap" style="overflow: auto;">
			<div class="progress-table" style="background-color: #FFFFFF">
				<div class="table-head">
					<div class="serial"></div>
					<div class="country">이름</div>
					<div class="visit">휴대폰 번호</div>
					<div class="percentage">주소</div>
				</div>
				<%
				if (shipList.isEmpty()) {
				%>
					<div class="progress-table" style="background-color: #FFFFFF; margin-bottom: 0">
					<p style="text-align: center; padding-top: 20px; font-size: 15px;">저장된 배송지가 없습니다.</p>
					</div>
				<%
				} else {
				for (Ship ship : shipList) {
				%>



				<div class="table-row">
					<div class="serial">
						<input type="radio" id='radiobox' name="radiobox"
							onchange="ship_select_action(<%=ship.getSNo()%>)"> <input
							type='hidden' name='sNo' id="sNo_<%=ship.getSNo()%>"
							value="<%=ship.getSNo()%>"> <input type='hidden'
							name='sName' id="sName_<%=ship.getSNo()%>"
							value="<%=ship.getSName()%>"> <input type='hidden'
							name='sPhone' id="sPhone_<%=ship.getSNo()%>"
							value="<%=ship.getSPhone()%>"> <input type='hidden'
							name='sAddr' id="sAddr_<%=ship.getSNo()%>"
							value="<%=ship.getSAddr()%>">

					</div>
					<div class="country">
						<%=ship.getSName()%>
					</div>
					<div class="visit"><%=ship.getSPhone()%></div>
					<div class="visit">
						<%=ship.getSAddr()%>
					</div>
					<div class="visit">
						<button
							onclick="javascript:ship_delete_action(<%=ship.getSNo()%>);"
							style="cursor: pointer; border: 7px solid #FAFAFA; margin: 2px; padding: 1px 5px; background: #FAFAFA;">삭제하기</button>
						<button
							onclick="javascript:ship_update_action(<%=ship.getSNo()%>);"
							style="cursor: pointer; border: 7px solid #FAFAFA; margin: 2px; padding: 1px 5px; background: #FAFAFA;">수정하기</button>
					</div>
				</div>
				<%
				}
				}
				%>
			</div>
			<div class="progress-table" style="background-color: #FFFFFF;">
				<button
					style="text-align: center; width: 48%; cursor: pointer; border: 7px solid #FAFAFA; background: #FAFAFA;"
					onclick="javascript:ship_submit();">확인</button>
				<button
					style="text-align: center; width: 48%; cursor: pointer; border: 7px solid #FAFAFA; background: #FAFAFA;"
					onclick="javascript:closeWindow();">닫기</button>
			</div>
		</div>
	</div>
</body>
</html>



