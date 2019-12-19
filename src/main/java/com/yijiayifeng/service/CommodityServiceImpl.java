package com.yijiayifeng.service;

import com.yijiayifeng.entity.Commodity;

import com.yijiayifeng.mapper.CommodityMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.sql.SQLOutput;
import java.util.Date;
import java.util.List;

@Service
@Transactional
public class CommodityServiceImpl implements CommodityService {
    @Autowired
    CommodityMapper commodityMapper;
    //查询所有商品
    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Commodity> selectAllCommodity(Commodity commodity) {
        List<Commodity> commodities = commodityMapper.selectAllCommodity(commodity);
        return commodities;
    }
    //查询分类商品
    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Commodity> selectCommodity(Commodity commodity) {
        List<Commodity> commodities = commodityMapper.selectCommodity(commodity);
        return commodities;
    }

    //删除
    @Override
    public void deleteCommodity(Integer id) {
        commodityMapper.deleteCommodity(id);
    }
    //添加
    @Override
    public void addCommodity(Commodity commodity) {
        System.out.println(commodity);
        commodityMapper.addCommodity(commodity);
    }
    //修改
    @Override
    public void updateCommodity(Commodity commodity) {
        commodityMapper.updateCommodity(commodity);
    }

    @Override
    public List<Commodity> selectByPage(Integer page, Integer rows) {
        //从第几条开始
        int a = page - 1;
        List<Commodity> commodityList = commodityMapper.selectByPage(a, rows);
        return commodityList;
    }

    @Override
    public Integer selectCommodityCount() {
        Integer count = commodityMapper.selectCommodityCount();
        return count;
    }

    @Override
    public List<Commodity> selectKindByPage(Integer page, Integer rows, String kind) {
        List<Commodity> commodityList = commodityMapper.selectKindByPage(page, rows, kind);
        return commodityList;
    }

    @Override
    public Integer selectKindCount(String kind) {
        commodityMapper.selectKindCount(kind);
        return null;
    }
}
