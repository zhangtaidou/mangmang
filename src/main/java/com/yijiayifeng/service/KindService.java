package com.yijiayifeng.service;

import com.yijiayifeng.entity.Admin;
import com.yijiayifeng.entity.Kind;
import com.yijiayifeng.entity.Room;

import java.util.List;

public interface KindService {

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

    //价格类型and相关房型搜索
    public List<Kind> selectByKindOrRoom_Name(Kind kind);
}
