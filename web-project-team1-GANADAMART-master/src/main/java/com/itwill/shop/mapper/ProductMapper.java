package com.itwill.shop.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.itwill.shop.product.Product;

public interface ProductMapper {

	/*
	 *  1. 전체 상품 검색
	 */
	@Select("select * from product")
	List<Product> findAll();
	
	/*
	 *  2. 전체 상품 정렬해서 검색(인기순) 
	 */
	@Select("select * from product order by p_count desc,p_name asc")
	List<Product> findAllOrderByPopularity();
	
	/*
	 *  3. 전체 상품 정렬해서 검색(가격 높은 순)
	 */
	@Select("select * from product order by p_price desc")
	List<Product> findAllOrderByPriceHigh();
	
	/*
	 *  4. 전체 상품 정렬해서 검색(가격 낮은 순) 
	 */
	@Select("select * from product order by p_price asc")
	List<Product> findAllOrderByPriceLow();
	
	/*
	 *  5. 전체 상품 정렬해서 검색(이름 순) 
	 */
	@Select("select * from product order by p_name asc")
	List<Product> findAllOrderByName();
	
	/*
	 *  6. 카테고리 별 전체 상품 검색
	 */
	@Select("select * from product where p_category=#{pCategory}")
	List<Product> findByCategory(int pCategory);
	
	/*
	 *  7. 카테고리 별 전체 상품 정렬해서 검색(인기순)
	 */
	@Select("select * from product where p_category=#{pCategory}  order by p_count desc,p_name asc")
	List<Product> findByCategoryOrderByPopularity(int pCategory);
	
	/*
	 *  8. 카테고리 별 전체 상품 정렬해서 검색(가격 높은순)
	 */
	@Select("select * from product where p_category=#{pCategory} order by p_price desc")
	List<Product> findByCategoryOrderByPriceHigh(int pCategory);
	
	/*
	 *  9. 카테고리 별 전체 상품 정렬해서 검색(가격 낮은순)
	 */
	@Select("select * from product where p_category=#{pCategory} order by p_price asc")
	List<Product> findByCategoryOrderByPriceLow(int pCategory);
	
	/*
	 *  10. 카테고리 별 전체 상품 정렬해서 검색(이름순)
	 */
	@Select("select * from product where p_category=#{pCategory} order by p_name asc")
	List<Product> findByCategoryOrderByName(int pCategory);
	
	/*
	 *  11. 이름으로 검색
	 */
	@Select("select * from product where p_name like '%'||#{pName}||'%'")
	List<Product> findByName(String pName);
	
	/*
	 *  12. pk로 검색
	 */
	@Select("select * from product where p_no=#{pNo}")
	Product findByPrimaryKey(int pNo);
	
	/*
	 *  13. p_count 증가
	 */
	@Update("update product set p_count = p_count+1 where p_no=#{pNo}")
	int increaseCount(int pNo);
	
	/*
	 *  14. 이름으로 검색(인기순 정렬해서)
	 */
	@Select("select * from product where p_name like '%'||#{pName}||'%' order by p_count desc,p_name asc")
	List<Product> findByNameOrderByPopuarity(String pName);
	
	/*
	 *  15. 이름으로 검색(가격높은순 정렬해서)
	 */
	@Select("select * from product where p_name like '%'||#{pName}||'%' order by p_price desc")
	List<Product> findByNameOrderByPriceHigh(String pName);
	
	/*
	 *  16. 이름으로 검색(가격낮은순 정렬해서)
	 */
	@Select("select * from product where p_name like '%'||#{pName}||'%' order by p_price asc")
	List<Product> findByNameOrderByPriceLow(String pName);
	
	
}
