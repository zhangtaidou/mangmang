package com.yijiayifeng.controller;

import com.yijiayifeng.entity.Admin;
import com.yijiayifeng.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

//管理员
@Controller
@RequestMapping("/adminController")
public class AdminController {

    @Autowired
    AdminService adminService;

    //登录
    @RequestMapping("/selectByPwd")
    public String selectByPwd(Admin admin, HttpSession session){
        Admin admin1 = adminService.selectByPwd(admin);
        if(admin1==null){
            return "login";
        }else {
            session.setAttribute("admin",admin1);
            return "Index";
        }
    }

    //修改订单结算状态
    @RequestMapping("/updateByIdPrice_state")
    public String updateByIdPrice_state(Admin admin) {
        adminService.updateByIdPrice_state(admin);
        return "";
    }
}

