package com.yijiayifeng.service;

import com.yijiayifeng.entity.User;

//用户
public interface UserService {
    //登录
    public User selectByPwd(User user);

    //注册
    public void UserAdd(User user);
}
