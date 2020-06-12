package com.censpeed.shop.enumeration;

public enum  ProductEnum {
    IS("1", "是"), NOT("0", "否");

    private String value;
    private String desc;

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    private ProductEnum(String value, String desc) {
        this.value = value;
        this.desc = desc;
    }

}
