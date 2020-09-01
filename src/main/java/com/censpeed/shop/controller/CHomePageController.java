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


    /**
     * 主页图列表
     * @param map
     * @return
     */
    @RequestMapping("index")
    public String index(Map map){
        List<CHomePage> cHomePages = cHomePageServiceI.selectAllCHomePage();
        map.put("list",cHomePages);
        return "homepage/index";
    }

    /**
     * 修改页面详情
     * @param map
     * @param id
     * @return
     */
    @RequestMapping("update")
    public String update(Map map,Integer id){
        CHomePage cHomePage = cHomePageServiceI.selectCHomePageById(id);
        map.put("homepage",cHomePage);
        return "homepage/update";
    }

    /**
     * 确认修改
     * @param map
     * @param cHomePage
     * @return
     */
    @PostMapping("updateHomePage")
    public String updateHomePage(Map map,CHomePage cHomePage){
        cHomePageServiceI.updateCHomePage(cHomePage);
        map.put("homepage",cHomePage);
        return "redirect:/homepage/index";
    }

    /**
     * 底部管理
     * @param map
     * @return
     */
    @RequestMapping("foot")
    public String foot(Map map){
        List<CFootTextWithBLOBs> cFootTexts = cFootTextServiceI.selectAllCFootText();
        map.put("foots",cFootTexts);
        return "homepage/foottextindex";
    }

    /**
     * 底部修改详情
     * @param id
     * @param map
     * @return
     */
    @RequestMapping(value = "/toFoot" ,method = RequestMethod.GET)
    public String toFoot(Integer id,Map map){
        CFootTextWithBLOBs cFootText = cFootTextServiceI.selectCFootTextById(id);
        map.put("foot",cFootText);
        return "homepage/foottextupdate";
    }


    /**
     * 确认修改
     * @param cFootText
     * @return
     */
    @RequestMapping("updateFoot")
    public String updateFoot(CFootTextWithBLOBs cFootText){
      cFootTextServiceI.updateFoot(cFootText);
        return "redirect:/homepage/foot";
    }



}
