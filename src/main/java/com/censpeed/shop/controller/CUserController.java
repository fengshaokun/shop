package com.censpeed.shop.controller;

import com.censpeed.shop.entity.CUser;
import com.censpeed.shop.service.CUserServiceI;
import com.censpeed.shop.utils.ShopResult;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("user")
public class CUserController {
@Autowired
private CUserServiceI cUserServiceI;

    @RequestMapping("/")
    public String index(){
        return "sso/login";
    }

    @RequestMapping("/login")
    @ResponseBody
    public ShopResult login(@Param("name") String name , @Param("password") String password, HttpServletRequest request) {


        CUser login = cUserServiceI.login(name, password);
        if (null == login) {
            return  ShopResult.build(400,"账号或密码错误,请重新登陆");
        }
        request.getSession().setAttribute("user", login);
        return ShopResult.ok();
    }

}
