package com.yijiayifeng.controller;

import com.yijiayifeng.entity.Admin;
import com.yijiayifeng.service.Super_AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;


@Controller
@RequestMapping("/superAdmin")
public class Super_AdminController {

    @Autowired
    Super_AdminService super_adminService;


    //超级管理员 查询所有酒店信息
    public List<Admin> select_out_Admin(){
        List<Admin> outAdmin = super_adminService.select_out_Admin();
        return  outAdmin;
    }


}
