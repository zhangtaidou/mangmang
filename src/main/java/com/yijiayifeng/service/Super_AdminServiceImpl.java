package com.yijiayifeng.service;


import com.yijiayifeng.entity.Admin;
import com.yijiayifeng.mapper.Super_AdminMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;

@Service
@Transactional
public class Super_AdminServiceImpl implements Super_AdminService {

    @Autowired
    Super_AdminMapper super_adminMapper;

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    //超级管理员 查询所有酒店信息
    public List<Admin> select_out_Admin() {
        List<Admin> outAdmin = super_adminMapper.select_out_Admin();
        return outAdmin;
    }



}
