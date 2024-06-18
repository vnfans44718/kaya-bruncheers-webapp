<%@page import="com.itwill.shop.review.ReviewService"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.itwill.shop.review.Review"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.itwill.shop.product.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.itwill.shop.product.ProductService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<style>
.star {
	font-size: 24px;
	cursor: pointer;
	color: gray;
}

.star:hover, .star.selected {
	color: gold;
}
</style>

<%
String referer = request.getHeader("Referer");
System.out.print(referer);
String sUserId = (String) session.getAttribute("sUserId");

boolean isLogin = false;
if (session.getAttribute("sUserId") != null) {
	isLogin = true;
}

String pNo = request.getParameter("pNo");
ProductService productService = new ProductService();
productService.increaseCount(Integer.parseInt(pNo));
Product product = productService.productByPK(Integer.parseInt(pNo));

DecimalFormat dc = new DecimalFormat("###,###,###,###");

ReviewService reviewService = new ReviewService();
List<Review> reviewList = reviewService.ProductReview(Integer.parseInt(pNo));
%>
<jsp:include page="include_css.jsp"></jsp:include>
<script type="text/javascript">
	function add_cart(){
		if (<%=!isLogin%>) {
			alert('로그인 하세요.');
			location.href = 'user_login_form.jsp';
			return false;
		} 
		return true;
	}
	
	function add_cart_popup_window(){
		if (<%=!isLogin%>) {
			alert('로그인 하세요');
			location.href = 'user_login_form.jsp';
		} else if(p_size.value==""){
			alert('사이즈를 골라주세요.');
			return false;
		} else{
			
			var left = Math.ceil(( window.screen.width)/5);
			var top = Math.ceil(( window.screen.height)/3); 
			console.log(left);
			console.log(top);
			var cartWin = window.open("about:blank","cartForm","width=260,height=130,top="+top+",left="+0+",location=no, directories=no, status=no, menubar=no, scrollbars=no,copyhistory=no");
			document.add_cart_form.action = 'cart_add_action_popup_window.jsp';
			document.add_cart_form.target = 'cartForm';
			document.add_cart_form.method = 'POST';
			document.add_cart_form.submit();
		}
	}


function selectButton(button) {
    // 모든 버튼의 선택 상태를 초기화합니다.
    const buttons = document.querySelectorAll('.genric-btn');
    buttons.forEach(btn => {
        btn.classList.value = 'genric-btn primary-border small';
    });
    // 클릭된 버튼에 선택 클래스를 추가합니다.
        button.classList.value = 'genric-btn primary small select';
        var value = button.value;
        document.getElementById("p_size").value = value;
        document.getElementById("o_p_size").value = value;
}
function setOrderQty(){
	console.log(add_cart_form.cart_qty.value);
	product_detail_form.p_qty.value = add_cart_form.cart_qty.value
	console.log(product_detail_form.p_qty.value);
}
/*
제품상세보기에서주문
*/
function order_create_form() {
	if (<%=!isLogin%>) {
		alert('로그인 하세요');
		location.href = 'user_login_form.jsp';
	} else if(p_size.value==""){
		alert('사이즈를 골라주세요.');
		return false;
	} else {
		document.product_detail_form.method = 'POST';
		document.product_detail_form.action = 'order_create_form.jsp';
		document.product_detail_form.submit();
	}
}



