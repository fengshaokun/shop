package com.censpeed.shop.controller;

import com.censpeed.shop.entity.CProduct;
import com.censpeed.shop.service.CProductServiceI;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("product")
public class CProductController {

    @Autowired
    private CProductServiceI cProductServiceI;




    @RequestMapping("productList")
    public String toProduct(@RequestParam(defaultValue = "1") Integer status, Map map){
        List<CProduct> cProducts = cProductServiceI.selectAllCProductByStatus(status);
        cProducts.get(0).getcProductDetails();
        map.put("productList",cProducts);
        return "/seller/goodsManagement";

    }

    @RequestMapping("uploadProduct")
    public String toUploadProduct(Map map){

        return "/seller/sellerUploadGoods";

    }

    @PostMapping("uploadGood")
    public String uploadGood(CProduct tbItem) {

        System.out.println(1);
        return "redirect:/seller/sellerUploadGoods";
    }


}
