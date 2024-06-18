

--userinfo update
update  userinfo 
set u_pass='1111',u_name='이름변경',u_email='change@naver.com',u_addr='충청도',u_phone='010-8888-8888'
where u_id='aaaa';

--userinfo delete
delete userinfo where u_id='aaaa';

--userinfo select 
select u_id,u_name,u_phone,u_email,u_addr from userinfo where u_id='bbbb';





