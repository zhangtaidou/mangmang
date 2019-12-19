package com.yijiayifeng.controller;


import com.yijiayifeng.entity.*;
import com.yijiayifeng.service.Admin_orderService;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

@RestController
@RequestMapping("/admin_orderController")
public class Admin_orderController {

    @Autowired
    private Admin_orderService admin_orderService;


    //查询所有订单
    @RequestMapping("/selectAllOrder")
    public List<Order_> selectAllOrder(Order_ order_){
        List<Order_> orders = admin_orderService.selectAllOrder(order_);
        return orders;
    }
    //查询所有订单金额
    @RequestMapping("/selectAllOrderPrice")
    public Total selectAllOrderPrice(Order_ order_){
        Total total = admin_orderService.selectAllOrderPrice(order_);
        return total;
    }


    //查询指定日期订单
    @RequestMapping("/selectByDateOrder")
    public List<Order_> selectByDateOrder(Order_ order_,String dateaa,String datebb) throws ParseException {
        DateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
        List<Order_> order_s = null;
            order_.setDatea(format1.parse(dateaa));
            order_.setDateb(format1.parse(datebb));
            order_s=admin_orderService.selectByDateOrder(order_);
            return order_s;
    }
    //查询指定日期订单金额
    @RequestMapping("/selectByDateOrderPrice")
    public Total selectByDateOrderPrice(Order_ order_,String dateaa,String datebb) throws ParseException {
        DateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
        List<Order_> order_s = null;
        order_.setDatea(format1.parse(dateaa));
        order_.setDateb(format1.parse(datebb));
        Total total = admin_orderService.selectByDateOrderPrice(order_);
        return total;
    }


    //查询对应酒店所有订单
    @RequestMapping("/selectByNameRoom")
    @ResponseBody
    public  List<Order_> selectByNameRoom(String name, String dateaa, String datebb, HttpSession session) throws ParseException {
        DateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
        Order_ order_ =new Order_();
        List<Order_> order_s=null;
        Admin admin = admin_orderService.selectByNameRoom(name);
            order_.setAdmin_id(admin.getId());
            order_.setDatea(format1.parse(dateaa));
            order_.setDateb(format1.parse(datebb));
            session.setAttribute("admin_id",admin.getId());
            order_s = admin_orderService.selectByDateOrder(order_);
        return order_s;
    }

    //结算酒店订单
    @RequestMapping("/updateByDateOrder")
    public String updateByDateOrder(String dateaa,String datebb,HttpSession session) throws ParseException {
        DateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
        Integer id= (Integer)session.getAttribute("admin_id");
        Order_ order_ =new Order_() ;
        order_.setAdmin_id(id);
        order_.setDatea(format1.parse(dateaa));
        order_.setDateb(format1.parse(datebb));
        admin_orderService.updateByDateOrder(order_);
        return "Panduan";
    }



    //根据手机号或者姓名查询某用户订单
    @RequestMapping("/selectByUserIdentiFication")
    public List<Order_> selectByUserIdentiFication(Order_ order_) {
        List<Order_> orders = admin_orderService.selectByUserIdentiFication(order_);
        return orders;
    }
    //根据手机号或者姓名查询某用户订单   新建订单
    @RequestMapping("/selectByPhoneOrNameNew")
    public List<Order_> selectByPhoneOrNameNew(Order_ order_) {
        List<Order_> orders = admin_orderService.selectByPhoneOrNameNew(order_);
        return orders;
    }

    //根据入住状态处理订单
    @RequestMapping("/updateState")
    public String updateState(Order_ order_) {
        Order_ order_1 = admin_orderService.selectByIdorder(order_);
        admin_orderService.updateState(order_1);
        return "";
    }

    //拒绝入住
    @RequestMapping("/NoOrder")
    public String NoOrder(Order_ order_){
        Order_ order_1 = admin_orderService.selectByIdorder(order_);
        admin_orderService.NoOrder(order_1);
        return "";
    }

    //根据状态查询入住用户
    @RequestMapping("/selectByIdState")
    public List<Order_> selectByIdState(Order_ order_) {
        List<Order_> order_s = admin_orderService.selectByIdState(order_);
        return order_s;
    }
    //根据状态查询待入住用户
    @RequestMapping("/selectByIdStateNew")
    public List<Order_> selectByIdStateNew(Order_ order_) {
        List<Order_> order_s = admin_orderService.selectByIdStateNew(order_);
        return order_s;
    }

    //根据状态查询待确认订单
    @RequestMapping("/selectByStateNext")
    public List<Order_> selectByStateNext(Order_ order_){
        List<Order_> order_s = admin_orderService.selectByStateNext(order_);
        return order_s;
    }

    //根据状态查询已取消订单
    @RequestMapping("/selectByStateNo")
    public List<Order_> selectByStateNo(Order_ order_){
        List<Order_> order_s = admin_orderService.selectByStateNext(order_);
        return order_s;
    }

    //根据状态查询拒绝订单
    @RequestMapping("/selectByStateNoNext")
    public List<Order_> selectByStateNoNext(Order_ order_) {
        List<Order_> order_s = admin_orderService.selectByStateNoNext(order_);
        return order_s;
    }
}
