package com.yijiayifeng.controller;

import com.yijiayifeng.entity.Admin;
import com.yijiayifeng.service.HomePageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/HomePageController")
public class HomePageController {
    @Autowired
    HomePageService homePageService;

    //根据位置查询酒店
    @RequestMapping("/selectByAddressAdmin")
    public List<Admin> selectByAddressAdmin(String address){
        List<Admin> admins = homePageService.selectByAddressAdmin(address);
        return admins;
    }
}
