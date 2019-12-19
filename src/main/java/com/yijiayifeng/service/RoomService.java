package com.yijiayifeng.service;

import com.yijiayifeng.entity.Admin;
import com.yijiayifeng.entity.Order_;
import com.yijiayifeng.entity.Room;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

//酒店房间管理
public interface RoomService {

    //查询所有房型
    public List<Room> selectRoom(Admin admin);

    //根据房态查询房型信息
    public List<Room> selectByState(Room room);

    //添加房型
    public void addRoom(String path, MultipartFile[] files,Room room);

    //删除房型
    public void deleteRoom(Room room);

    //修改房型
    public void updateRoom(Room room);

    //修改房间状态
    public void updateState(Room room);
    public Room selectByIdRoom(Room room);

    //添加测试
    public void addTest( Room room);
}
