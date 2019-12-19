package com.yijiayifeng.service;

import com.yijiayifeng.entity.*;
import com.yijiayifeng.mapper.Admin_orderMapper;
import com.yijiayifeng.mapper.RoomMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;

//酒店订单
@Service
@Transactional
public class Admin_orderServiceImpl implements Admin_orderService {

    @Autowired
    Admin_orderMapper admin_orderMapper;
    @Autowired
    RoomMapper roomMapper;

    //查询所有订单
    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Order_> selectAllOrder(Order_ order_) {
        List<Order_> orders = admin_orderMapper.selectAllOrder(order_);
        return orders;
    }

    //查询所有订单金额
    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public Total selectAllOrderPrice(Order_ order_) {
        List<Order_> orders = admin_orderMapper.selectAllOrder(order_);
        Total total = new Total();
        for (Order_ order : orders) {
            if("1".equals(order.getState()) || "0".equals(order.getState())){
            total.setTotal(total.getTotal() + order.getCount() * order.getDay() * order.getPrice());
            }
         }
        return total;
    }

    //查询指定日期的订单
    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Order_> selectByDateOrder(Order_ order_) {
        List<Order_> orders = admin_orderMapper.selectByDateOrder(order_);
        return orders;
    }

    //查询指定日期订单金额
    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public Total selectByDateOrderPrice(Order_ order_) {
        List<Order_> orders = admin_orderMapper.selectByDateOrder(order_);
        Total total = new Total();
        for (Order_ order : orders) {
            if("1".equals(order.getState()) || "0".equals(order.getState())){
            total.setTotal(total.getTotal() + order.getCount() * order.getDay() * order.getPrice());
            }
        }
        return total;
    }

    //查询对应酒店
    @Override
    public  Admin selectByNameRoom(String name) {
        Admin admins = admin_orderMapper.selectByNameRoom(name);
        return admins;
    }
    //结算酒店订单
    @Override
    public void updateByDateOrder(Order_ order_) {
        admin_orderMapper.updateByDateOrder(order_);
    }


    //根据手机号或者姓名查询某用户订单
    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Order_> selectByUserIdentiFication(Order_ order_) {
        if (order_.getPhone().equals("") || order_.getUser_name().equals("")) {
            List<Order_> orders = admin_orderMapper.selectByUserName(order_);
             return orders;
        } else if(order_.getPhone()!= "" && order_.getUser_name()!= "") {
            List<Order_> orders=admin_orderMapper.selectByUserPhone(order_);
            return orders;
        }
        return null;
    }

    //根据手机号或者姓名查询某用户订单    新建订单
    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Order_> selectByPhoneOrNameNew(Order_ order_) {
        //先判断传来的值是要根据哪个查询
        if (order_.getPhone().equals("") || order_.getUser_name().equals("")) {
            List<Order_> orders = admin_orderMapper.selectByUserNameState(order_);
            return orders;
        } else if(order_.getPhone()!= "" && order_.getUser_name()!= "") {
            List<Order_> orders=admin_orderMapper.selectByUserPhoneState(order_);
            return orders;
        }
        return null;
    }

    //根据入住状态处理订单修改状态
    @Override
    public void updateState(Order_ order_) {
        if(order_.getState().equals("1")){
            //开启状态转换关闭
            order_.setState("0");
            admin_orderMapper.updateState(order_);
        }else if(order_.getState().equals("0")||order_.getState().equals("2")){
            order_.setState("1");
            admin_orderMapper.updateState(order_);
        }else {
            order_.setState("2");
            admin_orderMapper.updateState(order_);

            //修改房间数量
            Room room = roomMapper.selectCount(order_);
            room.setCount(room.getCount()-1);
            roomMapper.updateCount(room);
        }
    }
    //查询单个为修改提供要修改对象
    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public Order_ selectByIdorder(Order_ order_) {
        Order_ order_1 = admin_orderMapper.selectByIdorder(order_);
        return order_1;
    }

    //拒绝入住
    @Override
    public void NoOrder(Order_ order_) {
        if(order_.getState().equals("3")) {
            //开启状态转换关闭
            order_.setState("4");
            admin_orderMapper.updateState(order_);
        }
    }

    //根据状态查询入住客户
    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Order_> selectByIdState(Order_ order_) {
        List<Order_> order_s = admin_orderMapper.selectByIdState(order_);
        return order_s;
    }

    //根据状态查询待入住客户
    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Order_> selectByIdStateNew(Order_ order_){
        List<Order_> order_s = admin_orderMapper.selectByIdStateNew(order_);
        return order_s;
    }

    //根据状态查询待确认订单
    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Order_> selectByStateNext(Order_ order_) {
        List<Order_> order_s = admin_orderMapper.selectByStateNext(order_);
        return order_s;
    }

    //根据状态查询已取消订单
    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Order_> selectByStateNo(Order_ order_) {
        List<Order_> order_s = admin_orderMapper.selectByStateNo(order_);
        return order_s;
    }

    //根据状态查询拒绝订单
    @Override
    public List<Order_> selectByStateNoNext(Order_ order_) {
        List<Order_> order_s = admin_orderMapper.selectByStateNoNext(order_);
        return order_s;
    }


}
