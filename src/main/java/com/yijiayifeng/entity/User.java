package com.yijiayifeng.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

@Data
@AllArgsConstructor       //有参
@NoArgsConstructor        //无参
@Accessors(chain = true)  //级联查询
public class User {
    private Integer id;
    private String  name;  //用户姓名
    private String  phone;  //用户手机号
    private String  identification;  //身份证
    private String  account;   //账号
    private String  password;  //密码
}
