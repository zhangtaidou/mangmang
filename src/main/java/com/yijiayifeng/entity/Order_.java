package com.yijiayifeng.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Accessors(chain = true)
public class Order_ {
    private Integer id;
    private String admin_name; //酒店名字
    private String user_name; //客户名字
    private Double price;  //价格
    private String room;   //房间房型
    private Integer day;   //入住天数
    private Integer count; //房间数量

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date date;    //订单时间
    private Integer admin_id;  //酒店id
    private String  user_id;   //用户id  身份证
    private String  phone;   //用户id  手机号
    private String  state; //入住状态是否入住
    private Date  datea;   //起始时间
    private Date  dateb;  //结束时间
    private String  price_state; //订单结算状态
    private String nuber; //工号
}
