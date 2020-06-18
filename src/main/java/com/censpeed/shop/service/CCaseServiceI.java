package com.censpeed.shop.service;

import com.censpeed.shop.entity.CCase;
import com.censpeed.shop.entity.CItemDetails;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface CCaseServiceI {
    //查询所有案例
    List selectAll();

    //分页查询案例
    PageInfo<CCase> selectAllLimit(Integer pageNum, Integer pageSize);

    //添加案例和案例详情
    void insert(CCase cCase, String caseContent);

    //通过Id查询案例
    CCase selectByPrimaryKey(Integer id);

    //修改案例和案例详情
    void updateCaseItem(CCase cCase, String caseContent);

    //删除案例
    void deleteCaseItem(Integer id);

    //查看案例详情
    CItemDetails selectCaseDetailsByCaId(Integer id);



}
