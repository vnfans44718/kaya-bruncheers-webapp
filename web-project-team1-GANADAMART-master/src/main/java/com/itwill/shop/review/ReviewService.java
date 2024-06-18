package com.itwill.shop.review;

import lombok.*;

import java.util.Date;
import java.util.List;

public class ReviewService {
	
   private ReviewDao reviewDao;
   
   public ReviewService() throws Exception {
	   reviewDao = new ReviewDaoImplMybatis(); 
   }  
   
   // 리뷰쓰기
   public int insert(Review review) throws Exception {
	   return reviewDao.insert(review);
   }
   
   //리뷰수정
   public int update(Review review) throws Exception {
       return reviewDao.update(review);
   }
   
   //리뷰삭제
   public int delete(int rNo) throws Exception {
       return reviewDao.delete(rNo);
   }
   
   //전체 리뷰 보기
   public List<Review> reviewListAll() throws Exception{
	   return reviewDao.findReviewAll();
   }
   
   // 상품 하나에 대한 리뷰 리스트
   public List<Review> ProductReview(int pNo) throws Exception{
	   return reviewDao.findByProductReview(pNo);
   }
   
   // 상품 하나에 대한 평점 합
   public int ProductReviewRating(int pNo) throws Exception{
	   return reviewDao.findByProductReviewRating(pNo);
   }
   
   public int findByStar(int rRating,int pNo) throws Exception{
	   return reviewDao.findByStar(rRating, pNo);
   }
}
