package com.myadmin.util;

import lombok.extern.slf4j.Slf4j;
import org.apache.commons.mail.DefaultAuthenticator;
import org.apache.commons.mail.Email;
import org.apache.commons.mail.SimpleEmail;
import org.springframework.mail.MailSender;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.swing.*;
import java.util.Properties;

//https://mvnrepository.com/artifact/org.apache.commons/commons-email dependency추가
@Slf4j
public class MailUtil {

    public static final String myId = "digicamjava";
    public static final String myPw = "";

    public static void sendEmail() throws Exception {
        Email email = new SimpleEmail();
        email.setHostName("smtp.naver.com");
        email.setSmtpPort(465);
        email.setCharset("utf-8"); // 인코딩 설정(utf-8, euc-kr)
        email.setAuthenticator(new DefaultAuthenticator(myId,myPw));
        email.setSSL(true);
        email.setFrom("digicamjava@naver.com", "이름");
        email.setSubject("메일 제목");
        email.setMsg("메일 내용");
        email.addTo("lssy2k1@naver.com", "이름");
        email.send();
    }

    // bean 설정을 안했을 경우
    public static void sendEmail2() throws Exception {

        // 메일 관련 정보
        String host = "smtp.naver.com";
        String username = myId;
        String password = myPw;
        int port = 465;

        // 메일 내용
        String subject = "메일 발송시 제목";
        String content = "메일 발송시 내용";

        Properties props = System.getProperties();
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", port);
        props.put("mail.smtp.auth", true);
        props.put("mail.smtp.ssl.enable", true);
        props.put("mail.smtp.ssl.trust", host);

        Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
            String user = username;
            String pass = password;
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user, pass);
            }
        });
        session.setDebug(true);

        // 보내는 사람
        String from = "digicamjava@naver.com";

        // 받는 사람
        String to = "lssy2k1@naver.com";

        try {
            // 메일 내용 넣을 객체와, 이를 도와주는 Helper 객체 생성
            MimeMessage mimeMessage = new MimeMessage(session);

            mimeMessage.setFrom(new InternetAddress(from)); // 보내는 사람 세팅
            mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(to)); // 받는 사람 세팅
            mimeMessage.setSubject(subject);	// 제목 세팅
            mimeMessage.setText(content);	// 내용 세팅

            // 메일 전송

            //mailSender.send(mail);
            Transport.send(mimeMessage);
        } catch(Exception e) {
            e.printStackTrace();
        }
    }
}
