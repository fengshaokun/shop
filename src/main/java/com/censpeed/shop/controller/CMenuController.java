package com.censpeed.shop.controller;


import com.censpeed.shop.entity.CMenu;
import com.censpeed.shop.entity.CProduct;
import com.censpeed.shop.service.CMenuServiceI;
import com.censpeed.shop.utils.ShopResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("menu")
public class CMenuController {

@Autowired
private CMenuServiceI cMenuServiceI;

    @RequestMapping("index")
    public String index(Map map) {
        List<CMenu> cMenus = cMenuServiceI.selectAll();
        map.put("menus",cMenus);
        return "menu/index";
    }

    @RequestMapping("create")
    public String create(Map map) {
        List<CMenu> cMenus = cMenuServiceI.selectAll();
        map.put("menus",cMenus);
        return "menu/create";
    }

    @RequestMapping("update")
    public String update(Integer id,Map map) {
        CMenu cMenu = cMenuServiceI.selectByPrimaryKey(id);
        map.put("cMenu",cMenu);
        List<CMenu> cMenus = cMenuServiceI.selectAll();
        map.put("pMenu",cMenus);
        return "menu/update";
    }



    @RequestMapping("uploadGood")
    public String uploadGood(CMenu cMenu) {
        cMenuServiceI.insert(cMenu);
        return "redirect:/menu/index";
    }


    @RequestMapping("updateMenu")
    public String updateMenu(CMenu cMenu) {
        cMenuServiceI.updateMenu(cMenu);
        return "redirect:/menu/index";
    }


    @RequestMapping("delete")
    @ResponseBody
    public ShopResult delete(Integer id) {

        return cMenuServiceI.selectPMenuByPid(id);

    }

    @RequestMapping("toDelete")
    public  String toDelete(Integer id){
        cMenuServiceI.deleteMenuById(id);
        return "redirect:/menu/index";
    }






}
