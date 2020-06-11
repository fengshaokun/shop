package com.censpeed.shop.mapper;

import com.censpeed.shop.entity.CItemDetails;

public interface CItemDetailsMapper {
    int deleteByPrimaryKey(Integer cCaseId);

    int insert(CItemDetails record);

    int insertSelective(CItemDetails record);

    CItemDetails selectByPrimaryKey(Integer cCaseId);

    int updateByPrimaryKeySelective(CItemDetails record);

    int updateByPrimaryKey(CItemDetails record);
}