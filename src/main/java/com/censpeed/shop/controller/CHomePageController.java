package com.censpeed.shop.controller;


import com.censpeed.shop.entity.CFootText;
import com.censpeed.shop.entity.CFootTextWithBLOBs;
import com.censpeed.shop.entity.CHomePage;
import com.censpeed.shop.service.CFootTextServiceI;
import com.censpeed.shop.service.CHomePageServiceI;
import com.censpeed.shop.service.CUserServiceI;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("homepage")
public class CHomePageController {

    @Autowired
    private CHomePageServiceI cHomePageServiceI;
    @Autowired
    private CFootTextServiceI cFootTextServiceI;


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

    @RequestMapping("foot")
    public String foot(Map map){
        List<CFootTextWithBLOBs> cFootTexts = cFootTextServiceI.selectAllCFootText();
        map.put("foots",cFootTexts);
        return "homepage/foottextindex";
    }

    @RequestMapping(value = "/toFoot" ,method = RequestMethod.GET)
    public String toFoot(Integer id,Map map){
        CFootTextWithBLOBs cFootText = cFootTextServiceI.selectCFootTextById(id);
        map.put("foot",cFootText);
        return "homepage/foottextupdate";
    }







    @RequestMapping("updateFoot")
    public String updateFoot(CFootTextWithBLOBs cFootText){
      cFootTextServiceI.updateFoot(cFootText);
        return "redirect:/homepage/foot";
    }



}
