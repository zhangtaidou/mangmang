package com.yijiayifeng.mapper;
import com.yijiayifeng.entity.DateTime;
import com.yijiayifeng.entity.Kind;
import com.yijiayifeng.entity.Room;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

public interface DateTimePriceMapper {
    //查找所有房态
    public List<Room> selectById(Integer id);
    //通过日期和房型查找
    public DateTime selectByDate(@Param("date") Date date, @Param("name") String name,@Param("kind")String kind,@Param("admin_id")Integer admin_id);
    //添加每日开房情况
    public void addDateByDate(DateTime dateTime);
    //修改房态
    public void updateByDateTime(@Param("id") Integer id,@Param("status") String status);
    //根据房型查找kind
    public List<Kind> selectByKind(DateTime dateTime);
    //修改价格
    public void updatePrice(DateTime dateTime);
    //批量修改价格
    public void updateByPrice(DateTime dateTime);
}
