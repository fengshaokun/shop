package com.censpeed.shop.service;

import com.censpeed.shop.entity.CHomePage;

import java.util.List;

public interface CHomePageServiceI {


    List<CHomePage> selectAllCHomePage();

    CHomePage selectCHomePageById(Integer id);

    void  updateCHomePage(CHomePage cHomePage);
}
