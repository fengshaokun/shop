package com.censpeed.shop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("home")
@Controller
public class CHomeController {


    @RequestMapping("index")
    public String toMain(){

        return "portal/list";
    }


}
