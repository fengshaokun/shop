package com.censpeed.shop.service.impl;

import com.censpeed.shop.entity.CProduct;
import com.censpeed.shop.entity.CProductDetails;
import com.censpeed.shop.entity.CProductMenuLink;
import com.censpeed.shop.mapper.CProductDetailsMapper;
import com.censpeed.shop.mapper.CProductMapper;
import com.censpeed.shop.mapper.CProductMenuLinkMapper;
import com.censpeed.shop.service.CProductServiceI;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.beans.Transient;
import java.util.List;

@Service
public class CProductServiceImpl implements CProductServiceI {

@Autowired
private CProductMapper cProductMapper;
@Autowired
private CProductDetailsMapper cProductDetailsMapper;
@Autowired
private CProductMenuLinkMapper cProductMenuLinkMapper;

    @Override
    public CProduct getCProductById(Integer cProductId) {
        return cProductMapper.selectByPrimaryKey(cProductId);
    }

    @Override
    public List<CProduct> selectAllCProductByStatus(Integer status) {
        return cProductMapper.selectAllCProductByStatus(status);
    }

    @Override
    @Transient
    public int insert(CProduct record,String productContent,Integer menuId) {
        CProductDetails cProductDetails = new CProductDetails();
        CProductMenuLink cProductMenuLink = new CProductMenuLink();
        cProductMapper.insert(record);
        cProductDetails.setcProductId(record.getId());
        cProductDetails.setProductContent(productContent);
        cProductDetailsMapper.insert(cProductDetails);
        cProductMenuLink.setcMenuId(menuId);
        cProductMenuLink.setcProductId(record.getId());
        cProductMenuLinkMapper.insert(cProductMenuLink);
        return record.getId();
    }

    @Override
    public int update(CProduct record, String productContent, Integer menuId) {
        cProductMapper.updateByPrimaryKeySelective(record);
        Integer id = record.getId();
        CProductMenuLink cProductMenuLink = new CProductMenuLink();
        cProductMenuLink.setcProductId(id);
        cProductMenuLink.setcMenuId(menuId);
        cProductMenuLinkMapper.deleteByProductKey(id);
        cProductMenuLinkMapper.insert(cProductMenuLink);

        CProductDetails cProductDetails = cProductDetailsMapper.selectByPrimaryKey(record.getId());
        if (cProductDetails==null){
            cProductDetails=new CProductDetails();
            cProductDetails.setcProductId(id);
       }
        cProductDetails.setProductContent(productContent);
        cProductDetailsMapper.updateByPrimaryKeySelective(cProductDetails);
        return record.getId();
    }

    @Override
    public int updateByPrimaryKeySelective(CProduct record) {
        cProductMenuLinkMapper.deleteByProductKey(record.getId());
        return  cProductMapper.updateByPrimaryKeySelective(record);
    }
}
