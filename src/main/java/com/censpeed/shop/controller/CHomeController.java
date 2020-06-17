package com.censpeed.shop.controller;

import com.censpeed.shop.entity.CHomePage;
import com.censpeed.shop.entity.CProduct;
import com.censpeed.shop.service.CCaseServiceI;
import com.censpeed.shop.service.CHomePageServiceI;
import com.censpeed.shop.service.CProductServiceI;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
    @Value("${size}")
    private Integer size;

    @RequestMapping("index")
    public String toMain(Map map){
        List<CHomePage> cHomePages = cHomePageServiceI.selectAllCHomePage();
        map.put("homepages",cHomePages);
        List list = cCaseServiceI.selectAll();
        map.put("cases",list);
        return "home/index";
    }
    @RequestMapping("list")
    public String list(Map map,@RequestParam(defaultValue = "1") Integer pageNum){
        PageInfo<CProduct> cProductPageInfo = cProductServiceI.selectAllCProductByStatus(1, pageNum,size);
        map.put("pageInfo",cProductPageInfo);
        return "home/list";
    }


}
