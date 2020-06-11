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
        registry.addResourceHandler("/portal/img/**").addResourceLocations("/WEB-INF/jsp/portal/img/");
        registry.addResourceHandler("/portal/js/**").addResourceLocations("/WEB-INF/jsp/portal/js/");
        registry.addResourceHandler("/portal/css/**").addResourceLocations("/WEB-INF/jsp/portal/css/");
        registry.addResourceHandler("/portal/files/**").addResourceLocations("/WEB-INF/jsp/portal/files/");
        registry.addResourceHandler("/portal/fonts/**").addResourceLocations("/WEB-INF/jsp/portal/fonts/");
        registry.addResourceHandler("/portal/tempFiles/**").addResourceLocations("/WEB-INF/jsp/portal/tempFiles/");
        super.addResourceHandlers(registry);
    }
}
