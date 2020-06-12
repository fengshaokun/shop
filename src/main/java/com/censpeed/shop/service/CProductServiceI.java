package com.censpeed.shop.service;

import com.censpeed.shop.entity.CProduct;

import java.util.List;

public interface CProductServiceI {

    CProduct getCProductById(Integer cProductId);

    List<CProduct> selectAllCProductByStatus(Integer status);

    int insert(CProduct record);
}
