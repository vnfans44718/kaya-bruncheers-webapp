package com.itwill.shop.product;

import java.io.IOException;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.itwill.shop.mapper.ProductMapper;

public class ProductDaoImplMyBatis implements ProductDao{
	private SqlSessionFactory sqlSessionFactory;
	
	public ProductDaoImplMyBatis() throws Exception {
		this.sqlSessionFactory = new SqlSessionFactoryBuilder()
				.build(Resources.getResourceAsStream("mybatis-config.xml"));
	}
	/*
	 *  1. 전체 상품 검색
	 */
	@Override
	public List<Product> findAll() throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);
		List<Product> productList = productMapper.findAll();
		sqlSession.close();
		return productList;
	}
	/*
	 *  2. 전체 상품 정렬해서 검색(인기순) 
	 */
	@Override
	public List<Product> findAllOrderByPopularity() throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);
		List<Product> productList = productMapper.findAllOrderByPopularity();
		sqlSession.close();
		return productList;
	}
	/*
	 *  3. 전체 상품 정렬해서 검색(가격 높은 순)
	 */
	@Override
	public List<Product> findAllOrderByPriceHigh() throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);
		List<Product> productList = productMapper.findAllOrderByPriceHigh();
		sqlSession.close();
		return productList;
	}
	/*
	 *  4. 전체 상품 정렬해서 검색(가격 낮은 순) 
	 */
	@Override
	public List<Product> findAllOrderByPriceLow() throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);
		List<Product> productList = productMapper.findAllOrderByPriceLow();
		sqlSession.close();
		return productList;
	}
	/*
	 *  5. 전체 상품 정렬해서 검색(이름 순) 
	 */
	@Override
	public List<Product> findAllOrderByName() throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);
		List<Product> productList = productMapper.findAllOrderByName();
		sqlSession.close();
		return productList;
	}
	/*
	 *  6. 카테고리 별 전체 상품 검색
	 */
	@Override
	public List<Product> findByCategory(int pCategory) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);
		List<Product> productList = productMapper.findByCategory(pCategory);
		sqlSession.close();
		return productList;
	}
	/*
	 *  7. 카테고리 별 전체 상품 정렬해서 검색(인기순)
	 */
	@Override
	public List<Product> findByCategoryOrderByPopularity(int pCategory) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);
		List<Product> productList = productMapper.findByCategoryOrderByPopularity(pCategory);
		sqlSession.close();
		return productList;
	}
	/*
	 *  8. 카테고리 별 전체 상품 정렬해서 검색(가격 높은순)
	 */
	@Override
	public List<Product> findByCategoryOrderByPriceHigh(int pCategory) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);
		List<Product> productList = productMapper.findByCategoryOrderByPriceHigh(pCategory);
		sqlSession.close();
		return productList;
	}
	/*
	 *  9. 카테고리 별 전체 상품 정렬해서 검색(가격 낮은순)
	 */
	@Override
	public List<Product> findByCategoryOrderByPriceLow(int pCategory) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);
		List<Product> productList = productMapper.findByCategoryOrderByPriceLow(pCategory);
		sqlSession.close();
		return productList;
	}
	/*
	 *  10. 카테고리 별 전체 상품 정렬해서 검색(이름순)
	 */
	@Override
	public List<Product> findByCategoryOrderByName(int pCategory) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);
		List<Product> productList = productMapper.findByCategoryOrderByName(pCategory);
		sqlSession.close();
		return productList;
	}
	/*
	 *  11. 이름으로 검색
	 */
	@Override
	public List<Product> findByName(String pName) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);
		List<Product> productList = productMapper.findByName(pName);
		sqlSession.close();
		return productList;
	}
	/*
	 *  12. pk로 검색
	 */
	@Override
	public Product findByPrimaryKey(int pNo) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);
		Product product = productMapper.findByPrimaryKey(pNo);
		sqlSession.close();
		return product;
	}
	
	/*
	 *  13. p_count 증가
	 */
	public int increaseCount(int pNo) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);
	    productMapper.increaseCount(pNo);
		sqlSession.close();
		return 0;
	}
	@Override
	public List<Product> findByNameOrderByPopuarity(String pName) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);
		List<Product> productList = productMapper.findByNameOrderByPopuarity(pName);
		sqlSession.close();
		return productList;
	}
	@Override
	public List<Product> findByNameOrderByPriceHigh(String pName) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);
	    List<Product> productList =  productMapper.findByNameOrderByPriceHigh(pName);
		sqlSession.close();
		return productList;
	}
	@Override
	public List<Product> findByNameOrderByPriceLow(String pName) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);
		List<Product> productList = productMapper.findByNameOrderByPriceLow(pName);
		sqlSession.close();
		return productList;
	}
	
}
