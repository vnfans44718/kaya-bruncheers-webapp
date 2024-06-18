<%@page import="com.itwill.shop.ship.Ship"%>
<%@page import="com.itwill.shop.ship.ShipService"%>
<%@page import="com.itwill.shop.user.User"%>
<%@page import="com.itwill.shop.user.UserService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="user_login_check.jspf" %>
<%
/* User loginUser = new UserService().findUser("cccc"); */

/* Get 방식으로 들어오면 홈페이지 메인으로 이동*/
if (request.getMethod().equalsIgnoreCase("GET")) {
	response.sendRedirect("index.jsp");
	return;
}


/* 파라메타 받기 */
String shipType = request.getParameter("shipType");
if (shipType == null) {
	shipType = "";
}

/* 세션으로부터 주문 데이터 뽑기 */
// 생각해보니 필요없을 듯 하다 (order_create_form에서 name 만 변수이름과 같게 하면 됨)
/* Ship ship = (Ship) session.getAttribute("ship");
if (ship == null) {
	response.sendRedirect("index.jsp");
	return;
} */

Ship ship = new Ship();
//ship.setSNo(3);
/*세션일 경우 수정 필요*/
ship.setSName(request.getParameter("sName"));
ship.setSPhone(request.getParameter("sPhone"));
ship.setSAddr(request.getParameter("sAddr"));
ship.setUId(sUserId);


ShipService shipService = new ShipService();
// 기본 배송지 설정일 경우
int rowCount = 0;
int updateRowCount = 0;
int InsertRowCount = 0;
if (shipType.equals("defaultShip")) {
	if (shipService.findByUserId(sUserId) == null) {
		// 배송지가 하나도 없었을 경우 
		rowCount = shipService.insert(ship);
		
	} else {
		// 기본 배송지가 있던 경우 
		int defaultShipNo = shipService.findDefaultAddr(sUserId).getSNo();
		ship.setSNo(defaultShipNo);
		updateRowCount = shipService.update(ship);
		
	}

} else if (shipType.equals("addShip")) {
	// 배송지 추가 (기본배송지 x)
	InsertRowCount = shipService.insert(ship);
} else {
	response.sendRedirect("index.jsp");
}
%>
<script type="text/javascript">
history.back();
</script>

