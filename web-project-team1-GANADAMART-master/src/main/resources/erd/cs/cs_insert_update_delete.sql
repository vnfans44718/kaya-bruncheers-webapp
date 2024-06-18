/***************************************************** insert *****************************************************/
--게시물 쓰기(최상위)
insert into cs(cs_no,cs_title, u_id, cs_content, cs_groupno, cs_step, cs_depth) 
    values(cs_cs_no_seq.nextval,
            'cs타이틀'||cs_cs_no_seq.currval,
            'bbbb'||cs_cs_no_seq.currval,
            'cs내용입니다'||cs_cs_no_seq.currval,
            cs_cs_no_seq.currval,
            1,
            0
            );
            
/***************************************************** update *****************************************************/
--답글쓰기 전 b_step update
update cs set cs_step=cs_step+1 where cs_step > 1 and cs_groupno=2;

--게시물 조회수 1 증가
update cs set cs_readcount=cs_readcount+1 where cs_no=2;

--게시물 수정
update cs set cs_title='제목수정', cs_content='내용수정', cs_date = sysdate where cs_no = 8;

/***************************************************** delete *****************************************************/            
--게시물 삭제
delete cs where cs_no=5; 