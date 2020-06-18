package com.censpeed.shop.mapper;

import com.censpeed.shop.entity.CFootText;

public interface CFootTextMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(CFootText record);

    int insertSelective(CFootText record);

    CFootText selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CFootText record);

    int updateByPrimaryKeyWithBLOBs(CFootText record);

    int updateByPrimaryKey(CFootText record);
}