package com.myadmin.adm;

import com.myadmin.service.AdmService;
import com.myadmin.service.LecService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
class DeleteTest {

    @Autowired
    AdmService admService;

    @Test
    void contextLoads() {
        try {
            admService.remove("adm1");
            admService.get();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

}
