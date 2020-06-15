package com.censpeed.shop.service.impl;

import com.censpeed.shop.entity.CUser;
import com.censpeed.shop.mapper.CCaseMapper;
import com.censpeed.shop.mapper.CUserMapper;
import com.censpeed.shop.service.CUserServiceI;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CUserServiceImpl implements CUserServiceI {

    @Autowired
    private CUserMapper cUserMapper;
    @Override
    public CUser login(String name, String password) {
         CUser cUser = new CUser();
         cUser.setName(name);
         cUser.setPassword(password);
        return cUserMapper.selectByNameAndPass(cUser);
    }
}
