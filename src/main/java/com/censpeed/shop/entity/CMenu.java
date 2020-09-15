package com.censpeed.shop.entity;

import java.util.List;

/**
 * 菜单
 */
public class CMenu {
    private Integer id;
    //菜单名
    private String principal;
    //排序
    private Integer sort;
    //父级Id
    private Integer pid;
    //父级菜单
    private CMenu cMenu;


    private List<CMenu> childMenu;


    public List<CMenu> getChildMenu() {
        return childMenu;
    }

    public void setChildMenu(List<CMenu> childMenu) {
        this.childMenu = childMenu;
    }

    public CMenu getcMenu() {
        return cMenu;
    }

    public void setcMenu(CMenu cMenu) {
        this.cMenu = cMenu;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPrincipal() {
        return principal;
    }

    public void setPrincipal(String principal) {
        this.principal = principal;
    }


    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }
}