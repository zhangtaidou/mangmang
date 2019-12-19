package com.yijiayifeng.controller;

import com.yijiayifeng.entity.*;
import com.yijiayifeng.service.User_orderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jms.core.JmsTemplate;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;


import java.util.List;

@RestController
@RequestMapping("/user_orderController")
public class User_orderController {

    @Autowired
    User_orderService user_orderService;
    @Autowired
    JmsTemplate jmsTemplate;



    //查询所有订单
    @RequestMapping("/selectAllUser_Order")
    @ResponseBody
    public List<User_order> selectAllUser_Order(User user) {
        List<User_order> user_orders = user_orderService.selectAllUser_Order(user);
        return user_orders;
    }

    //添加订单
    @RequestMapping("/addUser_order")
    public String addUser_order(Order_ order_){
        user_orderService.addUser_order(order_);
        return "";
    }

    //查询所有酒店
    @RequestMapping("/selectAllAdmin")
    public Admin selectAllAdmin(Order_ order_){
        Admin admins = user_orderService.selectAllAdmin(order_);
        return admins;
    }

    //修改回无订单状态
    @RequestMapping("/updateStateBy")
    public Admin updateStateBy(Order_ order_){
        user_orderService.updateStateBy(order_);
        Admin admin = new Admin();
        admin.setId(order_.getId());
        return admin;
    }
}
