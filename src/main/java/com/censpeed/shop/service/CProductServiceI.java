package com.censpeed.shop.service;

import com.censpeed.shop.entity.CProduct;
import com.censpeed.shop.entity.CProductDetails;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface CProductServiceI {

    CProduct getCProductById(Integer cProductId);

    PageInfo<CProduct> selectAllCProductByStatus(Integer status, Integer pageNum,Integer pageSize);

    //新增产品返回产品主键
    int insert(CProduct record,String productContent,Integer menuId);

    int update(CProduct record,String productContent,Integer menuId);

    int updateByPrimaryKeySelective(CProduct record);

    CProductDetails selectProductDetailsByProId(Integer id);
}
