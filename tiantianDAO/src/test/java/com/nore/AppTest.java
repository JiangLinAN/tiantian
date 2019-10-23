package com.nore;

import static org.junit.Assert.assertTrue;

import com.nore.dao.GoodTypeDAO;
import com.nore.dao.UserDAO;
import com.nore.pojo.GoodType;
import com.nore.pojo.User;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.Date;
import java.util.List;

/**
 * Unit test for simple App.
 */
public class AppTest {
   @Test
    public void testinsertUser(){
       ApplicationContext context=new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
       UserDAO userDao = context.getBean("userDao", UserDAO.class);
       User user=new User("少2","123","666","789",new Date());
       Integer integer = userDao.insertUser(user);
   }

   @Test
   public void testfindAll(){
      ApplicationContext context=new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
      UserDAO userDao = context.getBean("userDao", UserDAO.class);
      List<User> allUsers = userDao.findAllUsers();
      for (User allUser : allUsers) {
         System.out.println(allUser);
      }
   }

}
