<%@page import="java.text.DecimalFormat"%>
<%@page import="com.itwill.shop.product.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.itwill.shop.product.ProductService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx" class="no-js">
<%
	String sUserId = (String)session.getAttribute("sUserId");
%>
<head>
	<!-- Mobile Specific Meta -->
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
	
<%
	ProductService productService = new ProductService();
	List<Product> productList = productService.productListByCategoryOrderByPopularity(1);
	DecimalFormat dc = new DecimalFormat("###,###,###,###");
%>
<%
boolean isLogin = false;
if (session.getAttribute("sUserId") != null) {
	isLogin = true;
}


%>
	<!--
		CSS
		============================================= -->
	<link rel="stylesheet" href="css/linearicons.css">
	<link rel="stylesheet" href="css/font-awesome.min.css">
	<link rel="stylesheet" href="css/themify-icons.css">
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/owl.carousel.css">
	<link rel="stylesheet" href="css/nice-select.css">
	<link rel="stylesheet" href="css/nouislider.min.css">
	<link rel="stylesheet" href="css/ion.rangeSlider.css" />
	<link rel="stylesheet" href="css/ion.rangeSlider.skinFlat.css" />
	<link rel="stylesheet" href="css/magnific-popup.css">
	<link rel="stylesheet" href="css/main.css">
	<script type="text/javascript">
	
	function sizeSet(p_No,selectSizeList) {
	    var size = selectSizeList.getAttribute('value');
		var button = document.getElementById('sizeButton_'+p_No);
		button.innerHTML = size;
		//button.value = size;
		console.log(button);		
		var cartButton = document.getElementById('cart_form_'+p_No);
		cartButton.p_size.value = size; 
	    console.log(cartButton.p_size.value);
	}
	 
	
	
	function add_cart_popup_window(pNo){
		var cartButton = document.getElementById('cart_form_'+pNo);
		if (<%=!isLogin%>) {
			alert('로그인 하세요');
			location.href = 'user_login_form.jsp';
		} else if(cartButton.p_size.value==""){
			alert('사이즈를 골라주세요.');
			return false;
		} else{
			
			var left = Math.ceil(( window.screen.width)/5);
			var top = Math.ceil(( window.screen.height)/3); 
			console.log(left);
			console.log(top);
			var cartWin = window.open("about:blank","cartForm","width=260,height=130,top=500,left=840,location=no, directories=no, status=no, menubar=no, scrollbars=no,copyhistory=no");
			var cartButton = document.getElementById('cart_form_'+pNo);
			//cartButton.action = 'cart_add_action_popup_window.jsp';
			//cartButton.target = 'cartForm';
			//cartButton.method = 'POST';
			//cartButton.submit();
			var cartForm = document.getElementById('cart_form_'+pNo);
			cartForm.setAttribute('action', 'cart_add_action_popup_window.jsp');
			cartForm.setAttribute('target', 'cartForm');
			cartForm.setAttribute('method', 'POST');
			cartForm.submit();
		}
	}
		
	function login (){
		if (<%=!isLogin%>) {
			alert('로그인 하세요.');
			location.href = 'user_login_form.jsp';
			return false;
		} 
		return true;
	}
	
	</script>
</head>

