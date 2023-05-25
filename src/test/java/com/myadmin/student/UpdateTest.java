package com.myadmin.student;

import com.myadmin.dto.Stdn;
import com.myadmin.service.StudentService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
@Slf4j
public class UpdateTest {

    @Autowired
    StudentService service;

    @Test
    void contextLoads() {
        Stdn obj = new Stdn("st01", "pwdpwd", "karina", "kwangya@gmail.com", "01012341234");
        try {
            service.modify(obj);
            service.get();
            log.info("======================================");
            log.info("수정완료");
            log.info("======================================");
        } catch (Exception e) {
            log.info("student update test error");
            e.printStackTrace();
        }
    }
}
