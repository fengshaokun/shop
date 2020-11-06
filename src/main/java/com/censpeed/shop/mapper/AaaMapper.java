package com.censpeed.shop.mapper;

import com.censpeed.shop.entity.Aaa;

import java.util.List;

public interface AaaMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Aaa record);

    int insertSelective(Aaa record);

    Aaa selectByPrimaryKey(Integer id);

    List<Aaa> selectByPr(Boolean id);

    int updateByPrimaryKeySelective(Aaa record);

    int updateByPrimaryKey(Aaa record);
}