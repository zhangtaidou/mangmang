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
public class DateTime {
    private Integer id;
    @JsonFormat(pattern = "yyyy/MM/dd",timezone = "GMT+8")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date date;
    private String kind;
    private String status;
    private String room_name;
    private Double price;
    private Integer admin_id;
    private Date datea;
    private Date dateb;
}
