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


import java.util.*;

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
    @Autowired
    private CUserConsultServiceI cUserConsultServiceI;

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
/*
    @RequestMapping("list")
    public String list(Map map,@RequestParam(defaultValue = "1") Integer pageNum){
        PageInfo<CProduct> cProductPageInfo = cProductServiceI.selectAllCProductByStatus(1, pageNum,homeProductSize);
        map.put("pageInfo",cProductPageInfo);
        return "home/list";
    }
*/
@RequestMapping("list")
public String list(String name,Map map,@RequestParam(defaultValue = "1") Integer pageNum){
    if (name==null){name="";}
    PageInfo<CProduct> cProductPageInfo = cProductServiceI.selectProductLike(name,1, pageNum,homeProductSize);
    //PageInfo<CProduct> cProductPageInfo = cProductServiceI.selectAllCProductByStatus(1, pageNum,homeProductSize);
    map.put("pageInfo",cProductPageInfo);
    map.put("searchParam",name);
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



   @RequestMapping("addUserConsult")
    @ResponseBody
    public ShopResult addUserConsult(CUserConsult cUserConsult){
       cUserConsult.setCreateTime(new Date());
       ShopResult shopResult = cUserConsultServiceI.addUserConsult(cUserConsult);
       return shopResult;
   }


   @RequestMapping("productDetails")
    public  String productDetails(Integer id,Map map){
       CProductDetails cProductDetails = cProductServiceI.selectProductDetailsByProId(id);
       map.put("details",cProductDetails);
      return "home/productDetail";
   }
    @RequestMapping("caseDetails")
    public  String caseDetails(Integer id,Map map){
        CItemDetails cItemDetails = cCaseServiceI.selectCaseDetailsByCaId(id);
        map.put("details",cItemDetails);
        return "home/caseDetail";
    }

    @RequestMapping("weChatCord")
    @ResponseBody
    public ShopResult weChatCord(){
        CHomePage cHomePage = cHomePageServiceI.selectCHomePageById(6);
        return ShopResult.ok(cHomePage);
    }
/*
    @RequestMapping("getProductByLike")
    public String getProductByLike(String name,Map map,@RequestParam(defaultValue = "1") Integer pageNum){
        PageInfo<CProduct> cProductPageInfo = cProductServiceI.selectProductLike(name,1, pageNum,homeProductSize);
        map.put("pageInfo",cProductPageInfo);
        return "home/list";
    }*/

}
