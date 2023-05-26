package com.myadmin.adm;

import com.myadmin.dto.Adm;
import com.myadmin.dto.Lec;
import com.myadmin.service.AdmService;
import com.myadmin.service.LecService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
class InsertTest {

    @Autowired
    AdmService admService;

    @Test
    void contextLoads() {
        Adm adm = new Adm("adm2", "pwd1", 3, "adm@naver.com");
        try {
            admService.register(adm);
            log.info(admService.get().toString());
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

}
