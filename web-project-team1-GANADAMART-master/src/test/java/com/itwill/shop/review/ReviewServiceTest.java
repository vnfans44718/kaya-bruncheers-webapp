package com.itwill.shop.review;

import com.itwill.shop.product.Product;
import com.itwill.shop.user.User;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.Date;

import static org.junit.jupiter.api.Assertions.*;

class ReviewServiceTest {

    private ReviewService reviewService;
    private User user;
    private Product product;

    @BeforeEach
    public void setUp() throws Exception {
        reviewService = new ReviewService();
        user = new User();
        product = new Product();
    }

    @Test
    void insert() throws Exception {
        Review review = new Review(20, "내용", new Date(), "", 1,5);

        int result = reviewService.insert(review);

        assertEquals(1, result);
    }


    @Test
    void update() throws Exception {
        Review review = new Review(3, "내용수정", new Date(), "dd", 3,3);

        int result = reviewService.update(review);

        assertEquals(1, result);
    }

    @Test
    void delete() throws Exception {
        int rNo = 2;

        int result = reviewService.delete(rNo);

        assertEquals(1, result);
    }
}