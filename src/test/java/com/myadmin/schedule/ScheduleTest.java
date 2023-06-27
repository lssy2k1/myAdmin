package com.myadmin.schedule;

import com.myadmin.service.AttdService;
import com.myadmin.service.StdnService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
public class ScheduleTest {

    @Autowired
    StdnService stdnService;
    @Test
    void contextLoads() {
        try {
            System.out.println(stdnService.latestdn());
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

}
