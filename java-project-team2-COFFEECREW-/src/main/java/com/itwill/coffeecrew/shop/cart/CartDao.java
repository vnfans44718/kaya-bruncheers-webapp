package com.itwill.coffeecrew.shop.cart;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.itwill.coffeecrew.shop.common.DataSource;
import com.itwill.coffeecrew.shop.member.Member;
import com.itwill.coffeecrew.shop.product.Product;

public class CartDao {
	private DataSource dataSource;

	public CartDao() throws Exception {
		dataSource = new DataSource();
	}

	/*
	 * cart제품 존재여부 (수량검색)
	 */

	public int countByProductNo(String id, int pNo) throws Exception {
		int count = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(CartSQL.CART_COUNT_BY_USERID_PRODUCT_NO);
			pstmt.setString(1, id);
			pstmt.setInt(2, pNo);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				count = rs.getInt(1);
			}

		} finally {
			if (con != null) {
				con.close();
			}
		}

		return count;
	}

	/*
	 * cart insert(cart)
	 */

	public int insert(Cart cart) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		int insertRowCount = 0;
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(CartSQL.CART_INSERT);

			pstmt.setInt(1, cart.getCQty());
			pstmt.setString(2, cart.getMember().getId());
			pstmt.setInt(3, cart.getProduct().getPNo());

			insertRowCount = pstmt.executeUpdate();

		} finally {
			if (con != null) {
				con.close();
			}

		}

		return insertRowCount;

	}

	public int insert(String id, int pNo, int cQty) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		int insertRowCount = 0;
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(CartSQL.CART_INSERT);

			pstmt.setInt(1, cQty);
			pstmt.setString(2, id);
			pstmt.setInt(3, pNo);

			insertRowCount = pstmt.executeUpdate();

		} finally {
			if (con != null) {
				con.close();
			}

		}

		return insertRowCount;

	}

	/*
	 * cart add update(상품에서카트추가시update)
	 */

	public int updateByProductNo(String id, int pNo, int cQty) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(CartSQL.CART_UPDATE_BY_PRODUCT_NO_USERID);

			pstmt.setInt(1, cQty);
			pstmt.setInt(2, pNo);
			pstmt.setString(3, id);

			rowCount = pstmt.executeUpdate();

		} finally {
			if (con != null) {
				con.close();
			}

		}

		return rowCount;

	}

	public int updateByProductNo(Cart cart) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(CartSQL.CART_UPDATE_BY_PRODUCT_NO_USERID);

			pstmt.setInt(1, cart.getCQty());
			pstmt.setInt(2, cart.getProduct().getPNo());
			pstmt.setString(3, cart.getMember().getId());

			rowCount = pstmt.executeUpdate();

		} finally {
			if (con != null) {
				con.close();
			}

		}

		return rowCount;

	}

	/*
	 * cart update(카트리스트에서 수량 수정)
	 */

	public int updateByCartNo(int cNo, int cQty) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(CartSQL.CART_UPDATE_BY_CART_NO);
			pstmt.setInt(1, cQty);
			pstmt.setInt(2, cNo);
			rowCount = pstmt.executeUpdate();
		} finally {
			if (con != null) {
				con.close();
			}
		}
		return rowCount;
	}

	public int updateByCartNo(Cart cart) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(CartSQL.CART_UPDATE_BY_CART_NO);
			pstmt.setInt(1, cart.getCQty());
			pstmt.setInt(2, cart.getCNo());
			rowCount = pstmt.executeUpdate();
		} finally {
			if (con != null) {
				con.close();
			}
		}
		return rowCount;
	}

	/*
	 * cart list 보여주기
	 */
	public List<Cart> findByUserId(String id) throws Exception {
		List<Cart> cartList = new ArrayList<Cart>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = dataSource.getConnection();
			/*
			"select c*,p* from cart c join product p on c.p_no = p.p_no where id = ?"
			
			이름    널?       유형            
			----- -------- ------------- 
			C_NO  NOT NULL NUMBER(10)    
			C_QTY          NUMBER(10)    
			ID             VARCHAR2(100) 
			P_NO           NUMBER(10)    */

			pstmt = con.prepareStatement(CartSQL.CART_SELECT_BY_USER_ID);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Cart cart = Cart.builder().cNo(rs.getInt("c_no"))
						.member(Member.builder().id(rs.getString("id")).build()).cQty(rs.getInt("c_qty"))
						.product(Product.builder().pNo(rs.getInt("p_no")).pName(rs.getString("p_name"))
								.pPrice(rs.getInt("p_price")).pImage(rs.getString("p_image")).build())
						.build();

				cartList.add(cart);
			}
		} finally {
			if (con != null) {
				con.close();
			}
		}

		return cartList;
	}

	/*
	 * cart pk delete
	 */
	public int deleteByCartNo(int c_no) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		int deleteRowCount = 0;
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(CartSQL.CART_DELETE_BY_CART_NO);
			pstmt.setInt(1, c_no);
			deleteRowCount = pstmt.executeUpdate();
		} finally {
			if (con != null) {
				con.close();
			}
		}
		return deleteRowCount;
	}

	/*
	 * cart  delete - member id로 제거
	 */

	public int deleteByUserId(String id) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		int deleteRowCount = 0;
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(CartSQL.CART_DELETE_BY_USER_ID);
			pstmt.setString(1, id);
			deleteRowCount = pstmt.executeUpdate();
		} finally {
			if (con != null) {
				con.close();
			}
		}
		return deleteRowCount;
	}

	
	
	// 카트 번호로 카트 찾기
	public Cart findByCartNo(int c_no) throws Exception {
		Cart cart = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(CartSQL.CART_SELECT_BY_CART_NO);
			pstmt.setInt(1, c_no);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				cart = new Cart();
			}
		} finally {
			if (con != null) {
				con.close();
			}
		}
		return cart;
	}
	
	public int countByTotMid(String id) throws Exception {
		int countTot = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(CartSQL.CART_SELECT_TOT_BY_USER_ID);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				countTot = rs.getInt(1);
			}

		} finally {
			if (con != null) {
				con.close();
			}
		}

		return countTot;
	}
	
	
	

}// 끝
