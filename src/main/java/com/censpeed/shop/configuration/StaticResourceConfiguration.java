package com.censpeed.shop.configuration;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

@Configuration
public class StaticResourceConfiguration extends WebMvcConfigurerAdapter{


    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/js/**").addResourceLocations("/WEB-INF/js/");
        registry.addResourceHandler("/css/**").addResourceLocations("/WEB-INF/css/");
        registry.addResourceHandler("/fonts/**").addResourceLocations("/WEB-INF/fonts/");
        registry.addResourceHandler("/img/**").addResourceLocations("/WEB-INF/img/");
        registry.addResourceHandler("/portal/assets/images/**").addResourceLocations("/WEB-INF/jsp/portal/assets/images/");
        registry.addResourceHandler("/portal/assets/js/**").addResourceLocations("/WEB-INF/jsp/portal/assets/js/");
        registry.addResourceHandler("/portal/assets/css/**").addResourceLocations("/WEB-INF/jsp/portal/assets/css/");
        super.addResourceHandlers(registry);
    }
}
