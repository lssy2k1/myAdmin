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
class UpdateTest {

    @Autowired
    AdmService admService;
    @Test
    void contextLoads() {
        Adm adm = new Adm("adm2", "pwd2", 2, "adm@daum.net", null
                , "01000000000", "성수동", "0", null, "name");
        try {
            admService.modify(adm);
            log.info(admService.get().toString());
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

}
