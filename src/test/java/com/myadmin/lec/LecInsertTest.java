package com.myadmin.lec;

import com.myadmin.dto.Lec;
import com.myadmin.service.LecService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
class LecInsertTest {

    @Autowired
    LecService lecService;

    @Test
    void contextLoads() {
        Lec lec = new Lec(0, "관리자2", 2, "서울대 코딩", "이진만", "스프링", "www.daum.net", null, "9시간",  9999, "b.img", 0, "0", null, 0);
        Lec lec2 = new Lec(3, "관리자1", 1, "알파코 스프링수업", "이진만", "자바", "www.naver.com", null, "100시간",  100000, "a.img", 0, "0", "1111", 1);
        try {
            lecService.register(lec);
            log.info(lecService.get().toString());
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

}
