--게시판 리스트

--답글 내림차순
SELECT b_no, b_title, b_groupno, b_readcount, b_step, b_depth, u_id
FROM board ORDER BY b_groupno DESC;

--내린 답글 오름차순
SELECT b_no, b_title, b_groupno, b_readcount, b_step, b_depth, u_id
FROM board ORDER BY b_groupno DESC,b_step ASC;

-----------rownum--------------

select b_no,b_title, b_groupno, b_step, b_depth from board 
order by b_groupno desc, b_step asc;

SELECT rownum ,board.* FROM board;
SELECT rownum ,board.* FROM board ORDER BY b_groupno DESC, b_step ASC  ;

--select rownum as rn ,sorted_board.* from (select * from board ORDER BY groupno DESC,step ASC) sorted_board 
--where rownum>= 71 and rownum<=80;

select * from (select rownum as rn ,sorted_board.* from (select * 
                                                            from board ORDER BY b_groupno DESC, b_step ASC) sorted_board 
                                                          ) 
where rn>=1 and rn<=10;

SELECT rownum rn, s.*  FROM
				( SELECT * FROM board
					ORDER BY b_groupno DESC, b_step ASC
				) s ;

SELECT  ss.* FROM
		( SELECT rownum idx, s.*  FROM
				( SELECT * FROM board
					ORDER BY b_groupno DESC, b_step ASC
				)  s
		 )  ss ;

SELECT ss.* FROM
		( SELECT rownum idx, s.*  FROM
				( SELECT * FROM board
					ORDER BY b_groupno DESC, b_step ASC
				) s
		 ) ss
WHERE ss.idx >= 10 AND ss.idx <= 15 ;

--게시판리스트 페이지
select * from(
	 			select rownum idx,
	 					   sorted_board.* from(
	 					   						select b_no, b_title, 
	 											       u_id, b_date, 
	 												   b_readcount, b_groupno, 
	 												   b_step, b_depth 
	 					  						 	   from board 
	 					  						 	   order by b_groupno desc, b_step asc
	 					  					  ) sorted_board
	 			 ) rownum_board
	 where idx >= 1 and idx <= 15;


--게시판 리스트 전체
SELECT  b_no,
		b_title,
		b_content,
		b_readcount,
		b_date,
		b_groupno,
		b_step,
		b_depth,
		u_id
FROM board
ORDER BY b_groupno DESC, b_step ASC;

--게시판 1개 게시물 그룹
SELECT *
FROM board
WHERE b_groupno = 15 order by b_groupno desc , b_step asc;


SELECT *
FROM board
WHERE b_groupno = 1  AND b_depth >= 0 AND b_step >= 1
ORDER BY b_step, b_depth ASC;

SELECT *
FROM board
WHERE b_groupno = 1;


SELECT count(*) cnt FROM board WHERE b_groupno = ? AND b_depth >= ? AND b_step >= ? ORDER BY b_step, b_depth ASC;


