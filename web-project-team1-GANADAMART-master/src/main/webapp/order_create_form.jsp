<%@page import="com.itwill.shop.ship.Ship"%>
<%@page import="com.itwill.shop.ship.ShipService"%>
<%@page import="java.text.Format"%>
<%@page import="java.io.Console"%>
<%@page import="com.itwill.shop.product.ProductOption"%>
<%@page import="org.apache.catalina.connector.Response"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page
	import="ch.qos.logback.core.recovery.ResilientSyslogOutputStream"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.itwill.shop.user.User"%>
<%@page import="com.itwill.shop.user.UserService"%>
<%@page import="com.itwill.shop.order.Order"%>
<%@page import="com.itwill.shop.order.OrderItem"%>
<%@page import="com.itwill.shop.order.OrderService"%>
<%@page import="com.itwill.shop.cart.Cart"%>
<%@page import="com.itwill.shop.cart.CartService"%>
<%@page import="com.itwill.shop.product.Product"%>
<%@page import="com.itwill.shop.product.ProductService"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="user_login_check.jspf"%>
<%
if (request.getMethod().equalsIgnoreCase("GET")) {
	response.sendRedirect("index.jsp");
	return;
}
String buyType = request.getParameter("buyType");
if (buyType == null) {

	response.sendRedirect("category.jsp");
	return;
}

/* 기본배송지 회원 */
ShipService shipService = new ShipService();
Ship defaultShip = shipService.findDefaultAddr(sUserId);
if(defaultShip==null){
Ship ship = Ship.builder().sName(sUser.getUName()).sPhone(sUser.getUPhone()).sAddr(sUser.getUAddr()).uId(sUserId).build();
shipService.insert(ship);
defaultShip = shipService.findDefaultAddr(sUserId);
}



/*service 객체 생성 */

OrderService orderService = new OrderService();
CartService cartService = new CartService();
ProductService productService = new ProductService();

/*로그인 유저 및 주문 객체 생성 */

Order order = new Order();

List<Cart> cartList = new ArrayList<Cart>();
String[] cart_noStr_array = new String[]{};
int totPrice = 0;
int totOrderItem = 0;

if (buyType.equals("cart")) {

	/* 카트 전체 구매*/

	cartList = cartService.getCartItemByUserId("sUserId");

	for (Cart cart : cartList) {
		order.getOrderItemList()
		.add(OrderItem.builder().oiQty(cart.getCQty()).productOption(cart.getProductOption()).build());
		totPrice += cart.getCQty() * cart.getProductOption().getProduct().getPPrice();

	}
	/* 카트 선택 구매*/
} else if (buyType.equals("cart_select")) {
	cart_noStr_array = request.getParameterValues("cart_no");

	if (cart_noStr_array == null) {
		response.sendRedirect("category.jsp");
		return;
	}
	for (String cart_noStr : cart_noStr_array) {
		int cart_no = Integer.parseInt(cart_noStr);

		Cart cart = cartService.getCartItemByCartNo(cart_no);
		ProductOption productOption = cart.getProductOption();

		order.getOrderItemList()
		.add(OrderItem.builder().oiQty(cart.getCQty()).productOption(cart.getProductOption()).build());
		totPrice += cart.getCQty() * cart.getProductOption().getProduct().getPPrice();

	}

} else if (buyType.equals("direct")) {
	String p_noStr = request.getParameter("p_no");
	String p_qtyStr = request.getParameter("p_qty");
	String po_size = request.getParameter("o_p_size");

	if (p_noStr == null || p_qtyStr == null || po_size == null) {
		response.sendRedirect("category.jsp");
		return;
	}

	int p_no = Integer.parseInt(p_noStr);
	int p_qty = Integer.parseInt(p_qtyStr);
	int p_size = Integer.parseInt(po_size);

	ProductOption productOption = ProductOption.builder().poSize(p_size).product(productService.productByPK(p_no))
	.build();
	order.getOrderItemList().add(OrderItem.builder().oiQty(p_qty).productOption(productOption).build());
	totPrice = order.getOrderItemList().get(0).getOiQty()
	* order.getOrderItemList().get(0).getProductOption().getProduct().getPPrice();
}

order.setUId(sUser.getUId());
order.setOPrice(totPrice);

/**********************세션에 주문데이타담기***************************/
session.setAttribute("order", order);
/*********************************************************************/

