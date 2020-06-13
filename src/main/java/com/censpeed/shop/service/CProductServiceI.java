package com.censpeed.shop.service;

import com.censpeed.shop.entity.CProduct;

import java.util.List;

public interface CProductServiceI {

    CProduct getCProductById(Integer cProductId);

    List<CProduct> selectAllCProductByStatus(Integer status);

    //新增产品返回产品主键
    int insert(CProduct record,String productContent,Integer menuId);

    int update(CProduct record,String productContent,Integer menuId);

    int updateByPrimaryKeySelective(CProduct record);
}
