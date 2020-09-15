package com.censpeed.shop.entity;


/**
 * 案例详情
 */
public class CItemDetails {
    //案例Id
    private Integer cCaseId;
    //内容
    private String content;

    public Integer getcCaseId() {
        return cCaseId;
    }

    public void setcCaseId(Integer cCaseId) {
        this.cCaseId = cCaseId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}