package com.yijiayifeng.service;

import com.yijiayifeng.entity.*;
import com.yijiayifeng.mapper.User_OrderMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



import java.util.List;

//用户订单
@Service
public class User_orderServiceImpl implements  User_orderService {

    @Autowired
    User_OrderMapper user_orderMapper;

    //查询所有订单
    @Override
    public List<User_order> selectAllUser_Order(User user) {
        List<User_order> user_orders = user_orderMapper.selectAllUser_Order(user);
        return user_orders;
    }

    //添加订单
    @Override
    public void addUser_order(Order_ order_){
        order_.setState("3");
        //添加order订单
        user_orderMapper.addUser_order(order_);
        //通过order中的admin_id修改admin中的状态然后作为改变的值提示
        user_orderMapper.uptatePrice_state(order_);
        //查询出来所有酒店

//            for (Admin admin : admins) {
//                if(admin.getPrice_state()==1){
//                    //当前项目下路径
//                    File file = new File("C:\\Users\\90428\\Desktop\\lar.mp3");
//                    String filePath = file.getCanonicalPath();
//                    FileInputStream fileInputStream = new FileInputStream(file);
//                    BufferedInputStream bufferedInputStream = new BufferedInputStream(fileInputStream);
//                    AudioPlayer.player.start(bufferedInputStream);
//                }
//            }

    }

    //查询所有酒店状态
    @Override
    public Admin selectAllAdmin(Order_ order_) {
        Admin admins = user_orderMapper.selectAllAdmin(order_);
        return admins;
    }

    //修改回无订单状态
    @Override
    public void updateStateBy(Order_ order_) {
         user_orderMapper.updateStateBy(order_);
    }
}



