package com.yijiayifeng.service;

import com.yijiayifeng.entity.Admin;

import java.util.List;

public interface HomePageService {
    //根据位置查询酒店
    public List<Admin> selectByAddressAdmin(String address);
}
