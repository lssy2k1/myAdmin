package com.myadmin.controller;


import lombok.Getter;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;

@RestController
public class ChatController {

    @Autowired
    private final RedisTemplate<String, Object> redisTemplate;

    @Autowired
    public ChatController(RedisTemplate<String, Object> redisTemplate) {
        this.redisTemplate = redisTemplate;
    }

    @PostMapping("/saveMessage")
    @ResponseBody
    public String saveMessage(@RequestBody Message message) {
        ValueOperations<String, Object> valueOperations = redisTemplate.opsForValue();
        valueOperations.set("message:" + message.getId(), message);
        return "Message saved to Redis";
    }

    @GetMapping("/getMessages")
    @ResponseBody
    public List<Message> getMessages() {
        ValueOperations<String, Object> valueOperations = redisTemplate.opsForValue();
        List<Object> objectList = valueOperations.multiGet(redisTemplate.keys("message:*"));
        List<Message> messages = objectList.stream()
                .filter(obj -> obj instanceof Message)
                .map(obj -> (Message) obj)
                .collect(Collectors.toList());        return messages;
    }

    @DeleteMapping("/clearMessages")
    @ResponseBody
    public String clearMessages() {
        redisTemplate.delete(redisTemplate.keys("message:*"));
        return "Messages cleared from Redis";
    }

    @PostMapping("/saveNotificationMessage")
    @ResponseBody
    public String saveNotificationMessage(@RequestBody NotificationMessage notificationMessage) {
        ValueOperations<String, Object> valueOperations = redisTemplate.opsForValue();
        valueOperations.set("notificationMessage", notificationMessage.getMessage());
        return "Notification message saved to Redis";
    }

    @GetMapping("/getNotificationMessage")
    @ResponseBody
    public NotificationMessage getNotificationMessage() {
        ValueOperations<String, Object> valueOperations = redisTemplate.opsForValue();
        String message = (String) valueOperations.get("notificationMessage");
        return new NotificationMessage(message);
    }
}

@Getter
@Setter
class Message {
    private String id;
    private String sendid;
    private String receiveid;
    private String content1;

}

@Getter
@Setter
class NotificationMessage {
    private String message;

    public NotificationMessage(String message) {
        this.message = message;
    }

}