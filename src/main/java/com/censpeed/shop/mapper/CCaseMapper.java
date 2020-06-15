package com.censpeed.shop.mapper;

import com.censpeed.shop.entity.CCase;

import java.util.List;

public interface CCaseMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(CCase record);

    int insertSelective(CCase record);

    CCase selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CCase record);

    int updateByPrimaryKey(CCase record);

    List<CCase> selectAll();
}