package com.myadmin.ord;

import com.myadmin.dto.Anc;
import com.myadmin.dto.Ord;
import com.myadmin.service.AncService;
import com.myadmin.service.OrdService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
class InsertTest {

    @Autowired
    OrdService ordService;

    @Test
    void contextLoads() {
        Ord ord = new Ord(0, "testid", null, "0", 1000, "1", 10);

        try {
            ordService.register(ord);
            log.info(ordService.get().toString());
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

}
