package com.myadmin.firebase;

import com.google.firebase.messaging.*;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
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

    public void sendAll(List<String> tokens, String title, String pushMessage) throws FirebaseMessagingException, ExecutionException, InterruptedException {
        MulticastMessage message = MulticastMessage.builder()
                .putData("title", title)
                .putData("message", pushMessage)
                .addAllTokens(tokens)
                .build();
        log.info("message = {}", message);
        BatchResponse response = FirebaseMessaging.getInstance().sendMulticastAsync(message).get();
        log.info("response = {}", response);
        if (response.getFailureCount() > 0) {
            List<SendResponse> responses = response.getResponses();
            List<String> failedTokens = new ArrayList<>();
            for (int i = 0; i < responses.size(); i++) {
                if (!responses.get(i).isSuccessful()) {
                    // The order of responses corresponds to the order of the registration tokens.
                    failedTokens.add(tokens.get(i));
                }
            }

            System.out.println("List of tokens that caused failures: " + failedTokens);
        }
    }


    //안돼서 메뉴얼 보고 함.
//    public void sendall(List<NotificationRequest> requests) {
//        MulticastMessage.Builder messageBuilder = MulticastMessage.builder();
//        for (NotificationRequest request : requests) {
//            messageBuilder.addToken(request.getToken());
//            messageBuilder.putData("title", request.getTitle());
//            messageBuilder.putData("message", request.getMessage());
//        }
//        MulticastMessage message = messageBuilder.build();
//        log.info("message = {}",message);
//        try {
//            BatchResponse response = FirebaseMessaging.getInstance().sendMulticast(message);
//            log.info("response = [{} {} {}]", response.getResponses(), response.getSuccessCount(), response.getFailureCount());
//            System.out.println(response.getSuccessCount() + " messages were sent successfully");
//        } catch (FirebaseMessagingException e) {
//            e.printStackTrace();
//        }
//    }


}