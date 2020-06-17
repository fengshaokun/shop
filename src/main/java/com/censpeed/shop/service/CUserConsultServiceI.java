package com.censpeed.shop.service;

import com.censpeed.shop.entity.CUserConsult;
import com.github.pagehelper.PageInfo;

import java.util.List;


public interface CUserConsultServiceI {

    PageInfo<CUserConsult> getAllUserConsult(Integer pageNum);

    List<CUserConsult>getAll();


}
