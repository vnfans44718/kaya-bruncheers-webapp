package com.itwill.shop.ship;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.itwill.shop.mapper.ShipMapper;
import com.itwill.shop.product.ProductDao;
import com.itwill.shop.product.ProductDaoImplMyBatis;

public class ShipService {

	private ShipDao shipDao;
	
	public ShipService() throws Exception {
		shipDao = new ShipDaoImplMyBatis();	
	}
	
	public int insert(Ship ship) throws Exception {
		return shipDao.insert(ship);
	}
	
	public int insertByOrderAddr(int oNo) throws Exception {
		return shipDao.insertByOrderAddr(oNo);
	}
	
	public List<Ship> findByUserId(String sUserId) throws Exception {
		return shipDao.findByUserId(sUserId);
	}
	
	public Ship findDefaultAddr(String sUserId) throws Exception {
		return shipDao.findDefaultAddr(sUserId);
	}
	public Ship findShipBySNo(int sNo) throws Exception {
		return shipDao.findShipBySNo(sNo);
	}
	
	public int update(Ship ship) throws Exception {
		return shipDao.update(ship);
	}


	public int deleteByShipNo(int sNo) throws Exception {
		return shipDao.deleteByShipNo(sNo);
	}


	public int deleteByUserId(String sUserID) throws Exception {
		return shipDao.deleteByUserId(sUserID);
	}
	
	
	
}
