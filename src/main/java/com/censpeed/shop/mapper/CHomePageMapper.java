package com.censpeed.shop.mapper;

import com.censpeed.shop.entity.CHomePage;

import java.util.List;

public interface CHomePageMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(CHomePage record);

    int insertSelective(CHomePage record);

    CHomePage selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CHomePage record);

    int updateByPrimaryKey(CHomePage record);

    List<CHomePage> selectAllHomePage();
}