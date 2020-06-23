package com.censpeed.shop.service;

import com.censpeed.shop.entity.CUser;

public interface CUserServiceI {

    CUser  login(String name,String password);

    CUser getAllUser();

    void update(CUser cUser);
}
