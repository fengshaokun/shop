package com.censpeed.shop.mapper;

import com.censpeed.shop.entity.CProductDetails;

public interface CProductDetailsMapper {
    int deleteByPrimaryKey(Integer cProductId);

    int insert(CProductDetails record);

    int insertSelective(CProductDetails record);

    CProductDetails selectByPrimaryKey(Integer cProductId);

    int updateByPrimaryKeySelective(CProductDetails record);

    int updateByPrimaryKey(CProductDetails record);
}