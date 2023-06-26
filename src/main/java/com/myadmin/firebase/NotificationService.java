package com.myadmin.firebase;


import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ExecutionException;

@Slf4j
@Service
public class NotificationService {

    private static final Logger logger = LoggerFactory.getLogger(NotificationService.class);

    private final FCMService fcmService;

    @Autowired
    private RedisTemplate<String, Object> redisTemplate;

    public NotificationService(final FCMService fcmService) {
        this.fcmService = fcmService;
    }

    public void register(final String userId, final String token) {
        redisTemplate.opsForValue().set(userId, token);
    }

    public void deleteToken(final String userId) {
        redisTemplate.delete(userId);
    }

    public String getToken(final String userId) {
        return (String) redisTemplate.opsForValue().get(userId);
    }

    public void sendNotification(final NotificationRequest request) {
        try {
            fcmService.send(request);
        } catch (InterruptedException | ExecutionException e) {
            logger.error(e.getMessage());
        }
    }

//    private void createReceiveNotification(User sender, User receiver) {
//        if (receiver.isLogin()) {
//            NotificationRequest notificationRequest = NotificationRequest.builder()
//                    .title("POST RECEIVED")
//                    .token(notificationService.getToken(receiver.getId()))
//                    .message(NotificationType.POST_RECEIVED.generateNotificationMessage(sender, receiver))
//                    .build();
//            notificationService.sendNotification(notificationRequest);
//        }
//    }
//
//    private void createTaggedNotification(User sender, List<User> receivers) {
//        receivers.stream()
//                .filter(User::isLogin)
//                .forEach(receiver -> {
//                    NotificationRequest notificationRequest = NotificationRequest.builder()
//                            .title("POST TAGGED")
//                            .token(notificationService.getToken(receiver.getId()))
//                            .message(NotificationType.POST_TAGGED.generateNotificationMessage(sender, receiver))
//                            .build();
//                    notificationService.sendNotification(notificationRequest);
//                });
//    }

}