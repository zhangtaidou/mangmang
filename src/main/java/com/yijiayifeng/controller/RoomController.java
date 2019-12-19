package com.yijiayifeng.controller;

import com.yijiayifeng.entity.Admin;
import com.yijiayifeng.entity.Room;
import com.yijiayifeng.service.RoomService;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;



import javax.servlet.http.HttpSession;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


//酒店房间管理
@Controller
@RequestMapping("/roomController")
public class RoomController {

    @Autowired
    RoomService roomService;

    //查询所有房型
    @RequestMapping("/selectRoom")
    @ResponseBody
    public List<Room> selectRoom(Admin admin){
        List<Room> rooms = roomService.selectRoom(admin);
        return rooms;
    }

    //根据房态查询房型信息
    @RequestMapping("/selectByState")
    @ResponseBody
    public List<Room> selectByState(Room room){
        List<Room> rooms = roomService.selectByState(room);
        return rooms;
    }


    //添加房型1
    @RequestMapping("/addRoom")
    public String addRoom(Room room,HttpSession session, MultipartFile[] files){
        //从作用域中获取admin的id
        Admin admin =(Admin)session.getAttribute("admin");
        //修改room的id让admin的id作为外键
        room.setAdmin_id(admin.getId());
        //这是本地存放路径
        String path ="D:/Imp";
        //首先存传过来的文件，存到本地，然后提取存储路径放在FindData实体类中,这一步完成了再往下执行
  // room.setImg(path);
        //在把room对象传到service的add方法
        roomService.addRoom(path,files,room);
        return "ShangP";
    }

    //添加房型2
    @RequestMapping("/addUser")
    public String addUser(Room room,MultipartFile files,HttpSession session) throws IOException {
        //从作用域中获取admin的id
        Admin admin =(Admin)session.getAttribute("admin");
        //修改room的id让admin的id作为外键
        room.setAdmin_id(admin.getId());
        //获取文件名
        String fileName = files.getOriginalFilename();
        //时间格式化格式
        SimpleDateFormat simpleDateFormat =new SimpleDateFormat("yyyyMMddHHmmssSSS");
        //获取当前时间并作为时间戳
        String timeStamp = simpleDateFormat.format(new Date());
        //获取目的地的绝对路径
        String realPath = session.getServletContext().getRealPath("/images");
        //将文件拷贝到目标文件夹中
        files.transferTo(new File(realPath+"/"+timeStamp+fileName));
        //给实体类赋值  可以操作数据库
        room.setImg("./images/"+timeStamp+fileName);
        roomService.addTest(room);
        return "redirect:/ShangP.jsp";
    }

    //删除房型
    @RequestMapping("/deleteRoom")
    public String deleteRoom(Room room) {
        roomService.deleteRoom(room);
        return "forward:/roomController/selectRoom";
    }

    //修改房型
    @RequestMapping("/updateRoom")
    public String updateRoom(Room room,MultipartFile files,HttpSession session) throws IOException {
        //获取文件名
        String fileName = files.getOriginalFilename();
        if("".equals(fileName)){
            Room room1 = roomService.selectByIdRoom(room);
            room.setImg(room1.getImg());
            roomService.updateRoom(room);
            return "redirect:/ShangP.jsp";
        }else{
            //时间格式化格式
            SimpleDateFormat simpleDateFormat =new SimpleDateFormat("yyyyMMddHHmmssSSS");
            //获取当前时间并作为时间戳
            String timeStamp = simpleDateFormat.format(new Date());
            //获取目的地的绝对路径
            String realPath = session.getServletContext().getRealPath("/images");
            //将文件拷贝到目标文件夹中
            files.transferTo(new File(realPath+"/"+timeStamp+fileName));
            //给实体类赋值  可以操作数据库
            room.setImg("./images/"+timeStamp+fileName);
            roomService.updateRoom(room);
            return "redirect:/ShangP.jsp";
        }
    }



    //修改房间状态
    @RequestMapping("/updateState")
    public String updateState(Room room, HttpSession session) {
        Room room1 = roomService.selectByIdRoom(room);
        roomService.updateState(room1);
        Room room2 = roomService.selectByIdRoom(room);
        session.setAttribute("room2",room2);
        return "forward:/roomController/selectRoom";
    }
}
