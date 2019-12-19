package com.yijiayifeng.mapper;

import com.yijiayifeng.entity.Serve;

import java.util.List;

public interface ServeMapper {
    //用户添加服务
    public void addService(Serve serve);
    //对应酒店查看服务//对应用户查看服务
    public List<Serve> selectService(Serve serve);
    //处理服务订单
    public void updateService(Serve serve);
}
