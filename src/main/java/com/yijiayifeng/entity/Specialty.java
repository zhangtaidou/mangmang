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
public class Specialty {
    private Integer id;    //主键
    private String name;   //商品名称
    private Double price;  //单价
    private Integer sales; //销量
    private Integer stock;   //库存
    @JsonFormat(pattern = "yyyy-MM-dd",timezone = "GMT+8")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date date; //时间
    private Integer admin_id;//酒店id
    private String kind; //商品分类
}
