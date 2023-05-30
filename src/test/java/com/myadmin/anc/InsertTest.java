package com.myadmin.anc;

import com.myadmin.dto.Adm;
import com.myadmin.dto.Anc;
import com.myadmin.service.AdmService;
import com.myadmin.service.AncService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
class InsertTest {

    @Autowired
    AncService ancService;

    @Test
    void contextLoads() {
        Anc anc = new Anc(1000, "title", "writer", "contents", "a.jpg", null);
        try {
            ancService.register(anc);
            log.info(ancService.get().toString());
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

}
