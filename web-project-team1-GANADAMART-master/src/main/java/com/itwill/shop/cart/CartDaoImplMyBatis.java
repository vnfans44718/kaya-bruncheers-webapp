package com.itwill.shop.cart;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.itwill.shop.mapper.CartMapper;

public class CartDaoImplMyBatis implements CartDao{
	private SqlSessionFactory sqlSessionFactory;
	
	public CartDaoImplMyBatis() throws Exception {
		this.sqlSessionFactory = new SqlSessionFactoryBuilder()
				.build(Resources.getResourceAsStream("mybatis-config.xml"));
	}
	
	/*
	 *  멤버한사람의 카트에 제품번호 존재여부
	 */
	@Override
	public int countByProductNo(String sUserId, int poNo) throws Exception {
			SqlSession sqlSession=
					sqlSessionFactory.openSession(true);
			CartMapper cartMapper=sqlSession.getMapper(CartMapper.class);
			int count =cartMapper.countByProductNo(sUserId, poNo);
			return count;
	}
	
	
	public int findCartNoByPoNo(int poNo,String sUserId) throws Exception{
		SqlSession sqlSession=
				sqlSessionFactory.openSession(true);
		CartMapper cartMapper=sqlSession.getMapper(CartMapper.class);
		int cartNo =cartMapper.findCartNoByPoNo(poNo, sUserId);
		return cartNo;
	}
	
	/*
	 *	pNo와 pSize를 이용해 poNo찾기 
	 */
	@Override
	public int findPoNo(int pNo, int pSize) throws Exception {
		SqlSession sqlSession=
				sqlSessionFactory.openSession(true);
		CartMapper cartMapper=sqlSession.getMapper(CartMapper.class);
		int poNo =cartMapper.findPoNo(pNo, pSize);
		return poNo;
	}
	
	/*
	 * 카트추가
	 */
	@Override
	public int insert(String sUserId,int cQty,int poNo)throws Exception{
		SqlSession sqlSession=
				sqlSessionFactory.openSession(true);
		CartMapper cartMapper=sqlSession.getMapper(CartMapper.class);
		int rowCount = cartMapper.insert(sUserId, cQty, poNo);
		sqlSession.close();
		return rowCount;
	}
	
	/*
	 *  멤버한사람의 카트아이템 리스트
	 */
	@Override
	public List<Cart> findByUserId(String sUserId) throws Exception {
			List<Cart> cartList =new ArrayList<Cart>();
			SqlSession sqlSession=
					sqlSessionFactory.openSession(true);
			CartMapper cartMapper=sqlSession.getMapper(CartMapper.class);
			cartList=cartMapper.findByUserId(sUserId);
			sqlSession.close();
			return cartList;
	}
	/*
	 *  멤버의 카트 아이템 총 가격
	 */
	@Override
	public List<Cart> findByUserIdCartPrice(String sUserId) throws Exception {
			List<Cart> cartList = new ArrayList<Cart>();
			SqlSession sqlSession=
					sqlSessionFactory.openSession(true);
			CartMapper cartMapper=sqlSession.getMapper(CartMapper.class);
			cartList=cartMapper.findByUserIdCartPrice(sUserId);
			sqlSession.close();
			return cartList;
	}
	/*
	 * 1. 카트 수량 변경
	 * u_id 카트에 있는 제품의 수량증가
	 */
	@Override
	public int updateByProductNoUP(int cNo, int cQty) throws Exception {
		SqlSession sqlSession=
				sqlSessionFactory.openSession(true);
		CartMapper cartMapper=sqlSession.getMapper(CartMapper.class);
		int rowCount = cartMapper.updateByProductNoUP(cNo,cQty);
		sqlSession.close();
		return rowCount;
	}
	/*
	 * u_id 카트에 있는 제품의 수량감소
	 */
	@Override
	public int updateByProductNoDown(String sUserId, int poNo) throws Exception {
		SqlSession sqlSession=
				sqlSessionFactory.openSession(true);
		CartMapper cartMapper=sqlSession.getMapper(CartMapper.class);
		int rowCount = cartMapper.updateByProductNoDown(sUserId, poNo);
		sqlSession.close();
		return rowCount;
	}
	/*
	 * 카트에 있는 제품 수량 수정
	 */
	@Override
	public int updateByCartNo(int cQty, int cNo) throws Exception {
		SqlSession sqlSession=
				sqlSessionFactory.openSession(true);
		CartMapper cartMapper=sqlSession.getMapper(CartMapper.class);
		int rowCount = cartMapper.updateByCartNo(cQty, cNo);
		sqlSession.close();
		return rowCount;
	}
	/*
	 * 1. 카트아이템 1개 삭제
	 */
	@Override
	public int deleteByCartNo(int cNo) throws Exception {
		SqlSession sqlSession=
				sqlSessionFactory.openSession(true);
		CartMapper cartMapper=sqlSession.getMapper(CartMapper.class);
		int deleteRowCount = cartMapper.deleteByCartNo(cNo);
		sqlSession.close();
		return deleteRowCount;
	}
	/*
	 * 2. 카트아이템 전체 삭제
	 */
	@Override
	public int deleteByCartUserId(String sUserId) throws Exception {
		SqlSession sqlSession=
				sqlSessionFactory.openSession(true);
		CartMapper cartMapper=sqlSession.getMapper(CartMapper.class);
		int deleteRowCount = cartMapper.deleteByCartUserId(sUserId);
		sqlSession.close();
		return deleteRowCount;
	}

	@Override
	public Cart findByCartNo(int cart_no) throws Exception {
		SqlSession sqlSession= 
				sqlSessionFactory.openSession(true);
		CartMapper cartMapper=sqlSession.getMapper(CartMapper.class);
		Cart cart = cartMapper.findByCartNo(cart_no);
		sqlSession.close();
		return cart;
	}
}
	


