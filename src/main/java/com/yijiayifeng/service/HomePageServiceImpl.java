package com.yijiayifeng.service;

import com.yijiayifeng.entity.Admin;
import com.yijiayifeng.mapper.HomePageMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class HomePageServiceImpl implements HomePageService{
    @Autowired
    HomePageMapper homePageMapper;

     //根据位置查询酒店
     @Transactional(propagation = Propagation.SUPPORTS)
     @Override
    public List<Admin> selectByAddressAdmin(String address){
         List<Admin> admins = homePageMapper.selectByAddressAdmin(address);
         return admins;
    }
}
