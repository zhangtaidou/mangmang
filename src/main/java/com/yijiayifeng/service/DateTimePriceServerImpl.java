package com.yijiayifeng.service;
import com.yijiayifeng.entity.Admin;
import com.yijiayifeng.entity.DateTime;
import com.yijiayifeng.entity.Kind;
import com.yijiayifeng.entity.Room;
import com.yijiayifeng.mapper.DateTimePriceMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;
@Service
@Transactional
public class DateTimePriceServerImpl implements DateTimePriceServer {
    @Autowired
    DateTimePriceMapper dateTimeMapper;

    //查找所有房型
    @Override
    @Cacheable(cacheNames = "room")
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Room> selectById(HttpServletRequest request) {
        HttpSession session = request.getSession();
        Admin admin = (Admin) session.getAttribute("admin");
        Integer id = admin.getId();
        List<Room> rooms = dateTimeMapper.selectById(id);
        return rooms;
    }

    //修改房间价格
    @Override
    public void updatePrice(DateTime dateTime) {
        dateTimeMapper.updatePrice(dateTime);
    }

    @Override
    public void updateByPrice(DateTime dateTime) {
        dateTimeMapper.updateByPrice(dateTime);
    }

    @Override
    /*获取参数进行判断
     * 库里没有添加
     * 库里有直接查
     * */
    @Cacheable(cacheNames = "datekind")
    public DateTime selectByDate(Date date, String room_name, Double price, String kind, Integer admin_id) {
        DateTime dateTime = dateTimeMapper.selectByDate(date, room_name,kind,admin_id);
        if (dateTime==null){
            dateTime=new DateTime();
            dateTime.setPrice(price);
            dateTime.setDate(date);
            dateTime.setRoom_name(room_name);
            dateTime.setKind(kind);
            dateTime.setAdmin_id(admin_id);
            dateTime.setStatus("可售");
            dateTimeMapper.addDateByDate(dateTime);
            DateTime dateTime1 = dateTimeMapper.selectByDate(date, room_name,kind,admin_id);
            return dateTime1;
        }else{
            return dateTime;
        }
    }
    //根据房型查找kind
    @Transactional(propagation = Propagation.SUPPORTS)
    @Override
    @Cacheable(cacheNames = "datekind")
    public List<Kind> selectByKind(DateTime dateTime) {
        List<Kind> kinds = dateTimeMapper.selectByKind(dateTime);
        return kinds;
    }


    //修改房态
    @CacheEvict(cacheNames = "datekind")
    public String updateByDateTime(Date date,String room_name,String kind,Integer admin_id){
        DateTime dateTime = dateTimeMapper.selectByDate(date, room_name, kind,admin_id);
        if (dateTime.getStatus().equals("可售")){
            dateTimeMapper.updateByDateTime(dateTime.getId(),"已关房");
            return "已关房";
        }else {
            dateTimeMapper.updateByDateTime(dateTime.getId(),"可售");
            return "可售";
        }
    }



}
