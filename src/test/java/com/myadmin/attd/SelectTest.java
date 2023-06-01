package com.myadmin.attd;

import com.myadmin.service.AdmService;
import com.myadmin.service.AttdService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
class SelectTest {

    @Autowired
    AttdService attdService;
    @Test
    void contextLoads() {
        try {
            System.out.println(attdService.get("katarina")+"");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

}
