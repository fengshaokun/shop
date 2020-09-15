package com.censpeed.shop.service;

import com.censpeed.shop.entity.CMenu;
import com.censpeed.shop.utils.ShopResult;

import java.util.List;

public interface CMenuServiceI {


    //添加菜单
    int insert(CMenu record);
    //查询全部菜单
    List<CMenu> selectAll();
    //查询菜单是否有关联
    ShopResult selectPMenuByPid(Integer id);
    //删除菜单
    void deleteMenuById(Integer id);
    //查询菜单通过Id
    CMenu selectByPrimaryKey(Integer id);
    //通过所有父级菜单 查询所有菜单
    List<CMenu> selectAllMenu(List<CMenu> list);
    //查询全部菜单
    List<CMenu> selectAllPMEnu();
    //修改菜单
    void updateMenu(CMenu cMenu);

    //通过产品ID查看关联菜单
    CMenu selectMenuByProductId(Integer id);

}
