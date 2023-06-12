package com.myadmin.util;

import io.github.flashvayne.chatgpt.service.ChatgptService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.text.ParseException;

@Slf4j
@SpringBootTest
class GptTest2 {

    @Autowired
    ChatgptService chatgptService;
    @Test
    void contextLoads() throws ParseException {
        String str = chatgptService.sendMessage("한국이 뭐니");
        log.info("------------------------------------");
        log.info(str);
        String imageUrl = chatgptService.imageGenerate("boy");
        log.info(imageUrl);  // image url

    }

}
