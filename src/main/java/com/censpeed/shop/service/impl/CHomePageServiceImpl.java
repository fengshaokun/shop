package com.censpeed.shop.service.impl;

import com.censpeed.shop.entity.CHomePage;
import com.censpeed.shop.mapper.CHomePageMapper;
import com.censpeed.shop.service.CHomePageServiceI;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CHomePageServiceImpl implements CHomePageServiceI {

    @Autowired
    private CHomePageMapper cHomePageMapper;

    @Override
    public List<CHomePage> selectAllCHomePage() {
        return cHomePageMapper.selectAllHomePage();
    }

    @Override
    public CHomePage selectCHomePageById(Integer id) {
        return cHomePageMapper.selectByPrimaryKey(id);
    }

    @Override
    public void updateCHomePage(CHomePage cHomePage) {
        cHomePageMapper.updateByPrimaryKeySelective(cHomePage);
    }
}