StringBuilder title = new StringBuilder(128);
%>


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
<script type="text/javascript" charset="UTF-8"
	src="https://maps.googleapis.com/maps-api-v3/api/js/56/3/intl/ko_ALL/common.js"></script>
<script type="text/javascript" charset="UTF-8"
	src="https://maps.googleapis.com/maps-api-v3/api/js/56/3/intl/ko_ALL/util.js"></script>
<link type="text/css" rel="stylesheet" charset="UTF-8"
	href="https://www.gstatic.com/_/translate_http/_/ss/k=translate_http.tr.qhDXWpKopYk.L.W.O/am=wA/d=0/rs=AN8SPfq5gedF4FIOWZgYyMCNZA5tU966ig/m=el_main_css">
</head>

<!-- 다음 주소 api -->
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function addressApi() {
		new daum.Postcode({
			oncomplete : function(data) {
				console.log(data);
				console.log(data.address);
				document.getElementById('sAddr').value = data.address;
			}
		}).open();
	}
</script>


<!-- 배송목록 팝업 -->
<script type="text/javascript">
	function openShipList(uId) {
		
			let shipListPopup = window.open('ship_list_popup.jsp', '배송목록',
					"width=1000,height=0,innerHeight=1200");
			window.location.reload();
			
		
	}
</script>

<!-- 결제목록 팝업 -->
<script type="text/javascript">
	function openPayment() {
		
			let openPaymentPopup = window.open('order_payment_popup.jsp', '결제하기',
					"width=500,height=0,innerHeight=610" );
		
	}
</script>




<script>
function handleRadioChange(checkedRadio) {

    console.log("handleRadioChange 함수가 실행되었습니다.");

    let sName = document.getElementById('sName');

    if (!sName) {
        console.error("rcvrName 엘리먼트를 찾을 수 없습니다.");
        return;
    }
    

    if (checkedRadio == 'defaultShip' ) {
        console.log("기본 배송지 라디오 버튼이 체크되었습니다.");
        sName.value = "<%=defaultShip.getSName()%>"; // 기본값으로 설정
        sPhone.value = "<%=defaultShip.getSPhone()%>";
        sAddr.value = "<%=defaultShip.getSAddr()%>";
		}

		else {
			console.log("기본 배송지 라디오버튼이 체크되지 않았습니다.");
			sName.value = ""; // 다른 라디오 버튼이 선택될 때 텍스트 비우기
			sPhone.value = "";
			sAddr.value = "";
		}
	}
</script>
<script type="text/javascript">
	/*
	 * 주문
	 */
	function order_create_form_submit() {
		if (document.order_create_form.sName.value == ''
				|| document.order_create_form.sPhone.value == ''
				|| document.order_create_form.sAddr.value == '') {
			alert("배송지를 모두 입력해주세요");
			document.order_create_form.sName.focus();
			return;
		}
		if (document.order_create_form.oPayment.value == '') {
			alert("결제정보가 입력되지 않았습니다.");
			return;
		}
		document.order_create_form.method = 'POST';
		document.order_create_form.action = 'order_create_action.jsp';
		document.order_create_form.submit();

	}
</script>
<script type="text/javascript">
	function setShip(shipType) {
		if (document.order_create_form.sName.value == ''
				|| document.order_create_form.sPhone.value == ''
				|| document.order_create_form.sAddr.value == '') {
			alert("배송지를 모두 입력해주세요");
			document.order_create_form.sName.focus();
			return;
		}
		document.order_create_form.shipType.value = shipType;
		document.order_create_form.method = 'POST';
		document.order_create_form.action = 'ship_create_action.jsp';
		document.order_create_form.submit();
		alert("배송지 성공 짝짝짝!!");
		
	}
