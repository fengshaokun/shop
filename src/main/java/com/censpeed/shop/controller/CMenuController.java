package com.censpeed.shop.controller;


import com.censpeed.shop.entity.CMenu;
import com.censpeed.shop.service.CMenuServiceI;
import com.censpeed.shop.utils.ShopResult;
import org.apache.poi.ss.formula.functions.T;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("menu")
public class CMenuController {

@Autowired
private CMenuServiceI cMenuServiceI;

    /**
     * 菜单列表管理
     * @param map
     * @return
     */
    @RequestMapping("index")
    public String index(Map map) {
        List<CMenu> cMenus = cMenuServiceI.selectAll();
        map.put("menus",cMenus);
        return "menu/index";
    }


    /**
     * 创建菜单绑定父级菜单的下拉框
     * @param map
     * @return
     */
    @RequestMapping("create")
    public String create(Map map) {
        List<CMenu> cMenus = cMenuServiceI.selectAll();
        map.put("menus",cMenus);
        return "/menu/create";
    }

    /**
     * 修改菜单
     * @param id
     * @param map
     * @return
     */
    @RequestMapping("update")
    public String update(Integer id,Map map) {
        CMenu cMenu = cMenuServiceI.selectByPrimaryKey(id);
        map.put("cMenu",cMenu);
        List<CMenu> cMenus = cMenuServiceI.selectAll();
        map.put("pMenu",cMenus);
        return "menu/update";
    }


    /**
     * 创建提交
     * @param cMenu
     * @return
     */
    @RequestMapping("uploadGood")
    public String uploadGood(CMenu cMenu) {
        cMenuServiceI.insert(cMenu);
        return "redirect:/menu/index";
    }


    /**
     * 修改提交
     * @param cMenu
     * @return
     */
    @RequestMapping("updateMenu")
    public String updateMenu(CMenu cMenu) {
        cMenuServiceI.updateMenu(cMenu);
        return "redirect:/menu/index";
    }


    /**
     * 判断菜单是否有关联
     * @param id
     * @return
     */
    @RequestMapping("delete")
    @ResponseBody
    public ShopResult delete(Integer id) {

        return cMenuServiceI.selectPMenuByPid(id);

    }

    /**
     * 删除菜单
     * @param id
     * @return
     */
    @RequestMapping("toDelete")
    public  String toDelete(Integer id){
        cMenuServiceI.deleteMenuById(id);
        return "redirect:/menu/index";
    }

    /**
     * 菜单列表带排序
     * @return
     */
    @RequestMapping(value = "/menuIndex" ,method = RequestMethod.POST)
    @ResponseBody
    public  ShopResult menuIndex(){
        List<CMenu> cMenus = cMenuServiceI.selectAll();

        return ShopResult.ok(cMenus);
    }





}
