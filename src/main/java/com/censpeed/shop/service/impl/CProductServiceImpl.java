package com.censpeed.shop.service.impl;

import com.censpeed.shop.entity.CProduct;
import com.censpeed.shop.mapper.CProductMapper;
import com.censpeed.shop.service.CProductServiceI;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CProductServiceImpl implements CProductServiceI {

@Autowired
private CProductMapper cProductMapper;

    @Override
    public CProduct getCProductById(Integer cProductId) {
        return cProductMapper.selectByPrimaryKey(cProductId);
    }

    @Override
    public List<CProduct> selectAllCProductByStatus(Integer status) {
        return cProductMapper.selectAllCProductByStatus(status);
    }
}
