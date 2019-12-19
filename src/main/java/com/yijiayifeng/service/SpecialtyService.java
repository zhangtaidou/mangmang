package com.yijiayifeng.service;

import com.yijiayifeng.entity.Specialty;

import java.util.List;

public interface SpecialtyService {
    //查询所有
    public List<Specialty> selectAllSpecialty(Specialty specialty);
    //查询分类商品
    public List<Specialty> selectSpecialty(Specialty specialty);
    //删除
    public void  deleteSpecialty(Integer id);
    //添加
    public void  addSpecialty(Specialty specialty);
    //修改
    public void  updateSpecialty(Specialty specialty);
}
