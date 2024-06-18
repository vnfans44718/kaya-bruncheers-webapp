/************************************* 회원(member) *************************************/
--아이디로 회원정보 읽기 (select pk)
select id, pw, pwcheck, phone, birthdate, email, nickname from member where id = 'kimcoffee';

--핸드폰번호로 회원정보 읽기 (select by phone)
select id, pw, pwcheck, phone, birthdate, email, nickname from member where phone = '010-3333-3333';

--이메일로 회원정보 읽기 (select by email)
select id, pw, pwcheck, phone, birthdate, email, nickname from member where email = 'parkcoffee@naver.com';

--회원정보 수정 (update pk)
update member set 
				  phone = '010-6666-6666',
				  birthdate = '19950606',
				  email = 'jangcoffee@naver.com',
				  nickname = '장커피'
where id = 'kim1';

--비밀번호 수정 (update pw)
update member set pw = '9999' where id = 'kim1';

--회원탈퇴 (delete pk)
delete from member where id = 'kim1';



/************************************* 상품(product) *************************************/
--전체 상품 보여주기 (select all)
SELECT p_no, p_name, p_price, p_image, p_category FROM product;

--상품 1개 상세 보여주기 (select pk)
SELECT p_no, p_name, p_price, p_image, p_category FROM product WHERE p_no = 1;

--상품 1개 상세 보여주기 (select by p_category)
SELECT p_no, p_name, p_price, p_image, p_category FROM product WHERE p_category = ?

--상품 수정 (update pk)
UPDATE product SET p_name = '에스프레소' , p_price = 3000, p_image = '이미지5', p_category = '커피' WHERE p_no = 1;

--상품 삭제 (delete by p_name)
DELETE FROM product WHERE p_name = '밀크티';



/************************************** 주문(order) **************************************/
--아이디로 회원 한명의 주문목록 보여주기 (select by id)
SELECT * FROM orders WHERE id = 'kim1';

--주문번호로 주문목록 보여주기 (select with orderitem by o_no)
SELECT * FROM orders o JOIN order_item oi ON o.o_no = oi.o_no JOIN product p ON oi.p_no = p.p_no WHERE o.o_no = 1;

--아이디로 주문목록 보여주기 (select with orderitem by id)
SELECT * FROM orders o JOIN order_item oi ON o.o_no = oi.o_no JOIN product p ON oi.p_no = p.p_no WHERE o.id = 'kim1';

--주문번호로 삭제 (delete pk)
DELETE FROM orders WHERE o_no = ?;

--아이디로 삭제 (delete id)
DELETE FROM orders WHERE id = ?;



/************************************* 장바구니(cart) *************************************/
--아이디로 회원 1명의 카트리스트 보여주기 (select by id)
select c.*, p.* from cart c join product p on c.p_no = p.p_no where id = 1;

--카트번호로 회원 1명의 카트리스트 보여주기 (select pk)
select c.*, p.* from cart c join product p on c.p_no = p.p_no where c_no = 1;

--로그인한 회원의 카트에 존재하는 상품의 수 보여주기 (select by id and p_no)
select count(*)  as p_count from cart where id = 'kim1' and p_no = 1;

--카트번호로 카트리스트 삭제 (delete pk)
delete from cart where c_no = 1;

--아이디로 회원 1명의 카트리스트 삭제 (delete by id)
delete from cart where id = 1;

--카트 아이템 1개 수량 업데이트 (update pk)
update cart set c_qty = 1 where c_no = 1;

--로그인한 회원의 카트 아이템 1개 업데이트 (update by p_no and pk)
update cart set c_qty = 1 where p_no = 1 and id = 1;







