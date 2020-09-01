package com.censpeed.shop.controller;

import com.censpeed.shop.entity.CUser;
import com.censpeed.shop.service.CUserServiceI;
import com.censpeed.shop.utils.ShopResult;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@Controller
@RequestMapping("user")
public class CUserController {

@Autowired
private CUserServiceI cUserServiceI;


    /**
     * 用户登陆页面
     * @return
     */
    @RequestMapping("/index")
    public String index(){
        return "sso/login";
    }

    /**
     * 登陆接口
     * @param name
     * @param password
     * @param request
     * @return
     */
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

    @RequestMapping(value = "/email" ,method = RequestMethod.GET)
    public String email(Integer id, Map map){
        CUser allUser = cUserServiceI.getAllUser();
        map.put("user",allUser);
        return "user/email";
    }

    @RequestMapping(value = "/toUpdate" ,method = RequestMethod.GET)
    public String toUpdate(Integer id, Map map){
        CUser allUser = cUserServiceI.getAllUser();
        map.put("user",allUser);
        return "user/updateEmail";
    }

    @RequestMapping(value = "/update" ,method = RequestMethod.POST)
    public String update(CUser cUser){
        cUserServiceI.update(cUser);
        return "redirect:/user/email";
    }

}
