<%@ page import="com.itwill.shop.user.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%
    String sUserId = (String)session.getAttribute("sUserId");

	User fuser = (User)request.getAttribute("fuser");
    if (fuser == null) {
        fuser = new User("","","","","","","");
    }
    String msg = (String)request.getAttribute("msg");
    if (msg == null) msg = "";
    
%>
<!DOCTYPE html><head>
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

    <link rel="stylesheet" href="css/linearicons.css">
    <link rel="stylesheet" href="css/owl.carousel.css">
    <link rel="stylesheet" href="css/themify-icons.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/nice-select.css">
    <link rel="stylesheet" href="css/nouislider.min.css">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/main.css">

    <script type="text/javascript" charset="UTF-8" src="https://maps.googleapis.com/maps-api-v3/api/js/56/1/intl/ko_ALL/common.js"></script>
    <script type="text/javascript" charset="UTF-8" src="https://maps.googleapis.com/maps-api-v3/api/js/56/1/intl/ko_ALL/util.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
        function addressApi() {
            new daum.Postcode({
                oncomplete: function(data) {
                console.log(data);
                console.log(data.address);
        			document.f.uAddr.value=data.address;
                }
            }).open();
        }
    </script>
    <script type="text/javascript">

    function updateEmail() {
            var selectBox = document.getElementById("emailDomainSelect");
            var selectedValue = selectBox.options[selectBox.selectedIndex].value;
            document.getElementById("emailDomainText").value = selectedValue;
        }

        $("uEmail").blur(function() {
            email();
        });
        $("emailDomainText").change(function(){
            email();
        });

        function email() {
            const email = $("uEmail").val();
            const middle = $("middle").text();
            const address = $("#emailDomainText").val();
            if(email != "" && address != "") {
                $("#totalEmail").val(email+middle+address);
                }
        };

        function userCreate() {

            if (f.uId.value == "") {
                alert("아이디를 입력하세요.");
                f.uId.focus();
                return false;
            }

            if (f.uPass.value == "") {
                alert("비밀번호를 입력하세요.");
                f.uPass.focus();
                return false;
            }

            if (f.uPass2.value == "") {
                alert("비밀번호 확인을 입력하세요");
                f.uPass2.focus();
                return false;
            }

            if (f.uName.value == "") {
                alert("이름을 입력하세요.");
                f.uName.focus();
                return false;
            }

            if (f.uDob.value == "") {
                alert("생년월일을 입력하세요.");
                f.uDob.focus();
                return false;
            }
            
            if (f.uPhone.value == "") {
    			alert("전화번호를 입력하세요.");
    			f.uPhone.focus();
    			return false;
    		}

            if (f.uEmail.value == "") {
                alert("이메일을 입력하세요.");
                f.uEmail.focus();
                return false;
            }

            if (f.uAddr.value == "") {
                alert("주소를 입력하세요.");
                f.uAddr.focus();
                return false;
            }

            if (f.uPass.value != f.uPass2.value) {
                alert("비밀번호와 비밀번호확인은 일치 해야 합니다.");
                f.uPass.focus();
                f.uPass.select();
                return false;
            }

            f.action = "user_create_action.jsp";
            f.method='POST';
            f.submit();
        }

        function updateMessage(message, color) {
            var messageElement = document.getElementById("duplicateMessage");
            messageElement.innerHTML = message;
            messageElement.style.color = color;
        }

        function validateUserId(uId) {
            if (uId.match(/^[a-zA-Z0-9]+$/)) {
                return 0; // 아이디가 유효한 경우
            } else {
                return 1; // 아이디가 유효하지 않은 경우
            }
        }

        function checkDuplicate() {
            var uId = document.f.uId.value;
            var message = "";
            var color = "black";
            var validationResult = validateUserId(uId);

            if (uId === "") {
                updateMessage("", color);
                return;
            }

            if (validationResult === 1) {
                message = "아이디는 영문 또는 숫자만 가능합니다.";
                color = "red";
            }

            updateMessage(message, color);

            if (validationResult !== 0) {
                document.f.uId.select();
                document.f.uId.focus();
                return;
            }

            var xhr = new XMLHttpRequest();
            xhr.onload = function() {
                if (xhr.status === 200) {
                    updateMessage(xhr.responseText, xhr.responseText.includes("이미 사용 중인 아이디입니다.") ? "red" : "green");
                    if (xhr.responseText.includes("이미 사용 중인 아이디입니다.")) {
                        document.f.uId.select();
                        document.f.uId.focus();
                    }
                }
            };
            xhr.open("GET", "user_check_duplicate.jsp?uId=" + encodeURIComponent(uId), true);
            xhr.send();
            }
    </script>
