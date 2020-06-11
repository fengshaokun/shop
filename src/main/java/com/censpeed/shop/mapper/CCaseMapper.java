package com.censpeed.shop.mapper;

import com.censpeed.shop.entity.CCase;
import org.apache.catalina.LifecycleState;

import java.util.List;

public interface CCaseMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(CCase record);

    int insertSelective(CCase record);

    CCase selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CCase record);

    int updateByPrimaryKey(CCase record);
}