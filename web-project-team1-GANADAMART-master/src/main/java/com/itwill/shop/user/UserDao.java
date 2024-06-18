package com.itwill.shop.user;

import java.util.List;

public interface UserDao {

    int insert(User user) throws Exception; // 유저 생성

    int update(User user) throws Exception; // 유저 업데이트

    boolean updatePassword(String uId, String uPass) throws Exception; // 유저 변경

    int delete(String uId) throws Exception; // 유저 삭제

    User findUser(String uId) throws Exception; // 유저 아이디로 찾기

    User findUserName(String uName) throws Exception; // 이름으로 비밀번호 찾을 때 사용

    List<User> findUserList() throws Exception; // 유저 전체 찾기

    int countByUserId(String uID) throws Exception;
}
