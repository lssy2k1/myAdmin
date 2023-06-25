package com.myadmin;

import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.redis.connection.RedisConnection;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.core.RedisTemplate;
import org.junit.Assert;

@Slf4j
@SpringBootTest
public class RedisConnectTest {



    @Autowired
    private RedisTemplate<String, String> redisTemplate;

    @Test
    void RedisConnect(){
        boolean redisConnected = isRedisConnected();
        log.info(String.valueOf(redisConnected));
        Assert.assertTrue(redisConnected);
    }


    public boolean isRedisConnected() {
        RedisConnectionFactory connectionFactory = redisTemplate.getConnectionFactory();
        RedisConnection connection = connectionFactory.getConnection();
        boolean isConnected = !connection.isClosed();
        return isConnected;
    }




}
