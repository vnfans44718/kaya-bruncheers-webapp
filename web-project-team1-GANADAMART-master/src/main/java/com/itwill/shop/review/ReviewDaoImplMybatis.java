package com.itwill.shop.review;

import com.itwill.shop.mapper.ProductMapper;
import com.itwill.shop.mapper.ReviewMapper;
import com.itwill.shop.product.Product;

import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class ReviewDaoImplMybatis implements ReviewDao {

    private SqlSessionFactory sqlSessionFactory;

    public ReviewDaoImplMybatis() throws Exception {
        this.sqlSessionFactory = new SqlSessionFactoryBuilder()
                .build(Resources.getResourceAsStream("mybatis-config.xml"));
    }

    @Override
    public int insert(Review review) throws Exception {
        SqlSession sqlSession = sqlSessionFactory.openSession(true);
        ReviewMapper reviewMapper = sqlSession.getMapper(ReviewMapper.class);
        int rowCount = reviewMapper.insert(review);
        sqlSession.close();
        return rowCount;
    }

    @Override
    public int update(Review review) throws Exception {
        SqlSession sqlSession = sqlSessionFactory.openSession(true);
        ReviewMapper reviewMapper = sqlSession.getMapper(ReviewMapper.class);
        int rowCount = reviewMapper.update(review);
        sqlSession.close();
        return rowCount;
    }

    @Override
    public int delete(int rNo) throws Exception {
        SqlSession sqlSession = sqlSessionFactory.openSession(true);
        ReviewMapper reviewMapper = sqlSession.getMapper(ReviewMapper.class);
        int rowCount = reviewMapper.delete(rNo);
        sqlSession.close();
        return rowCount;
    }
    
    /*
     *  전체 리뷰 보기
     */
    @Override
    public List<Review> findReviewAll() throws Exception {
        SqlSession sqlSession = sqlSessionFactory.openSession(true);
        ReviewMapper reviewMapper = sqlSession.getMapper(ReviewMapper.class);
        List<Review> reviewList = reviewMapper.findReviewAll();
        sqlSession.close();
        return reviewList;
    }
    /*
     *  상품 하나에 대한 리뷰 리스트
     */
    @Override
    public List<Review> findByProductReview(int pNo) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		ReviewMapper reviewMapper = sqlSession.getMapper(ReviewMapper.class);
		List<Review> reviewList = reviewMapper.findByProductReview(pNo);
		sqlSession.close();
		return reviewList;
	}
    /*
     *  상품 하나에 대한 평점 합
     */
    @Override
    public int findByProductReviewRating(int pNo) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		ReviewMapper reviewMapper = sqlSession.getMapper(ReviewMapper.class);
		int rowCount = reviewMapper.findByProductReviewRating(pNo);
		sqlSession.close();
		return rowCount;
	}
    /*
     *  각 상품 평점 리뷰 몇개인지 구하기
     */

	@Override
	public int findByStar(int rRating, int pNo) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		ReviewMapper reviewMapper = sqlSession.getMapper(ReviewMapper.class);
		int rowCount = reviewMapper.findByStar(rRating, pNo);
		sqlSession.close();
		return rowCount;
	}
    
}
