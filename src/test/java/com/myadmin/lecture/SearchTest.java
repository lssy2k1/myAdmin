package com.myadmin.lecture;

import com.myadmin.dto.LectureSearch;
import com.myadmin.service.LectureService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
@Slf4j
public class SearchTest {

    @Autowired
    LectureService service;

    @Test
    void contextLoads() {

        LectureSearch ls = new LectureSearch("s", null, null
                , 2, 222, 311111);
        try {

            service.search(ls);
            log.info("======================================");
            log.info("select 완료");
            log.info("======================================");
        } catch (Exception e) {
            log.info("lecture select test error");
            e.printStackTrace();
        }
    }
}