</script>
<body>

	<!-- Start Header Area -->
	<div id="undefined-sticky-wrapper" class="sticky-wrapper"
		style="height: 80px;">
		<header class="header_area sticky-header">
			<div class="main_menu">
				<nav class="navbar navbar-expand-lg navbar-light main_box">
					<div class="container">
						<!-- Brand and toggle get grouped for better mobile display -->
						<a class="navbar-brand logo_h" href="index.jsp"><img
							src="img/banner/GANADA-Mart.png" alt=""></a>
						<button class="navbar-toggler" type="button"
							data-toggle="collapse" data-target="#navbarSupportedContent"
							aria-controls="navbarSupportedContent" aria-expanded="false"
							aria-label="Toggle navigation">
							<span class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
						<!-- Collect the nav links, forms, and other content for toggling -->
						<div class="collapse navbar-collapse offset"
							id="navbarSupportedContent">
							<ul class="nav navbar-nav menu_nav ml-auto mr-auto">
								<li class="nav-item active"><a class="nav-link"
									href="index.jsp">Home</a></li>
								<li class="nav-item submenu dropdown"><a
									href="category.jsp" class="nav-link dropdown-toggle"
									data-toggle="dropdown" role="button" aria-haspopup="true"
									aria-expanded="false">Shop</a>
									<ul class="dropdown-menu">
										<li class="nav-item"><a class="nav-link"
											href="category.jsp?category=1">스니커즈</a></li>
										<li class="nav-item"><a class="nav-link"
											href="category.jsp?category=2">스포츠</a></li>
										<li class="nav-item"><a class="nav-link"
											href="category.jsp?category=3">구두</a></li>
										<li class="nav-item"><a class="nav-link"
											href="category.jsp?category=4">샌들</a></li>
										<li class="nav-item"><a class="nav-link"
											href="category.jsp?category=5">캐주얼</a></li>
										<li class="nav-item"><a class="nav-link"
											href="category.jsp?category=6">부츠</a></li>
									</ul></li>
								<li class="nav-item submenu dropdown"><a
									href="user_view.jsp" class="nav-link dropdown-toggle"
									data-toggle="dropdown" role="button" aria-haspopup="true"
									aria-expanded="false">MyPage</a>
									<ul class="dropdown-menu">
										<li class="nav-item"><a class="nav-link"
											href="user_view.jsp">내정보</a></li>
										<li class="nav-item"><a class="nav-link" href="cart.jsp">장바구니</a></li>
										<li class="nav-item"><a class="nav-link"
											href="order_list.jsp">주문내역</a></li>
									</ul></li>
								<li class="nav-item submenu dropdown"><a
									href="board_list.jsp" class="nav-link dropdown-toggle"
									data-toggle="dropdown" role="button" aria-haspopup="true"
									aria-expanded="false">Board</a>
									<ul class="dropdown-menu">
										<li class="nav-item"><a class="nav-link"
											href="cs_list.jsp">Q&A</a></li>
										<li class="nav-item"><a class="nav-link"
											href="board_list.jsp">자유게시판</a></li>
									</ul></li>

							</ul>
							<%
							if (sUserId == null) {
							%>


							<ul class="nav navbar-nav navbar-right">
								<li class="nav-item"><a href="user_login_form.jsp"
									class="cart"><img alt="" src="img/login.png"
										style="padding-top: 15px"></a></li>
								<li class="nav-item"><a href="user_create_form.jsp"
									class="cart"><img alt="" src="img/join.png"
										style="padding-top: 15px"></a></li>
								<li class="nav-item"><a href="cart.jsp" class="cart"><img
										alt="" src="img/cart.png" style="padding-top: 15px"></a></li>
								<li class="nav-item">
									<button class="search">
										<span class="lnr lnr-magnifier" id="search"
											style="font-size: 25px"></span>
									</button>
								</li>
							</ul>
							<%
							} else {
							%>
							<ul class="nav navbar-nav navbar-right">
								<li class="nav-item"><a href="user_logout_action.jsp"
									class="cart"><img alt="" src="img/logout.png"
										style="padding-top: 15px"></a></li>
								<li class="nav-item"><a href="user_view.jsp" class="cart"><img
										alt="" src="img/my.png" style="padding-top: 15px"></a></li>
								<li class="nav-item"><a href="cart.jsp" class="cart"><img
										alt="" src="img/cart.png" style="padding-top: 15px"></a></li>
								<li class="nav-item">
									<button class="search">
										<span class="lnr lnr-magnifier" id="search"
											style="font-size: 25px"></span>
									</button>
								</li>
							</ul>
							<%
							}
							%>
						</div>
					</div>
				</nav>
			</div>
			<div class="search_input" id="search_input_box">
				<div class="container">
					<form class="d-flex justify-content-between"
						action="category_product_search.jsp?search=${search}">
						<input type="text" class="form-control" name="search"
							id="search_input" placeholder="Search Here">
						<button type="submit" class="btn"></button>
						<span class="lnr lnr-cross" id="close_search" title="Close Search"></span>
					</form>
				</div>
			</div>
		</header>
	</div>
	<!-- End Header Area -->

	<!-- Start Banner Area -->
	<section class="banner-area organic-breadcrumb">
		<div class="container">
			<div
				class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
				<div class="col-first">
					<h1 style="color: #CF1010">Order</h1>

					</nav>
				</div>
			</div>
		</div>
	</section>
	<!-- End Banner Area -->

	<!--================Checkout Area =================-->
	<section class="checkout_area section_gap">
		<div class="container">
			<!-- 주문자 정보 -->
			<div class="returning_customer">
				<div class="check_title"></div>
				<p>
					<font style="vertical-align: inherit;"></font>
				</p>
				<form class="row contact_form" action="#" method="post"
					style="margin-left: 0" novalidate="novalidate">
					<div class="col-md-6 form-group p_star" style="padding-left: 0">
						<h4>
							<font style="vertical-align: inherit;"><font
								style="vertical-align: inherit; font-weight: 600;">주문자 정보</font></font>
						</h4>
					</div>
					<div class="col-md-6 form-group p_star"></div>
					<div class="col-md-6 form-group p_star">
						<font style="vertical-align: inherit;"><font
							style="vertical-align: inherit;">이름 : <%=sUser.getUName()%></font></font><span><font
							style="vertical-align: inherit;"></font></span>
					</div>
					<div class="col-md-6 form-group p_star">
						<font style="vertical-align: inherit;"><font
							style="vertical-align: inherit;">전화번호 : <%=sUser.getUPhone()%></font></font><span><font
							style="vertical-align: inherit;"></font></span>
					</div>
					<div class="col-md-6 form-group p_star">
						<font style="vertical-align: inherit;"><font
							style="vertical-align: inherit;">이메일 : <%=sUser.getUEmail()%></font></font><span><font
							style="vertical-align: inherit;"></font></span>
					</div>
				</form>
			</div>
			<!-- 주문자 정보 끝 -->
			<!--  배송 정보 -->
			<div class="cupon_area">
				<div class="check_title"></div>
			</div>
			<div class="billing_details">
				<div class="row">
					<div class="col-lg-8">
						<h3>
							<font style="vertical-align: inherit;"><font
								style="vertical-align: inherit; font-weight: 600;">배송정보</font></font>
						</h3>
						<!--  배송 정보  폼 id와 name 확인!-->
						<%-- <form id='ship_form' name="ship_form' <!-- class=" row contact_form"
							action="#" method="post" novalidate="novalidate" -->> --%>

						<div class="col-md-12 form-group">

							<p style="color: #424242;">&nbsp;&nbsp;배송지 선택</p>
							&nbsp;&nbsp;&nbsp;<input id="defaultShip" name="shipRadio"
								type="radio" value="defaultShip"
								onchange="handleRadioChange(this.value)"> &nbsp; <label
								for="defaultShip" id="defaultShipLabel">기본배송지</label>

							&nbsp;&nbsp;&nbsp;<input id="newShip" name="shipRadio"
								type="radio" value="newShip" checked="checked"
								onchange="handleRadioChange(this.value)"> &nbsp; <label
								for="newShip" id="ShipLabel">신규입력</label>

							<button id="popMemberAddrList" type="button"
								style="margin-left: 15px;"
								onclick="openShipList('<%=sUser.getUId()%>')"
								class="btn btn-gray btn-sm btn-dialog">배송 주소록</button>
						</div>
						<form name="order_create_form">
							<div class="col-md-12 form-group">
								<input type="hidden" class="form-control" id="sNo" name="sNo">
							</div>
							<input type="hidden" name="shipType" value="">
							<div class="col-md-12 form-group">
								<p style="color: #424242;">&nbsp;&nbsp;이름</p>
								<input type="text" class="form-control" id="sName" name="sName"
									placeholder="이름을 입력해주세요.">
							</div>
							<div class="col-md-12 form-group">
								<p style="color: #424242;">&nbsp;&nbsp;휴대폰번호</p>
								<input type="text" class="form-control" id="sPhone"
									name="sPhone" placeholder="휴대폰번호를 입력해주세요.">
							</div>
							<div class="col-md-12 form-group">
								<p style="color: #424242;">
									&nbsp;&nbsp;주소 &nbsp;&nbsp;&nbsp;&nbsp;
									<button id="btnPostCode" type="button"
										class="btn btn-sm btn-line" onclick="addressApi()">우편번호
										찾기</button>
								</p>
								<input type="text" class="form-control" id="sAddr" name="sAddr"
									placeholder="주소를 입력해주세요.">

							</div>
							<div class="col-md-12 form-group">
								&nbsp;&nbsp;
								<button id="setDefaultAddrBtn" type="button"
									class="btn btn-sm btn-line btn-dialog"
									onclick="setShip('defaultShip')">기본배송지로 설정</button>
								<button id="addAddrBtn" type="button"
									class="btn btn-sm btn-line btn-dialog"
									onclick="setShip('addShip')">내 배송지에 추가</button>

							</div>

							<!-- <a class="primary-btn"
								href="javascript:order_create_form_submit();"><font
								style="vertical-align: inherit;"><font
									style="vertical-align: inherit;">결제하기</font></font></a> -->


							<div class="col-md-12 form-group">
								<div class="creat_account">

									<label for="f-option2"><font
										style="vertical-align: inherit;"></font></label>
								</div>
							</div>
							<div class="col-md-12 form-group">
								<div class="creat_account">

									<label for="f-option3"><font
										style="vertical-align: inherit;"></font></label>
								</div>

							</div>

							<!--  배송 정보 끝 -->

							<!--================ 주문아이템 =================-->
							<section class="order_item_area" style="padding: 0">
								<h3>
									<font style="vertical-align: inherit;"><font
										style="vertical-align: inherit; font-weight: 600;">상품
											정보</font></font>
								</h3>
								<div class="container" style="padding: 0">
									<div class="cart_inner">
										<div class="table-responsive">


											<input type="hidden" name="buyType" value=<%=buyType%>>
											<%
											for (String cart : cart_noStr_array) {
											%>
											<input type="hidden" name="c_no" value="<%=cart%>">
											<%
											}
											%>
											<table class="table">
												<thead>
													<tr>
														<th scope="col">상품정보&nbsp;&nbsp;&nbsp;&nbsp;</th>
														<th scope="col">주문수량</th>
														<th scope="col">주문가격</th>
													</tr>
												</thead>

												<tbody>
													<%
													for (OrderItem orderItem : order.getOrderItemList()) {
														totOrderItem = orderItem.getOiQty() * orderItem.getProductOption().getProduct().getPPrice();
													%>
													<tr>
														<td>
															<div class="media">
																<div class="d-flex">
																	<img width="150" height="150"
																		src="img/product/<%=orderItem.getProductOption().getProduct().getPImg()%>"
																		alt="">
																</div>
																<div class="media-body">
																	<p>
																		상품이름:
																		<%=orderItem.getProductOption().getProduct().getPName()%>
																	</p>
																	<p>
																		사이즈:
																		<%=orderItem.getProductOption().getPoSize()%>
																	</p>
																</div>
															</div>
														</td>
														<td>
															<div class="product_count">
																<input type="text" name="qty" id="sst" maxlength="12"
																	value="<%=orderItem.getOiQty()%>" title="Quantity:"
																	class="input-text qty">
															</div>
														</td>
														<td>
															<h5>
																<h5><%=new DecimalFormat("#,###").format(totOrderItem)%>원
																</h5>
															</h5>
														</td>
													</tr>
													<%
													}
													%>
													<td></td>
													<td style="font-weight: 600; text-align: center">총 주문
														금액</td>
													<td
														style="font-weight: 600; text-align: center; padding-right: 0"><%=new DecimalFormat("#,###").format(totPrice)%>원</td>

													<tr class="bottom_button">
													</tr>
													<tr>
													</tr>
													<tr class="out_button_area">

													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</section>
							<!-- 결제정보  -->
							<h3>
								<font style="vertical-align: inherit;"><font
									style="vertical-align: inherit; font-weight: 600;">결제정보</font></font>
								<div class="col-md-12 form-group">
									<input type="hidden" id="oPayment" name="oPayment" value="">
									<button id="payment" type="button" onclick="openPayment();"
										class="btn btn-gray btn-sm btn-dialog"
										style="margin-top: 20px; width: 100%; height: 50px;">결제정보
										입력하기</button>
								</div>
							</h3>
							<!-- 결제정보 끝  -->
					</div>

					</form>
					<!--================ 주문아이템  끝=================-->



					<div class="col-lg-4">
						<div class="order_box">
							<h2>
								<font style="vertical-align: inherit;"><font
									style="vertical-align: inherit;">주문</font></font>
							</h2>
							<ul class="list">
								<li><a href="#"><font style="vertical-align: inherit;"><font
											style="vertical-align: inherit;">제품</font></font><span><font
											style="vertical-align: inherit;"><font
												style="vertical-align: inherit;">가격</font></font></span></a></li>

								<%
								for (OrderItem orderItem : order.getOrderItemList()) {
									totOrderItem = orderItem.getOiQty() * orderItem.getProductOption().getProduct().getPPrice();
									StringBuilder subStrName = new StringBuilder(128);
									String productName = orderItem.getProductOption().getProduct().getPName();
									if (productName.length() > 10) {
										productName = String.format("%s...", productName.substring(0, 10));
									}
								%>
								<li><a href="#"><font style="vertical-align: inherit;"><font
											style="vertical-align: inherit; width: 150"><%=productName%></font></font><span
										style="margin: 0" class="middle"><font
											style="vertical-align: inherit;"><font
												style="vertical-align: inherit;"><%=orderItem.getOiQty()%>개</font></font></span>
										<span class="last"><%=new DecimalFormat("#,###").format(totOrderItem)%>원</span></a></li>

								<%
								}
								%>

							</ul>
							<ul class="list list_2">
								<li><a href="#"><font style="vertical-align: inherit;"><font
											style="vertical-align: inherit; visibility: hidden;">소계</font></font><span
										style="visibility: hidden;"><%=new DecimalFormat("#,###").format(totPrice)%>원</span></a></li>
								<li></li>
								<li><a href="#"><font style="vertical-align: inherit;"><font
											style="vertical-align: inherit;">총 가격</font></font><span><%=new DecimalFormat("#,###").format(totPrice)%>원</span></a></li>
							</ul>
							<div class="payment_item">
								<div class="radion_btn">
									<input type="radio" id="f-option5" name="selector">


								</div>

							</div>
							<div class="payment_item active">
								<div class="radion_btn">
									<input type="radio" id="f-option6" name="selector"> <img
										src="img/product/card.jpg" alt="">
								</div>

							</div>

							<!-- 		<a class="primary-btn"
								href="javascript:order_create_form_submit();"><font
								style="vertical-align: inherit;"><font
									style="vertical-align: inherit;">주문완료</font></font></a> -->

							<button class="primary-btn" type="button"
								style="border: 0; width: 290px; height: 38px; margin-top: 10px; margin-bottom: 10px;"
								onclick="javascript:order_create_form_submit();">
								<font style="vertical-align: inherit;"> <font
									style="vertical-align: inherit;">결제하기</font>
								</font>
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================End Checkout Area =================-->

	<!-- start footer Area -->
	<footer class="footer-area section_gap">
		<div class="container">
			<div class="row">
				<div class="col-lg-3  col-md-6 col-sm-6">
					<div class="single-footer-widget">
						<h6>
							<font style="vertical-align: inherit;"><font
								style="vertical-align: inherit;">회사 소개</font></font>
						</h6>
						<p>
							<font style="vertical-align: inherit;"><font
								style="vertical-align: inherit;"> 환자를 돌보는 것이 중요합니다. 그는
									환자의 성장을 따르지만 동시에 노동과 고통의 결과로 발생합니다. </font></font>
						</p>
					</div>
				</div>
				<div class="col-lg-4  col-md-6 col-sm-6">
					<div class="single-footer-widget">
						<h6>
							<font style="vertical-align: inherit;"><font
								style="vertical-align: inherit;">뉴스 레터</font></font>
						</h6>
						<p>
							<font style="vertical-align: inherit;"><font
								style="vertical-align: inherit;">최신 소식을 받아보세요</font></font>
						</p>
						<div class="" id="mc_embed_signup">

							<form target="_blank" novalidate="true"
								action="https://spondonit.us12.list-manage.com/subscribe/post?u=1462626880ade1ac87bd9c93a&amp;id=92a4423d01"
								method="get" class="form-inline">

								<div class="d-flex flex-row">

									<input class="form-control" name="EMAIL"
										placeholder="이메일을 입력하세요" onfocus="this.placeholder = ''"
										onblur="this.placeholder = 'Enter Email '" required=""
										type="email">


									<button class="click-btn btn btn-default">
										<i class="fa fa-long-arrow-right" aria-hidden="true"></i>
									</button>
									<div style="position: absolute; left: -5000px;">
										<input name="b_36c4fd991d266f23781ded980_aefe40901a"
											tabindex="-1" value="" type="text">
									</div>

									<!-- <div class="col-lg-4 col-md-4">
													<button class="bb-btn btn"><span class="lnr lnr-arrow-right"></span></button>
												</div>  -->
								</div>
								<div class="info"></div>
							</form>
						</div>
					</div>
				</div>
				<div class="col-lg-3  col-md-6 col-sm-6">
					<div class="single-footer-widget mail-chimp">
						<h6 class="mb-20">
							<font style="vertical-align: inherit;"><font
								style="vertical-align: inherit;">인스타그램 피드</font></font>
						</h6>
						<ul class="instafeed d-flex flex-wrap">
							<li><img src="img/i1.jpg" alt=""></li>
							<li><img src="img/i2.jpg" alt=""></li>
							<li><img src="img/i3.jpg" alt=""></li>
							<li><img src="img/i4.jpg" alt=""></li>
							<li><img src="img/i5.jpg" alt=""></li>
							<li><img src="img/i6.jpg" alt=""></li>
							<li><img src="img/i7.jpg" alt=""></li>
							<li><img src="img/i8.jpg" alt=""></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-2 col-md-6 col-sm-6">
					<div class="single-footer-widget">
						<h6>
							<font style="vertical-align: inherit;"><font
								style="vertical-align: inherit;">우리를 팔로우하세요</font></font>
						</h6>
						<p>
							<font style="vertical-align: inherit;"><font
								style="vertical-align: inherit;">우리 사회생활하자</font></font>
						</p>
						<div class="footer-social d-flex align-items-center">
							<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
								class="fa fa-twitter"></i></a> <a href="#"><i
								class="fa fa-dribbble"></i></a> <a href="#"><i
								class="fa fa-behance"></i></a>
						</div>
					</div>
				</div>
			</div>
			<div
				class="footer-bottom d-flex justify-content-center align-items-center flex-wrap">
				<p class="footer-text m-0">
					<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					<font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;"> 저작권 © </font></font>
					<script>
						document.write(new Date().getFullYear());
					</script>
					<font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">2024 판권 소유 | </font><font
						style="vertical-align: inherit;">이 템플릿은 다음과 같이 만들어졌습니다.</font></font><i
						class="fa fa-heart-o" aria-hidden="true"></i><font
						style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">작성자: </font></font><a
						href="https://colorlib.com" target="_blank"><font
						style="vertical-align: inherit;"><font
							style="vertical-align: inherit;">Colorlib</font></font></a>
					<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
				</p>
			</div>
		</div>
	</footer>
	<!-- End footer Area -->


	<script src="js/vendor/jquery-2.2.4.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"
		integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
		crossorigin="anonymous"></script>
	<script src="js/vendor/bootstrap.min.js"></script>
	<script src="js/jquery.ajaxchimp.min.js"></script>
	<script src="js/jquery.nice-select.min.js"></script>
	<script src="js/jquery.sticky.js"></script>
	<script src="js/nouislider.min.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<!--gmaps Js-->
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCjCGmQ0Uq4exrzdcL6rvxywDDOvfAu6eE"></script>
	<script src="js/gmaps.min.js"></script>
	<script src="js/main.js"></script>
	<div id="goog-gt-tt" class="VIpgJd-yAWNEb-L7lbkb skiptranslate"
		style="border-radius: 12px; margin: 0 0 0 -23px; padding: 0; font-family: 'Google Sans', Arial, sans-serif;"
		data-id="">
		<div id="goog-gt-vt" class="VIpgJd-yAWNEb-hvhgNd">
			<div class=" VIpgJd-yAWNEb-hvhgNd-l4eHX-i3jM8c">
				<img
					src="https://fonts.gstatic.com/s/i/productlogos/translate/v14/24px.svg"
					width="24" height="24" alt="">
			</div>
			<div class=" VIpgJd-yAWNEb-hvhgNd-k77Iif-i3jM8c">
				<div class="VIpgJd-yAWNEb-hvhgNd-IuizWc" dir="ltr">원본 텍스트</div>
				<div id="goog-gt-original-text"
					class="VIpgJd-yAWNEb-nVMfcd-fmcmS VIpgJd-yAWNEb-hvhgNd-axAV1"></div>
			</div>
			<div class="VIpgJd-yAWNEb-hvhgNd-N7Eqid ltr">
				<div class="VIpgJd-yAWNEb-hvhgNd-N7Eqid-B7I4Od ltr" dir="ltr">
					<div class="VIpgJd-yAWNEb-hvhgNd-UTujCb">번역 평가</div>
					<div class="VIpgJd-yAWNEb-hvhgNd-eO9mKe">보내주신 의견은 Google 번역을
						개선하는 데 사용됩니다.</div>
				</div>
				<div class="VIpgJd-yAWNEb-hvhgNd-xgov5 ltr">
					<button id="goog-gt-thumbUpButton" type="button"
						class="VIpgJd-yAWNEb-hvhgNd-bgm6sf" title="번역 품질 좋음"
						aria-label="번역 품질 좋음" aria-pressed="false">
						<span id="goog-gt-thumbUpIcon"><svg width="24" height="24"
								viewBox="0 0 24 24" focusable="false"
								class="VIpgJd-yAWNEb-hvhgNd-THI6Vb NMm5M">
								<path
									d="M21 7h-6.31l.95-4.57.03-.32c0-.41-.17-.79-.44-1.06L14.17 0S7.08 6.85 7 7H2v13h16c.83 0 1.54-.5 1.84-1.22l3.02-7.05c.09-.23.14-.47.14-.73V9c0-1.1-.9-2-2-2zM7 18H4V9h3v9zm14-7l-3 7H9V8l4.34-4.34L12 9h9v2z"></path></svg></span><span
							id="goog-gt-thumbUpIconFilled"><svg width="24" height="24"
								viewBox="0 0 24 24" focusable="false"
								class="VIpgJd-yAWNEb-hvhgNd-THI6Vb NMm5M">
								<path
									d="M21 7h-6.31l.95-4.57.03-.32c0-.41-.17-.79-.44-1.06L14.17 0S7.08 6.85 7 7v13h11c.83 0 1.54-.5 1.84-1.22l3.02-7.05c.09-.23.14-.47.14-.73V9c0-1.1-.9-2-2-2zM5 7H1v13h4V7z"></path></svg></span>
					</button>
					<button id="goog-gt-thumbDownButton" type="button"
						class="VIpgJd-yAWNEb-hvhgNd-bgm6sf" title="번역 품질 좋지 않음"
						aria-label="번역 품질 좋지 않음" aria-pressed="false">
						<span id="goog-gt-thumbDownIcon"><svg width="24"
								height="24" viewBox="0 0 24 24" focusable="false"
								class="VIpgJd-yAWNEb-hvhgNd-THI6Vb NMm5M">
								<path
									d="M3 17h6.31l-.95 4.57-.03.32c0 .41.17.79.44 1.06L9.83 24s7.09-6.85 7.17-7h5V4H6c-.83 0-1.54.5-1.84 1.22l-3.02 7.05c-.09.23-.14.47-.14.73v2c0 1.1.9 2 2 2zM17 6h3v9h-3V6zM3 13l3-7h9v10l-4.34 4.34L12 15H3v-2z"></path></svg></span><span
							id="goog-gt-thumbDownIconFilled"><svg width="24"
								height="24" viewBox="0 0 24 24" focusable="false"
								class="VIpgJd-yAWNEb-hvhgNd-THI6Vb NMm5M">
								<path
									d="M3 17h6.31l-.95 4.57-.03.32c0 .41.17.79.44 1.06L9.83 24s7.09-6.85 7.17-7V4H6c-.83 0-1.54.5-1.84 1.22l-3.02 7.05c-.09.23-.14.47-.14.73v2c0 1.1.9 2 2 2zm16 0h4V4h-4v13z"></path></svg></span>
					</button>
				</div>
			</div>
			<div id="goog-gt-votingHiddenPane"
				class="VIpgJd-yAWNEb-hvhgNd-aXYTce">
				<form id="goog-gt-votingForm"
					action="//translate.googleapis.com/translate_voting?client=te_lib"
					method="post" target="votingFrame"
					class="VIpgJd-yAWNEb-hvhgNd-aXYTce">
					<input type="text" name="sl" id="goog-gt-votingInputSrcLang"><input
						type="text" name="tl" id="goog-gt-votingInputTrgLang"><input
						type="text" name="query" id="goog-gt-votingInputSrcText"><input
						type="text" name="gtrans" id="goog-gt-votingInputTrgText"><input
						type="text" name="vote" id="goog-gt-votingInputVote">
				</form>
				<iframe name="votingFrame" frameborder="0"></iframe>
			</div>
		</div>
	</div>


</body>
</html>