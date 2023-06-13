package com.myadmin.stdn;

import com.myadmin.dto.Adm;
import com.myadmin.dto.Stdn;
import com.myadmin.service.AdmService;
import com.myadmin.service.StdnService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
class InsertTest {

    @Autowired
    StdnService stdnService;

    @Test
    void contextLoads() {
        Stdn stdn = new Stdn("uhbanana", "banana", "이거먹으면나한테바나나", "bananababanana@gmail.com", "01011111111","0");
        try {
            stdnService.register(stdn);
            log.info(stdnService.get().toString());
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

}
