package com.nore;

import static org.junit.Assert.assertTrue;

import com.nore.pojo.User;
import com.nore.service.UserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

/**
 * Unit test for simple App.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class AppTest {
    @Autowired
    private UserService userService;
    @Test
    public void testfindAll(){
        List<User> allUsers = userService.findAllUsers();
        for (User allUser : allUsers) {
            System.out.println(allUser);
        }
    }

    @Test
    public void testShiroInsertUser(){
        User user=new User();
        user.setUsername("蒋林安");
        user.setPassword("2090");
        user.setMail("1606573256@qq.com");
        user.setSalt("0000");
        Integer integer = userService.insertUser(user);
        System.out.println(integer);
        System.out.println(user);
    }
}
