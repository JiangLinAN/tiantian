package com.nore.controller;

import com.alibaba.fastjson.JSON;
import com.nore.pojo.User;
import com.nore.service.UserService;
import com.nore.utils.R;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;


/**
 * @Author:nore
 */
@RequestMapping("/user")
@Controller
public class UserController {
    @Autowired
    private UserService userService;


    @ResponseBody
    @RequestMapping("/login")
    public R loginUser(@RequestBody User user) {
        Subject subject = SecurityUtils.getSubject();
        UsernamePasswordToken token = new UsernamePasswordToken(user.getUsername(), user.getPassword());
        //记住我
        token.setRememberMe(true);
        //登录,shiro校验密码
        subject.login(token);
        return R.ok("登录成功");
    }

    @ResponseBody
    @RequestMapping("/checkCode")
    public R checkCode(@RequestBody String code, HttpSession session) {
        String cap = (String) session.getAttribute("captcha");
        String substring = code.substring(10, 14);
        if (cap.equalsIgnoreCase(substring)) {
            return R.ok("验证码ok");
        } else {
            return R.error("验证码不正确");
        }
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

    @RequestMapping("/logout")
    public String logoutUser(){
        Subject subject=SecurityUtils.getSubject();
        subject.logout();
        return "login";
    }

}
