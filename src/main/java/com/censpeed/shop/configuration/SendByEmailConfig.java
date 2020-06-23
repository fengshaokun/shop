package com.censpeed.shop.configuration;

import com.censpeed.shop.entity.CUser;
import com.censpeed.shop.service.CUserServiceI;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.scheduling.annotation.Async;


@Configuration
@EnableAspectJAutoProxy(exposeProxy = true)
public class SendByEmailConfig {
    // 记录日志
    private Logger logger = LoggerFactory.getLogger(SendByEmailConfig.class);

    @Autowired
    private JavaMailSender jms;
    @Autowired
    private CUserServiceI cUserServiceI;

    @Autowired
    private JavaMailSender mailSender;

    // 本身邮件的发送者,来自邮件配置
    @Value("${spring.mail.username}")
    private String username;

    @Value("${spring.mail.default-encoding}")
    private String DEFAULT_ENCODING;

    // 用于发送普通文字邮件
    @Async
    public Integer send(String sender, String receiver, String title, String text) {
        // 建立邮件消息
        SimpleMailMessage mailMessage = new SimpleMailMessage();
        CUser allUser = cUserServiceI.getAllUser();
        if (allUser!=null&&allUser.getEmail()!=null){
            receiver=allUser.getEmail();
        }
        else {return 0;}
        // 将邮件信息设置到SimpleMailMessage对象中
        mailMessage.setFrom(sender);
        mailMessage.setCc(sender);
        mailMessage.setTo(receiver);
        mailMessage.setSubject(title);
        mailMessage.setText(text);
        try {
            jms.send(mailMessage);
        } catch (Exception e) {
            logger.info("邮件发送异常：" + e.getMessage());
            e.printStackTrace();
            return 0;
        }
        return 1;
    }

}
