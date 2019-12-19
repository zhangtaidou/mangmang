package com.yijiayifeng.service;

import com.yijiayifeng.entity.Specialty;
import com.yijiayifeng.mapper.SpecialtyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service
@Transactional
public class SpecialtyServiceImpl implements SpecialtyService {
    @Autowired
    SpecialtyMapper specialtyMapper;

    //查询所有土特产商品
    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Specialty> selectAllSpecialty(Specialty specialty) {
        List<Specialty> specialties = specialtyMapper.selectAllSpecialty(specialty);
        return specialties;
    }
    //查询土特产分类商品
    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Specialty> selectSpecialty(Specialty specialty) {
        List<Specialty> specialties = specialtyMapper.selectSpecialty(specialty);
        return specialties;
    }
    //删除土特产商品
    @Override
    public void deleteSpecialty(Integer id) {
        specialtyMapper.deleteSpecialty(id);
    }
    //添加土特产商品
    @Override
    public void addSpecialty(Specialty specialty) {
        specialtyMapper.addSpecialty(specialty);
    }
    //修改土特产商品信息
    @Override
    public void updateSpecialty(Specialty specialty) {
        specialtyMapper.updateSpecialty(specialty);
    }
}
