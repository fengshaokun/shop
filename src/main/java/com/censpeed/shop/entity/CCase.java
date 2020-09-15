package com.censpeed.shop.entity;


/**
 *案例
 */
public class CCase {

    //id
    private Integer id;
    //公司名称
    private String companyName;
    //公司简介
    private String companyIntroduct;
    //公司Logo url
    private String companyLogo;
    //公司背景图
    private String backgroundImage;
    //项目名称
    private String name;
    //排序
    private Integer sort;
    //项目详情
    private CItemDetails cItemDetails;

    public CItemDetails getcItemDetails() {
        return cItemDetails;
    }

    public void setcItemDetails(CItemDetails cItemDetails) {
        this.cItemDetails = cItemDetails;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getCompanyIntroduct() {
        return companyIntroduct;
    }

    public void setCompanyIntroduct(String companyIntroduct) {
        this.companyIntroduct = companyIntroduct;
    }

    public String getCompanyLogo() {
        return companyLogo;
    }

    public void setCompanyLogo(String companyLogo) {
        this.companyLogo = companyLogo;
    }

    public String getBackgroundImage() {
        return backgroundImage;
    }

    public void setBackgroundImage(String backgroundImage) {
        this.backgroundImage = backgroundImage;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }
}