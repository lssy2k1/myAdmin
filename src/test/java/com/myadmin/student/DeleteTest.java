package com.myadmin.student;

import com.myadmin.service.StudentService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
@Slf4j
public class DeleteTest {

    @Autowired
    StudentService service;

    @Test
    void contextLoads() {

        try {
            service.remove("student");
            service.get();
            log.info("======================================");
            log.info("제거완료");
            log.info("======================================");
        } catch (Exception e) {
            log.info("student delete test error");
            e.printStackTrace();
        }
    }
}
