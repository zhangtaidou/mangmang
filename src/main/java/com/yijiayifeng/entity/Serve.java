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
public class Serve {
    private Integer id;
    private String option;   //选项
    private String number;  //房号
    private String remarks; //备注
    private String state;   //状态   2（已处理） 和 0

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date  date;
    private Integer user_id;//客户id
    private Integer admin_id;//酒店id
}
