package com.censpeed.shop.controller;

import com.censpeed.shop.entity.*;
import com.censpeed.shop.service.*;
import com.censpeed.shop.utils.ShopResult;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import sun.awt.CausedFocusEvent;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RequestMapping("home")
@Controller
public class CHomeController {
    @Autowired
    private CHomePageServiceI cHomePageServiceI;
    @Autowired
    private CCaseServiceI cCaseServiceI;
    @Autowired
    private CProductServiceI cProductServiceI;
    @Autowired
    private CMenuServiceI cMenuServiceI;
    @Autowired
    private CFootTextServiceI cFootTextServiceI;

    @Value("${homeProductSize}")
    private Integer homeProductSize;
    @Value("${homeCaseSize}")
    private Integer homeCaseSize;

    @RequestMapping("index")
    public String toMain(Map map){
        List<CHomePage>lists=new ArrayList<>();
        List<CHomePage> cHomePages = cHomePageServiceI.selectAllCHomePage();
          for (int i=0;i<3;i++){
              lists.add(cHomePages.get(i));
          }
        map.put("homepages",lists);
        List list = cCaseServiceI.selectAll();
        map.put("cases",list);
        return "home/index";
    }
    @RequestMapping("list")
    public String list(Map map,@RequestParam(defaultValue = "1") Integer pageNum){
        PageInfo<CProduct> cProductPageInfo = cProductServiceI.selectAllCProductByStatus(1, pageNum,homeProductSize);
        map.put("pageInfo",cProductPageInfo);
        return "home/list";
    }


    @RequestMapping("caseShow")
    public String caseShow(Map map,@RequestParam(defaultValue = "1") Integer pageNum){
        PageInfo<CCase> cCasePageInfo = cCaseServiceI.selectAllLimit(pageNum,homeCaseSize);
        map.put("pageInfo",cCasePageInfo);
        CHomePage cHomePage = cHomePageServiceI.selectCHomePageById(5);
        map.put("cHomePage",cHomePage);
        return "home/caseShow";
    }

    @RequestMapping("menuIndex")
    @ResponseBody
    public ShopResult menuIndex(){

        Map map = new HashMap();
        List<CMenu> cMenus = cMenuServiceI.selectAllPMEnu();
        List<CMenu> result = cMenuServiceI.selectAllMenu(cMenus);
        CHomePage cHomePage = cHomePageServiceI.selectCHomePageById(4);
        map.put("menu",result);
        map.put("logo",cHomePage);
        return ShopResult.ok(map);
    }


    @RequestMapping("menuProducts")
    @ResponseBody
    public ShopResult menuProducts(Integer id){
        List<CProduct> cProducts = cProductServiceI.selectProductByMenuId(id);
        return ShopResult.ok(cProducts);
    }

    @RequestMapping("footIndex")
    @ResponseBody
    public ShopResult footIndex(){
        CFootText cFootText = cFootTextServiceI.selectCFootTextById(1);
        return ShopResult.ok(cFootText);
    }





}
