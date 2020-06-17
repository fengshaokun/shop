package com.censpeed.shop.mapper;


import com.censpeed.shop.entity.CUserConsult;

import java.util.List;

public interface CUserConsultMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(CUserConsult record);

    int insertSelective(CUserConsult record);

    CUserConsult selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CUserConsult record);

    int updateByPrimaryKey(CUserConsult record);

    List<CUserConsult> getAllCUserConsultLimit();
}