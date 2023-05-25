package com.myadmin.lec;

import com.myadmin.service.LecService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
class LecSelectTest {

    @Autowired
    LecService lecService;

    @Test
    void contextLoads() {
        try {
            log.info(lecService.get(1).toString());
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

}
