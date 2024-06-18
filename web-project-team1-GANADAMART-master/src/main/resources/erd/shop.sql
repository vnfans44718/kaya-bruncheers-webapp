/*********************************** userinfo ***************************************/
--userinfo insert
insert into userinfo(u_id,u_pass,u_name,u_addr,u_phone,u_email,u_dob) values('admin','admin','관리자','서울특별시','010-0000-0000','admin@gmail.com','2000-01-01');
insert into userinfo(u_id,u_pass,u_name,u_addr,u_phone,u_email,u_dob) values('aaaa','aaaa','김민수','서울특별시','010-1111-1111','aaaa@gmail.com','2000-01-01');
insert into userinfo(u_id,u_pass,u_name,u_addr,u_phone,u_email,u_dob) values('bbbb','bbbb','강철수','경기도','010-2222-2222','bbbb@gmail.com','2002-02-02');
insert into userinfo(u_id,u_pass,u_name,u_addr,u_phone,u_email,u_dob) values('cccc','cccc','박만식','강원도','010-3333-3333','cccc@gmail.com','2008-08-10');


/*********************************** board ***************************************/

--게시물 쓰기
--insert into board(b_no,b_title,u_id,b_content,b_groupno,b_step,b_depth) 
--    values(board_b_no_SEQ.nextval,'게시판타이틀1','bbbb','내용입니다1',board_b_no_SEQ.currval,1,0);
--insert into board(b_no,b_title,u_id,b_content,b_groupno,b_step,b_depth) 
--    values(board_b_no_SEQ.nextval,'게시판타이틀2','bbbb','내용입니다2',board_b_no_SEQ.currval,1,0);
--insert into board(b_no,b_title,u_id,b_content,b_groupno,b_step,b_depth) 
--    values(board_b_no_SEQ.nextval,'게시판타이틀3','bbbb','내용입니다3',board_b_no_SEQ.currval,1,0);
--insert into board(b_no,b_title,u_id,b_content,b_groupno,b_step,b_depth) 
--    values(board_b_no_SEQ.nextval,'게시판타이틀4','aaaa','내용입니다4',board_b_no_SEQ.currval,1,0);
--insert into board(b_no,b_title,u_id,b_content,b_groupno,b_step,b_depth) 
--    values(board_b_no_SEQ.nextval,'게시판타이틀5','aaaa','내용입니다5',board_b_no_SEQ.currval,1,0);
--insert into board(b_no,b_title,u_id,b_content,b_groupno,b_step,b_depth) 
--    values(board_b_no_SEQ.nextval,'게시판타이틀6','aaaa','내용입니다6',board_b_no_SEQ.currval,1,0);
--insert into board(b_no,b_title,u_id,b_content,b_groupno,b_step,b_depth) 
--    values(board_b_no_SEQ.nextval,'게시판타이틀7','cccc','내용입니다7',board_b_no_SEQ.currval,1,0);
--insert into board(b_no,b_title,u_id,b_content,b_groupno,b_step,b_depth) 
--    values(board_b_no_SEQ.nextval,'게시판타이틀8','cccc','내용입니다8',board_b_no_SEQ.currval,1,0);
--insert into board(b_no,b_title,u_id,b_content,b_groupno,b_step,b_depth) 
--    values(board_b_no_SEQ.nextval,'게시판타이틀9','aaaa','내용입니다9',board_b_no_SEQ.currval,1,0);
--insert into board(b_no,b_title,u_id,b_content,b_groupno,b_step,b_depth) 
--    values(board_b_no_SEQ.nextval,'게시판타이틀10','cccc','내용입니다10',board_b_no_SEQ.currval,1,0);
--insert into board(b_no,b_title,u_id,b_content,b_groupno,b_step,b_depth) 
--    values(board_b_no_SEQ.nextval,'게시판타이틀11','cccc','내용입니다11',board_b_no_SEQ.currval,1,0);
--insert into board(b_no,b_title,u_id,b_content,b_groupno,b_step,b_depth) 
--    values(board_b_no_SEQ.nextval,'게시판타이틀12','cccc','내용입니다12',board_b_no_SEQ.currval,1,0);
--insert into board(b_no,b_title,u_id,b_content,b_groupno,b_step,b_depth) 
--    values(board_b_no_SEQ.nextval,'게시판타이틀13','aaaa','내용입니다13',board_b_no_SEQ.currval,1,0);
--insert into board(b_no,b_title,u_id,b_content,b_groupno,b_step,b_depth) 
--    values(board_b_no_SEQ.nextval,'게시판타이틀14','cccc','내용입니다14',board_b_no_SEQ.currval,1,0);
--insert into board(b_no,b_title,u_id,b_content,b_groupno,b_step,b_depth) 
--    values(board_b_no_SEQ.nextval,'게시판타이틀15','bbbb','내용입니다15',board_b_no_SEQ.currval,1,0);



--답글 쓰기
insert into board(b_no,b_title,u_id,b_content,b_groupno,b_step,b_depth) 
    values(board_b_no_SEQ.nextval,'답글 타이틀1','bbbb','답글 내용입니다1',1,2,1);
