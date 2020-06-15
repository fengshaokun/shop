package com.censpeed.shop.service;

import com.censpeed.shop.entity.CCase;

import java.util.List;

public interface CCaseServiceI {
    List selectAll();

    void insert(CCase cCase,String caseContent);

    CCase selectByPrimaryKey(Integer id);

    void updateCaseItem(CCase cCase,String caseContent);

    void deleteCaseItem(Integer id);

}
