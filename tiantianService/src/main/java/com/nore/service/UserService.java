package com.nore.service;

import com.nore.pojo.User;

import java.util.List;

/**
 * @Author:nore
 */
public interface UserService {
    List<User> findAllUsers();
    Integer insertUser(User user);
    User queryUserByUsername(String username);
    User queryUserByMail(String mail);
}
