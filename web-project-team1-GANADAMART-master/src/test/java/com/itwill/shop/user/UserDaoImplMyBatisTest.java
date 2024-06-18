package com.itwill.shop.user;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class UserDaoImplMyBatisTest {
	UserDao userDao;
	@BeforeEach
	void setUp() throws Exception {
		userDao = new UserDaoImplMyBatis();
	}

	@Test
	void testFindUser() throws Exception {
		User user = userDao.findUser("bbbb");
		System.out.println(user);
	}
	
	
	
}
