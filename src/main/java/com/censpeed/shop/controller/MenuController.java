package com.censpeed.shop.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("menu")
public class MenuController {


    @RequestMapping("index")
    public String index() {
        return "menu/index";
    }
    @RequestMapping("create")
    public String create() {
        return "menu/create";
    }
    @RequestMapping("update")
    public String update() {
        return "menu/update";
    }




}
