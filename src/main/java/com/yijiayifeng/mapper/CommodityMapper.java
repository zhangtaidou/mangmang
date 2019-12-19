package com.yijiayifeng.mapper;

import com.yijiayifeng.entity.Commodity;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CommodityMapper {
    //查询所有
    public List<Commodity> selectAllCommodity(Commodity commodity);
    //查询分类商品
    public List<Commodity> selectCommodity(Commodity commodity);
    //删除
    public void  deleteCommodity(Integer id);
    //添加
    public void  addCommodity(Commodity commodity);
    //修改
    public void  updateCommodity(Commodity commodity);
    //全部分页
    public List<Commodity> selectByPage(@Param("page") Integer page, @Param("rows") Integer rows);
    //全部分页所需的查询数据总条数
    public Integer selectCommodityCount();
    //类别分页
    public List<Commodity> selectKindByPage(@Param("page") Integer page,
                                            @Param("rows") Integer rows,
                                            @Param("kind") String kind);
    //类别分页需要的数据总条数
    public Integer selectKindCount(String kind);
}
