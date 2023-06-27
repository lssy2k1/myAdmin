package com.myadmin.fcm;

import com.google.firebase.messaging.*;
import com.myadmin.dto.Adm;
import com.myadmin.firebase.FCMService;
import com.myadmin.firebase.NotificationRequest;
import com.myadmin.firebase.NotificationService;
import com.myadmin.service.AdmService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.StringRedisTemplate;

import java.util.*;
import java.util.concurrent.ExecutionException;
import java.util.stream.Collectors;

@Slf4j
@SpringBootTest
public class GetTokenTest {

    @Autowired
    AdmService admService;

    @Autowired
    RedisTemplate<String, String> redisTemplate = new StringRedisTemplate(); // RedisTemplate 초기화

    @Autowired
    NotificationService notificationService;
    @Autowired
    FCMService fcmService;

    @Test
    void token() {
        String qwer = notificationService.getToken("qwer");
        System.out.println(qwer);
    }

    @Test
    void send() throws ExecutionException, InterruptedException {
        fcmService.send(new NotificationRequest("제목", "착석하세요", notificationService.getToken("ㅂㅈㄷㄱ")));
    }

    @Test
    void sendallpush() throws Exception {

        // redis에서 키 가져오기 토큰중복으로 안됨. id로 걸러서 토큰 가져오기 중복으로 안됨. 따라서 토큰으로 set 안됨. 다른 메서드 써야함
        // redis에서 키 가져오기 : value값 이상하다고 함. null값은 널포인트익셉션

        List<String> tokens = new ArrayList<>();
        List<Adm> adms = admService.get();
        for(Adm adm : adms){
            String token = notificationService.getToken(adm.getId());
            if(token == null){
                continue;
            }
            tokens.add(token);
        }
        log.info("tokens = {}", tokens);
        fcmService.sendAll(tokens, "보내는 타이틀", "푸쉬 내용");

    }
}