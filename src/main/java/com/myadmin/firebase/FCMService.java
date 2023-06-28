package com.myadmin.firebase;

import com.google.firebase.messaging.*;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ExecutionException;

@Slf4j
@Service
public class FCMService {

    private static final Logger logger = LoggerFactory.getLogger(FCMService.class);

    public void send(final NotificationRequest notificationRequest) throws InterruptedException, ExecutionException {
        Message message = Message.builder()
                .setToken(notificationRequest.getToken())
                .setWebpushConfig(WebpushConfig.builder().putHeader("ttl", "300")
                        .setNotification(new WebpushNotification(notificationRequest.getTitle(),
                                notificationRequest.getMessage()))
                        .build())
                .build();

        String response = FirebaseMessaging.getInstance().sendAsync(message).get();
        logger.info("Sent message: " + response);
    }

    public void sendAll(List<String> tokens, String title, String body){

        List<String> registrationTokens = tokens;

        Notification notification = Notification.builder()
                .setTitle(title)
                .setBody(body)
                .build();

        MulticastMessage message = MulticastMessage.builder()
                .setNotification(notification)
                .addAllTokens(registrationTokens)
                .build();

        try {
            FirebaseMessaging.getInstance().sendMulticast(message);
            log.info("성공적으로 메시지를 보냈습니다.");
        } catch (FirebaseMessagingException e) {
            log.info("메시지 보내기를 실패했습니다: " + e.getMessage());
        }
    }



//    public void sendAll(List<String> tokens, String title, String pushMessage) throws FirebaseMessagingException, ExecutionException, InterruptedException {
//        MulticastMessage message = MulticastMessage.builder()
//                .putData("title", title)
//                .putData("message", pushMessage)
//                .addAllTokens(tokens)
//                .build();
//        log.info("message = {}", message);
//        BatchResponse response = FirebaseMessaging.getInstance().sendMulticastAsync(message).get();
//        log.info("response = {}", response);
//        if (response.getFailureCount() > 0) {
//            List<SendResponse> responses = response.getResponses();
//            List<String> failedTokens = new ArrayList<>();
//            for (int i = 0; i < responses.size(); i++) {
//                if (!responses.get(i).isSuccessful()) {
//                    // The order of responses corresponds to the order of the registration tokens.
//                    failedTokens.add(tokens.get(i));
//                }
//            }
//
//            System.out.println("List of tokens that caused failures: " + failedTokens);
//        }
//    }

}