function review (){
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
	<form name="product_detail_form">
		<input type="hidden" name="p_no" value="<%=product.getPNo()%>">
		<input type="hidden" id="p_qty" name="p_qty" value="1"> <input
			type="hidden" id="o_p_size" name="o_p_size" value=""> <input
			type="hidden" name="buyType" value="direct">
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
                    <h1 style="color: #CF1010">Product</h1>
                    
                    </nav>
                </div>
            </div>
        </div>
    </section>
    <!-- End Banner Area -->

	<!--================Single Product Area =================-->
	<div class="product_image_area">
		<div class="container">
			<div class="row s_product_inner">
				<div class="col-lg-6">
					<div class="s_Product_carousel">
						<div class="single-prd-item">
							<img class="img-fluid" src="img/product/<%=product.getPImg()%>"
								alt="">
						</div>
						<div class="single-prd-item">
							<img class="img-fluid" src="img/product/<%=product.getPImg()%>"
								alt="">
						</div>
						<div class="single-prd-item">
							<img class="img-fluid" src="img/product/<%=product.getPImg()%>"
								alt="">
						</div>
					</div>
				</div>

				<div class="col-lg-5 offset-lg-1">
					<div class="s_product_text">
						<h3><%=product.getPName()%></h3>
						<h2><%=dc.format(product.getPPrice()) + "원"%></h2>
						<ul class="list">
							<%
							int categoryNo = product.getPCategory();
							String category = "";
							switch (categoryNo) {
								case 1 :
									category = "스니커즈";
									break;
								case 2 :
									category = "스포츠";
									break;
								case 3 :
									category = "구두";
									break;
								case 4 :
									category = "샌들";
									break;
								case 5 :
									category = "캐주얼";
									break;
								case 6 :
									category = "부츠";
									break;
							}
							%>
							<li><a class="active"><span>Category</span>:&nbsp;&nbsp;
									<%=category%></a></li>
						</ul>
						<div style="display: flex; margin-top: 30px">
							<span style="display: flex"><label for="size">Size:</label></span>
							<table>
								<tr>
									<div style="display: flex; flex-direction: column;">
										<ul style="display: flex;">
											<button class="genric-btn primary-border small" value="230"
												onclick="selectButton(this)" style="margin: 1% 3px">230</button>
											<button class="genric-btn primary-border small" value="235"
												onclick="selectButton(this)" style="margin: 1% 3px">235</button>
											<button class="genric-btn primary-border small" value="240"
												onclick="selectButton(this)" style="margin: 1% 3px">240</button>
											<button class="genric-btn primary-border small" value="245"
												onclick="selectButton(this)" style="margin: 1% 3px">245</button>
										</ul>

										<ul style="display: flex">
											<button class="genric-btn primary-border small" value="250"
												onclick="selectButton(this)" style="margin: 1% 3px">250</button>
											<button class="genric-btn primary-border small" value="255"
												onclick="selectButton(this)" style="margin: 1% 3px">255</button>
											<button class="genric-btn primary-border small" value="260"
												onclick="selectButton(this)" style="margin: 1% 3px">260</button>
											<button class="genric-btn primary-border small" value="265"
												onclick="selectButton(this)" style="margin: 1% 3px">265</button>
										</ul>
										<ul style="display: flex">
											<button class="genric-btn primary-border small" value="270"
												onclick="selectButton(this)" style="margin: 1% 3px">270</button>
											<button class="genric-btn primary-border small" value="275"
												onclick="selectButton(this)" style="margin: 1% 3px">275</button>
											<button class="genric-btn primary-border small" value="280"
												onclick="selectButton(this)" style="margin: 1% 3px">280</button>
										</ul>
									</div>
								</tr>
							</table>
						</div>

						<form name="add_cart_form" method="post"
							onsubmit="return add_cart();" action="cart_add_action.jsp"
							style="margin-bottom: 30px; margin-top: 40px">
							<div class="product_count">
								<label for="qty">Quantity:</label> <input type="text"
									name="cart_qty" id="sst" maxlength="12" value="1"
									title="Quantity:" class="input-text qty" readonly="readonly">
								<button
									onclick="var result = document.getElementById('sst'); var sst = result.value; if( !isNaN( sst )) result.value++;setOrderQty();return false;"
									class="increase items-count" type="button">
									<i class="lnr lnr-chevron-up"></i>
								</button>
								<button
									onclick="var result = document.getElementById('sst'); var sst = result.value; if( !isNaN( sst ) &amp;&amp; sst > 1 ) result.value--;setOrderQty(this);return false;"
									class="reduced items-count" type="button">
									<i class="lnr lnr-chevron-down"></i>
								</button>
							</div>
							<div class="card_area d-flex align-items-center"
								style="margin-top: 40px">
									<a href="<%=referer %>" class="primary-btn"
									style="color: white;">뒤로가기</a>
								<a href="javascript:add_cart_popup_window(this.parentElement);"
									class="primary-btn" style="color: white;">장바구니 담기</a> 
									<input
									type="hidden" id="p_size" name="p_size" value=""> 
									<input type="hidden" id="p_no" name="p_no"
									value="<%=product.getPNo()%>"> 
									
									<a href="javascript:order_create_form();" class="primary-btn"
									style="color: white;">주문하기</a>
									
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--================End Single Product Area =================-->

	<!--================Product Description Area =================-->
	<section class="product_description_area">
		<div class="container">
			<ul class="nav nav-tabs" id="myTab" role="tablist">
				<li class="nav-item"><a class="nav-link show active" id="contact-tab"
					data-toggle="tab" href="#contact" role="tab"
					aria-controls="contact" aria-selected="false">상품 후기</a></li>
				<li class="nav-item"><a class="nav-link"
					id="review-tab" data-toggle="tab" href="#review" role="tab"
					aria-controls="review" aria-selected="true">후기 작성</a></li>
			</ul>
			<!-- ------------myTabContent----------------------- -->
			<div class="tab-content" id="myTabContent">
				
				<div class="tab-pane fade active show" id="contact" role="tabpanel" aria-labelledby="contact-tab">
					<div class="row">
					<div class="col-lg-2"></div>
					<div class="col-lg-8">
							<%if(reviewList.size()>0){ %>
							<div class="row total_rate">
								<div class="col-6">
									<div class="box_total">
										
										<h5>상품만족도</h5>
										<%DecimalFormat df = new DecimalFormat("#.#"); %>
										<h4><%=df.format(reviewService.ProductReviewRating(Integer.parseInt(pNo))/(double)(reviewList.size()))%></h4>
										<h6>(<%=reviewList.size() %> Reviews)</h6>
									</div>
								</div>
								<div class="col-6">
									<div class="rating_list">
										<h3>Based on <%=reviewList.size() %> Reviews</h3>
										<ul class="list">
											<li><a href="#">5 Star <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i> </a></li>
											<li><a href="#">4 Star <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i> </a></li>
											<li><a href="#">3 Star <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i> </a></li>
											<li><a href="#">2 Star <i class="fa fa-star"></i><i class="fa fa-star"></i> </a></li>
											<li><a href="#">1 Star <i class="fa fa-star"></i></a></li>
										</ul>
									</div>
								</div>
							</div>
							<%} else{%>
								<div class="row total_rate">
								<div class="col-2"></div>
								<div class="col-8">
									<div class="box_total">
										
										<h5>아직 등록된 후기가 없습니다.</h5>
										<h4></h4>
										<h6></h6>
									</div>
								</div>
							</div>
							<%} %>
							
									
							<div class="review_list">
								<%for(Review review:reviewList){ %>
								<div class="review_item">
									<div class="media">
										<div class="d-flex">
											<img src="img/product/review-2.png" alt="">
										</div>
										<div class="media-body">
											<h4> 아이디 : <%=review.getUId() %> <span style="float: right;"><%=review.getRDate().toLocaleString() %></span></h4>
											<div>
											별점 :
											<%for(int i=0;i<review.getRRating();i++){ %>
											<i class="fa fa-star"></i>
											<%} %>
											</div>
										</div>
									</div>
									<p><%=review.getRContent() %></p>
								</div>
								<hr>
								<%} %>
							</div>
						</div>
					
					</div>
				</div>
			 <div class="tab-pane fade" id="review" role="tabpanel" aria-labelledby="review-tab">
               <div class="row">
                  <div class="col-lg-1"></div>
                  <div class="col-lg-10">
                     <div class="review_box">
                        <h4>후기를 작성해주세요.</h4>
                        <p>별점:</p>
                        <sqan class="rating" id="rating">
                              <span class="star" onclick="rate(1)">&#9733;</span>
                              <span class="star" onclick="rate(2)">&#9733;</span>
                              <span class="star" onclick="rate(3)">&#9733;</span>
                              <span class="star" onclick="rate(4)">&#9733;</span>
                              <span class="star" onclick="rate(5)">&#9733;</span>
                              
                          </span>
                        <form name="reviewForm" class="row contact_form" onsubmit="return review()" action="submit_review_action.jsp" method="post" id="reviewForm" novalidate="novalidate">
                           <div class="col-md-12">
                              <div class="form-group">
                                 <input type="text" class="form-control" readonly="readonly" value="작성자 : <%=sUserId %>님" id="name" name="name" placeholder="Your Full name" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Your Full name'">
                                 <input type="hidden" name="pNo" value="<%=product.getPNo()%>">
                                 <input type="hidden" id="ratingValue" name="rating" value="0">
                              </div>
                           </div>
                           <div class="col-md-12">
                              <div class="form-group">
                                 <textarea class="form-control" name="message" id="message" rows="1" placeholder="Review" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Review'"></textarea>
                              </div>
                           </div>
                           <div class="col-md-12 text-right" style="display: flex;justify-content: center;">
                              <button type="submit" value="submit" class="primary-btn" on>작성하기</button>
                           </div>
                        </form>
                     </div>
                  </div>
               </div>
            </div>
		</div>
	</section>
	<!--================End Product Description Area =================-->



	<!-- start footer Area -->
	<footer class="footer-area section_gap">
		<div class="container">
			<div class="row">
				<div class="col-lg-3  col-md-6 col-sm-6">
					<div class="single-footer-widget">
						<h6>About Us</h6>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
							sed do eiusmod tempor incididunt ut labore dolore magna aliqua.</p>
					</div>
				</div>
				<div class="col-lg-4  col-md-6 col-sm-6">
					<div class="single-footer-widget">
						<h6>Newsletter</h6>
						<p>Stay update with our latest</p>
						<div class="" id="mc_embed_signup">

							<form target="_blank" novalidate="true"
								action="https://spondonit.us12.list-manage.com/subscribe/post?u=1462626880ade1ac87bd9c93a&amp;id=92a4423d01"
								method="get" class="form-inline">

								<div class="d-flex flex-row">

									<input class="form-control" name="EMAIL"
										placeholder="Enter Email" onfocus="this.placeholder = ''"
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
					<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
				</p>
			</div>
		</div>
	</footer>
	<!-- End footer Area -->
	<script>
	let selectedRating = 0; // 초기값은 선택되지 않은 상태로 설정

	function rate(value) {
	    // 선택한 별점을 저장
	    selectedRating = value;
	    document.getElementById('ratingValue').value = value;
	    updateStars();
	}

	function updateStars() {
	    const stars = document.querySelectorAll('.star');
	    stars.forEach((star, index) => {
	        if (index < selectedRating) {
	            star.classList.add('selected');
	        } else {
	            star.classList.remove('selected');
	        }
	    });
	}

	document.getElementById('reviewForm').addEventListener('submit', function(event) {
	    if (selectedRating == 0) {
	        alert('별점을 선택해주세요.');
	        event.preventDefault();
	    }
	});
	</script>
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

</body>

</html>