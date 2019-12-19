package com.yijiayifeng.mapper;

import com.yijiayifeng.entity.Admin;
import com.yijiayifeng.entity.Kind;
import com.yijiayifeng.entity.Room;

import java.util.List;

//种类价格
public interface KindMapper {
    //添加不同种类价格
    public void addKind(Kind kind);

    //查询酒店所有房型
    public List<Room> selectRoom(Admin admin);

    //查询所有价格类型
    public List<Kind> selectKind(Admin admin);

    //移除价格设置
    public void deleteKind(Kind kind);

    //根据价格区间搜索
    public List<Kind> selectByPrice(Kind kind);

    //根据相关房型搜索
    public List<Kind> selectByRoom_Name(Kind kind);

    //根据价格类型搜索
    public List<Kind> selectByKind(Kind kind);
}
