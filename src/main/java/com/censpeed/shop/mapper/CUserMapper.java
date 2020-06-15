package com.censpeed.shop.mapper;

import com.censpeed.shop.entity.CUser;

public interface CUserMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(CUser record);

    int insertSelective(CUser record);

    CUser selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CUser record);

    int updateByPrimaryKey(CUser record);

    CUser selectByNameAndPass(CUser record);
}