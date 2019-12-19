package com.yijiayifeng.service;

import com.yijiayifeng.entity.Admin;
import com.yijiayifeng.mapper.AdminMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

//管理员
@Service
@Transactional
public class AdminServiceImpl  implements  AdminService{

    @Autowired
    AdminMapper adminMapper;

    //登录
    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public Admin selectByPwd(Admin admin) {
        Admin admin1 = adminMapper.selectByPwd(admin);
        return admin1;
    }

    //修改订单结算状态
    @Override
    public void updateByIdPrice_state(Admin admin) {
        adminMapper.updateByIdPrice_state(admin);
    }
}
