package com.censpeed.shop.controller;

import com.censpeed.shop.configuration.SendByEmailConfig;
import com.censpeed.shop.entity.*;
import com.censpeed.shop.service.*;
import com.censpeed.shop.utils.ShopResult;
import com.github.pagehelper.PageInfo;
import org.apache.poi.ss.formula.ptg.MemAreaPtg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import javax.annotation.Resource;
import javax.sql.DataSource;
import java.util.*;


/**
 * 产品官网首页
 */
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
    @Autowired
    private SendByEmailConfig send;
    @Autowired
    private CBannerSetviceI cBannerSetviceI;
    @Resource
    private DataSource dataSource;



    @Value("${spring.mail.username}")
    private String senderName;
    @Value("${homeProductSize}")
    private Integer homeProductSize;
    @Value("${homeCaseSize}")
    private Integer homeCaseSize;

    /**
     *  页面初始化  敬请期待页面
     * @return
     */
    @RequestMapping("date")
    @ResponseBody
    public String date (){
        System.out.println(this.dataSource.getClass());
        return  "ok";
    }


    /**
     *  页面初始化  敬请期待页面
     * @return
     */
    @RequestMapping("i")
    public String i (){
        return  "index";
    }

    /**
     * 首页内容
     * @param map
     * @return
     */
    @RequestMapping("index")
    public String toMain(Map map){
        List<CHomePage>lists=new ArrayList<>();
        List<CHomePage> cHomePages = cHomePageServiceI.selectAllCHomePage();
          for (int i=0;i<3;i++){
              lists.add(cHomePages.get(i));
          }
        map.put("homepages",lists);
        PageInfo<CCase> cCasePageInfo = cCaseServiceI.selectAllLimit(1, 8);
        map.put("cases",cCasePageInfo.getList());
        List<CBanner> cBanners = cBannerSetviceI.selectAllBanner();
        for (int i=0;i<cBanners.size();i++){
            map.put("banner"+i,cBanners.get(i));
        }
        return "home/index";
    }

    /**
     * 产品列表通过菜单分类
     * @param map
     * @return
     */
    @RequestMapping("list")
public String list(Map map){
    Map map1 = cProductServiceI.selectProductsList();
    map.put("map",map1);
    return "home/list";
}

    @ResponseBody
    @RequestMapping("listBody")
    public Map listBody(){
        Map map1 = cProductServiceI.selectProductsList();
        return map1;
    }

    /**
     *模糊查询产品 带分页
     * @param name
     * @param map
     * @param pageNum
     * @return
     */
    @RequestMapping("lists")
    public String getList(String name,Map map,@RequestParam(defaultValue = "1") Integer pageNum){
        if (name==null){name="";}
    PageInfo<CProduct> cProductPageInfo = cProductServiceI.selectProductLike(name,1, pageNum,homeProductSize);
    map.put("pageInfo",cProductPageInfo);
    map.put("searchParam",name);
        return "home/list2";
    }


    /**
     * 案例列表页
     * @param map
     * @param pageNum
     * @return
     */
    @RequestMapping("caseShow")
    public String caseShow(Map map,@RequestParam(defaultValue = "1") Integer pageNum){
        PageInfo<CCase> cCasePageInfo = cCaseServiceI.selectAllLimit(pageNum,homeCaseSize);
        map.put("pageInfo",cCasePageInfo);
        CHomePage cHomePage = cHomePageServiceI.selectCHomePageById(5);
        map.put("cHomePage",cHomePage);
        return "home/caseShow";
    }


    /**
     * 菜单接口
     * @return
     */
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


    /**
     * 通过菜单查询产品 首页头部
     * @param id
     * @return
     */
    @RequestMapping("menuProducts")
    @ResponseBody
    public ShopResult menuProducts(Integer id){
        List<CProduct> cProducts = cProductServiceI.selectProductByMenuIdFive(id);
        return ShopResult.ok(cProducts);
    }

    /**
     * 查询为空的时候
     * @param map
     * @param name
     * @return
     */
    @RequestMapping("kong")
    public String kong(Map map,String name){
        if (name==null){name="";}
         map.put("name",name);
        return "/home/kong";
    }

    /**
     * 首页底部
     * @return
     */
    @RequestMapping("footIndex")
    @ResponseBody
    public ShopResult footIndex(){
        CFootText cFootText = cFootTextServiceI.selectCFootTextById(1);
        return ShopResult.ok(cFootText);
    }


    /**
     * 添加咨询人
     * @param cUserConsult
     * @return
     */
   @RequestMapping("addUserConsult")
    @ResponseBody
    public ShopResult addUserConsult(CUserConsult cUserConsult){
       cUserConsult.setCreateTime(new Date());
       ShopResult shopResult = cUserConsultServiceI.addUserConsult(cUserConsult);
       String  content = "姓名：" + cUserConsult.getName()
              + ", 手机号：" + cUserConsult.getTel()
              + ", 邮箱：" + cUserConsult.getEmail()
              + ", 公司：" + cUserConsult.getCompany()
              + ", 留言内容：" + cUserConsult.getContent() ;
       String title = "姓名为："+cUserConsult.getName()+"网友提交了留言";
       Integer result = send.send(senderName, "", title, content);
       return shopResult;
   }


    /**
     * 产品详情
     * @param id
     * @param map
     * @return
     */
   @RequestMapping("productDetails")
    public  String productDetails(Integer id,Map map){
       CProduct cProductDetails = cProductServiceI.getCProductById(id);
       map.put("details",cProductDetails);
      return "home/productDetail";
   }

    /**
     * 案例详情
     * @param id
     * @param map
     * @return
     */
    @RequestMapping("caseDetails")
    public  String caseDetails(Integer id,Map map){
        CItemDetails cItemDetails = cCaseServiceI.selectCaseDetailsByCaId(id);
        map.put("details",cItemDetails);
        return "home/caseDetail";
    }

    /**
     * 微信公众号二维码
     * @return
     */
    @RequestMapping("weChatCord")
    @ResponseBody
    public ShopResult weChatCord(){
        CHomePage cHomePage = cHomePageServiceI.selectCHomePageById(6);
        return ShopResult.ok(cHomePage);
    }


    /**
     * 搜索
     * @param name
     * @param map
     * @param pageNum
     * @return
     */
         @RequestMapping("searchParam")
         @ResponseBody
    public ShopResult searchParam(String name,Map map,@RequestParam(defaultValue = "1") Integer pageNum){
             PageInfo<CProduct> cProductPageInfo = cProductServiceI.selectProductLike(name,1, pageNum,homeProductSize);
             if (cProductPageInfo.getList().size()==0){
                 return  ShopResult.build(500,"查询为空");
             }
             return ShopResult.ok();
    }


}
