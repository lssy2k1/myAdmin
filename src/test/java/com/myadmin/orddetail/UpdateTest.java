package com.myadmin.orddetail;

import com.myadmin.dto.Ord;
import com.myadmin.dto.OrdDetail;
import com.myadmin.service.OrdDetailService;
import com.myadmin.service.OrdService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
class UpdateTest {

    @Autowired
    OrdDetailService ordDetailService;

    @Test
    void contextLoads() {
        OrdDetail ordDetail = new OrdDetail(100, 100, 101, "2", null, null);

        try {
            ordDetailService.modify(ordDetail);
            log.info(ordDetailService.get().toString());
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

}
