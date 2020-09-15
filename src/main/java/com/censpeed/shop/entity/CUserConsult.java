package com.censpeed.shop.entity;

import java.util.Date;


/**
 * 咨询用户
 */
public class CUserConsult {
    @ExcelColumn(value = "id", col = 1)
    private Integer id;
    @ExcelColumn(value = "姓名", col = 2)
    private String name;
    @ExcelColumn(value = "电话", col = 3)
    private String tel;
    @ExcelColumn(value = "邮箱", col = 4)
    private String email;
    @ExcelColumn(value = "公司", col = 5)
    private String company;
    @ExcelColumn(value = "咨询内容", col = 6)
    private String content;
    @ExcelColumn(value = "咨询时间", col = 7)
    private Date createTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}