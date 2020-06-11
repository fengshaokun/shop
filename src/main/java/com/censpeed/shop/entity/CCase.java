package com.censpeed.shop.entity;

public class CCase {
    private Integer id;

    private String companyName;

    private String companyIntroduct;

    private String companyLogo;

    private String backgroundImage;

    private Integer cItemDetailsId;

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

    public Integer getcItemDetailsId() {
        return cItemDetailsId;
    }

    public void setcItemDetailsId(Integer cItemDetailsId) {
        this.cItemDetailsId = cItemDetailsId;
    }
}