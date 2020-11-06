package com.censpeed.shop;

import com.censpeed.shop.entity.Aaa;
import com.censpeed.shop.entity.CHomePage;
import com.censpeed.shop.mapper.AaaMapper;
import com.censpeed.shop.service.CFootTextServiceI;
import com.censpeed.shop.service.CHomePageServiceI;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

@SpringBootTest
@RunWith(SpringRunner.class)
public class ShopTest {
    @Autowired
    private CHomePageServiceI cHomePageServiceI;
    @Autowired
    private AaaMapper aaaMapper;



    @Test
    public  void test1(){
        List<Aaa> aaas = aaaMapper.selectByPr(false);
        System.out.println(aaas);
    }

}
