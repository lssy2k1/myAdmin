package com.myadmin.stdn;

import com.myadmin.service.StdnService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
public class StdnSelectTest {

    @Autowired
    StdnService stdnService;

    @Test
    void contextLoads() {
        try {
            System.out.println(stdnService.get("katarina"));
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
