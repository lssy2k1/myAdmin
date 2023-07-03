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
        String qwer = notificationService.getToken("adm_guava");
        System.out.println(qwer);
    }

    @Test
    void send() throws ExecutionException, InterruptedException {
        fcmService.send(new NotificationRequest("안녕하세요", "DIGICAMPUS입니다.", notificationService.getToken("adm_guava")));
    }

    @Test
    void sendAll() throws Exception {
        List<String> tokens = new ArrayList<>(Arrays.asList());
        List<Adm> adms = admService.get();
        for(Adm adm : adms){
            String token = notificationService.getToken(adm.getId());
            if(token == null){
                continue;
            }
            tokens.add(token);
        }
        fcmService.sendAll(tokens, "안녕하세요", "내용입니다");
    }

    //작동안함
//    @Test
//    void sendallpush() throws Exception {
//
//        // redis에서 키 가져오기 토큰중복으로 안됨. id로 걸러서 토큰 가져오기 중복으로 안됨. 따라서 토큰으로 set 안됨. 다른 메서드 써야함
//        // redis에서 키 가져오기 : value값 이상하다고 함. null값은 널포인트익셉션
//
//        List<String> tokens = new ArrayList<>();
//        List<Adm> adms = admService.get();
//        for(Adm adm : adms){
//            String token = notificationService.getToken(adm.getId());
//            if(token == null){
//                continue;
//            }
//            tokens.add(token);
//        }
//        log.info("tokens = {}", tokens);
//        fcmService.sendAll(tokens, "보내는 타이틀", "푸쉬 내용");
//    }

    //작동된 테스트
//    @Test
//    void testSendAll(){
//        List<String> registrationTokens = Arrays.asList(
//                "cLLujBZ6343REzmGPKxunS:APA91bHMyf149dDLuTPHls98eLYr161r9pf1f0aHsMmwFTzZnQsCXd5lXW1wz9JeeJN8YxRjZqcAUolOo_dPWtWmbTeMmGB_Lzni7PbKyTyb48NoG2hQwtvd3BdevHqt8j_D0p-9_XIS",
//                "dpSOtb4vX6U:APA91bFw4N_323XmFnXWjLif91zLD7y_6EvYQJHEIAff4ZwXJ8avBKU5vwdQImc-qVmcWsqhw1SB_4hGgBCw4s9N4UxgZTgUo2D8SxJOsPCophoVOlRj5dHSemSjhgdnYIY514nLxMGt"
//        );
//
//        Notification notification = Notification.builder()
//                .setTitle("알림 제목")
//                .setBody("알림 내용")
//                .build();
//
//        MulticastMessage message = MulticastMessage.builder()
//                .setNotification(notification)
//                .addAllTokens(registrationTokens)
//                .build();
//
//        try {
//            FirebaseMessaging.getInstance().sendMulticast(message);
//            System.out.println("성공적으로 메시지를 보냈습니다.");
//        } catch (FirebaseMessagingException e) {
//            System.out.println("메시지 보내기를 실패했습니다: " + e.getMessage());
//        }
//    }

}