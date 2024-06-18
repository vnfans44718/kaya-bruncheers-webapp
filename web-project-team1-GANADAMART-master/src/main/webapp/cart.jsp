<%@page import="java.text.DecimalFormat"%>
<%@page import="com.itwill.shop.cart.Cart"%>
<%@page import="java.util.List"%>
<%@page import="com.itwill.shop.cart.CartService"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<%@include file="user_login_check.jspf" %>
<html lang="zxx" class="no-js"><head>
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

	CartService cartService = new CartService();
	List<Cart> cartList = cartService.getCartItemByUserId(sUserId);
	DecimalFormat dc = new DecimalFormat("###,###,###,###");
	

%>
    <!--
            CSS
            ============================================= -->
    <link rel="stylesheet" href="css/linearicons.css">
    <link rel="stylesheet" href="css/owl.carousel.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/themify-icons.css">
    <link rel="stylesheet" href="css/nice-select.css">
    <link rel="stylesheet" href="css/nouislider.min.css">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/custom.css">
    
   
<script type="text/javascript">
	/*
	장바구니 비우기 [anchor 클릭시 cart 전체삭제요청 서버로전송]
	 */
	function cart_delete_action() {
		document.cart_delete_form.method = 'POST';
		document.cart_delete_form.action = 'cart_delete_action.jsp';
		document.cart_delete_form.submit();
	}
	
	/*
	장바구니 아이템1개삭제 [anchor 클릭시 메세지출력후 서버로 삭제요청 하기]
	 */
	function cart_delete_item_action(cart_no) {
		if (window.confirm('해당상품을 장바구니에서 삭제하시겠습니까?')) {
			document.cart_delete_item_form.method = 'POST';
			document.cart_delete_item_form.cart_no.value = cart_no;
			document.cart_delete_item_form.action = 'cart_delete_item_action.jsp';
			document.cart_delete_item_form.submit();
		}
	}
	
	/*
	장바구니 아이템1개수량수정[카트상품수량 증가,감소버튼클릭시 카트아이템수량변경서버요청]
	 */
	function cart_update_item_action(cart_no,updown) {
		var cart_qty_input = document.getElementById('cart_qty_'+cart_no);
		document.cart_update_form.cart_no.value = cart_no;		
		
		if (updown == '+') {
			    document.cart_update_form.cart_qty.value = parseInt(cart_qty_input.value) + 1;
		} else if (updown == '-') {
			if ( parseInt(cart_qty_input.value)- 1 >= 0) {
				document.cart_update_form.cart_qty.value = parseInt(cart_qty_input.value) - 1;
				
			}
		}
		document.cart_update_form.method = 'POST';
		document.cart_update_form.action = 'cart_update_item_action.jsp';
		document.cart_update_form.submit();
		
	}
	

	/*
	주문폼요청 [anchor클릭시 선택된 카트의제품을 주문하기위한 주문폼을보여주기]    
	 */
	function cart_view_form_select_order_form_submit() {
		var cart_item_checkbox_list = document
				.getElementsByName("cart_item_checkbox");
		var isChecked = false;
		for (var i = 0; i < cart_item_checkbox_list.length; i++) {
			if (cart_item_checkbox_list.item(i).checked === true) {
				isChecked = true;
				break;
			}
		}
		if (!isChecked) {
			alert('제품을선택해주세요');
			return;
		}
		document.cart_view_form.buyType.value = 'cart_select';
		document.cart_view_form.method = 'POST';
		document.cart_view_form.action = 'order_create_form.jsp';
		document.cart_view_form.submit();
	}
	/*
	카트아이템 전체선택,해지체크박스 변경시 전체카트아이템 선택해지
	 */
	function cart_item_all_select_deselect_checkbox_change() {
		var cart_item_checkbox_list = document
				.getElementsByName("cart_item_checkbox");
		for (var i = 0; i < cart_item_checkbox_list.length; i++) {
			cart_item_checkbox_list.item(i).checked = document
					.getElementById('cart_item_all_select_deselect_checkbox').checked;
		}
	}
	/*
	카트아이템한개 선택,해제 체크박스변경시 
	  - 주문앵커 카트아이템카운트변경
	  - cart_view_form input type hidden 변경
	 */
	function cart_item_checkbox_change() {
		var cart_item_checkbox_list = document.getElementsByName("cart_item_checkbox");
		var tot_order_price = 0;
		
		document.cart_view_form.innerHTML = '';
		document.cart_view_form.innerHTML += "<input type='hidden' name='buyType'>";
		for (var i = 0; i < cart_item_checkbox_list.length; i++) {
			if (cart_item_checkbox_list.item(i).checked === true) {
				var cart_no  = cart_item_checkbox_list.item(i).value;
				var cart_qty= document.getElementById('cart_qty_'+cart_no).value;
				var cart_product_unit_price = document.getElementById('cart_product_unit_price_'+cart_no).value;
				
				/************cart_view_form에 hidden추가***********************/
				document.cart_view_form.innerHTML += "<input type='hidden' name='cart_no' value='"
						+ cart_no+ "'>";
				/***************카트 총가격,수량계산***************/
				tot_order_price+=cart_qty*cart_product_unit_price;
			}
		}
		/***************카트 총가격,수량변경[UI]***************/
		document.getElementById('tot_order_price').innerHTML = tot_order_price
				.toLocaleString()+'원';
		
		console.log(cart_view_form);

	}
