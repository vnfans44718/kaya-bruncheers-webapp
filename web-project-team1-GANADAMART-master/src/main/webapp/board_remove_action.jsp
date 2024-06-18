<%@page import="com.itwill.shop.board.*, com.itwill.shop.user.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="user_login_check.jspf"%>
<%
    // 게시글 번호와 페이지 번호 가져오기
    Integer bNo = null;
    Integer pageno = null;
    try {
        bNo = Integer.valueOf(request.getParameter("bNo"));
        pageno = Integer.valueOf(request.getParameter("pageno"));
    } catch (Exception ex) {
    }
    
    // 게시글 삭제 결과를 저장할 변수 초기화
    boolean result = true;
    String msg = "";

    // 게시글 삭제 요청 처리
    if (bNo == null) {
        result = false;
        msg = "삭제실패";
    } else {
        try {
            new BoardService().remove(bNo);
            result = true;
            msg = "삭제성공";
        } catch (BoardException e) {
            result = false;
            msg = "삭제실패:" + e.getMessage();
        }
    }
%>
<script type="text/javascript">
<%if (result) {%>
	alert('<%=msg%>');
	location.href='board_list.jsp?pageno=<%=pageno%>';
<%} else {%>
	alert('<%=msg%>');
	//history.back();
	location.href='board_list.jsp?pageno=<%=pageno%>';
<%}%>
	
</script>




