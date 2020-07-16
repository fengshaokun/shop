package com.censpeed.shop.service;

import com.censpeed.shop.entity.CProduct;
import com.censpeed.shop.entity.CProductDetails;
import com.github.pagehelper.PageInfo;

import java.util.List;
import java.util.Map;

public interface CProductServiceI {

    CProduct getCProductById(Integer cProductId);

    PageInfo<CProduct> selectAllCProductByStatus(Integer status, Integer pageNum,Integer pageSize);

    //新增产品返回产品主键
    int insert(CProduct record,String productContent,Integer menuId);

    int update(CProduct record,String productContent,Integer menuId);

    int updateByPrimaryKeySelective(CProduct record);

    CProductDetails selectProductDetailsByProId(Integer id);
    //根据菜单Id 查询产品
    List<CProduct> selectProductByMenuId(Integer id);
    //模糊查询产品
    PageInfo<CProduct> selectProductLike(String name,Integer status, Integer pageNum,Integer pageSize);
    //根据菜单查询产品
    List<CProduct>selectProductsByMenu(Integer menuId);
    //查询所有产品通过菜单分类
    Map selectProductsList();

    void updateProductHOTNEWStatus(CProduct record);



}
