	<%@page import="java.text.DecimalFormat"%>
<%@page import="com.itwill.shop.user.User"%>
<%@page import="com.itwill.shop.product.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.itwill.shop.product.ProductService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
<%!User sUser; %>
<%
boolean isLogin = false;
if (session.getAttribute("sUserId") != null) {
isLogin = true;
}

	String searchKeyword = request.getParameter("search");
	if(searchKeyword==null){
		searchKeyword="";
	}	
	String sort = request.getParameter("sort");
	if(sort==null){
		sort="0";
	}
	
	ProductService productService = new ProductService();
	List<Product> productList = productService.productListByName(searchKeyword);
	
	String sUserId = (String)session.getAttribute("sUserId");
	
	int sortValue = Integer.parseInt(sort);
	
	
	switch(sortValue){
		case 1: productList = productService.findByNameOrderByPopuarity(searchKeyword);
		break;
		case 2: productList = productService.findByNameOrderByPriceHigh(searchKeyword);
		break;
		case 3: productList = productService.findByNameOrderByPriceLow(searchKeyword);
		break;
	}
	
	this.sUser = (User)session.getAttribute("sUser");
	DecimalFormat dc = new DecimalFormat("###,###,###,###");
	//
	String pageno = request.getParameter("pageno");
	
	if(pageno == null || pageno.equals("")){
		pageno = "1";
	}
	
	
	
%>

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
		var cartWin = window.open("about:blank","cartForm","width=260,height=130,top="+top+",left="+0+",location=no, directories=no, status=no, menubar=no, scrollbars=no,copyhistory=no");
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
 

</script>

	<jsp:include page="include_css.jsp"></jsp:include>
<script type="text/javascript" charset="UTF-8" src="https://maps.googleapis.com/maps-api-v3/api/js/56/3/intl/ko_ALL/common.js"></script><script type="text/javascript" charset="UTF-8" src="https://maps.googleapis.com/maps-api-v3/api/js/56/3/intl/ko_ALL/util.js"></script></head>

<body id="category">

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
                    <h1 style="color: #CF1010">Product</h1>
                    
                    </nav>
                </div>
            </div>
        </div>
    </section>
    <!-- End Banner Area -->

	<div class="container">
		<div class="row">
			<div class="col-xl-3 col-lg-4 col-md-5">
				<div class="sidebar-categories">
					<div class="head">Categories</div>
					<ul class="main-categories">
						<li class="main-nav-list"><a href="category.jsp?category=1&sort=0" ><span class="lnr lnr-arrow-right"></span>스니커즈<span class="number"></span></a>
						</li>
						<li class="main-nav-list"><a href="category.jsp?category=2&sort=0" ><span class="lnr lnr-arrow-right"></span>스포츠<span class="number"></span></a>
						</li>
						<li class="main-nav-list"><a href="category.jsp?category=3&sort=0" ><span class="lnr lnr-arrow-right"></span>구두<span class="number"></span></a>
						</li>
						<li class="main-nav-list"><a href="category.jsp?category=4&sort=0" ><span class="lnr lnr-arrow-right"></span>샌들<span class="number"></span></a>
						</li>
						<li class="main-nav-list"><a href="category.jsp?category=5&sort=0" ><span class="lnr lnr-arrow-right"></span>캐주얼<span class="number"></span></a>
						</li>
						<li class="main-nav-list"><a href="category.jsp?category=6&sort=0">부츠<span class="number"></span></a></li>
						
						
					</ul>
				</div>
				
			</div>
			<div class="col-xl-9 col-lg-8 col-md-7">
				<!-- Start Filter Bar -->
				
				
				<div class="filter-bar d-flex flex-wrap align-items-center">
					<div class="sorting">
						<select style="display: none;">
							<option value="1">Default sorting</option>
							<option value="1">Default sorting</option>
							<option value="1">Default sorting</option>
						</select>
						<div class="nice-select" tabindex="0"><span class="current">
						<%
						if(sortValue==0){ out.print("정렬");
						} else if(sortValue==1){
							out.print("베스트상품순");
						} else if(sortValue==2){
							out.print("높은가격순");
						} else if(sortValue==3){
							out.print("낮은가격순");							
						} else{
							out.print("정렬");														
						}
						%>
						</span>
						<ul class="list">
							<li data-value="1" class="option"><a href="category_product_search.jsp?sort=1&search=<%=searchKeyword%>">베스트상품순</li>
							<li data-value="1" class="option"><a href="category_product_search.jsp?sort=2&search=<%=searchKeyword%>">높은가격순</li>
							<li data-value="1" class="option"><a href="category_product_search.jsp?sort=3&search=<%=searchKeyword%>">낮은가격순</li></a>
						</ul>
					</div>
					</div>
					
					<div class="pagination">
						
						
						
						
						
						
						
					</div>
				</div>
				<!-- End Filter Bar -->
				<!-- Start Best Seller -->
				<section class="lattest-product-area pb-40 category-list">
					<div class="row">
						<!-- single product -->
							<%for(Product product:productList){
								String price = dc.format(product.getPPrice());
								%>
						<div class="col-lg-4 col-md-6">
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
				</section>
				<!-- End Best Seller -->
				<!-- Start Filter Bar -->
				<nav class="blog-pagination justify-content-center d-flex">
                            	
                        </nav>
				<!-- End Filter Bar -->
			</div>
		</div>
	</div>

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

	<!-- Modal Quick Product View -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="container relative">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
				<div class="product-quick-view">
					<div class="row align-items-center">
						<div class="col-lg-6">
							<div class="quick-view-carousel">
								<div class="item" style="background: url(img/organic-food/q1.jpg);">

								</div>
								<div class="item" style="background: url(img/organic-food/q1.jpg);">

								</div>
								<div class="item" style="background: url(img/organic-food/q1.jpg);">

								</div>
							</div>
						</div>
						<div class="col-lg-6">
							<div class="quick-view-content">
								<div class="top">
									<h3 class="head">Mill Oil 1000W Heater, White</h3>
									<div class="price d-flex align-items-center"><span class="lnr lnr-tag"></span> <span class="ml-10">$149.99</span></div>
									<div class="category">Category: <span>Household</span></div>
									<div class="available">Availibility: <span>In Stock</span></div>
								</div>
								<div class="middle">
									<p class="content">Mill Oil is an innovative oil filled radiator with the most modern technology. If you are
										looking for something that can make your interior look awesome, and at the same time give you the pleasant
										warm feeling during the winter.</p>
									<a href="#" class="view-full">View full Details <span class="lnr lnr-arrow-right"></span></a>
								</div>
								<div class="bottom">
									<div class="color-picker d-flex align-items-center">Color:
										<span class="single-pick"></span>
										<span class="single-pick"></span>
										<span class="single-pick"></span>
										<span class="single-pick"></span>
										<span class="single-pick"></span>
									</div>
									<div class="quantity-container d-flex align-items-center mt-15">
										Quantity:
										<input type="text" class="quantity-amount ml-15" value="1">
										<div class="arrow-btn d-inline-flex flex-column">
											<button class="increase arrow" type="button" title="Increase Quantity"><span class="lnr lnr-chevron-up"></span></button>
											<button class="decrease arrow" type="button" title="Decrease Quantity"><span class="lnr lnr-chevron-down"></span></button>
										</div>

									</div>
									<div class="d-flex mt-20">
										<a href="#" class="view-btn color-2"><span>Add to Cart</span></a>
										<a href="#" class="like-btn"><span class="lnr lnr-layers"></span></a>
										<a href="#" class="like-btn"><span class="lnr lnr-heart"></span></a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
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