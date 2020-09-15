package com.censpeed.shop.service;

import com.censpeed.shop.entity.CHomePage;

import java.util.List;

public interface CHomePageServiceI {

     //查询全部主页图
    List<CHomePage> selectAllCHomePage();
     //根据Id查询主页图
    CHomePage selectCHomePageById(Integer id);
     //修改
    void  updateCHomePage(CHomePage cHomePage);
}
