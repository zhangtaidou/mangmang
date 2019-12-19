package com.yijiayifeng.service;

import com.yijiayifeng.entity.Serve;
import com.yijiayifeng.mapper.ServeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

//用户服务页面
@Service
@Transactional
public class ServeServiceImpl implements ServeService {
    @Autowired
    ServeMapper serveMapper;

    //用户添加服务
    @Override
    public void addService(Serve serve) {
        serveMapper.addService(serve);
    }

    //对应酒店查看服务//对应用户查看服务
    @Override
    public List<Serve> selectService(Serve serve) {
        List<Serve> serves = serveMapper.selectService(serve);
        return serves;
    }

    //处理服务订单
    @Override
    public void updateService(Serve serve){
        serveMapper.updateService(serve);
    }
}
