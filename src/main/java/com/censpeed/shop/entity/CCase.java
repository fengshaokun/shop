package com.censpeed.shop.entity;

public class CCase {
    private Integer id;

    private String companyName;

    private String companyIntroduct;

    private String companyLogo;

    private String backgroundImage;

    private String name;

    private String sort;

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
    public String getSort() {
        return sort;
    }

    public void setSort(String sort) {
        this.sort = sort;
    }
}