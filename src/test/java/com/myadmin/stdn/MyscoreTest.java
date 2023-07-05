package com.myadmin.stdn;

import com.myadmin.dto.Stdn;
import com.myadmin.service.StdnService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@Slf4j
@SpringBootTest
public class MyscoreTest {

    @Autowired
    StdnService stdnService;

    @Test
    void test() throws Exception {
        Stdn myscore = stdnService.myscore("ejjang");
        log.info(myscore+"");
    }
}
