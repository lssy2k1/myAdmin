package com.myadmin.util;

import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
@Slf4j
public class GetdateTest {

    @Test
    void DateTest(){
        log.info(GetDateUtil.getDate());
    }
}
