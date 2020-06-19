package com.censpeed.shop.service;

import com.censpeed.shop.entity.CFootText;
import com.censpeed.shop.entity.CFootTextWithBLOBs;

import java.util.List;

public interface CFootTextServiceI {


    List<CFootTextWithBLOBs>selectAllCFootText();

    void updateFoot(CFootTextWithBLOBs cFootText);

    CFootTextWithBLOBs selectCFootTextById(Integer id);
}