</script>
<script type="text/javascript" charset="UTF-8" src="https://maps.googleapis.com/maps-api-v3/api/js/56/3/intl/ko_ALL/common.js"></script><script type="text/javascript" charset="UTF-8" src="https://maps.googleapis.com/maps-api-v3/api/js/56/3/intl/ko_ALL/util.js"></script>
</head>


<body onload="cart_item_checkbox_change();">
		
	<!-- cart 아이템을 주문폼으로 전송하기위한폼 -->
	<form name="cart_view_form" style="margin: 0">
		<input type="hidden" name="buyType" value="cart_select">
	
	</form>
	<!-- 선택된 cart 아이템을 삭제하기위한폼 -->
	<form name="cart_delete_item_form" style="margin: 0">
		<input type="hidden" name="cart_no" value="">
	</form>
	<!-- 전체 cart 아이템을 삭제하기위한폼 -->
	<form name="cart_delete_form" style="margin: 0">
		
	</form>
	<!-- cart 아이템의 수량을 수정하기위한폼 -->
	<form name="cart_update_form" style="margin: 0">
		<input type="hidden" name="cart_no" value=""> 
		<input type="hidden" name="cart_qty" value=""> 
	</form>
   <!-- Start Header Area -->
	<div id="undefined-sticky-wrapper" class="sticky-wrapper" style="height: 80px;">
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
								<a href="category.jsp" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
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
							<li class="nav-item submenu dropdown">
								<a href="user_view.jsp" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
								 aria-expanded="false">MyPage</a>
								<ul class="dropdown-menu">
									<li class="nav-item"><a class="nav-link" href="user_view.jsp">내정보</a></li>
									<li class="nav-item"><a class="nav-link" href="cart.jsp">장바구니</a></li>
									<li class="nav-item"><a class="nav-link" href="order_list.jsp">주문내역</a></li>
								</ul>
							</li>
							<li class="nav-item submenu dropdown">
								<a href="board_list.jsp" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
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
	</header></div>
	<!-- End Header Area -->

    <!-- Start Banner Area -->
    <section class="banner-area organic-breadcrumb">
        <div class="container">
            <div class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
                <div class="col-first">
                    <h1 style="color: #CF1010">Cart</h1>
                    
                    </nav>
                </div>
            </div>
        </div>
    </section>
    <!-- End Banner Area -->

    <!--================Cart Area =================-->
     
    <section class="cart_area">
        <div class="container">
            <div class="cart_inner">
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                        	
                            <tr>
                            	<th class="d-flex align-items-center justify-content-center" width=60 height=25 align="center" bgcolor="ffffff"
											class=t1><input type="checkbox"
											name="cart_item_all_select_deselect_checkbox"
											id="cart_item_all_select_deselect_checkbox" checked="checked"
											onchange ="cart_item_all_select_deselect_checkbox_change();cart_item_checkbox_change();">
								</th>
                                <th scope="col">Product</th>
                                <th scope="col">Price</th>
                                <th scope="col">Quantity</th>
                                <th scope="col">Size</th>
                                <th scope="col">Total</th>
                                <!-- TODO: -->
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                       <% 
					    int tot_price=0;
					    for(Cart cart:cartList){
					    //tot_price+=cart.getProductOption().getProduct().getPPrice()*cart.getCQty();
    					%>
                        <tr>
                        		<td width=60 height=40 align=center bgcolor="ffffff" class=t1>
											<input type="checkbox" 
													name="cart_item_checkbox"
													onchange="cart_item_checkbox_change();"
													value="<%=cart.getCNo()%>" 
													checked="checked">
										</td>
                        
                                <td>
                                    <div class="media">
                                        <div class="d-flex">
                                            <a href="product_detail.jsp?pNo=<%=cart.getProductOption().getProduct().getPNo()%>"><img width="150" height="150" src="img/product/<%=cart.getProductOption().getProduct().getPImg()%>" alt="" ></a>
                                        </div>
                                        <div class="media-body">
                                            <a href="product_detail.jsp?pNo=<%=cart.getProductOption().getProduct().getPNo()%>"><p style="color: black;"><%=cart.getProductOption().getProduct().getPName() %></p></a>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                	<% String price = dc.format(cart.getProductOption().getProduct().getPPrice()); %>
                                    <h5><%=price+"원"%></h5>
                                </td>
                                <td>
                                    <div class="product_count">
                                        <input type="text" name="qty" id="sst" maxlength="12" value="<%=cart.getCQty() %>" title="Quantity:"
                                            class="input-text qty" readonly="readonly">
                                            
                                        <button onclick="cart_update_item_action(<%=cart.getCNo()%>,'+');"
                                            class="increase items-count" type="button"><i class="lnr lnr-chevron-up"></i></button>
                                        <button onclick="cart_update_item_action(<%=cart.getCNo()%>,'-');"
                                            class="reduced items-count" type="button"><i class="lnr lnr-chevron-down"></i></button>
                                        <input type="hidden" id="cart_no_<%=cart.getCNo()%>" value="<%=cart.getCNo()%>"> 
										<input type="hidden" id="cart_qty_<%=cart.getCNo()%>" value="<%=cart.getCQty()%>">
										<input type="hidden" id="cart_product_unit_price_<%=cart.getCNo()%>" value="<%=cart.getProductOption().getProduct().getPPrice()%>">
                                    </div>
                                </td>
                                <td><h5><%=cart.getProductOption().getPoSize() %></h5></td>
                                <td>
                                	<% 
                                		price = dc.format(cart.getProductOption().getProduct().getPPrice()*cart.getCQty()) ;
                                		tot_price +=  cart.getProductOption().getProduct().getPPrice()*cart.getCQty();
                                	%>
                                    <h5><%=price+"원" %></h5>
                                </td>
                                <!--  TODO  -->
                                <td><a href="javascript:cart_delete_item_action(<%=cart.getCNo()%>);"><span class="lnr lnr-cross hover-opacity"></span></a></td>
                            </tr>
                            <%}%>
                     
                            <tr class="bottom_button">
                               
                                
                                
                                
                            </tr>
                            <tr>
                            	<td>
                                </td>
                                <td>
                                    <a class="gray_btn" href="javascript:cart_delete_action();">장바구니 비우기</a>
                                </td>
                                <td>
                                </td>
                                <td></td>
                                <td>
                                    <h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;TotalPrice</h5>
                                </td>
                                <td>
                                    <h5 id="tot_order_price"><%=new DecimalFormat("#,###").format(tot_price)%></h5>
                                </td>
                                 <td>
                                </td>
                            </tr>
                            <tr class="shipping_area">
                            </tr>
                            <tr class="out_button_area">
                                <td>
                                </td>
                                <td>
                                </td>
                                 <td>
                                </td>
                                 <td>
                                </td> 
								<td>
                                </td> 
								<td>
                                </td> 
                                <td>
                                    <div class="checkout_btn_inner d-flex align-items-center">
                                        <a class="gray_btn" href="category.jsp">계속 쇼핑하기</a>
                                        <a class="primary-btn" href="javascript:cart_view_form_select_order_form_submit();">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;주문하기&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </section>
    <!--================End Cart Area =================-->

    <!-- start footer Area -->
    <footer class="footer-area section_gap">
        <div class="container">
            <div class="row">
                <div class="col-lg-3  col-md-6 col-sm-6">
                    <div class="single-footer-widget">
                        <h6>About Us</h6>
                        <p>
                            Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt
                            ut labore dolore
                            magna aliqua.
                        </p>
                    </div>
                </div>
                <div class="col-lg-4  col-md-6 col-sm-6">
                    <div class="single-footer-widget">
                        <h6>Newsletter</h6>
                        <p>Stay update with our latest</p>
                        <div class="" id="mc_embed_signup">

                            <form target="_blank" novalidate="true" action="https://spondonit.us12.list-manage.com/subscribe/post?u=1462626880ade1ac87bd9c93a&amp;id=92a4423d01" method="get" class="form-inline">

                                <div class="d-flex flex-row">

                                    <input class="form-control" name="EMAIL" placeholder="Enter Email" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Email '" required="" type="email">


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
Copyright ©<script>document.write(new Date().getFullYear());</script>2024 All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
</p>
            </div>
        </div>
    </footer>
    <!-- End footer Area -->

    <script src="js/vendor/jquery-2.2.4.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
	<script src="js/vendor/bootstrap.min.js"></script>
	<script src="js/jquery.ajaxchimp.min.js"></script>
	<script src="js/jquery.nice-select.min.js"></script>
	<script src="js/jquery.sticky.js"></script>
    <script src="js/nouislider.min.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<!--gmaps Js-->
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCjCGmQ0Uq4exrzdcL6rvxywDDOvfAu6eE"></script>
	<script src="js/gmaps.min.js"></script>
	<script src="js/main.js"></script>



</body></html>