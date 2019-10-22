package com.nore.controller;

import com.nore.pojo.User;
import com.nore.service.UserService;
import com.nore.utils.R;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;


/**
 * @Author:nore
 */
@RequestMapping("/user")
@RestController
public class UserController {
    @Autowired
    private UserService userService;


    @RequestMapping("/login")
    public R loginUser(@RequestBody User user) {
        Subject subject = SecurityUtils.getSubject();
        System.out.println(user);
        UsernamePasswordToken token = new UsernamePasswordToken(user.getUsername(), user.getPassword());
        //记住我
        token.setRememberMe(true);
        //登录,shiro校验密码
        subject.login(token);
        return R.ok("登录成功");
    }

    @RequestMapping("/checkCode")
    public String checkCode(String code) {
        return "";
    }

    @PostMapping("/regist")
    @ResponseBody
    public String registerUser(@RequestBody User user) {
        try {
            if (user.getUsername().contains("@")) {
                return "-2";
            }
            userService.insertUser(user);
            System.out.println(user);
        } catch (Exception e) {
            System.out.println("用户名或邮箱重复");
            return "-1";
        }
        return "1";
    }

}
