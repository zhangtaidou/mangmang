package com.yijiayifeng.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

@Data
@AllArgsConstructor       //有参
@NoArgsConstructor        //无参
@Accessors(chain = true)  //级联查询
public class Total {
    private Integer id;
    private Double total=0.0;//总计
}
