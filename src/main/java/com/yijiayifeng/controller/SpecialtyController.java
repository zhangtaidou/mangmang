package com.yijiayifeng.controller;

import com.yijiayifeng.entity.Specialty;
import com.yijiayifeng.service.SpecialtyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/SpecialtyMapper")
public class SpecialtyController {

    @Autowired
    SpecialtyService specialtyService;
    //查询所有
    @RequestMapping("/selectAllSpecialty")
        public String selectAllSpecialty(Specialty specialty){
        List<Specialty> specialties = specialtyService.selectAllSpecialty(specialty);
        return "good.jsp";
    }
    //查询分类商品
    @RequestMapping("/selectSpecialty")
    public String selectSpecialty(Specialty specialty){
        List<Specialty> specialties = specialtyService.selectSpecialty(specialty);
        return "";
    }
    //删除
    @RequestMapping("/deleteSpecialty")
    public String deleteSpecialty(Integer id){
        specialtyService.deleteSpecialty(id);
        return "";
    }
    //添加
    @RequestMapping("/insertSpecialty")
    public String insertCommdity(Specialty specialty){
        System.out.println(specialty);
        specialtyService.addSpecialty(specialty);
        return "goods";
    }
    //修改
    @RequestMapping("/updateSpecialty")
    public String updateSpecialty(Specialty specialty){
        specialtyService.updateSpecialty(specialty);
        return "";
    }
}
