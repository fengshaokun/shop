package com.censpeed.shop.service.impl;


import com.censpeed.shop.entity.CUserConsult;
import com.censpeed.shop.mapper.CUserConsultMapper;
import com.censpeed.shop.service.CUserConsultServiceI;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class CUserConsultServiceImpl implements CUserConsultServiceI {

    @Value("${userConsultPageSize}")
    private Integer userConsultPageSize;
    @Autowired
    private CUserConsultMapper cUserConsultMapper;
    @Override
    public PageInfo<CUserConsult> getAllUserConsult(Integer pageNum) {
        PageHelper.startPage(pageNum, userConsultPageSize);
        List<CUserConsult> cUserConsults = cUserConsultMapper.getAllCUserConsultLimit();
        PageInfo<CUserConsult> pageInfo = new PageInfo<CUserConsult>(cUserConsults);
        return pageInfo;
    }

    @Override
    public List<CUserConsult> getAll() {
        return cUserConsultMapper.getAllCUserConsultLimit();
    }
}
