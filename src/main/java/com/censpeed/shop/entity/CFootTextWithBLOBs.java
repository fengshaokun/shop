package com.censpeed.shop.entity;

/**
 * 底部文字
 */

public class CFootTextWithBLOBs extends CFootText {
    //左边文字
    private String leftText;
    //右边文字
    private String rightText;

    public String getLeftText() {
        return leftText;
    }

    public void setLeftText(String leftText) {
        this.leftText = leftText;
    }

    public String getRightText() {
        return rightText;
    }

    public void setRightText(String rightText) {
        this.rightText = rightText;
    }
}