package com.censpeed.shop.service.impl;

import com.censpeed.shop.entity.CMenu;
import com.censpeed.shop.entity.CProduct;
import com.censpeed.shop.entity.CProductDetails;
import com.censpeed.shop.entity.CProductMenuLink;
import com.censpeed.shop.mapper.CMenuMapper;
import com.censpeed.shop.mapper.CProductDetailsMapper;
import com.censpeed.shop.mapper.CProductMapper;
import com.censpeed.shop.mapper.CProductMenuLinkMapper;
import com.censpeed.shop.service.CProductServiceI;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.beans.Transient;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class CProductServiceImpl implements CProductServiceI {

@Autowired
private CProductMapper cProductMapper;
@Autowired
private CProductDetailsMapper cProductDetailsMapper;
@Autowired
private CProductMenuLinkMapper cProductMenuLinkMapper;
@Autowired
private CMenuMapper cMenuMapper;


    @Override
    public CProduct getCProductById(Integer cProductId) {
        return cProductMapper.selectByPrimaryKey(cProductId);
    }

    @Override
    public PageInfo<CProduct> selectAllCProductByStatus(Integer status, Integer pageNum,Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<CProduct> cProducts = cProductMapper.selectAllCProductByStatus(status);
        PageInfo<CProduct> pageInfo = new PageInfo<CProduct>(cProducts);
        return pageInfo;
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
        if (!"".equals(menuId)&&menuId!=null){
            CProductMenuLink cProductMenuLink = new CProductMenuLink();
            cProductMenuLink.setcProductId(id);
            cProductMenuLink.setcMenuId(menuId);
            cProductMenuLinkMapper.deleteByProductKey(id);
            cProductMenuLinkMapper.insert(cProductMenuLink);
        }
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

    @Override
    public CProductDetails selectProductDetailsByProId(Integer id) {
        return cProductDetailsMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<CProduct> selectProductByMenuId(Integer id) {
        return cProductMapper.selectProductByMenuId(id);
    }

    @Override
    public List<CProduct> selectProductByMenuIdFive(Integer id) {
        return cProductMapper.selectProductByMenuIdFive(id);
    }

    @Override
    public PageInfo<CProduct> selectProductLike(String name,Integer status, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<CProduct> cProducts = cProductMapper.selectProductLike(name,status);
        PageInfo<CProduct> pageInfo = new PageInfo<CProduct>(cProducts);
        return pageInfo;
    }

    @Override
    public List<CProduct> selectProductsByMenu(Integer menuId) {
        return cProductMapper.selectProductByMenuId(menuId);
    }

    @Override
    public Map selectProductsList() {
        //查询所有父级菜单
        List<CMenu> PMenus = cMenuMapper.selectFootMenus(0);
        //查询所有2级菜单

        Map map = new HashMap();
        if (!PMenus.isEmpty()){
            for (CMenu c:PMenus){
                List<CMenu> cMenus = cMenuMapper.selectFootMenus(c.getId());
                if (!cMenus.isEmpty()){
                    for (CMenu cMenu:cMenus){
                        List<CProduct> cProducts = cProductMapper.selectProductByMenuId(cMenu.getId());
                        if (!cProducts.isEmpty()){
                            map.put(c.getPrincipal()+"-"+cMenu.getPrincipal(),cProducts);
                        }
                    }
                }
            }
        }
      return map;
    }

    @Override
    public void updateProductHOTNEWStatus(CProduct record) {
        cProductMapper.updateByPrimaryKeySelective(record);
    }
}