insert into board(b_no,b_title,u_id,b_content,b_groupno,b_step,b_depth) 
    values(board_b_no_SEQ.nextval,'답글 타이틀2','bbbb','답글 내용입니다2',2,2,1);
insert into board(b_no,b_title,u_id,b_content,b_groupno,b_step,b_depth) 
    values(board_b_no_SEQ.nextval,'답글 타이틀3','bbbb','답글 내용입니다3',3,2,1);
insert into board(b_no,b_title,u_id,b_content,b_groupno,b_step,b_depth) 
    values(board_b_no_SEQ.nextval,'답글 타이틀4','cccc','답글 내용입니다4',10,2,1);
insert into board(b_no,b_title,u_id,b_content,b_groupno,b_step,b_depth) 
    values(board_b_no_SEQ.nextval,'답글 타이틀5','aaaa','답글 내용입니다5',13,2,1);
  
    
    

/*********************************** cs ***************************************/
--고객센터 고정 글
insert into cs(cs_no,cs_title,u_id,cs_content,cs_groupno,cs_step,cs_depth) 
    values(9999,'※ 주문관련 안내글 ※','admin','주문에 이상이 생기면 02-999-9999 번호로 문의주세요.',9999,1,0);
insert into cs(cs_no,cs_title,u_id,cs_content,cs_groupno,cs_step,cs_depth) 
    values(9998,'※ 환불 및 반품관련 안내글 ※','admin','환불 및 반품관련 내용은 02-999-9999 번호로 문의주세요.',9998,1,0);
insert into cs(cs_no,cs_title,u_id,cs_content,cs_groupno,cs_step,cs_depth) 
    values(9997,'※ 배송관련 안내글 ※','admin','배송은 주문일로부터 일주일 이내에 배송됩니다.',9997,1,0);



--고객센터 쓰기
--insert into cs(cs_no,cs_title,u_id,cs_content,cs_groupno,cs_step,cs_depth) 
--    values(cs_cs_no_SEQ.nextval,'cs타이틀1','aaaa','내용입니다1',cs_cs_no_SEQ.currval,1,0);
--insert into cs(cs_no,cs_title,u_id,cs_content,cs_groupno,cs_step,cs_depth) 
--    values(cs_cs_no_SEQ.nextval,'cs타이틀2','bbbb','내용입니다2',cs_cs_no_SEQ.currval,1,0);


    
    
    
/*********************************** ship ***************************************/



insert into ship(s_no,s_name,s_phone,s_addr,u_id) values(ship_s_no_SEQ.nextval, '가나다1','01011112222','서울특별시','aaaa');
insert into ship(s_no,s_name,s_phone,s_addr,u_id) values(ship_s_no_SEQ.nextval, '가나다2','01022221111','경기도','bbbb');
insert into ship(s_no,s_name,s_phone,s_addr,u_id) values(ship_s_no_SEQ.nextval, '가나다3','01033331111','광주','cccc');
insert into ship(s_no,s_name,s_phone,s_addr,u_id) values(ship_s_no_SEQ.nextval, '가나다4','01044441111','부산','aaaa');
insert into ship(s_no,s_name,s_phone,s_addr,u_id) values(ship_s_no_SEQ.nextval, '가나다5','01055551111','제주도','bbbb');

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
  

/*********************************** product ***************************************/

