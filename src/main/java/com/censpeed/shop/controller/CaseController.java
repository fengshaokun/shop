package com.censpeed.shop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Map;

@Controller
public class CaseController {

    @RequestMapping("toMain")
    public String toMain() {
        return "portal/jsp/main";
    }


    @RequestMapping("toMarketMenu")
    public String toMarketMenu() {
        return "portal/jsp/marketMenu";
    }

    @RequestMapping("toSellerUploadGoods")
    public String toSellerUploadGoods(Map map) {

        return "/seller/sellerUploadGoods";
    }
    @RequestMapping("sellerUploadProducts")
    public String sellerUploadProducts(Map map) {

        return "/seller/sellerUploadProducts";
    }
    @RequestMapping("productDetail")
    public String productDetail(Map map) {
        return "/portal/jsp/productDetail";
    }

    @RequestMapping("toGoodsManagement")
    public String toGoodsManagement(Map map) {
        return "/seller/goodsManagement";
    }
}
