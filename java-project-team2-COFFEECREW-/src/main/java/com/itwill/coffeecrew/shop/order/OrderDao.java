package com.itwill.coffeecrew.shop.order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.naming.InitialContext;

import com.itwill.coffeecrew.shop.common.DataSource;
import com.itwill.coffeecrew.shop.product.Product;

public class OrderDao {

	private DataSource dataSource;

	public OrderDao() throws Exception {
		dataSource = new DataSource();
	}
	
	
	/*
	 * 주문생성
	 */
	public int insert(Order order) throws Exception {
		
		Connection con = null;
		PreparedStatement pstmt1 = null;
		PreparedStatement pstmt2 = null;
		try {
			con = dataSource.getConnection();
			con.setAutoCommit(false);
			pstmt1 = con.prepareStatement(OrderSQL.ORDER_INSERT);
			pstmt1.setString(1, order.getOName());
			pstmt1.setInt(2, order.getOTotalPrice());
			pstmt1.setString(3, order.getORequest());
			pstmt1.setString(4, order.getOPayMtd());
			pstmt1.setString(5, order.getId());
			pstmt1.executeUpdate();

			pstmt2 = con.prepareStatement(OrderSQL.ORDERITEM_INSERT);
			for (OrderItem orderItem : order.getOrderItemList()) {
				pstmt2.setInt(1, orderItem.getOiQty());
				pstmt2.setInt(2, orderItem.getProduct().getPNo());
				pstmt2.executeUpdate();
			}
			con.commit();
		} catch (Exception e) {
			e.printStackTrace();
			con.rollback();
			throw e;
		} finally {
			if (con != null)
				con.close();
		}
		return 0;
	}

	/*
	 * 주문전체(특정사용자)
	 */
	public List<Order> findOrderById(String id) throws Exception {
		ArrayList<Order> orderList = new ArrayList<Order>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(OrderSQL.ORDER_SELECT_BY_ID);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				orderList.add(new Order(rs.getInt("o_no"), 
									    rs.getString("o_name"), 
									    rs.getDate("o_date"),
									    rs.getInt("o_total_price"), 
									    rs.getString("o_request"), 
									    rs.getString("o_pay_mtd"), 
									    rs.getString("id"),
										new ArrayList<>()));
			}
		} finally {
			if (con != null) {
				con.close();
			}
		}
		return orderList;
	}

	/*
	 * 주문+주문아이템 전체(특정사용자)
	 */
	public List<Order> findOrderWithOrderItemById(String id) throws Exception {

		List<Order> orderList = new ArrayList<Order>();
		Connection con = null;
		PreparedStatement pstmt1 = null;
		PreparedStatement pstmt2 = null;
		ResultSet rs1 = null;
		ResultSet rs2 = null;
		try {
			con = dataSource.getConnection();
			pstmt1 = con.prepareStatement(OrderSQL.ORDER_SELECT_BY_ID);
			pstmt1.setString(1, id);
			rs1 = pstmt1.executeQuery();
			while (rs1.next()) {
				orderList.add(new Order(rs1.getInt("o_no"), 
									    rs1.getString("o_name"), 
									    rs1.getDate("o_date"),
									    rs1.getInt("o_total_price"), 
									    rs1.getString("o_request"), 
									    rs1.getString("o_pay_mtd"), 
									    rs1.getString("id"),
										new ArrayList<>()));
			}

			pstmt2 = con.prepareStatement(OrderSQL.ORDER_SELECT_WITH_ORDERITEM_BY_O_NO);
			for (int i = 0; i < orderList.size(); i++) {
				Order tempOrder = orderList.get(i);
				pstmt2.setInt(1, tempOrder.getONo());
				rs2 = pstmt2.executeQuery();
				Order orderWithOrderItem = null;
				if (rs2.next()) {
					orderWithOrderItem = new Order(rs2.getInt("o_no"), 
												   rs2.getString("o_name"), 
												   rs2.getDate("o_date"),
												   rs2.getInt("o_total_price"), 
												   rs2.getString("o_request"), 
												   rs2.getString("o_pay_mtd"), 
												   rs2.getString("id"),
												   new ArrayList<>());
					do {
						orderWithOrderItem.getOrderItemList()
								.add(new OrderItem(rs2.getInt("oi_no"), 
												   rs2.getInt("oi_qty"), 
												   rs2.getInt("o_no"), 
												   new Product(rs2.getInt("p_no"), 
														   	   rs2.getString("p_name"), 
														   	   rs2.getInt("p_price"),
														   	   rs2.getString("p_image"),
														   	   rs2.getString("p_category"))));
					} while (rs2.next());
				}
				orderList.set(i, orderWithOrderItem);
			}
		} finally {
			if (con != null) {
				con.close();
			}
		}
		return orderList;
	}
	
	
	/*
	 * 주문+주문아이템 한개
	 */
	public Order findByOrderNo(int oNo) throws Exception {

		Order order = new Order();

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(OrderSQL.ORDER_SELECT_WITH_ORDERITEM_BY_O_NO);
			pstmt.setInt(1, oNo);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				order = new Order(rs.getInt("o_no"), 
								  rs.getString("o_name"), 
								  rs.getDate("o_date"),
								  rs.getInt("o_total_price"), 
								  rs.getString("o_request"), 
								  rs.getString("o_pay_mtd"), 
								  rs.getString("id"),
								  new ArrayList<>());
				 do {
					order.getOrderItemList()
							.add(new OrderItem(rs.getInt("oi_no"), 
									   rs.getInt("oi_qty"), 
									   rs.getInt("o_no"), 
									   new Product(rs.getInt("p_no"), 
											   	   rs.getString("p_name"), 
											   	   rs.getInt("p_price"),
											   	   rs.getString("p_image"),
											   	   rs.getString("p_category"))));
				 } while (rs.next());
			}
		} finally {
			if (con != null) {
				con.close();
			}
		}
		return order;
	}
	
	/*
	 * 주문 전체 삭제
	 */
	public int deleteById(String id) throws Exception {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			con = dataSource.getConnection();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(OrderSQL.ORDER_DELETE_BY_ID);
			pstmt.setString(1, id);
			rowCount = pstmt.executeUpdate();
			con.commit();
		} catch (Exception e) {
			con.rollback();
			e.printStackTrace();
			throw e;
		} finally {
			if (con != null)
				con.close();
		}
		return rowCount;
	}

	/*
	 * 주문 1건 삭제
	 */
	public int deleteByOrderNo(int oNo) throws Exception {

		Connection con = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			con = dataSource.getConnection();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(OrderSQL.ORDER_DELETE_BY_O_NO);
			pstmt.setInt(1, oNo);
			rowCount = pstmt.executeUpdate();
			con.commit();
		} catch (Exception e) {
			con.rollback();
			e.printStackTrace();
			throw e;
		} finally {
			if (con != null)
				con.close();
		}
		return rowCount;
	}

	


}
