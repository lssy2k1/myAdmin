package com.myadmin.fcm;

import com.myadmin.firebase.FCMService;
import com.myadmin.firebase.NotificationRequest;
import com.myadmin.firebase.NotificationService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.concurrent.ExecutionException;

@SpringBootTest
public class GetTokenTest {


    @Autowired
    NotificationService notificationService;
    @Autowired
    FCMService fcmService;

    @Test
    void token(){
        String qwer = notificationService.getToken("qwer");
        System.out.println(qwer);
    }

    @Test
    void send() throws ExecutionException, InterruptedException {
        fcmService.send(new NotificationRequest("제목", "착석하세요", notificationService.getToken("qwer")));
    }

}
