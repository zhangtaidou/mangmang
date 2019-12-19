package com.yijiayifeng.service;

import com.yijiayifeng.entity.User;
import com.yijiayifeng.mapper.UserMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

//用户
@Service
@Transactional
public class UserServiceImpl implements UserService{

    @Autowired
    UserMapper userMapper;

    //登录
    @Transactional(propagation = Propagation.SUPPORTS)
    @Override
    public User selectByPwd(User user) {
        User user1 = userMapper.selectByPwd(user);
        return user1;
    }

    //注册
    @Override
    public void UserAdd(User user) {
        userMapper.UserAdd(user);
    }
}
