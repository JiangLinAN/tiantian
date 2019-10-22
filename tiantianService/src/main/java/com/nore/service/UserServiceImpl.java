package com.nore.service;

import com.nore.constant.MyConstant;
import com.nore.dao.UserDAO;
import com.nore.pojo.User;
import org.apache.shiro.crypto.hash.Sha256Hash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 * @Author:nore
 */
@Service
@Transactional
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDAO userDAO;

    @Transactional(propagation = Propagation.SUPPORTS)
    @Override
    public List<User> findAllUsers() {
        return userDAO.findAllUsers();
    }

    @Override
    public Integer insertUser(User user) {
        //自动生产一个盐
        user.setSalt(UUID.randomUUID().toString());
        //注册时间
        user.setRegisterTime(new Date());
        //密码加密
        Sha256Hash sha256Hash=new Sha256Hash(user.getPassword(),user.getSalt(), MyConstant.SALTCOUNT);
        user.setPassword(sha256Hash.toBase64());

        return userDAO.insertUser(user);
    }

    @Override
    public User queryUserByUsername(String username) {
        return userDAO.queryUserByUsername(username);
    }

    @Override
    public User queryUserByMail(String mail) {
        return userDAO.queryUserByMail(mail);
    }

}
