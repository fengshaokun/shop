package com.censpeed.shop.controller;


import com.censpeed.shop.entity.CMenu;
import com.censpeed.shop.entity.CProduct;
import com.censpeed.shop.service.CMenuServiceI;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
    public String update() {
        return "menu/update";
    }

    @RequestMapping("uploadGood")
    public String uploadGood(CMenu cMenu) {
        cMenuServiceI.insert(cMenu);
        return "redirect:/menu/index";
    }





}
