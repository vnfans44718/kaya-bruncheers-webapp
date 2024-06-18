--insert
INSERT INTO product(p_no, p_name, p_price, p_image, p_category) VALUES (1, '아메리카노', 5000, '이미지1', '커피');
INSERT INTO product(p_no, p_name, p_price, p_image, p_category) VALUES (2, '카페라떼', 6000, '이미지2', '커피');
INSERT INTO product(p_no, p_name, p_price, p_image, p_category) VALUES (3, '밀크티', 6500, '이미지3', '티');
INSERT INTO product(p_no, p_name, p_price, p_image, p_category) VALUES (4, '캐모마일', 6000, '이미지4', '티');
INSERT INTO product(p_no, p_name, p_price, p_image, p_category) VALUES (5, '딸기스무디', 7000, '이미지5', '스무디');
INSERT INTO product(p_no, p_name, p_price, p_image, p_category) VALUES (6, '블루베리스무디', 7000, '이미지6', '스무디');

--select by no
SELECT p_no, p_name, p_price, p_image, p_category FROM product WHERE p_no = 1;

--select by category
SELECT p_no, p_name, p_price, p_image, p_category FROM product WHERE p_category = '커피';

--select all
SELECT p_no, p_name, p_price, p_image, p_category FROM product;

--update
UPDATE product SET p_name = '에스프레소' , p_price = 3000, p_image = '이미지5', p_category = '커피' WHERE p_no = 1;

--delete by name
DELETE FROM product where p_name = '밀크티';