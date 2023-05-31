package com.myadmin.lec;

import com.myadmin.dto.Lec;
import com.myadmin.service.LecService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
class LecUpdateTest {

    @Autowired
    LecService lecService;

    @Test
    void contextLoads() {
        Lec lec = new Lec(1, "관리자2", 23, "서울대 코딩", "이진만"
                , "스프링", "www.daum.net", null, "99시간", 5
                , 999, "b.img", 10, "0", null, 90);
        try {
            lecService.modify(lec);
            log.info(lecService.get().toString());
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

}
