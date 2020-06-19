package com.censpeed.shop.service.impl;

import com.censpeed.shop.entity.CFootText;
import com.censpeed.shop.entity.CFootTextWithBLOBs;
import com.censpeed.shop.mapper.CFootTextMapper;
import com.censpeed.shop.service.CFootTextServiceI;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CFootTextServiceImpl implements CFootTextServiceI {
    @Autowired
    private CFootTextMapper cFootTextMapper;
    @Override
    public List<CFootTextWithBLOBs> selectAllCFootText() {
        return cFootTextMapper.selectAllCFootText();
    }

    @Override
    public void updateFoot(CFootTextWithBLOBs cFootText) {
        cFootTextMapper.updateByPrimaryKeySelective(cFootText);
    }

    @Override
    public CFootTextWithBLOBs selectCFootTextById(Integer id) {
        return cFootTextMapper.selectByPrimaryKey(id);
    }
}
