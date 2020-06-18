package com.censpeed.shop.mapper;

import com.censpeed.shop.entity.CProduct;

import java.util.List;

public interface CProductMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(CProduct record);

    int insertSelective(CProduct record);

    CProduct selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CProduct record);

    int updateByPrimaryKey(CProduct record);

    List<CProduct> selectAllCProductByStatus(Integer status);


    //根据菜单Id 查询产品
    List<CProduct> selectProductByMenuId(Integer id);
}