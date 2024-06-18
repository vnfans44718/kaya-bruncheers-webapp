
--userinfo update
update review
set r_content='리뷰내용수정'
where r_no=1;

--review delete
delete review where r_no=1;

--review select 
-- 전체 리뷰 보기
select * from review;

-- 상품 하나에 대한 리뷰 리스트
select * from review where p_no=1;

-- 상품 하나에 대한 평점 합
select round(AVG(R_RATING),1) from review where p_no = 1;

-- 평점 인자로 받아서 그 평점 리뷰 몇개인지
select count(*) from review where r_rating=4;


select count(*) as review_count
from product p
join review r on p.p_no = r.p_no
where r_rating = 3;




