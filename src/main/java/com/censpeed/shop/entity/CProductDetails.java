package com.censpeed.shop.entity;


/**
 * 产品详情
 */
public class CProductDetails {
    private Integer cProductId;

    //内容
    private String productContent;

    public Integer getcProductId() {
        return cProductId;
    }

    public void setcProductId(Integer cProductId) {
        this.cProductId = cProductId;
    }

    public String getProductContent() {
        return productContent;
    }

    public void setProductContent(String productContent) {
        this.productContent = productContent;
    }
}