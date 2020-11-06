package com.censpeed.shop.controller;


import com.censpeed.shop.entity.CBanner;
import com.censpeed.shop.service.CBannerSetviceI;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import javax.servlet.http.HttpServletRequest;

import java.util.List;
import java.util.Map;


/**
 * banner图页面
 */
@Controller
@RequestMapping("banner")
public class CBannerController {

    @Autowired
    private CBannerSetviceI cBannerSetviceI;

    /**
     * 查询banner图 带到banner/index 页面
     * @param map
     * @return
     */
    @RequestMapping("index")
    public String index(Map map){
        List<CBanner> cBanners = cBannerSetviceI.selectAllBanner();
        map.put("list",cBanners);
        return "banner/index";
    }

    /**
     * 修改Banner 详情
     * @param map
     * @param id
     * @return
     */
    @RequestMapping("update")
    public String update(Map map,Integer id){
        CBanner cBanner = cBannerSetviceI.selectBannerById(id);
        map.put("banner",cBanner);
        return "banner/update";
    }

    /**
     * 确认修改
     * @param map
     * @param cHomePage
     * @return
     */
    @PostMapping("updateBanner")
    public String updateHomePage(Map map,CBanner cHomePage){
        cBannerSetviceI.updateBanner(cHomePage);

        return "redirect:/banner/index";
    }

    @PostMapping("multipartFile")
    public void test(HttpServletRequest httpServletRequest, MultipartFile multipartFile){
        System.out.println(multipartFile.getName());
    }
}
