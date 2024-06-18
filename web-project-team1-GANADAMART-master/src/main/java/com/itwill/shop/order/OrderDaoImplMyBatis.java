package com.itwill.shop.order;

import java.io.IOException;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.itwill.shop.mapper.OrderMapper;

public class OrderDaoImplMyBatis implements OrderDao {
	
	SqlSessionFactory sqlSessionFactory;
	
	public OrderDaoImplMyBatis() throws IOException {
		this.sqlSessionFactory = new SqlSessionFactoryBuilder().build(Resources.getResourceAsStream("mybatis-config.xml"));
	}
	
	
	@Override
	public int deleteByUserId(String sUserId) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);
		int deleteRowCount= orderMapper.deleteByUserId(sUserId);
		sqlSession.close();
		return deleteRowCount;
	}

	@Override
	public int deleteByOrderNo(int oNo) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);
		int deleteRowCount= orderMapper.deleteByOrderNo(oNo);
		sqlSession.close();
		return deleteRowCount;
	}

	@Override
	public int insertOrder(Order order) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);
		int orderRowCount= orderMapper.insertOrder(order);
		List<OrderItem> orderItemList = order.getOrderItemList();
		for (OrderItem orderItem : orderItemList) {
			orderItem.setONo(order.getONo());
			orderMapper.insertOrderItem(orderItem);
		}
		sqlSession.commit();
		sqlSession.close();
		return order.getONo();
	}

	@Override
	public String findPrimaryImage(int oNo) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);
	    String pImg	=orderMapper.findPrimaryImage(oNo);
	    sqlSession.close();
		return pImg;
	}

	/*
	 * 주문전체(특정사용자)
	 */
	@Override
	public List<Order> findOrderByUserId(String sUserId) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);
		List<Order> orderList = orderMapper.findOrderByUserId(sUserId);
		sqlSession.close();
		return orderList;
	}
	@Override
	public int updateImg(String oImg, int oNo) throws Exception{
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);
		int rowCount = orderMapper.updateImg(oImg, oNo);
		sqlSession.close();
		return rowCount;
	}

	@Override
	public Order findListByOrderNo(int oNo) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);
		Order orderList= orderMapper.findListByOrderNo(oNo);
		sqlSession.close();
		return orderList;
	}

	@Override
	public List<Order> findListByUserId(String sUserId) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);
		List<Order> orderList = orderMapper.findListByUserId(sUserId);
		sqlSession.close();
		return orderList;
	}

}
