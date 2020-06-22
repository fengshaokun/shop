package com.censpeed.shop.entity;

import java.util.List;

public class CMenu {
    private Integer id;

    private String principal;

    private String sort;

    private Integer pid;

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


    public String getSort() {
        return sort;
    }

    public void setSort(String sort) {
        this.sort = sort;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }
}