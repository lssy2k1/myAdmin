package com.myadmin.ord;

import com.myadmin.service.AncService;
import com.myadmin.service.OrdService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
class DeleteTest {

    @Autowired
    OrdService ordService;

    @Test
    void contextLoads() {
        try {
            ordService.remove(122);
            ordService.get();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

}
