package com.yijiayifeng.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Accessors(chain = true)
public class Admin {
    private Integer id;
    private String  name;    //酒店名称
    private String  address;  //酒店地址
    private String  account;   //账号
    private String  password;  //密码
    private Integer price_state;//状态
    public void select(){
        System.out.println("admin的行为");
    };
}
