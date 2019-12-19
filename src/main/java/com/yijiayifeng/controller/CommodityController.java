package com.yijiayifeng.controller;

import com.yijiayifeng.entity.Commodity;
import com.yijiayifeng.service.CommodityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;


import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/commodity")
public class CommodityController {
    @Autowired
    CommodityService commodityService;
    //查询所有
    @RequestMapping("/selectAllCommodity")
    @ResponseBody
    public List<Commodity> selectAllCommodity(Commodity commodity){
        List<Commodity> commodities = commodityService.selectAllCommodity(commodity);
        return commodities;
    }
    //查询分类商品
    @RequestMapping("/selectCommodity")
    public String selectCommodity(Commodity commodity){
        List<Commodity> commodities = commodityService.selectCommodity(commodity);
        return "";
    }
    //删除
    @RequestMapping("/deleteCommodity")
    public String deleteCommdity(Integer id){
        commodityService.deleteCommodity(id);
        return "redirect:/commodity.jsp";
    }
    //添加
    @RequestMapping("/insertCommodity")
    public String insertCommdity(Commodity commodity, MultipartFile file, HttpSession session) throws IOException {
        System.out.println(file);
        //获取文件名
        String fileName = file.getOriginalFilename();
        //时间格式化格式
        SimpleDateFormat simpleDateFormat =new SimpleDateFormat("yyyyMMddHHmmssSSS");
        //获取当前时间并作为时间戳
        String timeStamp = simpleDateFormat.format(new Date());
        //获取目的地的绝对路径
        String realPath = session.getServletContext().getRealPath("/images");
        //将文件拷贝到目标文件夹中
        file.transferTo(new File(realPath+"/"+timeStamp+fileName));
        //给实体类赋值  可以操作数据库
        commodity.setImg_src("images/"+timeStamp+fileName);
        commodityService.addCommodity(commodity);
        return "redirect:/commodity.jsp";


       /* System.out.println(1);
        //从作用域中获取admin的id
        //Admin admin_id =(Admin)session.getAttribute("admin");
        //修改room的id让admin的id作为外键
        *//*room.setAdmin_id(admin.getId());*//*
        //获取文件名
        String fileName = files.getOriginalFilename();
        System.out.println(2);
        //时间格式化格式
        SimpleDateFormat simpleDateFormat =new SimpleDateFormat("yyyyMMddHHmmssSSS");
        System.out.println(3);
        //获取当前时间并作为时间戳
        String timeStamp = simpleDateFormat.format(new Date());
        System.out.println(4);
        //获取目的地的绝对路径
        String realPath = session.getServletContext().getRealPath("/images");
        System.out.println(5);
        //将文件拷贝到目标文件夹中
        files.transferTo(new File(realPath+"/"+timeStamp+fileName));
        System.out.println(6);
        //给实体类赋值  可以操作数据库
        commodity.setImg_src("./images/"+timeStamp+fileName);
        commodityService.addCommodity(commodity);
        System.out.println("./images/"+timeStamp+fileName);
        System.out.println(commodity);
        return "redirect:/commodity.jsp";*/
    }
    //修改
    @RequestMapping("/updateCommodity")
    public String updateCommodity(Commodity commodity){
        commodityService.updateCommodity(commodity);
        return "";
    }
    //分页
    @ResponseBody
    @RequestMapping("/selectByPage")
    //当前页数,每页展示几条
    public Map<String, Object> selectByPage(Integer page, Integer rows){
        //查询当前页展示的数据
        List<Commodity> commodityList = commodityService.selectByPage(page , rows);
        //查询总条数
        Integer count = commodityService.selectCommodityCount();
        Map<String, Object> map = new HashMap<>();
        //当前页角号
        map.put("page",page);
        //总条数
        map.put("records",count);
        //总页数(默认值)
        Integer pageCount = 0;
        //如果数据总条数%每页展示的条数余数 = 0 时,总页数的值 = 总条数/每页展示的条数
        if (count % rows == 0) {
            pageCount = count / rows;
            //如果数据总条数%每页展示的条数余数 ！= 0 时,总页数的值 = 总条数/每页展示的条数+1
        } else {
            pageCount = count / rows + 1;
        }
        map.put("total",pageCount);
        //每页展示的具体数据
        map.put("rows",commodityList);
        return map;
    }
}
