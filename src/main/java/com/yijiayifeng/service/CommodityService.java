package com.yijiayifeng.service;

import com.yijiayifeng.entity.Commodity;

import java.util.List;
import java.util.Map;

public interface CommodityService {
    //查询商品
    public List<Commodity> selectAllCommodity(Commodity commodity);
    //查询分类商品
    public List<Commodity> selectCommodity(Commodity commodity);
    //删除商品
    public void  deleteCommodity(Integer id);
    //添加商品
    public void  addCommodity(Commodity commodity);
    //修改商品
    public void  updateCommodity(Commodity commodity);
    //分页
    public List<Commodity> selectByPage(Integer page, Integer rows);
    //分页所需的查询数据总条数
    public Integer selectCommodityCount();
    //类别分页
    public List<Commodity> selectKindByPage(Integer page,Integer rows,String kind);
    //类别分页需要的数据总条数
    public Integer selectKindCount(String kind);
}
