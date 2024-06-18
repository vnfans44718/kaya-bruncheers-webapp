-----------rownum--------------

select cs_no,cs_title, cs_groupno, cs_step, cs_depth from cs 
order by cs_groupno desc, cs_step asc;

SELECT rownum ,cs.* FROM cs;
SELECT rownum ,cs.* FROM cs ORDER BY cs_groupno DESC, cs_step ASC  ;

--select rownum as rn ,sorted_board.* from (select * from board ORDER BY groupno DESC,step ASC) sorted_board 
--where rownum>= 71 and rownum<=80;

select * from (select rownum as rn ,sorted_cs.* from (select * 
                                                            from cs ORDER BY cs_groupno DESC, cs_step ASC) sorted_cs 
                                                          ) 
where rn>=1 and rn<=10;

SELECT rownum rn, s.*  FROM
				( SELECT * FROM cs
					ORDER BY cs_groupno DESC, cs_step ASC
				) s ;

SELECT  ss.* FROM
		( SELECT rownum idx, s.*  FROM
				( SELECT * FROM cs
					ORDER BY cs_groupno DESC, cs_step ASC
				)  s
		 )  ss ;

SELECT ss.* FROM
		( SELECT rownum idx, s.*  FROM
				( SELECT * FROM cs
					ORDER BY cs_groupno DESC, cs_step ASC
				) s
		 ) ss
WHERE ss.idx >= 10 AND ss.idx <= 15 ;

--cs리스트 페이지
select * from(
	 			select rownum rn,
	 					   sorted_cs.* from(
	 					   						select cs_no, cs_title, 
	 											       u_id, cs_date, 
                                                       cs_groupno, 
	 												   cs_step, cs_depth 
	 					  						 	   from cs 
	 					  						 	   order by cs_groupno desc, cs_step asc
	 					  					  ) sorted_cs
	 			 ) rownum_cs
	 where rn >= 1 and rn <= 10;
------------------------------------------------------------------     
SELECT * FROM (
    SELECT ROWNUM -3 AS rn,
               sorted_cs.* 
        FROM (
            SELECT cs_no, cs_title, 
                   u_id, cs_date, 
                   cs_groupno, 
                   cs_step, cs_depth 
            FROM cs 
            ORDER BY cs_groupno DESC, cs_step ASC
        ) sorted_cs
    ) rownum_cs
WHERE rn >= 1 AND rn <= 10 AND rownum_cs.cs_groupno < 9000;
--------------------------------------------------------------------------
--cs 리스트 전체
SELECT  cs_no,
		cs_title,
		cs_content,
		cs_date,
		cs_groupno,
		cs_step,
		cs_depth,
		u_id
FROM cs
ORDER BY cs_groupno DESC, cs_step ASC;

--cs 1개 게시물 그룹
SELECT *
FROM cs
WHERE cs_groupno = 15 order by cs_groupno desc , cs_step asc;


SELECT *
FROM cs
WHERE cs_groupno = 1  AND cs_depth >= 0 AND cs_step >= 1
ORDER BY cs_step, cs_depth ASC;

SELECT *
FROM cs
WHERE cs_groupno = 1;


SELECT count(*) cnt FROM cs WHERE cs_groupno = 1 AND cs_depth >= 0 AND cs_step >= 1 ORDER BY cs_step, cs_depth ASC;


