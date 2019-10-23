package com.nore;

import static org.junit.Assert.assertTrue;

import com.nore.dao.GoodDAO;
import com.nore.dao.GoodTypeDAO;
import com.nore.pojo.Good;
import com.nore.pojo.GoodType;
import com.nore.pojo.User;
import com.nore.service.GoodTypeService;
import com.nore.service.UserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
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
    @Autowired
    private GoodTypeDAO goodTypeDAO;
    @Autowired
    private GoodDAO goodDAO;
    @Autowired
    private GoodTypeService goodTypeService;

    @Test
    public void testGoodsDAO() {
        List<Good> goodsByTypeId = goodDAO.findGoodsByTypeId(1);
        for (Good good : goodsByTypeId) {
            System.out.println(good);
        }
    }


    //service
    @Test
    public void testGoodTypeService() {
        GoodType goodTypeAndGoods = goodTypeService.findGoodTypeAndGoods(1);
        System.out.println(goodTypeAndGoods);
    }

    //DAO

    @Test
    public void testfindAll() {
        List<User> allUsers = userService.findAllUsers();
        for (User allUser : allUsers) {
            System.out.println(allUser);
        }
    }

    @Test
    public void testShiroInsertUser() {
        User user = new User();
        user.setUsername("蒋林安");
        user.setPassword("2090");
        user.setMail("1606573256@qq.com");
        user.setSalt("0000");
        Integer integer = userService.insertUser(user);
        System.out.println(integer);
        System.out.println(user);
    }

}
