package com.myadmin.myPage;

import com.myadmin.service.MyPageService;
import com.myadmin.service.StdnService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
public class MyPageSelectTest {

    @Autowired
    MyPageService myPageService;

    @Test
    void contextLoads() {
        try {
            System.out.println(myPageService.get("katarina"));
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
