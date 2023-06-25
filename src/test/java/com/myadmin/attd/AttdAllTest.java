package com.myadmin.attd;

import com.myadmin.service.AdmService;
import com.myadmin.service.AttdAllService;
import com.myadmin.service.AttdService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
class AttdAlltTest {

    @Autowired
    AttdAllService attdAllService;
    @Test
    void contextLoads() {
        try {
            System.out.println(attdAllService.get()+"");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

}
