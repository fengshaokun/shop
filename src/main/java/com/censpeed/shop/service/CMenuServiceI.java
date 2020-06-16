package com.censpeed.shop.service;

import com.censpeed.shop.entity.CMenu;
import com.censpeed.shop.utils.ShopResult;

import java.util.List;

public interface CMenuServiceI {


    int insert(CMenu record);

    List<CMenu> selectAll();

    ShopResult selectPMenuByPid(Integer id);

    void deleteMenuById(Integer id);

    CMenu selectByPrimaryKey(Integer id);
}
