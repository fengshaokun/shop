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


    /**
     * 用户咨询列表管理
     * @param map
     * @param pageNum
     * @return
     */
    @RequestMapping("index")
    public String index(Map map,@RequestParam(defaultValue = "1") Integer pageNum){
        PageInfo<CUserConsult> cUserConsultPageInfo=cUserConsultServiceI.getAllUserConsult(pageNum);
        map.put("pageInfo",cUserConsultPageInfo);
        return "/user/index";

    }

    /**
     * 删除用户咨询
     * @param id
     * @return
     */
    @RequestMapping("delete")
    public String delete(Integer id){
        cUserConsultServiceI.deleteUserConsultById(id);
        return "redirect:/consult/index";

    }


    /**
     * 修改用户咨询回显
     * @param id
     * @param map
     * @return
     */
    @RequestMapping("update")
    public String update(Integer id,Map map){
        CUserConsult cUserConsult = cUserConsultServiceI.selectCUserConsultById(id);
        map.put("itemDto",cUserConsult);
        return "/user/update";
    }


    /**
     * 确认修改用户咨询
     * @param cUserConsult
     * @return
     */
    @RequestMapping("updateConsult")
    public String updateConsult(CUserConsult cUserConsult){
        cUserConsultServiceI.updateConsult(cUserConsult);
        return "redirect:/consult/index";
    }


    /**
     * 导出用户咨询列表 poi
     * @param response
     * @throws IOException
     */
    @RequestMapping(value = "/exportExcel", method = RequestMethod.GET)
    public void exportExcel(HttpServletResponse response)  throws IOException {
        List<CUserConsult> resultList = cUserConsultServiceI.getAll();
        long t1 = System.currentTimeMillis();
        ExcelUtils.writeExcel("客户咨询列表",response, resultList, CUserConsult.class);
        long t2 = System.currentTimeMillis();
        System.out.println(String.format("write over! cost:%sms", (t2 - t1)));
    }


    /**
     * 导入
     * @param file
     */
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
