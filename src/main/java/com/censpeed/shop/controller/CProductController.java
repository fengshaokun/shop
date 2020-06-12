package com.censpeed.shop.controller;

import com.censpeed.shop.entity.CProduct;
import com.censpeed.shop.service.CProductServiceI;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("product")
public class CProductController {

    @Autowired
    private CProductServiceI cProductServiceI;

    @RequestMapping("create")
    public String createProduct() {
        return "product/create";
    }

    @RequestMapping("productList")
    public String toProduct(@RequestParam(defaultValue = "1") Integer status, Map map){
        List<CProduct> cProducts = cProductServiceI.selectAllCProductByStatus(status);
        cProducts.get(0).getcProductDetails();
        map.put("productList",cProducts);
        return "product/index";

    }
    @RequestMapping("uploadGood")
    public String uploadGood(CProduct cProduct) {
        cProductServiceI.insert(cProduct);
        return "redirect:/product/index";
    }



}
