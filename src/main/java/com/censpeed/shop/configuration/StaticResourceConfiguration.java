package com.censpeed.shop.configuration;

import com.censpeed.shop.interceptor.LoginInterceptor;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

@Configuration
public class StaticResourceConfiguration extends WebMvcConfigurerAdapter{

    /**
     * 静态资源
     * @param registry
     */
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/js/**").addResourceLocations("/WEB-INF/js/");
        registry.addResourceHandler("/css/**").addResourceLocations("/WEB-INF/css/");
        registry.addResourceHandler("/fonts/**").addResourceLocations("/WEB-INF/fonts/");
        registry.addResourceHandler("/img/**").addResourceLocations("/WEB-INF/img/");
        registry.addResourceHandler("/portal/assets/images/**").addResourceLocations("/WEB-INF/jsp/portal/assets/images/");
        registry.addResourceHandler("/home/assets/images/**").addResourceLocations("/WEB-INF/jsp/home/assets/images/");
        registry.addResourceHandler("/menu/img/**").addResourceLocations("/WEB-INF/jsp/menu/img/");
        registry.addResourceHandler("/portal/assets/js/**").addResourceLocations("/WEB-INF/jsp/portal/assets/js/");
        registry.addResourceHandler("/portal/assets/css/**").addResourceLocations("/WEB-INF/jsp/portal/assets/css/");
        registry.addResourceHandler("/portal/assets/images/**").addResourceLocations("/WEB-INF/jsp/portal/assets/images/");
        registry.addResourceHandler("/home/assets/js/**").addResourceLocations("/WEB-INF/jsp/home/assets/js/");
        registry.addResourceHandler("/home/assets/css/**").addResourceLocations("/WEB-INF/jsp/home/assets/css/");
        registry.addResourceHandler("/home/assets/js/**").addResourceLocations("/WEB-INF/jsp/home/assets/js/");
        registry.addResourceHandler("/home/assets/bootstrap/**").addResourceLocations("/WEB-INF/jsp/home/assets/bootstrap/");
        registry.addResourceHandler("/menu/js/**").addResourceLocations("/WEB-INF/jsp/menu/js/");
        registry.addResourceHandler("/menu/css/**").addResourceLocations("/WEB-INF/jsp/menu/css/");
        super.addResourceHandlers(registry);
    }

    /**
     * 拦截
     * @param registry
     */
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        InterceptorRegistration loginRegistry = registry.addInterceptor(new LoginInterceptor());
        // 拦截路径

        loginRegistry.addPathPatterns("/**");
        // 排除路径
        loginRegistry.excludePathPatterns("/user/login");
        loginRegistry.excludePathPatterns("/user/index");
        loginRegistry.excludePathPatterns("/home/*");
        loginRegistry.excludePathPatterns("/**/*.css", "/**/*.js", "/**/*.png", "/**/*.jpg", "/**/*.jpeg", "/*.html", "/**/*.html","/swagger-resources/**","swagger-ui.html");

    }
}
