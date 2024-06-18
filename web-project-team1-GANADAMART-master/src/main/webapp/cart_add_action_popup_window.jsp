<%@page import="com.itwill.shop.cart.CartService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	
	
<%
	String sUserId = (String)session.getAttribute("sUserId");

	if(request.getMethod().equalsIgnoreCase("GET")){
		response.sendRedirect("index.jsp");
		return;
	}
	
	/*
	1.파라메타받기(cart_qty,p_no)
	2.장바구니에 제품을담고 cart_view.jsp로redirection
	*/

	String cart_qtyStr=request.getParameter("cart_qty");
	String p_size = request.getParameter("p_size");
	String p_noStr=request.getParameter("p_no");
	

	CartService cartService=new CartService();

	cartService.ProductCountByAdd(sUserId, Integer.parseInt(p_noStr),Integer.parseInt(cart_qtyStr),Integer.parseInt(p_size));
	
	

%>

<script type="text/javascript">
</script>
</head>
<body>
<div style="width:250px ;margin:0 auto;padding: 0px">
	<img src="http://pics.gmkt.kr/pc/ko/item/vip/img_cartplus_n.png" width="30px" height="30px"
		alt="장바구니이미지">
	<strong style="align-items: center;">상품을 담았습니다.</strong><br><br>

		<div  style="margin: 0 auto;padding: 0px 20px;display: inline-block;width: auto;height: auto;;" >
			<button onclick="window.close();opener.location.reload();" style="font-size: 12pt">
				계속 쇼핑
			</button>
			<button onclick="window.close();opener.location.href='cart.jsp';" style="font-size: 12pt">
				장바구니
			</button> 
			<!-- <button onclick="window.close();opener.location.href='cart_view_select.jsp';">
				장바구니[cart_view_select.jsp]
			</button> 
			<button onclick="window.close();opener.location.href='cart_view_select_update_qty.jsp';">
				장바구니[cart_view_select_update_qty.jsp]
			</button> 
			<button onclick="window.close();opener.location.href='cart_view_select_update_qyt_all_check_delete_image.jsp';">
				장바구니[cart_view_select_update_qyt_all_check_delete_image.jsp]
			</button>  -->
			
			
		</div>
</div>
</body>
</html>

