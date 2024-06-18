package com.itwill.shop.user;

import com.itwill.shop.mapper.UserMapper;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.util.List;

public class UserDaoImplMyBatis implements UserDao {

    private SqlSessionFactory sqlSessionFactory;

    public UserDaoImplMyBatis() throws Exception {
        this.sqlSessionFactory = new SqlSessionFactoryBuilder()
                .build(Resources.getResourceAsStream("mybatis-config.xml"));
    }

    @Override
    public int insert(User user) throws Exception {
        SqlSession sqlSession = sqlSessionFactory.openSession(true);
        UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
        int rowCount = userMapper.insert(user);
        sqlSession.close();
        return rowCount;
    }

    @Override
    public int update(User user) throws Exception {
        SqlSession sqlSession = sqlSessionFactory.openSession(true);
        UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
        int rowCount = userMapper.update(user);
        sqlSession.close();
        return rowCount;
    }

    @Override
    public boolean updatePassword(String uId, String uPass) throws Exception {
        SqlSession sqlSession = sqlSessionFactory.openSession(true);
        UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
        return userMapper.updatePassword(uId, uPass);
    }

    @Override
    public int delete(String uId) throws Exception {
        SqlSession sqlSession = sqlSessionFactory.openSession(true);
        UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
        int rowCount = userMapper.delete(uId);
        sqlSession.close();
        return rowCount;
    }

    @Override
    public User findUser(String uId) throws Exception {
        SqlSession sqlSession = sqlSessionFactory.openSession(true);
        UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
        User user = userMapper.findUser(uId);
        sqlSession.close();
        return user;
    }

    @Override
    public User findUserName(String uName) throws Exception {
        SqlSession sqlSession = sqlSessionFactory.openSession(true);
        UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
        User user = userMapper.findUserName(uName);
        sqlSession.close();
        return user;
    }

    @Override
    public List<User> findUserList() throws Exception {
        SqlSession sqlSession = sqlSessionFactory.openSession(true);
        UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
        List<User> userList = userMapper.findUserList();
        sqlSession.close();
        return userList;
    }

    @Override
    public int countByUserId(String uID) throws Exception {
        SqlSession sqlSession = sqlSessionFactory.openSession(true);
        UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
        int rowCount = userMapper.countByUserId(uID);
        sqlSession.close();
        return rowCount;
    }
}