/*******************************스니커즈 insert******************************/
insert into product values(product_p_no_SEQ.nextval,'나이키 우먼스 TC 7900',0,149000,'나이키 우먼스 TC 7900.jpg',1);
insert into product values(product_p_no_SEQ.nextval,'나이키 에어 포스 1 07',0,139000,'나이키 에어 포스 1 07.jpg',1);
insert into product values(product_p_no_SEQ.nextval,'나이키 에어 맥스 97',0,229000,'나이키 에어 맥스 97.jpg',1);
insert into product values(product_p_no_SEQ.nextval,'아디다스 가젤',0,129000,'아디다스 가젤.jpg',1);
insert into product values(product_p_no_SEQ.nextval,'반스 올드 스쿨 오버트 컴피쿠시',0,125000,'반스 올드 스쿨 오버트 컴피쿠시.jpg',1);
insert into product values(product_p_no_SEQ.nextval,'반스 클래식 슬립-온 98 DX',0,105000,'반스 클래식 슬립-온 98 DX.jpg',1);
insert into product values(product_p_no_SEQ.nextval,'아디다스 삼바 오리지날 우먼스',0,139000,'아디다스 삼바 오리지날 우먼스.jpg',1);
insert into product values(product_p_no_SEQ.nextval,'푸마 카프리 로얄 스웨이드',0,99000,'푸마 카프리 로얄 스웨이드.jpg',1);
insert into product values(product_p_no_SEQ.nextval,'반스 뉴 재즈',0,99000,'반스 뉴 재즈.jpg',1);
insert into product values(product_p_no_SEQ.nextval,'뉴발란스 CM1600LG',0,169000,'뉴발란스 CM1600LG.jpg',1);
insert into product values(product_p_no_SEQ.nextval,'아디다스 컨츄리 오리지날',0,139000,'아디다스 컨츄리 오리지날.jpg',1);
insert into product values(product_p_no_SEQ.nextval,'컨버스 척테일러 올스타 프로 스웨이드 블랙',0,85000,'컨버스 척테일러 올스타 프로 스웨이드 블랙.jpg',1);
insert into product values(product_p_no_SEQ.nextval,'나이키 우먼스 피닉스 와플 NCPS',0,119000,'나이키 우먼스 피닉스 와플 NCPS.jpg',1);
insert into product values(product_p_no_SEQ.nextval,'나이키 풀 포스 로우',0,109000,'나이키 풀 포스 로우.jpg',1);
insert into product values(product_p_no_SEQ.nextval,'나이키 블레이저 미드 프로 클럽 NTY',0,139000,'나이키 블레이저 미드 프로 클럽 NTY.jpg',1);
insert into product values(product_p_no_SEQ.nextval,'뉴발란스 U574LGDO',0,149000,'뉴발란스 U574LGDO.jpg',1);
insert into product values(product_p_no_SEQ.nextval,'푸마-180 톤즈',0,109000,'푸마-180 톤즈.jpg',1);
insert into product values(product_p_no_SEQ.nextval,'컨버스 런스타 모션 파운데이셔널 블랙',0,119000,'컨버스 런스타 모션 파운데이셔널 블랙.jpg',1);
insert into product values(product_p_no_SEQ.nextval,'뉴발란스 ML2002RO',0,169000,'뉴발란스 ML2002RO.jpg',1);
insert into product values(product_p_no_SEQ.nextval,'나이키 덩크 로우 레트로',0,139000,'나이키 덩크 로우 레트로.jpg',1);
/*******************************스포츠 insert******************************/
insert into product values(product_p_no_SEQ.nextval,'뉴발란스 MTMORCB3',0,189000,'뉴발란스 MTMORCB3.jpg',2);
insert into product values(product_p_no_SEQ.nextval,'써코니 엔돌핀 프로 플러스 M',0,299000,'써코니 엔돌핀 프로 플러스 M.jpg',2);
insert into product values(product_p_no_SEQ.nextval,'푸마 밀레니오 TR',0,79000,'푸마 밀레니오 TR.jpg',2);
insert into product values(product_p_no_SEQ.nextval,'써코니 엔돌핀 프로 4 M',0,269000,'써코니 엔돌핀 프로 4 M.jpg',2);
insert into product values(product_p_no_SEQ.nextval,'뉴발란스 MFCPZLW2',0,139000,'뉴발란스 MFCPZLW2.jpg',2);
insert into product values(product_p_no_SEQ.nextval,'써코니 라이드 16 M',0,159000,'써코니 라이드 16 M.jpg',2);
insert into product values(product_p_no_SEQ.nextval,'써코니 블레이즈 TR M',0,139000,'써코니 블레이즈 TR M.jpg',2);
insert into product values(product_p_no_SEQ.nextval,'아디다스 2 맨',0,169000,'아디다스 2 맨.jpg',2);
insert into product values(product_p_no_SEQ.nextval,'뉴발란스 M880S13',0,159000,'뉴발란스 M880S13.jpg',2); 
insert into product values(product_p_no_SEQ.nextval,'뉴발란스 MW1880CR',0,149000,'뉴발란스 MW1880CR.jpg',2);
insert into product values(product_p_no_SEQ.nextval,'나이키 줌 보메로 5 SP',0,189000,'나이키 줌 보메로 5 SP.jpg',2);
insert into product values(product_p_no_SEQ.nextval,'써코니 페레그린 11 ST M',0,149000,'써코니 페레그린 11 ST M.jpg',2);
insert into product values(product_p_no_SEQ.nextval,'나이키 줌 보메로 5 SE FTMT',0,209000,'나이키 줌 보메로 5 SE FTMT.jpg',2);
insert into product values(product_p_no_SEQ.nextval,'푸마 리딤 프로폼',0,89000,'푸마 리딤 프로폼.jpg',2);
insert into product values(product_p_no_SEQ.nextval,'휠라 디사이퍼 v2',0,79000,'휠라 디사이퍼 v2.jpg',2);
insert into product values(product_p_no_SEQ.nextval,'나이키 에어 베이퍼맥스 2023 FK 넥스트네이처',0,249000,'나이키 에어 베이퍼맥스 2023 FK 넥스트네이처.jpg',2);
insert into product values(product_p_no_SEQ.nextval,'뉴발란스 MFCPZLW1',0,139000,'뉴발란스 MFCPZLW1.jpg',2);
insert into product values(product_p_no_SEQ.nextval,'아식스 GT-2160',0,139000,'아식스 GT-2160.jpg',2);
insert into product values(product_p_no_SEQ.nextval,'팀버랜드 워터프루프 워커부츠',0,218000,'팀버랜드 워터프루프 워커부츠.jpg',2);
insert into product values(product_p_no_SEQ.nextval,'휠라 트라조러스 N3',0,79000,'휠라 트라조러스 N3.jpg',2);
/*******************************구두 insert******************************/
insert into product values(product_p_no_SEQ.nextval,'호킨스 플린트 로퍼',0,129000,'호킨스 플린트 로퍼.jpg',3);
insert into product values(product_p_no_SEQ.nextval,'스테파노로시 알토나 레이스',0,129000,'스테파노로시 알토나 레이스.jpg',3);
insert into product values(product_p_no_SEQ.nextval,'드라반 천연소가죽 스트레이트팁 슈즈',0,55800,'드라반 천연소가죽 스트레이트팁 슈즈.jpg',3);
insert into product values(product_p_no_SEQ.nextval,'스타비 시칠리 더비슈즈',0,59900,'스타비 시칠리 더비슈즈.jpg',3);
insert into product values(product_p_no_SEQ.nextval,'닥터마틴 2046',0,230000,'닥터마틴 2046.jpg',3);
insert into product values(product_p_no_SEQ.nextval,'커스텀에이드 스웨이드 페니로퍼 피어슨',0,99000,'커스텀에이드 스웨이드 페니로퍼 피어슨.jpg',3);
insert into product values(product_p_no_SEQ.nextval,'스페리 카보 옥스포드',0,129000,'스페리 카보 옥스포드.jpg',3);
insert into product values(product_p_no_SEQ.nextval,'파스코로젠 MS1600-BE',0,84900,'파스코로젠 MS1600-BE.jpg',3);
insert into product values(product_p_no_SEQ.nextval,'스페리 플로트 M',0,49000,'스페리 플로트 M.jpg',3);
insert into product values(product_p_no_SEQ.nextval,'닥터마틴 1461 벡스',0,210000,'닥터마틴 1461 벡스.jpg',3);

