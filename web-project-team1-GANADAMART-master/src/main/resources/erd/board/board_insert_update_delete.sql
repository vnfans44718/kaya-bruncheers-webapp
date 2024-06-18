
/***************************************************** insert *****************************************************/
--게시물 쓰기(최상위)
insert into board(b_no,b_title,u_id,b_content,b_groupno,b_step,b_depth) 
    values(board_b_no_SEQ.nextval,
            '게시판타이틀'||board_b_no_SEQ.currval,
            'bbbb',
            '내용입니다'||board_b_no_SEQ.currval,
            board_b_no_SEQ.currval,
            1,
            0
            );

--답글 쓰기
insert into board(b_no,b_title,u_id,b_content,b_groupno,b_step,b_depth) 
    values(board_b_no_SEQ.nextval,
            '게시판타이틀'||board_b_no_SEQ.currval,
            'bbbb',
            '내용입니다'||board_b_no_SEQ.currval,
            2,
            2,
            1
            );

/***************************************************** update *****************************************************/
--답글쓰기 전 b_step update
update board set b_step=b_step+1 where b_step > 1 and b_groupno=2;

--게시물 조회수 1 증가
update board set b_readcount=b_readcount+1 where b_no=2;

--게시물 수정
update board set b_title='제목수정', b_content='내용수정', b_date = sysdate where b_no = 8;

/***************************************************** delete *****************************************************/
--게시물 삭제
delete board where b_no=5;
--답글 삭제
delete board where b_groupno=5;






