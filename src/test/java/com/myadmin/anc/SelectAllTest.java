package com.myadmin.anc;

import com.myadmin.service.AdmService;
import com.myadmin.service.AncService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
class SelectAllTest {

    @Autowired
    AncService ancService;

    @Test
    void contextLoads() {
        try {
            log.info(ancService.get().toString());
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

}
