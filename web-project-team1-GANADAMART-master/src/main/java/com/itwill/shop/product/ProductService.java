package com.itwill.shop.product;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.itwill.shop.mapper.ProductMapper;

public class ProductService {
	private ProductDao productDao;
	
	public ProductService() throws Exception {
		productDao=new ProductDaoImplMyBatis();
	}
	/*
	 *  1. 전체 상품 보기
	 */
	public List<Product> productList() throws Exception{
		return productDao.findAll();
	}
	
	/*
	 *  2. 전체 상품 보기(인기순)
	 */
	public List<Product> productListOrderByPopularity() throws Exception{
		return productDao.findAllOrderByPopularity();
	}
	
	/*
	 *  3. 전체 상품 보기(가격 높은 순)
	 */
	public List<Product> productListOrderByPriceHigh() throws Exception{
		return productDao.findAllOrderByPriceHigh();
	}
	
	/*
	 *  4. 전체 상품 보기(가격 낮은 순)
	 */
	public List<Product> productListOrderByPriceLow() throws Exception{
		return productDao.findAllOrderByPriceLow();
	}
	
	/*
	 *  5. 전체 상품 보기(이름 순)
	 */
	public List<Product> productListOrderByName() throws Exception{
		return productDao.findAllOrderByName();
	}
	
	/*
	 *  6. 카테고리 별 전체 상품 보기
	 */
	public List<Product> productListByCategory(int pCategory) throws Exception{
		return productDao.findByCategory(pCategory);
	}
	
	/*
	 *  7. 카테고리 별 전체 상품 보기(인기순)
	 */
	public List<Product> productListByCategoryOrderByPopularity(int pCategory) throws Exception{
		return productDao.findByCategoryOrderByPopularity(pCategory);
	}
	
	/*
	 *  8. 카테고리 별 전체 상품 보기(가격 높은 순)
	 */
	public List<Product> productListByCategoryOrderByPriceHigh(int pCategory) throws Exception{
		return productDao.findByCategoryOrderByPriceHigh(pCategory);
	}
	
	/*
	 *  9. 카테고리 별 전체 상품 보기(가격 낮은 순)
	 */
	public List<Product> productListByCategoryOrderByPriceLow(int pCategory) throws Exception{
		return productDao.findByCategoryOrderByPriceLow(pCategory);
	}
	
	/*
	 *  10. 카테고리 별 전체 상품 보기(이름 순)
	 */
	public List<Product> productListByCategoryOrderByName(int pCategory) throws Exception{
		return productDao.findByCategoryOrderByName(pCategory);
	}
	
	/*
	 *  11. 상품 이름으로 검색해서 보기
	 */
	public List<Product> productListByName(String pName) throws Exception{
		return productDao.findByName(pName);
	}
	
	/*
	 *  12. 상품 상세보기
	 */
	public Product productByPK(int pNo) throws Exception{
		return productDao.findByPrimaryKey(pNo);
	}
	
	/*
	 *	13. 상품 구매수 증가시키기(인기 UP)
	 */
	public void increaseCount(int pNo) throws Exception {
		productDao.increaseCount(pNo);
	}
	
	public List<Product> findByNameOrderByPopuarity(String pName) throws Exception {
		return productDao.findByNameOrderByPopuarity(pName);
	}
	public List<Product> findByNameOrderByPriceHigh(String pName) throws Exception {
		return productDao.findByNameOrderByPriceHigh(pName);
	}
	public List<Product> findByNameOrderByPriceLow(String pName) throws Exception {
		return productDao.findByNameOrderByPriceLow(pName);
	}
}
