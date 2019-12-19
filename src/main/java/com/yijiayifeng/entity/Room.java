package com.yijiayifeng.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Accessors(chain = true)
public class Room {
    private Integer id;
    private String  name;  //酒店房型
    private String  img;   //酒店房间图片
    private Double  price; //房价价格
    private String  comment; //评论
    private String  grade; //评分
    private String  introduce;  //酒店介绍
    private Integer admin_id;  //酒店id   这是外键  一对多
    private Integer count;    //房间库存
    private String state;    //房态state
}
