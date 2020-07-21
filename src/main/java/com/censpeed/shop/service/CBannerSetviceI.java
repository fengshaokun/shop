package com.censpeed.shop.service;

import com.censpeed.shop.entity.CBanner;

import java.util.List;

public interface CBannerSetviceI {

    List<CBanner> selectAllBanner();

    CBanner selectBannerById(Integer id);

    void updateBanner(CBanner cBanner);
}
