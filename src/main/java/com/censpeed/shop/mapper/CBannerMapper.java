package com.censpeed.shop.mapper;

import com.censpeed.shop.entity.CBanner;

import java.util.List;

public interface CBannerMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(CBanner record);

    int insertSelective(CBanner record);

    CBanner selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CBanner record);

    int updateByPrimaryKey(CBanner record);

    List<CBanner> selectAllBanner();
}