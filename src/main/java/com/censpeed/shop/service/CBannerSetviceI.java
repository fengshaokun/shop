package com.censpeed.shop.service;

import com.censpeed.shop.entity.CBanner;

import java.util.List;

public interface CBannerSetviceI {

    //查询全部
    List<CBanner> selectAllBanner();
     //根据id查询
    CBanner selectBannerById(Integer id);
    //修改
    void updateBanner(CBanner cBanner);
}
