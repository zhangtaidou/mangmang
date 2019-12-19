package com.yijiayifeng.mapper;

import com.yijiayifeng.entity.User;

//用户
public interface UserMapper {
    //登录
    public User selectByPwd(User user);

    //注册
    public void UserAdd(User user);
}
