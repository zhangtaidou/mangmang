package com.yijiayifeng.mapper;

import com.yijiayifeng.entity.*;
import org.apache.ibatis.annotations.Param;

import java.util.List;

//用户订单
public interface User_OrderMapper {
    //查询所有订单
    public List<User_order> selectAllUser_Order(User user);

    //添加订单
    public void addUser_order(Order_ order_);


    //修改admin状态处理提示音
    public void uptatePrice_state(Order_ order_);
    //修改回无订单状态
    public void updateStateBy(Order_ order_);



    //查询所有酒店判断状态
    public Admin selectAllAdmin(Order_ order_);
}
