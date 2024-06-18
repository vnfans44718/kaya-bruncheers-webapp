package com.itwill.coffeecrew.shop.product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.itwill.coffeecrew.shop.common.DataSource;

public class ProductDao {
	private DataSource dataSource;

	public ProductDao() throws Exception {
		dataSource = new DataSource();
	}

	// 카테고리 이름으로 분류
	public List<Product> findByCategory(String pCategory) throws Exception {
		List<Product> productList = new ArrayList<Product>();

		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(ProductSQL.PRODUCT_SELECT_BY_CATEGORY);
		pstmt.setString(1, pCategory);
		ResultSet rs = pstmt.executeQuery();
		Product product = null;
		while (rs.next()) {
			product = new Product(rs.getInt("p_no"), rs.getString("p_name"), rs.getInt("p_price"),
					rs.getString("p_image"), rs.getString("p_category"));
			productList.add(product);
		}
		pstmt.close();
		dataSource.close(con);
		return productList;
	}

	// 상품 번호로 선택
	public Product findByProductNo(int pNo) throws Exception {
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(ProductSQL.PRODUCT_SELECT_BY_NO);
		pstmt.setInt(1, pNo);
		ResultSet rs = pstmt.executeQuery();
		Product product = null;
		if (rs.next()) {
			product = new Product(rs.getInt("p_no"), rs.getString("p_name"), rs.getInt("p_price"),
					rs.getString("p_image"), rs.getString("p_category"));
		}
		pstmt.close();
		dataSource.close(con);
		return product;
	}

	// 전체 상품 찾기
	public List<Product> findProductAll() throws Exception {
		List<Product> productList = new ArrayList<Product>();

		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(ProductSQL.PRODUCT_SELECT_ALL);
		ResultSet rs = pstmt.executeQuery();

		while (rs.next()) {
			Product product = new Product(rs.getInt("p_no"), rs.getString("p_name"), rs.getInt("p_price"),
					rs.getString("p_image"), rs.getString("p_category"));
			productList.add(product);
		}
		pstmt.close();
		dataSource.close(con);
		return productList;
	}

	// 상품 추가하기
	public int productInsert(Product product) throws Exception {
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(ProductSQL.PRODUCT_INSERT);
		pstmt.setInt(1, product.getPNo());
		pstmt.setString(2, product.getPName());
		pstmt.setInt(3, product.getPPrice());
		pstmt.setString(4, product.getPImage());
		pstmt.setString(5, product.getPCategory());

		int rowCount = pstmt.executeUpdate();
		pstmt.close();
		dataSource.close(con);
		return rowCount;
	}

	// 상품 업데이트 하기
	public int productUpdate(Product product) throws Exception {
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(ProductSQL.PRODUCT_UPDATE);
		pstmt.setString(1, product.getPName());
		pstmt.setInt(2, product.getPPrice());
		pstmt.setString(3, product.getPImage());
		pstmt.setInt(4, product.getPNo());
		pstmt.setString(5, product.getPCategory());
		int rowCount = pstmt.executeUpdate();

		pstmt.close();
		dataSource.close(con);
		return rowCount;
	}

	// 이름으로 상품 삭제하기
	public int productDelete(String pName) throws Exception {
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(ProductSQL.PRODUCT_DELETE_BY_NAME);
		pstmt.setString(1, pName);
		int rowCount = pstmt.executeUpdate();
		pstmt.close();
		dataSource.close(con);
		return rowCount;
	}

}
