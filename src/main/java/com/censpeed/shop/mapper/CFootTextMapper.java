package com.censpeed.shop.mapper;

import com.censpeed.shop.entity.CFootText;
import com.censpeed.shop.entity.CFootTextWithBLOBs;

import java.util.List;

public interface CFootTextMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(CFootTextWithBLOBs record);

    int insertSelective(CFootTextWithBLOBs record);

    CFootTextWithBLOBs selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CFootTextWithBLOBs record);

    int updateByPrimaryKeyWithBLOBs(CFootTextWithBLOBs record);

    int updateByPrimaryKey(CFootText record);

    List<CFootTextWithBLOBs> selectAllCFootText();
}