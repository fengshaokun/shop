package com.censpeed.shop.mapper;

import com.censpeed.shop.entity.CUserSonsult;

public interface CUserSonsultMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(CUserSonsult record);

    int insertSelective(CUserSonsult record);

    CUserSonsult selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CUserSonsult record);

    int updateByPrimaryKey(CUserSonsult record);
}