package com.censpeed.shop.service.impl;

import com.censpeed.shop.entity.CMenu;
import com.censpeed.shop.entity.CProductMenuLink;
import com.censpeed.shop.mapper.CMenuMapper;
import com.censpeed.shop.mapper.CProductMenuLinkMapper;
import com.censpeed.shop.service.CMenuServiceI;
import com.censpeed.shop.utils.ShopResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class CMenuServiceImpl implements CMenuServiceI {

    @Autowired
    private CMenuMapper cMenuMapper;
    @Autowired
    private CProductMenuLinkMapper cProductMenuLinkMapper;

    @Override
    public int insert(CMenu record) {
        return cMenuMapper.insert(record);
    }

    @Override
    public List<CMenu> selectAll() {
        return cMenuMapper.selectAll();
    }

    @Override
    public ShopResult selectPMenuByPid(Integer id) {
        List<CMenu> cMenu = cMenuMapper.selectPMenuByPid(id);
        List<CProductMenuLink> cProductMenuLinks = cProductMenuLinkMapper.selectLinkByMenuId(id);
        if (cMenu.size()==0&&cProductMenuLinks.size()==0){
          return  ShopResult.ok();
        }
        else {
            return  ShopResult.build(400,"此菜单有关联,无法删除");
        }
    }

    @Override
    public void deleteMenuById(Integer id) {
        cMenuMapper.deleteByPrimaryKey(id);
    }

    @Override
    public CMenu selectByPrimaryKey(Integer id) {
        return cMenuMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<CMenu> selectAllMenu(List<CMenu> cMenus,List<CMenu>result) {

        for (CMenu cMenu:cMenus){
            List<CMenu> cMenus1 = cMenuMapper.selectPMenuByPid(cMenu.getId());
            if (cMenus1!=null&&cMenus1.size()!=0){
                cMenu.setChildMenu(cMenus1);
                result.add(cMenu);
                selectAllMenu(cMenus1,result);
            }
        }
        return result;
    }

    @Override
    public List<CMenu> selectAllPMEnu() {
        return cMenuMapper.selectPMenuByPid(0);
    }

    @Override
    public void updateMenu(CMenu cMenu) {
        cMenuMapper.updateByPrimaryKeySelective(cMenu);
    }


}
