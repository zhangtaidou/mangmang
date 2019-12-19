package com.yijiayifeng.controller;

import com.yijiayifeng.entity.Serve;
import com.yijiayifeng.service.ServeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

//用户服务页面
@Controller
@RequestMapping("/ServeController")
public class ServeController {
    @Autowired
    ServeService serveService;

    //用户添加服务
    @RequestMapping("/addService")
    public String addService(Serve serve){
        serveService.addService(serve);
        return "";
    }

    //对应酒店查看服务//对应用户查看服务
    @ResponseBody
    @RequestMapping("/selectService")
    public List<Serve> selectService(Serve serve){
        List<Serve> serves = serveService.selectService(serve);
        return serves;
    }

    //修改服务订单
    @RequestMapping("/uptateService")
    public String updateService(Serve serve){
        System.out.println("id"+serve);
        serveService.updateService(serve);
        return "";
    }
}
