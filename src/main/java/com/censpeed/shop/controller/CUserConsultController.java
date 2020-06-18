package com.censpeed.shop.controller;


import com.alibaba.fastjson.JSON;
import com.censpeed.shop.entity.CUserConsult;
import com.censpeed.shop.service.CUserConsultServiceI;
import com.censpeed.shop.utils.ExcelUtils;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("consult")
public class CUserConsultController {

    @Autowired
    private CUserConsultServiceI cUserConsultServiceI;

    @RequestMapping("index")
    public String index(Map map,@RequestParam(defaultValue = "1") Integer pageNum){
        PageInfo<CUserConsult> cUserConsultPageInfo=cUserConsultServiceI.getAllUserConsult(pageNum);
        map.put("pageInfo",cUserConsultPageInfo);
        return "/user/index";

    }

    @RequestMapping("delete")
    public String delete(Integer id){
        cUserConsultServiceI.deleteUserConsultById(id);
        return "redirect:/consult/index";

    }


    @RequestMapping("update")
    public String update(Integer id,Map map){
        CUserConsult cUserConsult = cUserConsultServiceI.selectCUserConsultById(id);
        map.put("itemDto",cUserConsult);
        return "/user/update";
    }

    @RequestMapping("updateConsult")
    public String updateConsult(CUserConsult cUserConsult){
        cUserConsultServiceI.updateConsult(cUserConsult);
        return "redirect:/consult/index";
    }


    @RequestMapping(value = "/exportExcel", method = RequestMethod.GET)
    public void exportExcel(HttpServletResponse response)  throws IOException {
        List<CUserConsult> resultList = cUserConsultServiceI.getAll();
        long t1 = System.currentTimeMillis();
        ExcelUtils.writeExcel("客户咨询列表",response, resultList, CUserConsult.class);
        long t2 = System.currentTimeMillis();
        System.out.println(String.format("write over! cost:%sms", (t2 - t1)));
    }


    @RequestMapping(value = "/readExcel", method = RequestMethod.POST)
    public void readExcel(@RequestParam(value="uploadFile", required = false) MultipartFile file){
        long t1 = System.currentTimeMillis();
        List<CUserConsult> list = ExcelUtils.readExcel("", CUserConsult.class, file);
        long t2 = System.currentTimeMillis();
        System.out.println(String.format("read over! cost:%sms", (t2 - t1)));
        list.forEach(
                b -> System.out.println(JSON.toJSONString(b))
        );
    }

}