/*******************************샌들 insert******************************/
insert into product values(product_p_no_SEQ.nextval, '크록밴드', 0, 74900,'크록밴드.jpg',4);
insert into product values(product_p_no_SEQ.nextval, '아딜렛 라이트', 0,45000,'아딜렛 라이트.jpg',4);
insert into product values(product_p_no_SEQ.nextval, '웨이브 플립', 0,39000,'웨이브 플립.jpg',4);
insert into product values(product_p_no_SEQ.nextval, 'SD3601GGY', 0,29000,'SD3601GGY.jpg',4);
insert into product values(product_p_no_SEQ.nextval, '멜로우 클로그', 0,47000,'멜로우 클로그.jpg',4);
insert into product values(product_p_no_SEQ.nextval, 'SD1501BK3', 0,59000,'SD1501BK3.jpg',4);
insert into product values(product_p_no_SEQ.nextval, '멜로우 슬라이드', 0,19000,'멜로우 슬라이드.jpg',4);
insert into product values(product_p_no_SEQ.nextval, '라이트라이드', 0,55000,'라이트라이드.jpg',4);
insert into product values(product_p_no_SEQ.nextval, '나이키 비스타 샌들', 0,39000,'나이키 비스타 샌들.jpg',4);
insert into product values(product_p_no_SEQ.nextval, '아딜렛 샌들', 0,27000,'아딜렛 샌들.jpg',4);
/*******************************캐주얼 insert******************************/
insert into product values(product_p_no_SEQ.nextval, '할야드 플러시스텝', 0, 49000,'할야드 플러시스텝.jpg',5);
insert into product values(product_p_no_SEQ.nextval, '하울', 0, 29000,'하울.jpg',5);
insert into product values(product_p_no_SEQ.nextval, '글랜즈 로퍼', 0, 29000,'글랜즈 로퍼.jpg',5);
insert into product values(product_p_no_SEQ.nextval, '크로제', 0, 69000,'크로제.jpg',5);
insert into product values(product_p_no_SEQ.nextval, '모카신', 0, 59000,'모카신.jpg',5);
insert into product values(product_p_no_SEQ.nextval, '스트라이퍼', 0, 39000,'스트라이퍼.jpg',5);
insert into product values(product_p_no_SEQ.nextval, '스니커즈 체이스', 0, 69000,'스니커즈 체이스.jpg',5);
insert into product values(product_p_no_SEQ.nextval, '오케사', 0, 39000,'오케사.jpg',5);
insert into product values(product_p_no_SEQ.nextval, '벨렌', 0, 49000,'벨렌.jpg',5);
insert into product values(product_p_no_SEQ.nextval, '몬투라', 0, 99000,'몬투라.jpg',5);
/*******************************부츠 insert******************************/
insert into product values(product_p_no_SEQ.nextval, '사이드 고어 부츠', 0, 49000,'사이드 고어 부츠.jpg',6);
insert into product values(product_p_no_SEQ.nextval, '터프 패디드', 0, 29000,'터프 패디드.jpg',6);
insert into product values(product_p_no_SEQ.nextval, '모리 첼시', 0, 49000,'모리 첼시.jpg',6);
insert into product values(product_p_no_SEQ.nextval, '나이키 마노아', 0, 59000,'나이키 마노아.jpg',6);
insert into product values(product_p_no_SEQ.nextval, '멜버른 스퀘어토 첼시부츠', 0, 80900,'멜버른 스퀘어토 첼시부츠.jpg',6);
insert into product values(product_p_no_SEQ.nextval, '푸퍼 매트', 0, 59000,'푸퍼 매트.jpg',6);
insert into product values(product_p_no_SEQ.nextval, '로스', 0, 39000,'로스.jpg',6);
insert into product values(product_p_no_SEQ.nextval, '터프 패디드 폴카', 0, 39000,'터프 패디드 폴카.jpg',6);
insert into product values(product_p_no_SEQ.nextval, '누비 사이드 고어', 0, 79000,'누비 사이드 고어.jpg',6);
insert into product values(product_p_no_SEQ.nextval, '패딩슈즈 콜드스냅', 0, 139000,'패딩슈즈 콜드스냅.jpg',6);


