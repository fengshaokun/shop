package com.censpeed.shop.service;

import com.censpeed.shop.entity.CUserConsult;
import com.censpeed.shop.utils.ShopResult;
import com.github.pagehelper.PageInfo;

import java.util.List;


public interface CUserConsultServiceI {

    //分页 用户咨询列表
    PageInfo<CUserConsult> getAllUserConsult(Integer pageNum);
    //查询所有用户咨询列表
    List<CUserConsult>getAll();
    //删除用户咨询列表
    void deleteUserConsultById(Integer id);
    //修改用户咨询列表
    void updateConsult(CUserConsult cUserConsult);
    //查询用户咨询列表通过Id
    CUserConsult selectCUserConsultById(Integer id);
    //新增用户咨询列表
    ShopResult addUserConsult(CUserConsult cUserConsult);
}
