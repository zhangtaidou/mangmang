package com.yijiayifeng.service;

import com.yijiayifeng.entity.Admin;


//管理员
public interface AdminService {
    //登录
    public Admin selectByPwd(Admin admin);
    //修改订单结算状态
    public void updateByIdPrice_state(Admin admin);
}