/*********************************** product_option ***************************************/


/*******************************상품 옵션 insert******************************/
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,230,1);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,235,1);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,240,1);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,245,1);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,250,1);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,255,1);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,260,1);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,265,1);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,270,1);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,275,1);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,280,1);


insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,230,2);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,235,2);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,240,2);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,245,2);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,250,2);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,255,2);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,260,2);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,265,2);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,270,2);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,275,2);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,280,2);


insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,230,3);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,235,3);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,240,3);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,245,3);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,250,3);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,255,3);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,260,3);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,265,3);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,270,3);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,275,3);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,280,3);


insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,230,4);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,235,4);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,240,4);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,245,4);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,250,4);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,255,4);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,260,4);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,265,4);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,270,4);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,275,4);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,280,4);


insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,230,5);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,235,5);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,240,5);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,245,5);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,250,5);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,255,5);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,260,5);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,265,5);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,270,5);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,275,5);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,280,5);


insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,230,6);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,235,6);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,240,6);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,245,6);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,250,6);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,255,6);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,260,6);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,265,6);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,270,6);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,275,6);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,280,6);


insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,230,7);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,235,7);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,240,7);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,245,7);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,250,7);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,255,7);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,260,7);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,265,7);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,270,7);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,275,7);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,280,7);


insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,230,8);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,235,8);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,240,8);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,245,8);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,250,8);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,255,8);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,260,8);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,265,8);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,270,8);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,275,8);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,280,8);


insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,230,9);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,235,9);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,240,9);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,245,9);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,250,9);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,255,9);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,260,9);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,265,9);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,270,9);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,275,9);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,280,9);


insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,230,10);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,235,10);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,240,10);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,245,10);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,250,10);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,255,10);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,260,10);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,265,10);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,270,10);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,275,10);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,280,10);


insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,230,11);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,235,11);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,240,11);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,245,11);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,250,11);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,255,11);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,260,11);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,265,11);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,270,11);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,275,11);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,280,11);


insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,230,12);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,235,12);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,240,12);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,245,12);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,250,12);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,255,12);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,260,12);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,265,12);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,270,12);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,275,12);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,280,12);


insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,230,13);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,235,13);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,240,13);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,245,13);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,250,13);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,255,13);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,260,13);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,265,13);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,270,13);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,275,13);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,280,13);


insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,230,14);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,235,14);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,240,14);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,245,14);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,250,14);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,255,14);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,260,14);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,265,14);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,270,14);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,275,14);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,280,14);


insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,230,15);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,235,15);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,240,15);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,245,15);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,250,15);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,255,15);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,260,15);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,265,15);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,270,15);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,275,15);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,280,15);


insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,230,16);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,235,16);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,240,16);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,245,16);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,250,16);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,255,16);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,260,16);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,265,16);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,270,16);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,275,16);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,280,16);


insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,230,17);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,235,17);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,240,17);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,245,17);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,250,17);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,255,17);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,260,17);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,265,17);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,270,17);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,275,17);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,280,17);


insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,230,18);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,235,18);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,240,18);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,245,18);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,250,18);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,255,18);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,260,18);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,265,18);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,270,18);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,275,18);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,280,18);


insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,230,19);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,235,19);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,240,19);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,245,19);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,250,19);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,255,19);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,260,19);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,265,19);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,270,19);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,275,19);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,280,19);


insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,230,20);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,235,20);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,240,20);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,245,20);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,250,20);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,255,20);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,260,20);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,265,20);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,270,20);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,275,20);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,280,20);


insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,230,21);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,235,21);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,240,21);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,245,21);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,250,21);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,255,21);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,260,21);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,265,21);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,270,21);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,275,21);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,280,21);


insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,230,22);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,235,22);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,240,22);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,245,22);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,250,22);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,255,22);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,260,22);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,265,22);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,270,22);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,275,22);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,280,22);


insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,230,23);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,235,23);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,240,23);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,245,23);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,250,23);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,255,23);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,260,23);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,265,23);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,270,23);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,275,23);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,280,23);


insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,230,24);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,235,24);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,240,24);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,245,24);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,250,24);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,255,24);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,260,24);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,265,24);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,270,24);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,275,24);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,280,24);


insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,230,25);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,235,25);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,240,25);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,245,25);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,250,25);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,255,25);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,260,25);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,265,25);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,270,25);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,275,25);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,280,25);


insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,230,26);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,235,26);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,240,26);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,245,26);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,250,26);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,255,26);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,260,26);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,265,26);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,270,26);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,275,26);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,280,26);


insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,230,27);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,235,27);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,240,27);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,245,27);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,250,27);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,255,27);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,260,27);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,265,27);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,270,27);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,275,27);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,280,27);


insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,230,28);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,235,28);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,240,28);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,245,28);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,250,28);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,255,28);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,260,28);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,265,28);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,270,28);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,275,28);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,280,28);


insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,230,29);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,235,29);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,240,29);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,245,29);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,250,29);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,255,29);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,260,29);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,265,29);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,270,29);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,275,29);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,280,29);


insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,230,30);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,235,30);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,240,30);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,245,30);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,250,30);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,255,30);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,260,30);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,265,30);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,270,30);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,275,30);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,280,30);


insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,230,31);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,235,31);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,240,31);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,245,31);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,250,31);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,255,31);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,260,31);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,265,31);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,270,31);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,275,31);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,280,31);


insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,230,32);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,235,32);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,240,32);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,245,32);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,250,32);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,255,32);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,260,32);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,265,32);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,270,32);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,275,32);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,280,32);


insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,230,33);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,235,33);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,240,33);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,245,33);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,250,33);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,255,33);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,260,33);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,265,33);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,270,33);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,275,33);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,280,33);


insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,230,34);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,235,34);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,240,34);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,245,34);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,250,34);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,255,34);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,260,34);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,265,34);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,270,34);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,275,34);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,280,34);


insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,230,35);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,235,35);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,240,35);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,245,35);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,250,35);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,255,35);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,260,35);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,265,35);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,270,35);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,275,35);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,280,35);


insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,230,36);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,235,36);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,240,36);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,245,36);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,250,36);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,255,36);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,260,36);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,265,36);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,270,36);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,275,36);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,280,36);


insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,230,37);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,235,37);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,240,37);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,245,37);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,250,37);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,255,37);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,260,37);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,265,37);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,270,37);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,275,37);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,280,37);


insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,230,38);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,235,38);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,240,38);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,245,38);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,250,38);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,255,38);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,260,38);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,265,38);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,270,38);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,275,38);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,280,38);


insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,230,39);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,235,39);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,240,39);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,245,39);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,250,39);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,255,39);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,260,39);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,265,39);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,270,39);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,275,39);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,280,39);


insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,230,40);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,235,40);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,240,40);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,245,40);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,250,40);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,255,40);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,260,40);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,265,40);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,270,40);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,275,40);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,280,40);


insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,230,41);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,235,41);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,240,41);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,245,41);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,250,41);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,255,41);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,260,41);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,265,41);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,270,41);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,275,41);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,280,41);


insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,230,42);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,235,42);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,240,42);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,245,42);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,250,42);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,255,42);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,260,42);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,265,42);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,270,42);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,275,42);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,280,42);


insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,230,43);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,235,43);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,240,43);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,245,43);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,250,43);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,255,43);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,260,43);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,265,43);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,270,43);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,275,43);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,280,43);


insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,230,44);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,235,44);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,240,44);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,245,44);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,250,44);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,255,44);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,260,44);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,265,44);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,270,44);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,275,44);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,280,44);


insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,230,45);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,235,45);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,240,45);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,245,45);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,250,45);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,255,45);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,260,45);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,265,45);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,270,45);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,275,45);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,280,45);


insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,230,46);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,235,46);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,240,46);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,245,46);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,250,46);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,255,46);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,260,46);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,265,46);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,270,46);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,275,46);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,280,46);


insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,230,47);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,235,47);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,240,47);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,245,47);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,250,47);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,255,47);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,260,47);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,265,47);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,270,47);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,275,47);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,280,47);


insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,230,48);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,235,48);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,240,48);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,245,48);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,250,48);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,255,48);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,260,48);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,265,48);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,270,48);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,275,48);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,280,48);


insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,230,49);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,235,49);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,240,49);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,245,49);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,250,49);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,255,49);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,260,49);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,265,49);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,270,49);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,275,49);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,280,49);


insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,230,50);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,235,50);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,240,50);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,245,50);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,250,50);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,255,50);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,260,50);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,265,50);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,270,50);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,275,50);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,280,50);


insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,230,51);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,235,51);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,240,51);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,245,51);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,250,51);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,255,51);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,260,51);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,265,51);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,270,51);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,275,51);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,280,51);


insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,230,52);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,235,52);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,240,52);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,245,52);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,250,52);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,255,52);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,260,52);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,265,52);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,270,52);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,275,52);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,280,52);


insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,230,53);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,235,53);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,240,53);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,245,53);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,250,53);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,255,53);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,260,53);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,265,53);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,270,53);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,275,53);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,280,53);


insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,230,54);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,235,54);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,240,54);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,245,54);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,250,54);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,255,54);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,260,54);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,265,54);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,270,54);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,275,54);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,280,54);


insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,230,55);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,235,55);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,240,55);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,245,55);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,250,55);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,255,55);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,260,55);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,265,55);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,270,55);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,275,55);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,280,55);


insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,230,56);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,235,56);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,240,56);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,245,56);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,250,56);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,255,56);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,260,56);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,265,56);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,270,56);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,275,56);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,280,56);


insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,230,57);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,235,57);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,240,57);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,245,57);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,250,57);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,255,57);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,260,57);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,265,57);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,270,57);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,275,57);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,280,57);


insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,230,58);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,235,58);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,240,58);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,245,58);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,250,58);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,255,58);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,260,58);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,265,58);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,270,58);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,275,58);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,280,58);


insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,230,59);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,235,59);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,240,59);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,245,59);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,250,59);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,255,59);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,260,59);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,265,59);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,270,59);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,275,59);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,280,59);


insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,230,60);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,235,60);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,240,60);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,245,60);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,250,60);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,255,60);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,260,60);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,265,60);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,270,60);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,275,60);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,280,60);

insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,230,61);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,235,61);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,240,61);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,245,61);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,250,61);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,255,61);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,260,61);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,265,61);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,270,61);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,275,61);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,280,61);


insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,230,62);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,235,62);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,240,62);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,245,62);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,250,62);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,255,62);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,260,62);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,265,62);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,270,62);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,275,62);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,280,62);


insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,230,63);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,235,63);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,240,63);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,245,63);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,250,63);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,255,63);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,260,63);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,265,63);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,270,63);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,275,63);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,280,63);


insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,230,64);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,235,64);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,240,64);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,245,64);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,250,64);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,255,64);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,260,64);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,265,64);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,270,64);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,275,64);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,280,64);


insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,230,65);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,235,65);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,240,65);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,245,65);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,250,65);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,255,65);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,260,65);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,265,65);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,270,65);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,275,65);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,280,65);


insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,230,66);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,235,66);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,240,66);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,245,66);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,250,66);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,255,66);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,260,66);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,265,66);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,270,66);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,275,66);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,280,66);


insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,230,67);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,235,67);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,240,67);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,245,67);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,250,67);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,255,67);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,260,67);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,265,67);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,270,67);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,275,67);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,280,67);


insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,230,68);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,235,68);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,240,68);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,245,68);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,250,68);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,255,68);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,260,68);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,265,68);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,270,68);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,275,68);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,280,68);


insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,230,69);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,235,69);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,240,69);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,245,69);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,250,69);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,255,69);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,260,69);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,265,69);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,270,69);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,275,69);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,280,69);


insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,230,70);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,235,70);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,240,70);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,245,70);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,250,70);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,255,70);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,260,70);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,265,70);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,270,70);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,275,70);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,280,70);


insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,230,71);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,235,71);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,240,71);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,245,71);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,250,71);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,255,71);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,260,71);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,265,71);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,270,71);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,275,71);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,280,71);


insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,230,72);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,235,72);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,240,72);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,245,72);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,250,72);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,255,72);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,260,72);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,265,72);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,270,72);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,275,72);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,280,72);


insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,230,73);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,235,73);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,240,73);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,245,73);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,250,73);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,255,73);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,260,73);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,265,73);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,270,73);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,275,73);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,280,73);


insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,230,74);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,235,74);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,240,74);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,245,74);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,250,74);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,255,74);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,260,74);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,265,74);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,270,74);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,275,74);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,280,74);


insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,230,75);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,235,75);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,240,75);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,245,75);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,250,75);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,255,75);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,260,75);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,265,75);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,270,75);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,275,75);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,280,75);


insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,230,76);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,235,76);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,240,76);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,245,76);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,250,76);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,255,76);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,260,76);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,265,76);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,270,76);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,275,76);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,280,76);


insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,230,77);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,235,77);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,240,77);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,245,77);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,250,77);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,255,77);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,260,77);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,265,77);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,270,77);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,275,77);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,280,77);


insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,230,78);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,235,78);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,240,78);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,245,78);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,250,78);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,255,78);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,260,78);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,265,78);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,270,78);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,275,78);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,280,78);


insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,230,79);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,235,79);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,240,79);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,245,79);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,250,79);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,255,79);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,260,79);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,265,79);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,270,79);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,275,79);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,280,79);


insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,230,80);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,235,80);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,240,80);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,245,80);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,250,80);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,255,80);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,260,80);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,265,80);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,270,80);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,275,80);
insert into product_option(po_no,po_size,p_no) values(product_option_po_no_SEQ.nextval,280,80);


/*********************************** cart ***************************************/
            
            
/**********************cart insert************************/
--bbbb님이 1번1개,2번2개 제품담기
insert into cart(c_no,c_qty,po_no,u_id) values(cart_c_no_seq.nextval,1,1,'bbbb');
insert into cart(c_no,c_qty,po_no,u_id) values(cart_c_no_seq.nextval,2,50,'bbbb');
--cccc님이 3번8개,4번4개 제품담기
insert into cart(c_no,c_qty,po_no,u_id) values(cart_c_no_seq.nextval,8,3,'cccc');
insert into cart(c_no,c_qty,po_no,u_id) values(cart_c_no_seq.nextval,4,30,'cccc');

/*********************************** order ***************************************/


/* 회원 1명 INSERT */
INSERT INTO userinfo values ('user1','1111','김익명1','서울시 강남구','010-1111-1111','mail1@naver.com', '2000-01-01');
INSERT INTO userinfo values ('user2','2222','김익명2','서울시 동작구','010-2222-2222','mail2@naver.com', '2000-02-02');
INSERT INTO userinfo values ('user3','3333','김익명3','서울시 강서구','010-3333-3333','mail3@naver.com', '2000-03-03');


