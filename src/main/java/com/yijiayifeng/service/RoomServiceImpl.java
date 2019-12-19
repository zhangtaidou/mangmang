package com.yijiayifeng.service;

import com.yijiayifeng.entity.Admin;
import com.yijiayifeng.entity.Order_;
import com.yijiayifeng.entity.Room;
import com.yijiayifeng.mapper.RoomMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

//酒店房间管理
@Service
@Transactional
public class RoomServiceImpl implements RoomService{

    @Autowired
    RoomMapper roomMapper;

    //查询所有房型
    @Transactional(propagation = Propagation.SUPPORTS)
    @Override
    public List<Room> selectRoom(Admin admin) {
        List<Room> rooms = roomMapper.selectRoom(admin);
        return rooms;
    }

    //根据房态查询房型信息
    @Transactional(propagation = Propagation.SUPPORTS)
    @Override
    public List<Room> selectByState(Room room){
        if("开房".equals(room.getState())){
            room.setState("1");
            List<Room> rooms=roomMapper.selectByState(room);
            return rooms;
        }else {
            room.setState("0");
            List<Room> rooms=roomMapper.selectByState(room);
            return rooms;
        }


    }

    //添加房型
    @Override
    public void addRoom(String path, MultipartFile[] files,Room room) {
        FileOutputStream fout =null;
        InputStream in =null;
        try {
            for (MultipartFile file : files) {
                //获取文件名
                String filemz = path + file.getOriginalFilename();//注意这里可以自己根据实际情况定制输出文件的名字如：年月日时分秒毫秒+随机数，而不使用原始名字。
                //获取后缀名
                String sname = filemz.substring(filemz.lastIndexOf("."));
                //时间格式化格式
                SimpleDateFormat simpleDateFormat =new SimpleDateFormat("yyyyMMddHHmmssSSS");
                //获取当前时间并作为时间戳
                String timeStamp = simpleDateFormat.format(new Date());
                //拼接新的文件名
                String newName = path+"/"+ timeStamp + sname;

                room.setImg(newName);
                //这些if else是为了判断文件类型，并把文件名字存到实体类中去，并通过实体类存到数据库。
                if (sname.equals(".jpg") || sname.equals(".png") || sname.equals("")) {
                    System.out.println(newName);
                }else{
                    System.out.println("不认识"); }

                //把文件保存到新的文件夹下，newName就是上面拼凑的新的文件夹名字
                fout =new FileOutputStream(new File(newName));
                //fout.write(file.getBytes());//这样做也可以
                in = file.getInputStream();
                int len;
                byte[] byt =new byte[1024];
                while ((len = in.read(byt)) != -1) {
                    fout.write(byt, 0, len);
            }
//  如果使用上面的fout.write(file.getBytes());可以如下关闭流
//                fout.close();
//                in.close();
            }
        }catch (Exception e) {
            e.printStackTrace();
        }finally {
            if (null != fout) {
                try {
                    fout.close();
                }catch (IOException e) {
                    e.printStackTrace();
                }
            }
            if (null != in) {
                try {
                    in.close();
                }catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    //下面返回null;可以根据自己的实际情况来返回，如k为原始文件名、v为随机文件名。也可以把返回值变为 HashMap<String,Object>
    //把失败文件、成功文件的List返回
        if(room.getState().equals("开房")){
            room.setState("1");
        }else {
            room.setState("0");
        }
        roomMapper.addRoom(room);
    }



    //删除房型
    @Override
    public void deleteRoom(Room room) {
        roomMapper.deleteRoom(room);
    }

    //修改房型
    @Override
    public void updateRoom(Room room) {
        roomMapper.updateRoom(room);
    }


    //修改房间状态
    @Override
    public void updateState(Room room) {
        if(room.getState().equals("1")){
            //开启状态转换关闭
            room.setState("0");
            roomMapper.updateState(room);
        }else {
            room.setState("1");
            roomMapper.updateState(room);

        }
    }


    //查询单个为修改提供要修改对象
    @Override
    public Room selectByIdRoom(Room room) {
        Room room1 = roomMapper.selectByIdRoom(room);
        return room1;
    }




    //添加测试
    @Override
    public void addTest(Room room) {
        if(room.getState().equals("开房")){
            room.setState("1");
        }else {
            room.setState("0");
        }
        roomMapper.addRoom(room);
    }

}




