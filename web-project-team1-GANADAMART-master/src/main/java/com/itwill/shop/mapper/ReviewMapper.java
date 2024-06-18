package com.itwill.shop.mapper;

import com.itwill.shop.product.Product;
import com.itwill.shop.review.Review;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface ReviewMapper {

    @Insert("INSERT INTO review (r_no, r_content,r_date, u_id, p_no,r_rating) VALUES (review_r_no_seq.nextval,#{rContent},sysdate,#{uId},#{pNo},#{rRating})")
    int insert(Review review) throws Exception; //리뷰 입력

    @Update("update review set r_content=#{rContent} where r_no=#{rNo}")
    int update(Review review) throws Exception; //리뷰 수정

    @Delete("DELETE review WHERE r_No = #{rNo}")
    int delete(int rNo) throws Exception; //리뷰 삭제

    // 전체 리뷰 보기
    @Select("select * from review")
    List<Review> findReviewAll() throws Exception;
    
    // 상품 하나에 대한 리뷰 리스트
    @Select("select * from review where p_no=#{pNo} order by r_date desc")
    List<Review> findByProductReview(int pNo) throws Exception;
    
    // 상품 하나에 대한 평점 합
    @Select("select round(SUM(R_RATING),1) from review where p_no=#{pNo}")
    int findByProductReviewRating(int pNo) throws Exception;
    
    @Select("select count(*) from review where r_rating=#{rRating} and p_no=#{pNo}")
    int findByStar(int rRating,int pNo) throws Exception;
    
    
}
