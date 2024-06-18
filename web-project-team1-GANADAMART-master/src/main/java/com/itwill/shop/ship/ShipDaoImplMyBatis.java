package com.itwill.shop.ship;

import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.itwill.shop.mapper.ShipMapper;

public class ShipDaoImplMyBatis implements ShipDao {
	private SqlSessionFactory sqlSessionFactory;
	
	

	public ShipDaoImplMyBatis() throws Exception {
		this.sqlSessionFactory = new SqlSessionFactoryBuilder().build(Resources.getResourceAsStream("mybatis-config.xml"));
	}

	@Override
	public int insert(Ship ship) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		ShipMapper shipMapper = sqlSession.getMapper(ShipMapper.class);
		int rowCount = shipMapper.insert(ship);
		sqlSession.close();
		return rowCount;
	}
 
	@Override
	public int insertByOrderAddr(int oNo) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		ShipMapper shipMapper = sqlSession.getMapper(ShipMapper.class);
		int rowCount = shipMapper.insertByOrderAddr(oNo);
		sqlSession.close();
		return rowCount;
	}

	@Override
	public List<Ship> findByUserId(String sUserId) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		ShipMapper shipMapper = sqlSession.getMapper(ShipMapper.class);
		List<Ship> shipList = shipMapper.findByUserId(sUserId);
		sqlSession.close();
		return shipList;
	}

	@Override
	public Ship findShipBySNo(int sNo) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		ShipMapper shipMapper = sqlSession.getMapper(ShipMapper.class);
		Ship ship =  shipMapper.findShipBySNo(sNo);
		sqlSession.close();
		return ship;
	}
	@Override
	public Ship findDefaultAddr(String sUserId) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		ShipMapper shipMapper = sqlSession.getMapper(ShipMapper.class);
		Ship dafaultAddr =  shipMapper.findDefaultAddr(sUserId);
		sqlSession.close();
		return dafaultAddr;
	}

	@Override
	public int update(Ship ship) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		ShipMapper shipMapper = sqlSession.getMapper(ShipMapper.class);
		int rowCount = shipMapper.update(ship);
		sqlSession.close();
		return rowCount;
	}

	@Override
	public int deleteByShipNo(int sNo) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		ShipMapper shipMapper = sqlSession.getMapper(ShipMapper.class);
		int rowCount = shipMapper.deleteByShipNo(sNo);
		sqlSession.close();
		return rowCount;
	}

	@Override
	public int deleteByUserId(String sUserID) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		ShipMapper shipMapper = sqlSession.getMapper(ShipMapper.class);
		int rowCount =  shipMapper.deleteByUserId(sUserID);
		sqlSession.close();
		return rowCount;
	}

}
