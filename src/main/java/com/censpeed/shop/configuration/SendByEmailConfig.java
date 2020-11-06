package com.censpeed.shop.configuration;

import com.censpeed.shop.entity.CUser;
import com.censpeed.shop.service.CUserServiceI;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.mail.MailException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.scheduling.annotation.Async;

import javax.mail.internet.MimeMessage;
import java.io.InputStream;


@Configuration
@EnableAspectJAutoProxy(exposeProxy = true)
public class SendByEmailConfig {
    // 记录日志

    @Bean
    public JavaMailSender javaMailSender() {
        return new JavaMailSender() {
            @Override
            public void send(SimpleMailMessage simpleMessage) throws MailException {

            }

            @Override
            public void send(SimpleMailMessage... simpleMessages) throws MailException {

            }

            @Override
            public MimeMessage createMimeMessage() {
                return null;
            }

            @Override
            public MimeMessage createMimeMessage(InputStream contentStream) throws MailException {
                return null;
            }

            @Override
            public void send(MimeMessage mimeMessage) throws MailException {

            }

            @Override
            public void send(MimeMessage... mimeMessages) throws MailException {

            }

            @Override
            public void send(MimeMessagePreparator mimeMessagePreparator) throws MailException {

            }

            @Override
            public void send(MimeMessagePreparator... mimeMessagePreparators) throws MailException {

            }
        };
    }

    private Logger logger = LoggerFactory.getLogger(SendByEmailConfig.class);

    @Autowired
    private JavaMailSender jms;
    @Autowired
    private CUserServiceI cUserServiceI;


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
        if (allUser!=null&&allUser.getEmail()!=null&&!"".equals(allUser.getEmail())){
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
