package com.yijiayifeng.service;

import com.yijiayifeng.entity.Admin;
import com.yijiayifeng.entity.Kind;
import com.yijiayifeng.entity.Room;
import com.yijiayifeng.mapper.KindMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class KindServiceImpl implements KindService{

    @Autowired
     KindMapper kindMapper;



    //添加不同种类价格
    @Override
    public void addKind(Kind kind) {
        kindMapper.addKind(kind);
    }

    //查询酒店所有房型
    @Override
    public List<Room> selectRoom(Admin admin){
        List<Room> rooms = kindMapper.selectRoom(admin);
        return rooms;
    }

    //查询所有价格类型
    @Override
    public List<Kind> selectKind(Admin admin) {
        List<Kind> kinds = kindMapper.selectKind(admin);
        return kinds;
    }

    //移除价格设置
    @Override
    public void deleteKind(Kind kind) {
        kindMapper.deleteKind(kind);
    }

    //根据价格区间搜索
    public List<Kind> selectByPrice(Kind kind){
        List<Kind> kinds = kindMapper.selectByPrice(kind);
        return kinds;
    }

    //价格类型and相关房型搜索
    public List<Kind> selectByKindOrRoom_Name(Kind kind){
        if ("".equals(kind.getRoom_name()) || "".equals(kind.getKind())){
            List<Kind> kinds = kindMapper.selectByRoom_Name(kind);
            return kinds;
        }else if (kind.getRoom_name()!="" && kind.getKind()!="") {
            List<Kind> kinds = kindMapper.selectByKind(kind);
            return kinds;
        }
        return null;
    }
}
