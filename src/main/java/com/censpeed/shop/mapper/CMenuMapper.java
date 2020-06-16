package com.censpeed.shop.mapper;

import com.censpeed.shop.entity.CMenu;
import org.apache.catalina.LifecycleState;

import java.util.List;

public interface CMenuMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(CMenu record);

    int insertSelective(CMenu record);

    CMenu selectByPrimaryKey(Integer id);

    List<CMenu> selectPMenuByPid(Integer id);

    int updateByPrimaryKeySelective(CMenu record);

    int updateByPrimaryKey(CMenu record);

    List<CMenu> selectAll();

}