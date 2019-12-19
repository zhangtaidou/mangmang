package com.yijiayifeng.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Accessors(chain = true)
public class Account {
    private Integer id;
    private String  name;
    private String  username;
    private String  number;
    private String  numbercopy;
    private String  ctitys;
    private String  ctityss;
    private Integer admin_id;

}
