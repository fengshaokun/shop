package com.censpeed.shop.entity;

public class CProductMenuLink {
    private Integer id;

    private Integer cProductId;

    private Integer cMenuId;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getcProductId() {
        return cProductId;
    }

    public void setcProductId(Integer cProductId) {
        this.cProductId = cProductId;
    }

    public Integer getcMenuId() {
        return cMenuId;
    }

    public void setcMenuId(Integer cMenuId) {
        this.cMenuId = cMenuId;
    }
}