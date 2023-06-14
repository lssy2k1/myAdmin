package com.myadmin.stdn;

import com.myadmin.service.AdmService;
import com.myadmin.service.StdnService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
class ApproveTest {

    @Autowired
    StdnService stdnService;

    @Test
    void contextLoads() {
        try {
            log.info(stdnService.approve("0").toString());
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

}
