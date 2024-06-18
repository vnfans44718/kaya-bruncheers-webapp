package com.itwill.shop.mapper;

import com.itwill.shop.user.User;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface UserMapper {

    @Insert("insert into userinfo(u_id, u_pass, u_name, u_phone, u_email, u_addr, u_dob) values (#{uId}, #{uPass}, #{uName}, #{uPhone}, #{uEmail}, #{uAddr}, #{uDob})")
    int insert(User user) throws Exception; // 유저 생성

    @Update("update userinfo set u_pass=#{uPass}, u_name=#{uName}, u_email=#{uEmail}, u_addr=#{uAddr},u_phone=#{uPhone} where u_id=#{uId}")
    int update(User user) throws Exception; // 유저 업데이트

    @Update("update userinfo set u_pass = #{uPass} where u_id = #{uId}")
    boolean updatePassword(@Param("uId") String uId, @Param("uPass") String uPass) throws Exception; // 유저 비밀번호 변경

    @Delete("delete userinfo where u_id = #{uId}")
    int delete(String uId) throws Exception; // 유저 삭제

    @Select("select u_id, u_pass, u_name, u_phone, u_email, u_addr, u_dob from userinfo where u_id=#{uId}")
    User findUser(String uId) throws Exception; // 유저 아이디로 찾기

    @Select("select u_id, u_pass, u_name, u_phone, u_email, u_addr, u_dob from userinfo where u_Name=#{uName}")
    User findUserName(String uName) throws Exception; // 유저 이름으로 찾기

    @Select("select * from userinfo")
    List<User> findUserList() throws Exception; // 유저 전체 찾기

    @Select("select count(*) cnt from userinfo where u_id=#{uId}")
    int countByUserId(String uID) throws Exception;
}
