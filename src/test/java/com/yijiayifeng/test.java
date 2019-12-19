package com.yijiayifeng;


import com.yijiayifeng.controller.CommodityController;
import com.yijiayifeng.controller.Super_AdminController;
import com.yijiayifeng.entity.Admin;
import com.yijiayifeng.entity.Commodity;
import com.yijiayifeng.mapper.CommodityMapper;
import com.yijiayifeng.mapper.Super_AdminMapper;
import com.yijiayifeng.service.CommodityServiceImpl;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import java.util.List;
import java.util.Map;

@RunWith(SpringRunner.class)
@SpringBootTest
@WebAppConfiguration
public class test {
    @Autowired
    private CommodityServiceImpl service;
    @Autowired
    private CommodityMapper commodityMapper;
    @Autowired
    private Super_AdminMapper super_adminMapper;
    @Autowired
    private Super_AdminController super_adminController;

    @Test
    public void a() {
        List<Commodity> commodities = commodityMapper.selectByPage(0, 6);
        for (Commodity commodity : commodities) {
            System.out.println(commodity);
        }
    }
    @Test
    public void b () {
        List<Admin> outAdmin = super_adminController.select_out_Admin();
        for (Admin admin : outAdmin) {
            System.out.println(admin.getId());
        }
    }


    @Test
    public void c (){
        Admin admin = new Admin();
        admin.select();
    }
}
