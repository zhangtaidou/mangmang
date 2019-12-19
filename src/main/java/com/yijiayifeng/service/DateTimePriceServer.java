package com.yijiayifeng.service;

import com.yijiayifeng.entity.DateTime;
import com.yijiayifeng.entity.Kind;
import com.yijiayifeng.entity.Room;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

@Service
public interface DateTimePriceServer {
    //查询所有房态
    public List<Room> selectById(HttpServletRequest request);
    //查询date中数据
    public DateTime selectByDate(Date date,String room_name,Double price,String kind,Integer admin_id);
    //根据房型查找kind
    public List<Kind> selectByKind(DateTime dateTime);
    //修改房态
    public String updateByDateTime(Date date,String room_name,String kind,Integer admin_id);
    //通过日期和房型查找
    public void updatePrice(DateTime dateTime);
    //批量修改
    public void updateByPrice(DateTime dateTime);

}
