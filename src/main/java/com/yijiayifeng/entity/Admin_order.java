package com.yijiayifeng.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Data
@AllArgsConstructor       //有参
@NoArgsConstructor        //无参
@Accessors(chain = true)  //级联查询
public class Admin_order {
    private Integer id;
    private Integer count;   //数量
    private Double sprice; //总价
    @JsonFormat(pattern = "yyyy-MM-dd",timezone = "GMT+8")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date date;    //订单时间
    private Integer admin_id;  //酒店id   一对多
    private Integer user_id;  //用户id   一对多

    private User user;  //用户对象
    private Commodity commodity; //商品对象


}
