package com.censpeed.shop.controller;

import com.censpeed.shop.entity.CCase;
import com.censpeed.shop.entity.CHomePage;
import com.censpeed.shop.entity.CMenu;
import com.censpeed.shop.entity.CProduct;
import com.censpeed.shop.service.CCaseServiceI;
import com.censpeed.shop.service.CHomePageServiceI;
import com.censpeed.shop.service.CMenuServiceI;
import com.censpeed.shop.service.CProductServiceI;
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
    public List<CMenu> menuIndex(Map map){

        List<CMenu> cMenus = cMenuServiceI.selectAllPMEnu();
        List<CMenu>result = new ArrayList<>();
        List<CMenu> cMenus1 = cMenuServiceI.selectAllMenu(cMenus, result);
        return cMenus1;
    }


    @RequestMapping("menuProducts")
    @ResponseBody
    public ShopResult menuProducts(Integer id){
        List<CProduct> cProducts = cProductServiceI.selectProductByMenuId(id);
        return ShopResult.ok(cProducts);
    }






}
