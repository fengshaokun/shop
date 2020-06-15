package com.censpeed.shop.controller;

import com.censpeed.shop.entity.CCase;
import com.censpeed.shop.service.CCaseServiceI;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("case")
public class CCaseController {


    @Autowired
    private CCaseServiceI cCaseServiceI;


    @RequestMapping("index")
    public String index(Map map) {
        List list = cCaseServiceI.selectAll();
        map.put("cases",list);
        return "case/index";
    }


    @RequestMapping("create")
    public String update(){
        return "case/create";
    }

    //修改页面回显
    @RequestMapping("update")
    public String update(Integer id,Map map) {
        CCase cCase = cCaseServiceI.selectByPrimaryKey(id);
        map.put("item",cCase);
        return "case/update";
    }


    @RequestMapping("upload")
    public String upload(CCase cCase,String caseContent){
        cCaseServiceI.insert(cCase,caseContent);
        return "redirect:/case/index";
    }

    @RequestMapping("updateCase")
    public String updateCase(CCase cCase,String caseContent){
        cCaseServiceI.updateCaseItem(cCase,caseContent);
        return "redirect:/case/index";
    }

    @RequestMapping("delete")
    public String delete(Integer id){
        cCaseServiceI.deleteCaseItem(id);
        return "redirect:/case/index";
    }


}
