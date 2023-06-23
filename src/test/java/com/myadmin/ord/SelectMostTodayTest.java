package com.myadmin.ord;

import com.myadmin.dto.Ord;
import com.myadmin.service.OrdService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
class SelectMostTodayTest {

    @Autowired
    OrdService ordService;

    @Test
    void contextLoads() {
        try {
            log.info(ordService.mostlec().toString());
            log.info(ordService.moststdn().toString());
            Ord gettoday = ordService.gettoday();

            if (gettoday !=null) {
                log.info(ordService.gettoday().toString());
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

}
