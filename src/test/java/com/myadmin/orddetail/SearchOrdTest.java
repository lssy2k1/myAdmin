package com.myadmin.orddetail;

import com.myadmin.service.OrdDetailService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
class SearchOrdTest {

    @Autowired
    OrdDetailService ordDetailService;
    @Test
    void contextLoads() {
        try {
            log.info(ordDetailService.searchOrd(123).toString());
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

}
