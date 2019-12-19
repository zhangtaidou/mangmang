package com.yijiayifeng.controller;

import com.yijiayifeng.entity.User;
import com.yijiayifeng.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/userController")
public class UserController{

    @Autowired
    UserService userService;

    //登录
    @RequestMapping("/selectByPwd")
    public String selectByPwd(User user, HttpSession session) {
        User user1 = userService.selectByPwd(user);
        if(user1==null){

            return "";
        }else {

            return "";
        }
    }

    //注册
    @RequestMapping("/userAdd")
    public String UserAdd(User user) {
        userService.UserAdd(user);
        return "";
    }
}
