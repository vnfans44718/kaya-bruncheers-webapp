<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.itwill.shop.board.Board"%>
<%@page import="com.itwill.shop.board.BoardService"%>
<%@page import="com.itwill.shop.board.BoardListPageMakerDto"%>
<%@page import="com.itwill.shop.board.PageInputDto"%>
<%@page import="com.itwill.shop.board.util.PageMaker"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!public String getTitleString(Board board) {
    StringBuilder title = new StringBuilder(128);
    String t = board.getBTitle();
    if (t.length() > 15) {
        t = String.format("%s...", t.substring(0, 15));
    }
    for (int i = 0; i < board.getBDepth(); i++) {
        title.append("&nbsp;&nbsp;");
    }
    if (board.getBDepth() > 0) {
        title.append("<img border='0' src='img/re.gif'/>");
    }
    title.append(t.replace(" ", "&nbsp;"));
    return title.toString();
}%>

<%
//요청페이지번호    
String pageno = request.getParameter("pageno");
if (pageno == null || pageno.equals("")) {
    pageno = "1";
}
//게시물조회
BoardListPageMakerDto boardListPage = 
    new BoardService().findBoardList(Integer.parseInt(pageno));


String sUserId = (String)session.getAttribute("sUserId");


boolean isLogin = false;
if (session.getAttribute("sUserId") != null) {
	isLogin = true;
}

%>

<!DOCTYPE html>
<html lang="zxx" class="no-js">
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
    <style type="text/css">
    	#paging_table.table td, .table th {
		    padding: 0.75rem;
		    vertical-align: top;
		    border-top: 1px solid #ffffff;
		}
    </style>
    <script type="text/javascript">
		function boardCreate() {
			if (<%=!isLogin%>) {
				alert('로그인 하세요.');
				location.href = 'user_login_form.jsp';
				return false;
			} else {
				location.href = "board_write.jsp";
				return true;
			}
		}
		function checkLogin(bNo, pageno) {
		    if (<%=!isLogin%>) {
		        alert('로그인 하세요.');
		        location.href = 'user_login_form.jsp';
		        return false;
		    } else {
		        location.href = 'board_view.jsp?bNo=' + bNo + '&pageno=' + pageno;
		        return true;
		    }
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
                    <h1 style="color: #CF1010">Board</h1>
                    
                    </nav>
                </div>
            </div>
        </div>
    </section>
    <!-- End Banner Area -->

    <!-- Start 게시판 리스트 -->
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <h2>게시판 리스트</h2>
				<table style="margin-left: auto; margin-right: 0;" border="0"
					cellpadding="0" cellspacing="0">
					<tr bgcolor="#FFFFFF">
						<td height="20" class="t1" align="right" valign="bottom">♠ 총
							<font color="#FF0000"><%=boardListPage.pageMaker.getTotCount()%></font>
							건 | 현재페이지(<font color="#FF0000"><%=boardListPage.pageMaker.getCurPage()%></font>
							/ <font color="#0000FF"><%=boardListPage.pageMaker.getTotPage()%></font>)
						</td>
					</tr>
				</table>
				<table class="table">
                    <thead>
                        <tr>
                            <td width=70 align=center bgcolor="FFFFFF">번호</td>
                            <td width=500 align=center bgcolor="FFFFFF">제목</td>
                            <td width=100 align=center bgcolor="FFFFFF">작성자</td>
                            <td width=100 align=center bgcolor="FFFFFF">작성일</td>
                            <td width=70 align=center bgcolor="FFFFFF">조회수</td>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                        for(Board board : boardListPage.itemList) {
                        %>
                        <tr>
                            <td align="center"><%= board.getRn()%></td>
	                        <td ><a href="board_view.jsp?bNo=<%= board.getBNo() %>&pageno=<%=boardListPage.pageMaker.getCurPage()%>"
	                        		onclick="checkLogin(<%= board.getBNo() %>, <%= boardListPage.pageMaker.getCurPage() %>); return false;">
	                                <%= this.getTitleString(board) %></a></td>
	                        <td align="center"><%= board.getUId() %></td>
	                        <td align="center"><%= dateFormat.format(board.getBDate()) %></td>
	                        <td align="center"><%= board.getBReadcount() %></td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
                <!-- 페이징 처리 추가 -->
				<table class="table" id="paging_table">
					<tr>
						<td align="center">
							<%if(boardListPage.pageMaker.getCurBlock() > 1) {%> <a
							href="./board_list.jsp?pageno=<%=boardListPage.pageMaker.getPrevGroupStartPage()%>">◀◀</a>&nbsp;&nbsp;
							<%}%> <%if(boardListPage.pageMaker.getPrevPage()>0) {%> <a
							href="./board_list.jsp?pageno=<%=boardListPage.pageMaker.getPrevPage()%>">◀</a>&nbsp;&nbsp;
							<%}%> <%
								for (int i = boardListPage.pageMaker.getBlockBegin(); i <= boardListPage.pageMaker.getBlockEnd(); i++) {
							 	if (boardListPage.pageMaker.getCurPage() == i) {
							%> <font color='red'><strong><%=i%></strong></font>&nbsp; <%} else {%>
							<a href="./board_list.jsp?pageno=<%=i%>"><strong><%=i%></strong></a>&nbsp;
							<%
							   }
							  }%> <%if(boardListPage.pageMaker.getNextPage()<=boardListPage.pageMaker.getTotPage()){%>
							<a
							href="./board_list.jsp?pageno=<%=boardListPage.pageMaker.getNextPage()%>">▶&nbsp;&nbsp;</a>
							<%}%> <%if(boardListPage.pageMaker.getTotBlock() > boardListPage.pageMaker.getCurBlock()){%>
							<a
							href="./board_list.jsp?pageno=<%=boardListPage.pageMaker.getNextGroupStartPage()%>">▶▶&nbsp;&nbsp;</a>
							<%}%>
						</td>
					</tr>
					<tr>
						<td align="right"><input type="button" value="글쓰기"
							class="genric-btn primary-border" onclick="boardCreate();" /></td>
					</tr>
				</table>
			</div>
        </div>
    </div>
    <!-- End 게시판 리스트 -->

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

    <!--================Contact Success and Error message Area =================-->
    <div id="success" class="modal modal-message fade" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <i class="fa fa-close"></i>
                    </button>
                    <h2>Thank you</h2>
                    <p>Your message is successfully sent...</p>
                </div>
            </div>
        </div>
    </div>

    <!-- Modals error -->

    <div id="error" class="modal modal-message fade" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <i class="fa fa-close"></i>
                    </button>
                    <h2>Sorry !</h2>
                    <p> Something went wrong </p>
                </div>
            </div>
        </div>
    </div>
    <!--================End Contact Success and Error message Area =================-->


    <script src="js/vendor/jquery-2.2.4.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
        crossorigin="anonymous"></script>
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
</body>

</html>

