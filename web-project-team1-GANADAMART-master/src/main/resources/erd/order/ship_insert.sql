
insert into ship(s_no,s_name,s_phone,s_addr,u_id) values(ship_s_no_SEQ.nextval, '가나다1','01011112222','서울특별시','user1');
insert into ship(s_no,s_name,s_phone,s_addr,u_id) values(ship_s_no_SEQ.nextval, '가나다2','01022221111','경기도','user1');
insert into ship(s_no,s_name,s_phone,s_addr,u_id) values(ship_s_no_SEQ.nextval, '가나다3','01033331111','광주','user2');
insert into ship(s_no,s_name,s_phone,s_addr,u_id) values(ship_s_no_SEQ.nextval, '가나다4','01044441111','부산','user2');
insert into ship(s_no,s_name,s_phone,s_addr,u_id) values(ship_s_no_SEQ.nextval, '가나다5','01055551111','제주도','user3');

--order pk를 이용한 join 연산으로 insert
  INSERT INTO ship(s_no, s_name, s_phone, s_addr, u_id)
  SELECT ship_s_no_SEQ.nextval,
         o.o_name AS s_name,
         o.o_phone AS s_phone,
         o.o_addr AS s_addr,
         u.u_id
  FROM userinfo u
  JOIN orders o ON u.u_id = o.u_id
  WHERE o.o_no = 2;