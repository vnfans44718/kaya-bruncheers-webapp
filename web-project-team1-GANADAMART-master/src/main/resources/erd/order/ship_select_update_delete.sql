--u_id의 기본 배송지 출력
select * from ship  where u_id = 'user1';
SELECT * FROM (
    SELECT rownum as idx, s.*
    FROM (
        SELECT * FROM ship WHERE u_id = 'user1' ORDER BY s_no ASC
    ) s
)
WHERE idx = 1;


--배송지 회원 아이디로 업데이트
update ship set s_no = 1 ,s_name = '이름수정', s_phone= '369369', s_addr='미국' where u_id = user2;
--기본 배송지 배송지 번호로 업데이트
update ship set s_no = 1 ,s_name = '이름수정', s_phone= '369369', s_addr='미국' where s_no=4;

--배송지 삭제

--배송지 pk로 1개 삭제 (회원 1명의 특정주소 삭제)
delete from ship where s_no='2';
--고객 pk로 배송지 1개 삭제 (회원 1명의 주소 전체 삭제)
delete from ship where u_id='user1';