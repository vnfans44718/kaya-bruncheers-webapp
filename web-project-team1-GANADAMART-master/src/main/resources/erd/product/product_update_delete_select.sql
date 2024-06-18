/******************************* select ******************************/
-- 1. 전체 상품 검색
select * from product;
-- 2. 전체 상품 정렬해서 검색(인기순)
select * from product order by p_count desc,p_name asc;
-- 3. 전체 상품 정렬해서 검색(가격 높은순)
select * from product order by p_price desc;
-- 4. 전체 상품 정렬해서 검색(가격 낮은순)
select * from product order by p_price asc;
-- 5. 전체 상품 정렬해서 검색(이름순)
select * from product order by p_name asc;
-- 6. 카테고리 별 전체 상품 검색
select * from product where p_category=1;
-- 7. 카테고리 별 전체 상품 정렬해서 검색(인기순) 
select * from product where p_category=1  order by p_count desc,p_name asc;
-- 8. 카테고리 별 전체 상품 정렬해서 검색(가격 높은순)
select * from product where p_category=1 order by p_price desc;
-- 9. 카테고리 별 전체 상품 정렬해서 검색(가격 낮은순)
select * from product where p_category=1 order by p_price asc;
-- 10. 카테고리 별 전체 상품 정렬해서 검색(이름순)
select * from product where p_category=1 order by p_name asc;
-- 11. 이름으로 검색
select * from product where p_name like '%뉴발란스%';
-- 12. pk로 검색
select * from product where p_no=1;
/******************************* update ******************************/
/******************************* delete******************************/