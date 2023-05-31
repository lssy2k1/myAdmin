package com.myadmin.sbjdetail;

import com.myadmin.service.AncService;
import com.myadmin.service.SbjDetailService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
class SelectTest {

    @Autowired
    SbjDetailService sbjDetailService;
    @Test
    void contextLoads() {
        try {
            log.info(sbjDetailService.get(1).toString());
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

}
