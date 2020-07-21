package com.censpeed.shop.service.impl;

import com.censpeed.shop.entity.CBanner;
import com.censpeed.shop.mapper.CBannerMapper;
import com.censpeed.shop.service.CBannerSetviceI;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CBannerServiceImpl implements CBannerSetviceI {

    @Autowired
    private CBannerMapper cBannerMapper;
    @Override
    public List<CBanner> selectAllBanner() {
        return cBannerMapper.selectAllBanner();
    }

    @Override
    public CBanner selectBannerById(Integer id) {
        return cBannerMapper.selectByPrimaryKey(id);
    }

    @Override
    public void updateBanner(CBanner cBanner) {
        cBannerMapper.updateByPrimaryKeySelective(cBanner);
    }
}
