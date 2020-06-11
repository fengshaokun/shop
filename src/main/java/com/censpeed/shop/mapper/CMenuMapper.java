package com.censpeed.shop.mapper;

import com.censpeed.shop.entity.CMenu;

public interface CMenuMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(CMenu record);

    int insertSelective(CMenu record);

    CMenu selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CMenu record);

    int updateByPrimaryKey(CMenu record);
}