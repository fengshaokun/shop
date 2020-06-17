package com.censpeed.shop.controller;


import com.censpeed.shop.entity.CHomePage;
import com.censpeed.shop.service.CHomePageServiceI;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("homepage")
public class CHomePageController {

    @Autowired
    private CHomePageServiceI cHomePageServiceI;

    @RequestMapping("index")
    public String index(Map map){
        List<CHomePage> cHomePages = cHomePageServiceI.selectAllCHomePage();
        map.put("list",cHomePages);
        return "homepage/index";
    }

    @RequestMapping("update")
    public String update(Map map,Integer id){
        CHomePage cHomePage = cHomePageServiceI.selectCHomePageById(id);
        map.put("homepage",cHomePage);
        return "homepage/update";
    }

    @PostMapping("updateHomePage")
    public String updateHomePage(Map map,CHomePage cHomePage){
        cHomePageServiceI.updateCHomePage(cHomePage);
        map.put("homepage",cHomePage);
        return "redirect:/homepage/index";
    }

}
