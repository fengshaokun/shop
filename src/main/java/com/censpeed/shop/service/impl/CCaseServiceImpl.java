package com.censpeed.shop.service.impl;

import com.censpeed.shop.entity.CCase;
import com.censpeed.shop.entity.CItemDetails;
import com.censpeed.shop.mapper.CCaseMapper;
import com.censpeed.shop.mapper.CItemDetailsMapper;
import com.censpeed.shop.service.CCaseServiceI;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CCaseServiceImpl implements CCaseServiceI {

    @Autowired
    private CCaseMapper cCaseMapper;
    @Autowired
    private CItemDetailsMapper cItemDetailsMapper;

    @Override
    public List selectAll() {
        return cCaseMapper.selectAll();
    }

    @Override
    public void insert(CCase cCase,String caseContent) {
        cCaseMapper.insert(cCase);
        Integer id = cCase.getId();
        CItemDetails cItemDetails = new CItemDetails();
        cItemDetails.setcCaseId(id);
        cItemDetails.setContent(caseContent);
        cItemDetailsMapper.insert(cItemDetails);
    }

    @Override
    public CCase selectByPrimaryKey(Integer id) {
        return cCaseMapper.selectByPrimaryKey(id);
    }

    @Override
    public void updateCaseItem(CCase cCase, String caseContent) {

        cCaseMapper.updateByPrimaryKeySelective(cCase);
        CItemDetails cItemDetails = new CItemDetails();
        cItemDetails.setcCaseId(cCase.getId());
        cItemDetails.setContent(caseContent);
        cItemDetailsMapper.updateByPrimaryKeySelective(cItemDetails);

    }

    @Override
    public void deleteCaseItem(Integer id) {
        cCaseMapper.deleteByPrimaryKey(id);
        cItemDetailsMapper.deleteByPrimaryKey(id);
    }
}
