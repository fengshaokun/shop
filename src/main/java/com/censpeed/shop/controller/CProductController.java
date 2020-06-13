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

    //产品管理
    @RequestMapping("index")
    public String toProduct(@RequestParam(defaultValue = "1") Integer status, Map map){
        List<CProduct> cProducts = cProductServiceI.selectAllCProductByStatus(status);
        map.put("productList",cProducts);
        return "product/index";

    }

    //创建产品
    @PostMapping("uploadGood")
    public String uploadGood(CProduct cProduct,String productContent,String onTime,Integer menuId) {
        if (cProduct.getVideo().equals("")){
            cProduct.setVideo(null);
        }
        cProduct.setStatus(1);
        cProduct.setCreateTime(stringToDate(onTime));
      int Pid = cProductServiceI.insert(cProduct,productContent,menuId);
        return "redirect:/product/index";
    }


    //修改产品
    @PostMapping("updateGoods")
    public String updateGoods(CProduct cProduct,String productContent,String onTime,Integer menuId) {
        if (cProduct.getVideo().equals("")){
            cProduct.setVideo(null);
        }
        cProduct.setCreateTime(stringToDate(onTime));
      int Pid = cProductServiceI.update(cProduct,productContent,menuId);
        return "redirect:/product/index";
    }

    //修改页面回显
    @RequestMapping("update")
    public String update(Integer id,Map map) {
        CProduct cProductById = cProductServiceI.getCProductById(id);
        map.put("product",cProductById);
        return "product/update";
    }
    //删除/恢复产品
    @RequestMapping("updateStatus")
    public String updateStatus(Integer id,Integer status,Map map) {
        if (status==1){
            CProduct cProductById = cProductServiceI.getCProductById(id);
            cProductById.setStatus(2);
            cProductServiceI.updateByPrimaryKeySelective(cProductById);
            return "redirect:/product/index";
        }else {
            CProduct cProductById = cProductServiceI.getCProductById(id);
            cProductById.setStatus(1);
            cProductServiceI.updateByPrimaryKeySelective(cProductById);
            return "redirect:/product/index";
        }
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
