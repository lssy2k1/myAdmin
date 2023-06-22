package com.myadmin.stdn;

import com.myadmin.service.StdnService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class TopStdnTest {

    @Autowired
    StdnService stdnService;

    @Test
    void test() throws Exception {
        stdnService.topstdn();
    }
}