<body>

	<!-- Start Header Area -->
	<header class="header_area sticky-header">
		<div class="main_menu">
			<nav class="navbar navbar-expand-lg navbar-light main_box">
				<div class="container">
					<!-- Brand and toggle get grouped for better mobile display -->
					<a class="navbar-brand logo_h" href="index.jsp"><img src="img/banner/GANADA-Mart.png" alt=""></a>
					<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
					 aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse offset" id="navbarSupportedContent">
						<ul class="nav navbar-nav menu_nav ml-auto mr-auto">
							<li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
							<li class="nav-item submenu dropdown">
								<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
								 aria-expanded="false">Shop</a>
								<ul class="dropdown-menu">
								
									<li class="nav-item"><a class="nav-link" href="category.jsp?category=1">스니커즈</a></li>
									<li class="nav-item"><a class="nav-link" href="category.jsp?category=2">스포츠</a></li>
									<li class="nav-item"><a class="nav-link" href="category.jsp?category=3">구두</a></li>
									<li class="nav-item"><a class="nav-link" href="category.jsp?category=4">샌들</a></li>
									<li class="nav-item"><a class="nav-link" href="category.jsp?category=5">캐주얼</a></li>
									<li class="nav-item"><a class="nav-link" href="category.jsp?category=6">부츠</a></li>
								</ul>
							</li>
							<li class="nav-item submenu dropdown" >
								<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
								 aria-expanded="false">MyPage</a>
								<ul class="dropdown-menu" >
									<li class="nav-item"><a class="nav-link" href="user_view.jsp">내정보</a></li>
									<li class="nav-item"><a class="nav-link" href="cart.jsp">장바구니</a></li>
									<li class="nav-item"><a class="nav-link" href="order_list.jsp">주문내역</a></li>
								</ul>
							</li>
							
							<li class="nav-item submenu dropdown" >
								<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
								 aria-expanded="false">Board</a>
								<ul class="dropdown-menu">
									<li class="nav-item"><a class="nav-link" href="cs_list.jsp">고객센터</a></li>
									<li class="nav-item"><a class="nav-link" href="board_list.jsp">자유게시판</a></li>
								</ul>
							</li>
							
						</ul>
						<%if(sUserId==null){%>
							
						
						<ul class="nav navbar-nav navbar-right">
							<li class="nav-item"><a href="user_login_form.jsp" class="cart"><img alt="" src="img/login.png" style="padding-top: 15px"></a></li>
							<li class="nav-item"><a href="user_create_form.jsp" class="cart"><img alt="" src="img/join.png" style="padding-top: 15px"></a></li>
							<li class="nav-item"><a href="cart.jsp" class="cart"><img alt="" src="img/cart.png" style="padding-top: 15px"></a></li>
							<li class="nav-item">
								<button class="search"><span class="lnr lnr-magnifier" id="search" style="font-size: 25px"></span></button>
							</li>
						</ul>
						<%}else{ %>
						<ul class="nav navbar-nav navbar-right">
							<li class="nav-item"><a href="user_logout_action.jsp" class="cart"><img alt="" src="img/logout.png" style="padding-top: 15px"></a></li>
							<li class="nav-item"><a href="user_view.jsp" class="cart"><img alt="" src="img/my.png" style="padding-top: 15px"></a></li>
							<li class="nav-item"><a href="cart.jsp" class="cart"><img alt="" src="img/cart.png" style="padding-top: 15px"></a></li>
							<li class="nav-item">
								<button class="search"><span class="lnr lnr-magnifier" id="search" style="font-size: 25px"></span></button>
							</li>
						</ul>
						<%} %>
					</div>
				</div>
			</nav>
		</div>
		<div class="search_input" id="search_input_box">
			<div class="container">
				<form class="d-flex justify-content-between" action="category_product_search.jsp?search=${search}">
					<input type="text" class="form-control" name="search" id="search_input" placeholder="Search Here">
					<button type="submit" class="btn"></button>
					<span class="lnr lnr-cross" id="close_search" title="Close Search"></span>
				</form>
			</div>
		</div>
	</header>
	<!-- End Header Area -->

	<!-- start banner Area -->
	<section class="banner-area">
		<div class="container">
			<div class="row fullscreen align-items-center justify-content-start">
				
			</div>
		</div>
	</section>
	<!-- End banner Area -->

	<!-- start features Area -->
	<!-- end features Area -->

	<!-- Start category Area -->

	<!-- End category Area -->

	<!-- start product Area -->
	<section class="owl-carousel active-product-area section_gap">
		<!-- single product slide -->
		<div class="single-product-slider">
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-lg-6 text-center">
						<div class="section-title">
							<h1>Best Products</h1>
							<h3>스니커즈</h3>
						</div>
					</div>
				</div>
				<div class="row">
					<!-- single product -->
					<%
					for(int i=0;i<8;i++) {
						Product product = productList.get(i);
						String price = dc.format(product.getPPrice());
					%>
					<div class="col-lg-3 col-md-6">
						<div class="single-product">
							<a href="product_detail.jsp?pNo=<%=product.getPNo() %>"><img class="img-fluid" src="img/product/<%=product.getPImg()%>" alt=""></a>
							<div class="product-details">
								<h6><%= product.getPName() %></h6>
								<div class="price">
									<h6><%= price+"원"%></h6>
								</div>
								<div class="prd-bottom">
									<form name="cart_form" id="cart_form_<%=product.getPNo()%>">
										<input type="hidden" id="cart_qty" name="cart_qty" value="1">
										<input type="hidden" id="p_size" name="p_size" value="">
										<input type="hidden" id="p_no" name="p_no" value="<%=product.getPNo()%>">
										<a href="javascript:add_cart_popup_window(<%=product.getPNo() %>)" class="genric-btn primary-border">장바구니 담기</a>
									<div class="btn-group">
									    <button type="button" id="sizeButton_<%=product.getPNo() %>" class="btn btn-warning dropdown-toggle" data-bs-toggle="dropdown" value="">size</button>
									    <ul class="dropdown-menu" data-popper-placement="bottom-start" style="font-size: 15px; position: absolute; inset: 0px auto auto 0px; margin: 0px; transform: translate(0px, 40px);max-height: 150px; overflow-y: auto;">
									      <li><a class="dropdown-item" onclick="sizeSet(<%=product.getPNo()%>,this)" value="230">230</a></li>
									      <li><hr class="dropdown-divider"></li>
									      <li><a class="dropdown-item" onclick="sizeSet(<%=product.getPNo()%>,this)" value="235">235</a></li>
									      <li><hr class="dropdown-divider"></li>
									      <li><a class="dropdown-item" onclick="sizeSet(<%=product.getPNo()%>,this)" value="240">240</a></li>
									      <li><hr class="dropdown-divider"></li>
									      <li><a class="dropdown-item" onclick="sizeSet(<%=product.getPNo()%>,this)" value="245">245</a></li>
									      <li><hr class="dropdown-divider"></li>
									      <li><a class="dropdown-item" onclick="sizeSet(<%=product.getPNo()%>,this)" value="250">250</a></li>
									      <li><hr class="dropdown-divider"></li>
									      <li><a class="dropdown-item" onclick="sizeSet(<%=product.getPNo()%>,this)" value="255">255</a></li>
									      <li><hr class="dropdown-divider" ></li>
									      <li><a class="dropdown-item" onclick="sizeSet(<%=product.getPNo()%>,this)" value="260">260</a></li>
									      <li><hr class="dropdown-divider"></li> 
									      <li><a class="dropdown-item" onclick="sizeSet(<%=product.getPNo()%>,this)" value="265">265</a></li>
									      <li><hr class="dropdown-divider"></li>
									      <li><a class="dropdown-item" onclick="sizeSet(<%=product.getPNo()%>,this)" value="270">270</a></li>
									      <li><hr class="dropdown-divider"></li>
									      <li><a class="dropdown-item" onclick="sizeSet(<%=product.getPNo()%>,this)" value="275">275</a></li>
									      <li><hr class="dropdown-divider"></li>
									      <li><a class="dropdown-item" onclick="sizeSet(<%=product.getPNo()%>,this)" value="280">280</a></li>
									    </ul>
									  </div>
									</form>
								</div>
							</div>
						</div>
					</div>
					<%} %>
				</div>
			</div>
		</div>
	
	<!-- single product slide -->
		<div class="single-product-slider">
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-lg-6 text-center">
						<div class="section-title">
							<h1>Best Products</h1>
							<h3>스포츠</h3>
						</div>
					</div>
				</div>
				<div class="row">
					<!-- single product -->
					<%
					productList = productService.productListByCategoryOrderByPopularity(2);
					for(int i=0;i<8;i++) {
						Product product = productList.get(i);
						String price = dc.format(product.getPPrice());
					%>
				<div class="col-lg-3 col-md-6">
						<div class="single-product">
							<a href="product_detail.jsp?pNo=<%=product.getPNo() %>"><img class="img-fluid" src="img/product/<%=product.getPImg()%>" alt=""></a>
							<div class="product-details">
								<h6><%= product.getPName() %></h6>
								<div class="price">
									<h6><%= price+"원"%></h6>
								</div>
								<div class="prd-bottom">
									<form name="cart_form" id="cart_form_<%=product.getPNo()%>">
										<input type="hidden" id="cart_qty" name="cart_qty" value="1">
										<input type="hidden" id="p_size" name="p_size" value="">
										<input type="hidden" id="p_no" name="p_no" value="<%=product.getPNo()%>">
										<a href="javascript:add_cart_popup_window(<%=product.getPNo() %>)" class="genric-btn primary-border">장바구니 담기</a>
									<div class="btn-group">
									    <button type="button" id="sizeButton_<%=product.getPNo() %>" class="btn btn-warning dropdown-toggle" data-bs-toggle="dropdown" value="">size</button>
									    <ul class="dropdown-menu" data-popper-placement="bottom-start" style="font-size: 15px; position: absolute; inset: 0px auto auto 0px; margin: 0px; transform: translate(0px, 40px);max-height: 150px; overflow-y: auto;">
									      <li><a class="dropdown-item" onclick="sizeSet(<%=product.getPNo()%>,this)" value="230">230</a></li>
									      <li><hr class="dropdown-divider"></li>
									      <li><a class="dropdown-item" onclick="sizeSet(<%=product.getPNo()%>,this)" value="235">235</a></li>
									      <li><hr class="dropdown-divider"></li>
									      <li><a class="dropdown-item" onclick="sizeSet(<%=product.getPNo()%>,this)" value="240">240</a></li>
									      <li><hr class="dropdown-divider"></li>
									      <li><a class="dropdown-item" onclick="sizeSet(<%=product.getPNo()%>,this)" value="245">245</a></li>
									      <li><hr class="dropdown-divider"></li>
									      <li><a class="dropdown-item" onclick="sizeSet(<%=product.getPNo()%>,this)" value="250">250</a></li>
									      <li><hr class="dropdown-divider"></li>
									      <li><a class="dropdown-item" onclick="sizeSet(<%=product.getPNo()%>,this)" value="255">255</a></li>
									      <li><hr class="dropdown-divider" ></li>
									      <li><a class="dropdown-item" onclick="sizeSet(<%=product.getPNo()%>,this)" value="260">260</a></li>
									      <li><hr class="dropdown-divider"></li> 
									      <li><a class="dropdown-item" onclick="sizeSet(<%=product.getPNo()%>,this)" value="265">265</a></li>
									      <li><hr class="dropdown-divider"></li>
									      <li><a class="dropdown-item" onclick="sizeSet(<%=product.getPNo()%>,this)" value="270">270</a></li>
									      <li><hr class="dropdown-divider"></li>
									      <li><a class="dropdown-item" onclick="sizeSet(<%=product.getPNo()%>,this)" value="275">275</a></li>
									      <li><hr class="dropdown-divider"></li>
									      <li><a class="dropdown-item" onclick="sizeSet(<%=product.getPNo()%>,this)" value="280">280</a></li>
									    </ul>
									  </div>
									</form>
								</div>
							</div>
						</div>
					</div>
					<%} %>
				</div>
			</div>
		</div>
		
		<!-- single product slide -->
		<div class="single-product-slider">
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-lg-6 text-center">
						<div class="section-title">
							<h1>Best Products</h1>
							<h3>구두</h3>
						</div>
					</div>
				</div>
				<div class="row">
					<!-- single product -->
					<%
					productList = productService.productListByCategoryOrderByPopularity(3);
					for(int i=0;i<8;i++) {
						Product product = productList.get(i);
						String price = dc.format(product.getPPrice());
					%>
					<div class="col-lg-3 col-md-6">
						<div class="single-product">
							<a href="product_detail.jsp?pNo=<%=product.getPNo() %>"><img class="img-fluid" src="img/product/<%=product.getPImg()%>" alt=""></a>
							<div class="product-details">
								<h6><%= product.getPName() %></h6>
								<div class="price">
									<h6><%= price+"원"%></h6>
								</div>
								<div class="prd-bottom">
									<form name="cart_form" id="cart_form_<%=product.getPNo()%>">
										<input type="hidden" id="cart_qty" name="cart_qty" value="1">
										<input type="hidden" id="p_size" name="p_size" value="">
										<input type="hidden" id="p_no" name="p_no" value="<%=product.getPNo()%>">
										<a href="javascript:add_cart_popup_window(<%=product.getPNo() %>)" class="genric-btn primary-border">장바구니 담기</a>
									<div class="btn-group">
									    <button type="button" id="sizeButton_<%=product.getPNo() %>" class="btn btn-warning dropdown-toggle" data-bs-toggle="dropdown" value="">size</button>
									    <ul class="dropdown-menu" data-popper-placement="bottom-start" style="font-size: 15px; position: absolute; inset: 0px auto auto 0px; margin: 0px; transform: translate(0px, 40px);max-height: 150px; overflow-y: auto;">
									      <li><a class="dropdown-item" onclick="sizeSet(<%=product.getPNo()%>,this)" value="230">230</a></li>
									      <li><hr class="dropdown-divider"></li>
									      <li><a class="dropdown-item" onclick="sizeSet(<%=product.getPNo()%>,this)" value="235">235</a></li>
									      <li><hr class="dropdown-divider"></li>
									      <li><a class="dropdown-item" onclick="sizeSet(<%=product.getPNo()%>,this)" value="240">240</a></li>
									      <li><hr class="dropdown-divider"></li>
									      <li><a class="dropdown-item" onclick="sizeSet(<%=product.getPNo()%>,this)" value="245">245</a></li>
									      <li><hr class="dropdown-divider"></li>
									      <li><a class="dropdown-item" onclick="sizeSet(<%=product.getPNo()%>,this)" value="250">250</a></li>
									      <li><hr class="dropdown-divider"></li>
									      <li><a class="dropdown-item" onclick="sizeSet(<%=product.getPNo()%>,this)" value="255">255</a></li>
									      <li><hr class="dropdown-divider" ></li>
									      <li><a class="dropdown-item" onclick="sizeSet(<%=product.getPNo()%>,this)" value="260">260</a></li>
									      <li><hr class="dropdown-divider"></li> 
									      <li><a class="dropdown-item" onclick="sizeSet(<%=product.getPNo()%>,this)" value="265">265</a></li>
									      <li><hr class="dropdown-divider"></li>
									      <li><a class="dropdown-item" onclick="sizeSet(<%=product.getPNo()%>,this)" value="270">270</a></li>
									      <li><hr class="dropdown-divider"></li>
									      <li><a class="dropdown-item" onclick="sizeSet(<%=product.getPNo()%>,this)" value="275">275</a></li>
									      <li><hr class="dropdown-divider"></li>
									      <li><a class="dropdown-item" onclick="sizeSet(<%=product.getPNo()%>,this)" value="280">280</a></li>
									    </ul>
									  </div>
									</form>
								</div>
							</div>
						</div>
					</div>
					<%} %>
				</div>
			</div>
		</div>
		
		<!-- single product slide -->
		<div class="single-product-slider">
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-lg-6 text-center">
						<div class="section-title">
							<h1>Best Products</h1>
							<h3>샌들</h3>
						</div>
					</div>
				</div>
				<div class="row">
					<!-- single product -->
					<%
					productList = productService.productListByCategoryOrderByPopularity(4);
					for(int i=0;i<8;i++) {
						Product product = productList.get(i);
						String price = dc.format(product.getPPrice());
					%>
				<div class="col-lg-3 col-md-6">
						<div class="single-product">
							<a href="product_detail.jsp?pNo=<%=product.getPNo() %>"><img class="img-fluid" src="img/product/<%=product.getPImg()%>" alt=""></a>
							<div class="product-details">
								<h6><%= product.getPName() %></h6>
								<div class="price">
									<h6><%= price+"원"%></h6>
								</div>
								<div class="prd-bottom">
									<form name="cart_form" id="cart_form_<%=product.getPNo()%>">
										<input type="hidden" id="cart_qty" name="cart_qty" value="1">
										<input type="hidden" id="p_size" name="p_size" value="">
										<input type="hidden" id="p_no" name="p_no" value="<%=product.getPNo()%>">
										<a href="javascript:add_cart_popup_window(<%=product.getPNo() %>)" class="genric-btn primary-border">장바구니 담기</a>
									<div class="btn-group">
									    <button type="button" id="sizeButton_<%=product.getPNo() %>" class="btn btn-warning dropdown-toggle" data-bs-toggle="dropdown" value="">size</button>
									    <ul class="dropdown-menu" data-popper-placement="bottom-start" style="font-size: 15px; position: absolute; inset: 0px auto auto 0px; margin: 0px; transform: translate(0px, 40px);max-height: 150px; overflow-y: auto;">
									      <li><a class="dropdown-item" onclick="sizeSet(<%=product.getPNo()%>,this)" value="230">230</a></li>
									      <li><hr class="dropdown-divider"></li>
									      <li><a class="dropdown-item" onclick="sizeSet(<%=product.getPNo()%>,this)" value="235">235</a></li>
									      <li><hr class="dropdown-divider"></li>
									      <li><a class="dropdown-item" onclick="sizeSet(<%=product.getPNo()%>,this)" value="240">240</a></li>
									      <li><hr class="dropdown-divider"></li>
									      <li><a class="dropdown-item" onclick="sizeSet(<%=product.getPNo()%>,this)" value="245">245</a></li>
									      <li><hr class="dropdown-divider"></li>
									      <li><a class="dropdown-item" onclick="sizeSet(<%=product.getPNo()%>,this)" value="250">250</a></li>
									      <li><hr class="dropdown-divider"></li>
									      <li><a class="dropdown-item" onclick="sizeSet(<%=product.getPNo()%>,this)" value="255">255</a></li>
									      <li><hr class="dropdown-divider" ></li>
									      <li><a class="dropdown-item" onclick="sizeSet(<%=product.getPNo()%>,this)" value="260">260</a></li>
									      <li><hr class="dropdown-divider"></li> 
									      <li><a class="dropdown-item" onclick="sizeSet(<%=product.getPNo()%>,this)" value="265">265</a></li>
									      <li><hr class="dropdown-divider"></li>
									      <li><a class="dropdown-item" onclick="sizeSet(<%=product.getPNo()%>,this)" value="270">270</a></li>
									      <li><hr class="dropdown-divider"></li>
									      <li><a class="dropdown-item" onclick="sizeSet(<%=product.getPNo()%>,this)" value="275">275</a></li>
									      <li><hr class="dropdown-divider"></li>
									      <li><a class="dropdown-item" onclick="sizeSet(<%=product.getPNo()%>,this)" value="280">280</a></li>
									    </ul>
									  </div>
									</form>
								</div>
							</div>
						</div>
					</div>
					<%} %>
				</div>
			</div>
		</div>
		
		<!-- single product slide -->
		<div class="single-product-slider">
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-lg-6 text-center">
						<div class="section-title">
							<h1>Best Products</h1>
							<h3>캐주얼</h3>
						</div>
					</div>
				</div>
				<div class="row">
					<!-- single product -->
					<%
					productList = productService.productListByCategoryOrderByPopularity(5);
					for(int i=0;i<8;i++) {
						Product product = productList.get(i);
						String price = dc.format(product.getPPrice());
					%>
			<div class="col-lg-3 col-md-6">
						<div class="single-product">
							<a href="product_detail.jsp?pNo=<%=product.getPNo() %>"><img class="img-fluid" src="img/product/<%=product.getPImg()%>" alt=""></a>
							<div class="product-details">
								<h6><%= product.getPName() %></h6>
								<div class="price">
									<h6><%= price+"원"%></h6>
								</div>
								<div class="prd-bottom">
									<form name="cart_form" id="cart_form_<%=product.getPNo()%>">
										<input type="hidden" id="cart_qty" name="cart_qty" value="1">
										<input type="hidden" id="p_size" name="p_size" value="">
										<input type="hidden" id="p_no" name="p_no" value="<%=product.getPNo()%>">
										<a href="javascript:add_cart_popup_window(<%=product.getPNo() %>)" class="genric-btn primary-border">장바구니 담기</a>
									<div class="btn-group">
									    <button type="button" id="sizeButton_<%=product.getPNo() %>" class="btn btn-warning dropdown-toggle" data-bs-toggle="dropdown" value="">size</button>
									    <ul class="dropdown-menu" data-popper-placement="bottom-start" style="font-size: 15px; position: absolute; inset: 0px auto auto 0px; margin: 0px; transform: translate(0px, 40px);max-height: 150px; overflow-y: auto;">
									      <li><a class="dropdown-item" onclick="sizeSet(<%=product.getPNo()%>,this)" value="230">230</a></li>
									      <li><hr class="dropdown-divider"></li>
									      <li><a class="dropdown-item" onclick="sizeSet(<%=product.getPNo()%>,this)" value="235">235</a></li>
									      <li><hr class="dropdown-divider"></li>
									      <li><a class="dropdown-item" onclick="sizeSet(<%=product.getPNo()%>,this)" value="240">240</a></li>
									      <li><hr class="dropdown-divider"></li>
									      <li><a class="dropdown-item" onclick="sizeSet(<%=product.getPNo()%>,this)" value="245">245</a></li>
									      <li><hr class="dropdown-divider"></li>
									      <li><a class="dropdown-item" onclick="sizeSet(<%=product.getPNo()%>,this)" value="250">250</a></li>
									      <li><hr class="dropdown-divider"></li>
									      <li><a class="dropdown-item" onclick="sizeSet(<%=product.getPNo()%>,this)" value="255">255</a></li>
									      <li><hr class="dropdown-divider" ></li>
									      <li><a class="dropdown-item" onclick="sizeSet(<%=product.getPNo()%>,this)" value="260">260</a></li>
									      <li><hr class="dropdown-divider"></li> 
									      <li><a class="dropdown-item" onclick="sizeSet(<%=product.getPNo()%>,this)" value="265">265</a></li>
									      <li><hr class="dropdown-divider"></li>
									      <li><a class="dropdown-item" onclick="sizeSet(<%=product.getPNo()%>,this)" value="270">270</a></li>
									      <li><hr class="dropdown-divider"></li>
									      <li><a class="dropdown-item" onclick="sizeSet(<%=product.getPNo()%>,this)" value="275">275</a></li>
									      <li><hr class="dropdown-divider"></li>
									      <li><a class="dropdown-item" onclick="sizeSet(<%=product.getPNo()%>,this)" value="280">280</a></li>
									    </ul>
									  </div>
									</form>
								</div>
							</div>
						</div>
					</div>
					<%} %>
				</div>
			</div>
		</div>
		
		<!-- single product slide -->
		<div class="single-product-slider">
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-lg-6 text-center">
						<div class="section-title">
							<h1>Best Products</h1>
							<h3>부츠</h3>
						</div>
					</div>
				</div>
				<div class="row">
					<!-- single product -->
					<%
					productList = productService.productListByCategoryOrderByPopularity(6);
					for(int i=0;i<8;i++) {
						Product product = productList.get(i);
						String price = dc.format(product.getPPrice());
					%>
				<div class="col-lg-3 col-md-6">
						<div class="single-product">
							<a href="product_detail.jsp?pNo=<%=product.getPNo() %>"><img class="img-fluid" src="img/product/<%=product.getPImg()%>" alt=""></a>
							<div class="product-details">
								<h6><%= product.getPName() %></h6>
								<div class="price">
									<h6><%= price+"원"%></h6>
								</div>
								<div class="prd-bottom">
									<form name="cart_form" id="cart_form_<%=product.getPNo()%>">
										<input type="hidden" id="cart_qty" name="cart_qty" value="1">
										<input type="hidden" id="p_size" name="p_size" value="">
										<input type="hidden" id="p_no" name="p_no" value="<%=product.getPNo()%>">
										<a href="javascript:add_cart_popup_window(<%=product.getPNo() %>)" class="genric-btn primary-border">장바구니 담기</a>
									<div class="btn-group">
									    <button type="button" id="sizeButton_<%=product.getPNo() %>" class="btn btn-warning dropdown-toggle" data-bs-toggle="dropdown" value="">size</button>
									    <ul class="dropdown-menu" data-popper-placement="bottom-start" style="font-size: 15px; position: absolute; inset: 0px auto auto 0px; margin: 0px; transform: translate(0px, 40px);max-height: 150px; overflow-y: auto;">
									      <li><a class="dropdown-item" onclick="sizeSet(<%=product.getPNo()%>,this)" value="230">230</a></li>
									      <li><hr class="dropdown-divider"></li>
									      <li><a class="dropdown-item" onclick="sizeSet(<%=product.getPNo()%>,this)" value="235">235</a></li>
									      <li><hr class="dropdown-divider"></li>
									      <li><a class="dropdown-item" onclick="sizeSet(<%=product.getPNo()%>,this)" value="240">240</a></li>
									      <li><hr class="dropdown-divider"></li>
									      <li><a class="dropdown-item" onclick="sizeSet(<%=product.getPNo()%>,this)" value="245">245</a></li>
									      <li><hr class="dropdown-divider"></li>
									      <li><a class="dropdown-item" onclick="sizeSet(<%=product.getPNo()%>,this)" value="250">250</a></li>
									      <li><hr class="dropdown-divider"></li>
									      <li><a class="dropdown-item" onclick="sizeSet(<%=product.getPNo()%>,this)" value="255">255</a></li>
									      <li><hr class="dropdown-divider" ></li>
									      <li><a class="dropdown-item" onclick="sizeSet(<%=product.getPNo()%>,this)" value="260">260</a></li>
									      <li><hr class="dropdown-divider"></li> 
									      <li><a class="dropdown-item" onclick="sizeSet(<%=product.getPNo()%>,this)" value="265">265</a></li>
									      <li><hr class="dropdown-divider"></li>
									      <li><a class="dropdown-item" onclick="sizeSet(<%=product.getPNo()%>,this)" value="270">270</a></li>
									      <li><hr class="dropdown-divider"></li>
									      <li><a class="dropdown-item" onclick="sizeSet(<%=product.getPNo()%>,this)" value="275">275</a></li>
									      <li><hr class="dropdown-divider"></li>
									      <li><a class="dropdown-item" onclick="sizeSet(<%=product.getPNo()%>,this)" value="280">280</a></li>
									    </ul>
									  </div>
									</form>
								</div>
							</div>
						</div>
					</div>
					<%} %>
				</div>
			</div>
		</div>
		
	</section>
	<!-- end product Area -->

	<!-- Start exclusive deal Area -->
	
						<!-- single exclusive carousel -->
						
						<!-- single exclusive carousel -->
						
	<!-- End exclusive deal Area -->

	<!-- Start brand Area -->
	
	<!-- End brand Area -->

	<!-- Start related-product Area -->
	
	<!-- End related-product Area -->

	<!-- start footer Area -->
	<footer class="footer-area section_gap">
		<div class="container">
			<div class="row">
				<div class="col-lg-3  col-md-6 col-sm-6">
					<div class="single-footer-widget">
						<h6>About Us</h6>
						<p>
							Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore dolore
							magna aliqua.
						</p>
					</div>
				</div>
				<div class="col-lg-4  col-md-6 col-sm-6">
					<div class="single-footer-widget">
						<h6>Newsletter</h6>
						<p>Stay update with our latest</p>
						<div class="" id="mc_embed_signup">

							<form target="_blank" novalidate="true" action="https://spondonit.us12.list-manage.com/subscribe/post?u=1462626880ade1ac87bd9c93a&amp;id=92a4423d01"
							 method="get" class="form-inline">

								<div class="d-flex flex-row">

									<input class="form-control" name="EMAIL" placeholder="Enter Email" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Email '"
									 required="" type="email">


									<button class="click-btn btn btn-default"><i class="fa fa-long-arrow-right" aria-hidden="true"></i></button>
									<div style="position: absolute; left: -5000px;">
										<input name="b_36c4fd991d266f23781ded980_aefe40901a" tabindex="-1" value="" type="text">
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
						<h6 class="mb-20">Instragram Feed</h6>
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
						<h6>Follow Us</h6>
						<p>Let us be social</p>
						<div class="footer-social d-flex align-items-center">
							<a href="#"><i class="fa fa-facebook"></i></a>
							<a href="#"><i class="fa fa-twitter"></i></a>
							<a href="#"><i class="fa fa-dribbble"></i></a>
							<a href="#"><i class="fa fa-behance"></i></a>
						</div>
					</div>
				</div>
			</div>
			<div class="footer-bottom d-flex justify-content-center align-items-center flex-wrap">
				<p class="footer-text m-0"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
