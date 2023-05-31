package com.myadmin.sbjdetail;

import com.myadmin.dto.Anc;
import com.myadmin.dto.SbjDetail;
import com.myadmin.service.AncService;
import com.myadmin.service.SbjDetailService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
class InsertTest {

    @Autowired
    SbjDetailService sbjDetailService;

    @Test
    void contextLoads() {
        try {
            SbjDetail sbjDetail = new SbjDetail(0, "기타", 1);
            sbjDetailService.register(sbjDetail);
            log.info(sbjDetailService.get().toString());
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

}
