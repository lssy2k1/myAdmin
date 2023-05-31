package com.myadmin.sbjdetail;

import com.myadmin.service.AncService;
import com.myadmin.service.SbjDetailService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
class DeleteTest {

    @Autowired
    SbjDetailService sbjDetailService;
    @Test
    void contextLoads() {
        try {
            sbjDetailService.remove(1);
            sbjDetailService.get();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

}