/* user1 주문 */
-- user1의 상품 상세에서 주문
INSERT INTO orders(o_no, o_price, o_addr, o_name, o_phone, o_payment, o_img,u_id) VALUES(orders_o_no_SEQ.nextval,200000,'서울시 관악구','김배송','010-1111-1111','카드', 'shoe.img','user1');
INSERT INTO order_item(oi_no,oi_qty,o_no,po_no) VALUES (order_item_oi_no_SEQ.nextval,2,orders_o_no_SEQ.currval,1); 
INSERT INTO order_item(oi_no,oi_qty,o_no,po_no) VALUES (order_item_oi_no_SEQ.nextval,1,orders_o_no_SEQ.currval,2);
INSERT INTO order_item(oi_no,oi_qty,o_no,po_no) VALUES (order_item_oi_no_SEQ.nextval,6,orders_o_no_SEQ.currval,3); 
-- user1의 카트에서 주문 
INSERT INTO orders(o_no, o_price, o_addr, o_name, o_phone, o_payment, o_img,u_id) VALUES(orders_o_no_SEQ.nextval,800000,'서울시 광진구','김새봄','010-1111-1111','카드', 'shoe.img','user1');
INSERT INTO order_item(oi_no,oi_qty,o_no,po_no) VALUES (order_item_oi_no_SEQ.nextval,5,orders_o_no_SEQ.currval,3); 
INSERT INTO order_item(oi_no,oi_qty,o_no,po_no) VALUES (order_item_oi_no_SEQ.nextval,2,orders_o_no_SEQ.currval,5);
INSERT INTO order_item(oi_no,oi_qty,o_no,po_no) VALUES (order_item_oi_no_SEQ.nextval,1,orders_o_no_SEQ.currval,1); 
/* user2 주문 */
-- user2의 상품 상세에서 주문
INSERT INTO orders(o_no, o_price, o_addr, o_name, o_phone, o_payment, o_img,u_id) VALUES(orders_o_no_SEQ.nextval,200000,'서울시 종로구','김익명','010-1111-1111','카드', 'shoe.img','user2');
INSERT INTO order_item(oi_no,oi_qty,o_no,po_no) VALUES (order_item_oi_no_SEQ.nextval,1,orders_o_no_SEQ.currval,8); 
INSERT INTO order_item(oi_no,oi_qty,o_no,po_no) VALUES (order_item_oi_no_SEQ.nextval,2,orders_o_no_SEQ.currval,4);
INSERT INTO order_item(oi_no,oi_qty,o_no,po_no) VALUES (order_item_oi_no_SEQ.nextval,2,orders_o_no_SEQ.currval,2); 
-- user2의 카트에서 주문 
INSERT INTO orders(o_no, o_price, o_addr, o_name, o_phone, o_payment, o_img,u_id) VALUES(orders_o_no_SEQ.nextval,700000,'서울시 마포구','박윤슬','010-1111-1111','카드', 'shoe.img','user2');
INSERT INTO order_item(oi_no,oi_qty,o_no,po_no) VALUES (order_item_oi_no_SEQ.nextval,4,orders_o_no_SEQ.currval,11); 
INSERT INTO order_item(oi_no,oi_qty,o_no,po_no) VALUES (order_item_oi_no_SEQ.nextval,5,orders_o_no_SEQ.currval,2);
INSERT INTO order_item(oi_no,oi_qty,o_no,po_no) VALUES (order_item_oi_no_SEQ.nextval,6,orders_o_no_SEQ.currval,1); 

/* user3 주문 */
-- user3의 상품 상세에서 주문
INSERT INTO orders(o_no, o_price, o_addr, o_name, o_phone, o_payment, o_img,u_id) VALUES(orders_o_no_SEQ.nextval,200000,'서울시 송파구','강가을','010-1111-1111','카드', 'shoe.img','user3');
INSERT INTO order_item(oi_no,oi_qty,o_no,po_no) VALUES (order_item_oi_no_SEQ.nextval,2,orders_o_no_SEQ.currval,1); 
INSERT INTO order_item(oi_no,oi_qty,o_no,po_no) VALUES (order_item_oi_no_SEQ.nextval,2,orders_o_no_SEQ.currval,2);
INSERT INTO order_item(oi_no,oi_qty,o_no,po_no) VALUES (order_item_oi_no_SEQ.nextval,2,orders_o_no_SEQ.currval,3); 
-- user3의 카트에서 주문 
INSERT INTO orders(o_no, o_price, o_addr, o_name, o_phone, o_payment, o_img,u_id) VALUES(orders_o_no_SEQ.nextval,200000,'서울시 구로구','송하늘','010-1111-1111','카드', 'shoe.img','user3');
INSERT INTO order_item(oi_no,oi_qty,o_no,po_no) VALUES (order_item_oi_no_SEQ.nextval,3,orders_o_no_SEQ.currval,19); 
INSERT INTO order_item(oi_no,oi_qty,o_no,po_no) VALUES (order_item_oi_no_SEQ.nextval,3,orders_o_no_SEQ.currval,10);
INSERT INTO order_item(oi_no,oi_qty,o_no,po_no) VALUES (order_item_oi_no_SEQ.nextval,1,orders_o_no_SEQ.currval,3); 

