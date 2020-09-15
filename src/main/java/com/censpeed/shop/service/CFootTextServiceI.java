package com.censpeed.shop.service;

import com.censpeed.shop.entity.CFootText;
import com.censpeed.shop.entity.CFootTextWithBLOBs;

import java.util.List;

public interface CFootTextServiceI {
     //查询全部底部文字
    List<CFootTextWithBLOBs>selectAllCFootText();
    //修改底部文字
    void updateFoot(CFootTextWithBLOBs cFootText);
    //根据Id查询底部文字
    CFootTextWithBLOBs selectCFootTextById(Integer id);
}
