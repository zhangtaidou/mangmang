package com.yijiayifeng.controller;
import com.yijiayifeng.entity.DateTime;
import com.yijiayifeng.entity.Kind;
import com.yijiayifeng.entity.Room;
import com.yijiayifeng.service.DateTimePriceServer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@RestController
@RequestMapping("/datetimeprice")
public class DateTimePriceController {
    @Autowired
    DateTimePriceServer dateTimeServer;
    //查找所有房态
    @RequestMapping("/selectbyid")
    public List<Room> selectById(HttpServletRequest request){
        List<Room> rooms = dateTimeServer.selectById(request);
        return rooms;
    }
    //修改房间价格
    @RequestMapping("/updateprice")
    public String updatePrice(DateTime dateTime){
        dateTimeServer.updatePrice(dateTime);
        return "";
    }

    //批量修改房间价格
    @RequestMapping("/updateByprice")
    public String updateByPrice(String [] date,Integer admin_id,String kind,String[] room_name,Double price) throws ParseException {
        for (String s : date) {
            for (String name : room_name) {
                DateFormat format = new SimpleDateFormat("yyyy/MM/dd");
                Date date1 = format.parse(s);
                DateTime dateTime = new DateTime();
                dateTime.setDate(date1);
                dateTime.setRoom_name(name);
                dateTime.setKind(kind);
                dateTime.setAdmin_id(admin_id);
                dateTime.setPrice(price);
                dateTimeServer.updateByPrice(dateTime);
            }
        }
        return "redirect:/fangjia.jsp";
    }



    //开关房获取参数

    @RequestMapping("/selectdatetime")
    public List<DateTime> selectDateTime(String [] date,String name,Double price,String kind,Integer admin_id) throws ParseException {
        List<DateTime> list=new ArrayList<>();
        for (String s : date) {
            DateFormat dateFormat=new SimpleDateFormat("yyyy/MM/dd");
            Date date1 = dateFormat.parse(s);
            DateTime dateTime = dateTimeServer.selectByDate(date1, name, price, kind, admin_id);
            list.add(dateTime);
        }
        return list;
    }
    //修改房态
    @RequestMapping("/updateByDateTime")
    public String updateByDateTime(String date,String name,String kind,Integer admin_id) throws ParseException {
        DateFormat dateFormat=new SimpleDateFormat("yyyy/MM/dd");
        Date date1 = dateFormat.parse(date);
        String s = dateTimeServer.updateByDateTime(date1, name, kind,admin_id);
        return s;
    }
    //根据房型查Kind
    @RequestMapping("/selectByKind")
    public List<Kind> selectByKind(DateTime dateTime){
        List<Kind> kinds = dateTimeServer.selectByKind(dateTime);
        return kinds;
    }

}
