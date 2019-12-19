package com.yijiayifeng.service;

import com.yijiayifeng.entity.*;
import org.apache.ibatis.annotations.Param;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;

//用户订单
public interface User_orderService {
    //查询所有订单
    public List<User_order> selectAllUser_Order(User user);

    //添加订单
    public void addUser_order(Order_ order_);

    //查询所有酒店
    public Admin selectAllAdmin(Order_ order_);

    //修改回无订单状态
    public void updateStateBy(Order_ order_);
}
