package com.censpeed.shop.controller;


import com.censpeed.shop.entity.CBanner;
import com.censpeed.shop.service.CBannerSetviceI;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("banner")
public class CBannerController {

    @Autowired
    private CBannerSetviceI cBannerSetviceI;
    @RequestMapping("index")
    public String index(Map map){
        List<CBanner> cBanners = cBannerSetviceI.selectAllBanner();
        map.put("list",cBanners);
        return "banner/index";
    }

    @RequestMapping("update")
    public String update(Map map,Integer id){
        CBanner cBanner = cBannerSetviceI.selectBannerById(id);
        map.put("banner",cBanner);
        return "banner/update";
    }

    @PostMapping("updateBanner")
    public String updateHomePage(Map map,CBanner cHomePage){
        cBannerSetviceI.updateBanner(cHomePage);

        return "redirect:/banner/index";
    }
}
