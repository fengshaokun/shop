package com.censpeed.shop.service;

import com.censpeed.shop.entity.CMenu;

import java.util.List;

public interface CMenuServiceI {


    int insert(CMenu record);

    List<CMenu> selectAll();
}
