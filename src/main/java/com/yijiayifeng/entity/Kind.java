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
//种类价格表
public class Kind {
    private Integer id;
    private Double  price;   //价格
    private Double  pricea;//价格区间
    private Double  priceb;//价格区间
    private String  kind;   //种类

    @JsonFormat(pattern = "yyyy-MM-dd",timezone = "GMT+8")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date    date;   //时间
    private String  room_name;//房型名称  对应房型
    private Integer count;//早餐数量
    private String  status; //开关房状态
    private Integer admin_id;//酒店id
}