</head>
<body>
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
                    <h1 style="color: #CF1010">Join</h1>
                    
                    </nav>
                </div>
            </div>
        </div>
    </section>
    <!-- End Banner Area -->

<!--================Login Box Area =================-->
<div class="row justify-content-center">
<div class="col-lg-6 justify-content-center">

    <div class="login_form_inner">
        <h3>회원가입</h3>

        <form name="f" method="POST" class="row login_form" id="contactForm"
              novalidate="novalidate">
            <div class="col-md-12 form-group">
                <input type="text" class="form-control" id="uId" name="uId" placeholder="아이디"
                       value="<%= fuser.getUId() %>" onfocus="this.placeholder = ''" onblur="this.placeholder = '아이디'" onchange="checkDuplicate()">
                <span id="duplicateMessage"></span>
            </div>
            <div class="col-md-12 form-group">
                <input type="password" class="form-control" id="uPass" name="uPass" placeholder="비밀번호"
                       value="<%= fuser.getUPass() %>" onfocus="this.placeholder = ''" onblur="this.placeholder = '비밀번호'">
            </div>
            <div class="col-md-12 form-group">
                <input type="password" class="form-control" id="uPass2" name="uPass2" placeholder="비밀번호 확인"
                       value="<%= fuser.getUPass() %>" onfocus="this.placeholder = ''" onblur="this.placeholder = '비밀번호 확인'">
            </div>
            <div class="col-md-12 form-group">
                <input type="text" class="form-control" id="uName" name="uName"
                       placeholder="이름" onfocus="this.placeholder = ''"
                       value="<%= fuser.getUName() %>" onblur="this.placeholder = '이름'">
            </div>
            <div class="col-md-12 form-group">
                <input type="date" class="form-control" id="uBod" name="uDob" value="<%= fuser.getUDob() %>">
            </div>
            <div class="col-md-12 form-group">
                <input type="text" class="form-control" id="uPhone" name="uPhone" placeholder="휴대폰 번호"
                       value="<%= fuser.getUPhone() %>" onfocus="this.placeholder = ''" onblur="this.placeholder = '휴대폰 번호'"
                       oninput="phoneMask(this)" maxlength="13">
            </div>
            <script>
                function addHyphen() {
                    var phone = document.getElementById('uPhone');
                    var num = phone.value.replace(/-/g, '');

                    if (num.length < 4) {
                        phone.value = num;
                    } else if (num.length < 7) {
                        phone.value = num.substr(0, 3) + '-' + num.substr(3);
                    } else if (num.length < 11) {
                        phone.value = num.substr(0, 3) + '-' + num.substr(3, 4) + '-' + num.substr(7);
                    } else {
                        phone.value = num.substr(0, 3) + '-' + num.substr(3, 4) + '-' + num.substr(7, 4);
                    }
                }
                document.getElementById('uPhone').addEventListener('keyup', addHyphen);
            </script>
            <div class="col-md-12 form-group">
                <div class="input-group">
                    <input type="email" class="form-control" id="uEmail" name="uEmail" placeholder="이메일"
                           value="<%= fuser.getUEmail() %>" onfocus="this.placeholder = ''" onblur="this.placeholder = '이메일'"><span id="middle">@</span>
                    <div class="input-group-append">
                        <input type="text" id="emailDomainText" name="emailDomainText" class="form-control" value="" placeholder="도메인">
                    </div>
                    <select class="custom-select" id="emailDomainSelect" name="emailDomain" onchange="updateEmail()">
                        <option value="">선택</option>
                        <option value="gmail.com">gmail.com</option>
                        <option value="naver.com">naver.com</option>
                        <option value="itwill">itwill.com</option>
                    </select>
                    <input type="hidden" id="totalEmail" name="email" value="">
                </div>
            </div>


            <div class="col-md-12 form-group">
                <input type="text" class="form-control" id="uAddr" name="uAddr" placeholder="주소"
                value="<%= fuser.getUAddr() %>" onfocus="this.placeholder = ''" onblur="this.placeholder = '주소'">
                <input type="button" onclick="addressApi()" value="우편번호 찾기">
            </div>
                <div class="col-md-12 form-group">
                <button type="button" value="회원가입" onclick="userCreate();" class="primary-btn">회원가입</button>
            </div>
        </form>
    </div>
    </div>
</div>
<!--================End Login Box Area =================-->

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