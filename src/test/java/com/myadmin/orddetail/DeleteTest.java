package com.myadmin.orddetail;

import com.myadmin.service.OrdDetailService;
import com.myadmin.service.OrdService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
class DeleteTest {

    @Autowired
    OrdDetailService ordDetailService;

    @Test
    void contextLoads() {
        try {
            ordDetailService.remove(101);
            ordDetailService.get();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

}
