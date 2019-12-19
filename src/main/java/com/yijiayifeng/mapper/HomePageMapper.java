package com.yijiayifeng.mapper;

import com.yijiayifeng.entity.Admin;

import java.util.List;

//用户查看所有酒店
public interface HomePageMapper {
    //根据位置查询酒店
    public List<Admin> selectByAddressAdmin(String address);
}
