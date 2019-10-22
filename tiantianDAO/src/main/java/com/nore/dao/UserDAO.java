package com.nore.dao;

import com.nore.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserDAO {
    //添加一个用户
    Integer insertUser(User user);

    //根据username查询单个用户
    User queryUserByUsername(@Param("username") String username);

    //根据mail查询单个用户
    User queryUserByMail(@Param("mail") String mail);

    //查询所有用户
    List<User> findAllUsers();
}