</p>
			</div>
		</div>
	</footer>
	<!-- End footer Area -->

	<script src="js/vendor/jquery-2.2.4.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
	 crossorigin="anonymous"></script>
	<script src="js/vendor/bootstrap.min.js"></script>
	<script src="js/jquery.ajaxchimp.min.js"></script>
	<script src="js/jquery.nice-select.min.js"></script>
	<script src="js/jquery.sticky.js"></script>
	<script src="js/nouislider.min.js"></script>
	<script src="js/countdown.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
	<!--gmaps Js-->
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCjCGmQ0Uq4exrzdcL6rvxywDDOvfAu6eE"></script>
	<script src="js/gmaps.min.js"></script>
	<script src="js/main.js"></script>
	<script>
	
	$('.owl-carousel').owlCarousel({
	    items : 1, //화면에 표시 할 슬라이드 수
	    nav:true,
	    navText: ["<img src='img/product/prev.png'>","<img src='img/product/next.png'>"],
	    //animateOut : 'fadeOut', // 사라질때의 애니메이션
	    //margin : 10, // 슬라이드 간격
	    //dots : true, // Pagination 표시 여부
	    //autoplay : true, // 자동 슬라이드 여부
	    //autoplayTimeout : 3000, // 자동 슬라이드 시간 (예제는 3초)
	    loop : false // 무한 반복 여부
	    //background-image: url('img/product/prev.png');
	});
	
	
	</script>
</body>

</html>