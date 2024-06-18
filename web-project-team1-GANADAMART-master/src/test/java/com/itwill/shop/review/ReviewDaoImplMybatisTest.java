package com.itwill.shop.review;

import static org.junit.jupiter.api.Assertions.*;

import java.util.List;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;

class ReviewDaoImplMybatisTest {
	ReviewDao reviewDao;
	Review review;
	
	@BeforeEach
	void setUp() throws Exception {
		reviewDao = new ReviewDaoImplMybatis();
	}
	@Disabled
	@Test
	void testInsert() throws Exception {
		int count = reviewDao.insert(review);
		System.out.println(count);
		assertTrue(count!=0);
	}
	@Disabled
	@Test
	void testUpdate() throws Exception {
		int count = reviewDao.update(review);
		System.out.println(count);
		assertFalse(count!=0);
	}
	@Disabled
	@Test
	void testDelete() throws Exception {
		int count = reviewDao.delete(1);
		System.out.println(count);
		assertTrue(count>=0);
	}
	@Disabled
	@Test 
	void testFindReviewAll() throws Exception{
		List<Review> reviewList = reviewDao.findReviewAll();
		System.out.println(reviewList);
		assertTrue(reviewList!=null);
		assertTrue(reviewList.get(0)!=null);
	}
	@Disabled
	@Test
	void testFindByProductReview() throws Exception{
		List<Review> reviewList = reviewDao.findByProductReview(1);
		System.out.println(reviewList);
	}
	
	@Test
	void testFindByProductReviewRating() throws Exception{
		int count = reviewDao.findByProductReviewRating(3);
		System.out.println(count);
	}
	
	
	
}
