package com.myadmin.sbjdetail;

import com.myadmin.dto.Anc;
import com.myadmin.service.AncService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
class UpdateTest {

    @Autowired
    AncService ancService;
    @Test
    void contextLoads() {
        Anc anc = new Anc(140, "title fix", "writer 11", "contents 11", "a.jpg", null);

        try {
            ancService.modify(anc);
            log.info(ancService.get().toString());
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

}
