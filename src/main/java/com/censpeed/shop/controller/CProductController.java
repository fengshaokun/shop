package com.censpeed.shop.controller;

import com.censpeed.shop.entity.CMenu;
import com.censpeed.shop.entity.CProduct;
import com.censpeed.shop.service.CMenuServiceI;
import com.censpeed.shop.service.CProductServiceI;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("product")
public class CProductController {

    @Autowired
    private CProductServiceI cProductServiceI;

    @Autowired
    private CMenuServiceI cMenuServiceI;
    @RequestMapping("create")
    public String createProduct(Map map) {
        List<CMenu> cMenus = cMenuServiceI.selectAll();
        map.put("menus",cMenus);
        return "product/create";
    }

    @RequestMapping("index")
    public String toProduct(@RequestParam(defaultValue = "1") Integer status, Map map){
        List<CProduct> cProducts = cProductServiceI.selectAllCProductByStatus(status);
        cProducts.get(0).getcProductDetails();
        map.put("productList",cProducts);
        return "product/index";

    }
    @PostMapping("uploadGood")
    public String uploadGood(CProduct cProduct,String productContent,String onTime,Integer menuId) {
        cProduct.setStatus(1);
        cProduct.setCreateTime(stringToDate(onTime));
      int Pid = cProductServiceI.insert(cProduct,productContent,menuId);
        return "redirect:/product/index";
    }



    public  static Date stringToDate(String str) {
        try {
            return new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(str);
        } catch (ParseException e) {
            e.printStackTrace();
            return null;
        }

    }


}
