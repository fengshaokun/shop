package com.censpeed.shop.controller;

import com.censpeed.shop.entity.CCase;
import com.censpeed.shop.entity.CItemDetails;
import com.censpeed.shop.service.CCaseServiceI;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;


/**
 * 案例页面
 */
@Controller
@RequestMapping("case")
public class CCaseController {


    @Autowired
    private CCaseServiceI cCaseServiceI;

    @Value("${caseSize}")
    private Integer caseSize;


    /**
     *  查询案例列表 初始化页面
     * @param map
     * @param pageNum
     * @return
     */
    @RequestMapping("index")
    public String index(Map map,@RequestParam(defaultValue = "1") Integer pageNum){
        PageInfo<CCase> cCasePageInfo = cCaseServiceI.selectAllLimit(pageNum,caseSize);
        map.put("pageInfo",cCasePageInfo);
        return "case/index";
    }


    /**
     * 跳转到创建页面
     * @return
     */
    @RequestMapping("create")
    public String update(){
        return "case/create";
    }

    /**
     * 修改案例页面详情回显
     * @param id
     * @param map
     * @return
     */
    //修改页面回显
    @RequestMapping("update")
    public String update(Integer id,Map map) {
        CCase cCase = cCaseServiceI.selectByPrimaryKey(id);
        map.put("item",cCase);
        return "case/update";
    }


    /**
     * 创建案例提交
     * @param cCase
     * @param caseContent
     * @return
     */
    @RequestMapping("upload")
    public String upload(CCase cCase,String caseContent){
        cCaseServiceI.insert(cCase,caseContent);
        return "redirect:/case/index";
    }

    /**
     * 修改案例提交
     * @param cCase
     * @param caseContent
     * @return
     */
    @RequestMapping("updateCase")
    public String updateCase(CCase cCase,String caseContent){
        cCaseServiceI.updateCaseItem(cCase,caseContent);
        return "redirect:/case/index";
    }

    /**
     * 删除案例
     * @param id
     * @return
     */
    @RequestMapping("delete")
    public String delete(Integer id){
        cCaseServiceI.deleteCaseItem(id);
        return "redirect:/case/index";
    }

    /**
     * 查看案例详情
     * @param id
     * @param map
     * @return
     */
    @RequestMapping("detail")
    public String detail(Integer id,Map map){
        CItemDetails cItemDetails = cCaseServiceI.selectCaseDetailsByCaId(id);
        map.put("detail",cItemDetails);
        return "case/detail";
    }


}
