package com.censpeed.shop.service.impl;

import com.censpeed.shop.entity.CMenu;
import com.censpeed.shop.mapper.CMenuMapper;
import com.censpeed.shop.service.CMenuServiceI;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CMenuServiceImpl implements CMenuServiceI {

    @Autowired
    private CMenuMapper cMenuMapper;

    @Override
    public int insert(CMenu record) {
        return cMenuMapper.insert(record);
    }

    @Override
    public List<CMenu> selectAll() {
        return cMenuMapper.selectAll();
    }
}
