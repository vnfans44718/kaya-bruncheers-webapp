package com.itwill.shop.product;

import java.util.List;

import org.apache.ibatis.annotations.Select;

public interface ProductDao {
	/*
	 *  1. 전체 상품 검색
	 */
	List<Product> findAll() throws Exception;
	
	/*
	 *  2. 전체 상품 정렬해서 검색(인기순) 
	 */
	List<Product> findAllOrderByPopularity() throws Exception;
	
	/*
	 *  3. 전체 상품 정렬해서 검색(가격 높은 순)
	 */
	List<Product> findAllOrderByPriceHigh() throws Exception;
	
	/*
	 *  4. 전체 상품 정렬해서 검색(가격 낮은 순) 
	 */
	List<Product> findAllOrderByPriceLow() throws Exception;
	
	/*
	 *  5. 전체 상품 정렬해서 검색(이름 순) 
	 */
	List<Product> findAllOrderByName() throws Exception;
	
	/*
	 *  6. 카테고리 별 전체 상품 검색
	 */
	List<Product> findByCategory(int pCategory) throws Exception;
	
	/*
	 *  7. 카테고리 별 전체 상품 정렬해서 검색(인기순)
	 */
	List<Product> findByCategoryOrderByPopularity(int pCategory) throws Exception;
	
	/*
	 *  8. 카테고리 별 전체 상품 정렬해서 검색(가격 높은순)
	 */
	List<Product> findByCategoryOrderByPriceHigh(int pCategory) throws Exception;
	
	/*
	 *  9. 카테고리 별 전체 상품 정렬해서 검색(가격 낮은순)
	 */
	List<Product> findByCategoryOrderByPriceLow(int pCategory) throws Exception;
	
	/*
	 *  10. 카테고리 별 전체 상품 정렬해서 검색(이름순)
	 */
	List<Product> findByCategoryOrderByName(int pCategory) throws Exception;
	
	/*
	 *  11. 이름으로 검색
	 */
	List<Product> findByName(String pName) throws Exception;
	
	/*
	 *  12. pk로 검색
	 */
	Product findByPrimaryKey(int pNo) throws Exception;
	
	/*
	 *  13. p_count 증가
	 */
	int increaseCount(int pNo) throws Exception;
	
	/*
	 *  14. 이름으로 검색(인기순 정렬해서)
	 */
	List<Product> findByNameOrderByPopuarity(String pName) throws Exception;
	
	/*
	 *  15. 이름으로 검색(가격높은순 정렬해서)
	 */
	List<Product> findByNameOrderByPriceHigh(String pName) throws Exception;
	
	/*
	 *  16. 이름으로 검색(가격낮은순 정렬해서)
	 */
	List<Product> findByNameOrderByPriceLow(String pName) throws Exception;
}
