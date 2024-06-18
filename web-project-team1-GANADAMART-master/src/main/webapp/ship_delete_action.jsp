<%@page import="com.itwill.shop.ship.ShipService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="user_login_check.jspf" %>
<%
/**********

 참고 (ship_list_popup 에서 해줘야 할 일들)  
  

배송 목록에서 x 표시로 되어 있을 버튼을 누르면 sNo 가 넘어와야함  
 스크립트를 이용해 a href 에 함수를 사용 해야한다
 
 - 삭제를 하기 위한 함수
 function cart_delete_item_action(cart_no) {
		if (window.confirm('해당상품을 장바구니에서 삭제하시겠습니까?')) {
	document.cart_delete_item_form.method = 'POST';
	document.cart_delete_item_form.cart_no.value = cart_no;
	document.cart_delete_item_form.action = 'cart_delete_item_action.jsp';
	document.cart_delete_item_form.submit();
		}
	}

- 삭제를 하기위한 hidden 폼 (파라메타를 넘겨주기 위한 동적기능만 수행) -- 이 히든 폼은 스크립트 끝나고 아래쪽에 작성할 것( 식별 용이하게 하기 위함)
<form name="cart_delete_item_form" style="margin: 0">
<input type="hidden" name="cart_no" value="">
</form>

- 화면에서 보여지는 삭제버튼
 href="javascript:cart_delete_item_action((cart_no - 자바 변수 ));"
 


*********/
%>

<%
if (request.getMethod().equalsIgnoreCase("GET")) {
	response.sendRedirect("ship_list_popup.jsp");
	// 어디로 보내는게 좋을까..? 메인으로 보내는 게 깔끔할지 고민해보기
	return;
}

/* 파라메타 받기 */
String sNoStr = request.getParameter("sNo");
if (sNoStr == null || sNoStr.equals("")) {
	response.sendRedirect("ship_list_popup.jsp");
	return;
}

/* 삭제 */
ShipService shipService = new ShipService();
int rowCount = shipService.deleteByShipNo(Integer.parseInt(sNoStr));

response.sendRedirect("ship_list_popup.jsp");

%>
