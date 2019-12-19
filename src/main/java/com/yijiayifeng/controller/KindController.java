package com.yijiayifeng.controller;


import com.yijiayifeng.entity.Admin;
import com.yijiayifeng.entity.Kind;
import com.yijiayifeng.entity.Room;
import com.yijiayifeng.service.KindService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/KindController")
public class KindController {

    @Autowired
    KindService kindService;

    //添加不同种类价格
    @RequestMapping("/addKind")
    public String addKind(Kind kind) {
        kindService.addKind(kind);
        return "forward:/KindController/selectRoom";
    }

    //查询所有房间类型
    @ResponseBody
    @RequestMapping("/selectRoom")
    public List<Room> selectRoom(Admin admin) {
        List<Room> rooms = kindService.selectRoom(admin);
        return rooms;
    }

    //查询所有价格类型
    @ResponseBody
    @RequestMapping("/selectKind")
    public List<Kind> selectKind(Admin admin) {
        List<Kind> kinds = kindService.selectKind(admin);
        return kinds;
    }

    //移除价格设置
    @RequestMapping("/deleteKind")
    public String deleteKind(Kind kind) {
        kindService.deleteKind(kind);
        return "JiaGeTianJia";
    }

    //根据价格区间搜索
    @ResponseBody
    @RequestMapping("/selectByPrice")
    public List<Kind> selectByPrice(Kind kind){
        List<Kind> kinds = kindService.selectByPrice(kind);
        return kinds;
    }

    //根据房型或者价格类型搜索
    @ResponseBody
    @RequestMapping("/selectByKindOrRoom_Name")
    public List<Kind> selectByKindOrRoom_Name(Kind kind){
        List<Kind> kinds = kindService.selectByKindOrRoom_Name(kind);
        return kinds;
    }
}
