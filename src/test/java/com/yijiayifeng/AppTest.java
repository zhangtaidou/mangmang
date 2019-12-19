package com.yijiayifeng;

import static org.junit.Assert.assertTrue;


import com.yijiayifeng.controller.CommodityController;
import com.yijiayifeng.entity.Commodity;
import com.yijiayifeng.service.CommodityService;
import com.yijiayifeng.service.CommodityServiceImpl;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import java.util.Date;
import java.util.List;

/**
 * Unit test for simple App.
 */
@RunWith(SpringRunner.class)
@SpringBootTest

@WebAppConfiguration
public class AppTest {

    @Autowired(required = true)
    private CommodityServiceImpl commodityServiceImpl;

    /**
     * Rigorous Test :-)
     */
    @Test
    public void shouldAnswerWithTrue()
    {
        assertTrue( true );
    }

    @Test
    public void name1() {
        List<Commodity> list = commodityServiceImpl.selectByPage(0, 3);
        System.out.println("1");
        for (int i = 0; i < list.size(); i++) {
            System.out.println("1");

            System.out.println(list);
            System.out.println("1");

        }
        System.out.println("1");

        /*List<Commodity> commodities = commodityServiceImpl.selectByPage(0, 3);
        for (Commodity commodity : commodities) {
            System.out.println(commodity);
        }*/
    }
}
