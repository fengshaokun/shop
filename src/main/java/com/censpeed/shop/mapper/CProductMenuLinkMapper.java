package com.censpeed.shop.mapper;

import com.censpeed.shop.entity.CProductMenuLink;

import java.util.List;

public interface CProductMenuLinkMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(CProductMenuLink record);

    int insertSelective(CProductMenuLink record);

    CProductMenuLink selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CProductMenuLink record);

    int updateByPrimaryKey(CProductMenuLink record);

    List<CProductMenuLink> selectLinkByMenuId(Integer id);


    int deleteByProductKey(Integer id);
}