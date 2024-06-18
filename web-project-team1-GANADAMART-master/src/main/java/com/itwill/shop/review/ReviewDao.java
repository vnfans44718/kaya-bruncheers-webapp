package com.itwill.shop.review;

import java.util.List;

import org.apache.ibatis.annotations.Select;

public interface ReviewDao {

    int insert(Review review) throws Exception; //리뷰 입력

    int update(Review review) throws Exception; //리뷰 수정

    int delete(int rNo) throws Exception; //리뷰 삭제
    
    List<Review> findReviewAll() throws Exception;// 전체 리뷰 보기
    
    List<Review> findByProductReview(int pNo) throws Exception;// 상품 하나에 대한 리뷰 리스트
    
    int findByProductReviewRating(int pNo) throws Exception;// 상품 하나에 대한 평점 합
    
    int findByStar(int rRating,int pNo) throws Exception;

}
